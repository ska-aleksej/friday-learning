class SettingsManager {
    constructor() {
        if (!this.initializeElements()) {
            console.log('Settings elements not found on this page');
            return;
        }

        this.isAndroid = /Android/i.test(navigator.userAgent);
        this.isChrome = /Chrome/i.test(navigator.userAgent);
        this.isIOS = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;
        this.isOpera = /Opera/i.test(navigator.userAgent) ||
                      (/OPR/i.test(navigator.userAgent) && /Chrome/i.test(navigator.userAgent));
        this.voicesLoaded = false;
        this.initialized = false;
        this.hasUnsavedChanges = false;

        this.defaultSettings = {
            voice: null
        };

        // Временно устанавливаем настройки по умолчанию
        // Настройки из localStorage загрузим после получения списка голосов
        this.settings = { ...this.defaultSettings };
        this.initEventListeners();
        this.initVoices();

        // Для мобильных устройств и Opera добавляем дополнительную инициализацию
        if ((this.isAndroid && this.isChrome) || this.isIOS || this.isOpera) {
            // Инициализируем при открытии модального окна
            this.modal.addEventListener('show', () => {
                if (!this.voicesLoaded) {
                    this.forceInitVoices();
                }
            });

            // Для iOS добавляем обработку при взаимодействии
            if (this.isIOS) {
                this.modal.addEventListener('touchstart', () => {
                    if (!this.voicesLoaded) {
                        this.forceInitVoices();
                    }
                }, { once: true });
            }
        }
    }

    initializeElements() {
        this.modal = document.getElementById('settingsModal');
        this.settingsButton = document.getElementById('settingsButton');
        this.closeButton = document.getElementById('closeSettings');
        this.saveButton = document.getElementById('saveSettings');
        this.resetButton = document.getElementById('resetSettings');
        this.previewButton = document.getElementById('previewVoice');
        this.voiceSelect = document.getElementById('voiceSelect');

        return this.modal && this.settingsButton && this.closeButton &&
               this.saveButton && this.resetButton && this.previewButton &&
               this.voiceSelect;
    }

    loadAndValidateSettings() {
        const savedSettings = localStorage.getItem('speechSettings');
        if (!savedSettings) {
            return { ...this.defaultSettings };
        }

        try {
            const parsed = JSON.parse(savedSettings);
            const validatedVoice = this.validateVoice(parsed.voice);

            // Если сохраненный голос невалиден, очищаем localStorage
            if (parsed.voice !== null && validatedVoice === null) {
                console.log('Saved voice is no longer available, clearing saved settings');
                localStorage.removeItem('speechSettings');
                return { ...this.defaultSettings };
            }

            return { voice: validatedVoice };
        } catch (error) {
            console.error('Error parsing saved settings:', error);
            localStorage.removeItem('speechSettings');
            return { ...this.defaultSettings };
        }
    }

    validateVoice(voiceName) {
        if (!voiceName) return null;

        const voices = window.speechSynthesis.getVoices();
        const voice = voices.find(v => v.name === voiceName);

        if (!voice) return null;

        // Проверяем что голос поддерживает английский
        if (!voice.lang.startsWith('en')) {
            console.log(`Voice ${voice.name} doesn't support English, lang: ${voice.lang}`);
            return null;
        }

        return voice.name;
    }

    saveSettings() {
        // Проверяем что настройки изменились
        const currentVoice = this.voiceSelect.value || null;
        if (currentVoice === this.settings.voice) {
            // Настройки не изменились, ничего не делаем
            return;
        }

        // Валидируем выбранный голос
        const validatedVoice = this.validateVoice(currentVoice);

        const settings = {
            voice: validatedVoice
        };

        localStorage.setItem('speechSettings', JSON.stringify(settings));
        this.settings = settings;
        this.hasUnsavedChanges = false;
        this.updateSaveButton();
        console.log('Settings saved:', settings);
    }

    resetSettings() {
        this.settings = { ...this.defaultSettings };
        this.updateUI();
        this.hasUnsavedChanges = true;
        this.updateSaveButton();
        console.log('Settings reset to defaults');
    }

    forceInitVoices() {
        console.log('Forcing voices initialization in settings...');

        // Для Opera используем специальную инициализацию
        if (this.isOpera) {
            console.log('Using Opera-specific voice initialization in settings');
            // Создаем несколько utterance для увеличения шанса загрузки
            const utterances = [];
            for (let i = 0; i < 3; i++) {
                utterances.push(new SpeechSynthesisUtterance(''));
                utterances[i].lang = 'en-US';
            }

            // Проигрываем и отменяем каждый
            utterances.forEach(u => {
                window.speechSynthesis.speak(u);
            });
            window.speechSynthesis.cancel();
        } else {
            const utterance = new SpeechSynthesisUtterance('');
            utterance.lang = 'en-US';
            window.speechSynthesis.speak(utterance);
            window.speechSynthesis.cancel();
        }

        let attempts = 0;
        // Для Opera увеличиваем количество попыток и задержку
        const maxAttempts = this.isOpera ? 15 : 5;
        const delay = this.isOpera ? 1000 : 500;

        const tryGetVoices = () => {
            const voices = window.speechSynthesis.getVoices();
            if (voices.length > 0) {
                this.onVoicesReady(voices);
            } else if (attempts < maxAttempts) {
                attempts++;
                console.log(`Settings: Voice loading attempt ${attempts}/${maxAttempts}...`);
                setTimeout(tryGetVoices, delay);
            } else {
                console.log(`Settings: Failed to load voices after ${maxAttempts} attempts`);
                // Для Opera пытаемся еще раз через 3 секунды
                if (this.isOpera) {
                    console.log('Settings: Opera - Making final attempt after 3 seconds...');
                    setTimeout(() => {
                        const finalVoices = window.speechSynthesis.getVoices();
                        if (finalVoices.length > 0) {
                            this.onVoicesReady(finalVoices);
                        } else {
                            console.log('Settings: Opera - Final voice loading attempt failed');
                            this.onVoicesReady([]);
                        }
                    }, 3000);
                } else {
                    // Загружаем настройки без голосов
                    this.onVoicesReady([]);
                }
            }
        };

        tryGetVoices();
    }

    initVoices() {
        const voices = window.speechSynthesis.getVoices();
        if (voices.length > 0) {
            this.onVoicesReady(voices);
        }

        window.speechSynthesis.onvoiceschanged = () => {
            const voices = window.speechSynthesis.getVoices();
            this.onVoicesReady(voices);
        };
    }

    onVoicesReady(voices) {
        console.log('Voices loaded in settings:', voices);
        this.voicesLoaded = true;
        this.initialized = true;

        // Загружаем и валидируем настройки ПОСЛЕ получения списка голосов
        this.settings = this.loadAndValidateSettings();

        // Обновляем UI
        this.updateVoiceList(voices);
        this.updateUI();
    }

    updateVoiceList(voices) {
        // Для iOS не фильтруем голоса, так как Siri может говорить на разных языках
        const voicesToUse = this.isIOS ? voices : voices.filter(voice => voice.lang.startsWith('en'));
        console.log('Available voices in settings:', voicesToUse);

        // Сохраняем текущее значение до обновления
        const currentValue = this.voiceSelect.value || this.settings.voice;

        if (voicesToUse.length > 0) {
            // Для iOS используем специальную обработку
            if (this.isIOS) {
                const englishVoice = voicesToUse.find(v => v.lang.startsWith('en'));
                if (englishVoice) {
                    // Если есть английский голос, показываем только его
                    this.voiceSelect.innerHTML = `
                        <option value="${englishVoice.name}">
                            ${englishVoice.name} (English)
                        </option>
                    `;
                } else {
                    // Если английских нет, показываем сообщение
                    this.voiceSelect.innerHTML = `
                        <option value="" disabled>
                            Используется системный голос (Siri)
                        </option>
                    `;
                }
                // Скрываем выбор голоса на iOS, так как он ограничен
                this.voiceSelect.parentElement.style.display = 'none';
            } else {
                // Стандартная обработка для других платформ
                this.voiceSelect.innerHTML = voicesToUse
                    .map(voice => `
                        <option value="${voice.name}">
                            ${voice.name} (${voice.lang})
                        </option>
                    `).join('');

                // Добавляем опцию для системного выбора
                this.voiceSelect.innerHTML = `
                    <option value="">
                        Системный голос по умолчанию
                    </option>
                ` + this.voiceSelect.innerHTML;
            }

            // Восстанавливаем выбранное значение если оно валидно
            const validValue = this.validateVoice(currentValue) || '';
            this.voiceSelect.value = validValue;

            // Для Android Chrome добавляем специальную обработку
            if (this.isAndroid && this.isChrome) {
                // Удаляем старые обработчики
                const newSelect = this.voiceSelect.cloneNode(true);
                this.voiceSelect.parentNode.replaceChild(newSelect, this.voiceSelect);
                this.voiceSelect = newSelect;

                // Добавляем новый обработчик
                this.voiceSelect.addEventListener('change', () => {
                    this.onVoiceChanged();
                });
            }
        } else {
            let message = 'Голоса не доступны';
            this.voiceSelect.innerHTML = `
                <option value="" disabled>
                    ${message}
                </option>
            `;
        }
    }

    onVoiceChanged() {
        // Проверяем изменились ли настройки
        const currentVoice = this.voiceSelect.value || null;
        const changed = currentVoice !== this.settings.voice;

        this.hasUnsavedChanges = changed;
        this.updateSaveButton();

        if (changed) {
            console.log('Voice selection changed to:', currentVoice);
        }
    }

    updateSaveButton() {
        // Активируем кнопку сохранения только если есть несохраненные изменения
        if (this.saveButton) {
            this.saveButton.disabled = !this.hasUnsavedChanges;
            if (this.hasUnsavedChanges) {
                this.saveButton.classList.add('highlight');
            } else {
                this.saveButton.classList.remove('highlight');
            }
        }
    }

    updateUI() {
        const currentValue = this.voiceSelect.value || null;
        this.voiceSelect.value = this.settings.voice || '';

        // Проверяем изменились ли настройки после загрузки
        const changed = (this.voiceSelect.value || null) !== this.settings.voice;
        this.hasUnsavedChanges = changed;
        this.updateSaveButton();
    }

    previewVoice() {
        if (!this.voicesLoaded && (this.isAndroid && this.isChrome || this.isIOS)) {
            this.forceInitVoices();
            return;
        }

        const utterance = new SpeechSynthesisUtterance('Hello, this is a preview of the selected voice.');
        const voices = window.speechSynthesis.getVoices();
        const selectedVoiceName = this.voiceSelect.value;

        // Для iOS не устанавливаем голос, используем только lang
        if (this.isIOS) {
            console.log('Preview with iOS system voice and en-US language');
        } else if (selectedVoiceName) {
            const selectedVoice = voices.find(v => v.name === selectedVoiceName);
            if (selectedVoice && selectedVoice.lang.startsWith('en')) {
                utterance.voice = selectedVoice;
                console.log('Preview with voice:', selectedVoice.name);
            } else {
                console.log('Selected voice not found or not English, using default');
            }
        }

        utterance.lang = 'en-US';

        // Добавляем обработчики для отладки
        utterance.onstart = () => console.log('Preview started');
        utterance.onend = () => {
            console.log('Preview ended');
            // Для iOS очищаем очередь после окончания
            if (this.isIOS) {
                window.speechSynthesis.cancel();
            }
        };
        utterance.onerror = (event) => {
            console.error('Preview error:', event);
        };

        window.speechSynthesis.cancel();

        // Для iOS добавляем небольшую задержку
        if (this.isIOS) {
            setTimeout(() => {
                window.speechSynthesis.speak(utterance);
            }, 50);
        } else {
            window.speechSynthesis.speak(utterance);
        }
    }

    initEventListeners() {
        // Открытие/закрытие модального окна
        this.settingsButton.addEventListener('click', () => {
            this.modal.classList.add('show');
            this.updateUI();
        });

        this.closeButton.addEventListener('click', () => {
            this.modal.classList.remove('show');
        });

        // Закрытие по клику вне модального окна
        this.modal.addEventListener('click', (e) => {
            if (e.target === this.modal) {
                this.modal.classList.remove('show');
            }
        });

        this.previewButton.addEventListener('click', () => this.previewVoice());

        this.saveButton.addEventListener('click', () => {
            if (this.hasUnsavedChanges) {
                this.saveSettings();
                this.modal.classList.remove('show');
            }
        });

        this.resetButton.addEventListener('click', () => {
            this.resetSettings();
        });

        // Отслеживание изменений голоса (кроме Android Chrome где handled отдельно)
        if (!this.isAndroid || !this.isChrome) {
            this.voiceSelect.addEventListener('change', () => {
                this.onVoiceChanged();
            });
        }
    }

    getSpeechSettings() {
        return this.settings;
    }
}

document.addEventListener('DOMContentLoaded', () => {
    window.settingsManager = new SettingsManager();
}); 