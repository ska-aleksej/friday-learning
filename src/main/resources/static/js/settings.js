class SettingsManager {
    constructor() {
        if (!this.initializeElements()) {
            console.log('Settings elements not found on this page');
            return;
        }

        this.isAndroid = /Android/i.test(navigator.userAgent);
        this.isChrome = /Chrome/i.test(navigator.userAgent);
        this.isIOS = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;
        this.isSafari = /^((?!chrome|android).)*safari/i.test(navigator.userAgent);
        this.initialized = false;

        this.defaultSettings = {
            voice: null,
            rate: this.isIOS ? 0.9 : 1.0, // Для iOS используем более медленную скорость по умолчанию
            pitch: 1.0,
            volume: 1.0
        };

        this.settings = this.loadSettings();
        this.initEventListeners();
        this.initVoices();

        // Для мобильных устройств добавляем дополнительную инициализацию
        if ((this.isAndroid && this.isChrome) || this.isIOS) {
            // Инициализируем при открытии модального окна
            this.modal.addEventListener('show', () => {
                if (!this.initialized) {
                    this.forceInitVoices();
                }
            });

            // Для iOS добавляем обработку при взаимодействии
            if (this.isIOS) {
                this.modal.addEventListener('touchstart', () => {
                    if (!this.initialized) {
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
        this.rateRange = document.getElementById('rateRange');
        this.pitchRange = document.getElementById('pitchRange');
        this.volumeRange = document.getElementById('volumeRange');
        this.rateValue = document.getElementById('rateValue');
        this.pitchValue = document.getElementById('pitchValue');
        this.volumeValue = document.getElementById('volumeValue');

        return this.modal && this.settingsButton && this.closeButton && 
               this.saveButton && this.resetButton && this.previewButton && 
               this.voiceSelect && this.rateRange && this.pitchRange && 
               this.volumeRange && this.rateValue && this.pitchValue && 
               this.volumeValue;
    }

    loadSettings() {
        const savedSettings = localStorage.getItem('speechSettings');
        if (!savedSettings) {
            localStorage.setItem('speechSettings', JSON.stringify(this.defaultSettings));
            return this.defaultSettings;
        }
        return JSON.parse(savedSettings);
    }

    saveSettings() {
        const settings = {
            voice: this.voiceSelect.value || null,
            rate: parseFloat(this.rateRange.value) || 1.0,
            pitch: parseFloat(this.pitchRange.value) || 1.0,
            volume: parseFloat(this.volumeRange.value) || 1.0
        };
        localStorage.setItem('speechSettings', JSON.stringify(settings));
        this.settings = settings;
    }

    resetSettings() {
        this.settings = this.defaultSettings;
        this.updateUI();
        localStorage.setItem('speechSettings', JSON.stringify(this.defaultSettings));
    }

    forceInitVoices() {
        if (this.initialized) return;
        
        console.log('Forcing voices initialization in settings...');
        const utterance = new SpeechSynthesisUtterance('');
        utterance.lang = 'en-US';

        let attempts = 0;
        const tryGetVoices = () => {
            const voices = window.speechSynthesis.getVoices();
            if (voices.length > 0) {
                this.initialized = true;
                this.updateVoiceList(voices);
                console.log('Settings voices initialized successfully:', voices);
            } else if (attempts < 5) {
                attempts++;
                setTimeout(tryGetVoices, 500);
            }
        };
        
        window.speechSynthesis.speak(utterance);
        window.speechSynthesis.cancel();
        tryGetVoices();
    }

    initVoices() {
        const voices = window.speechSynthesis.getVoices();
        if (voices.length > 0) {
            this.initialized = true;
            this.updateVoiceList(voices);
        }

        window.speechSynthesis.onvoiceschanged = () => {
            const voices = window.speechSynthesis.getVoices();
            if (voices.length > 0) {
                this.initialized = true;
                console.log('Voices changed in settings:', voices);
                this.updateVoiceList(voices);
            }
        };
    }

    updateVoiceList(voices) {
        const englishVoices = voices.filter(voice => voice.lang.startsWith('en'));
        console.log('Available English voices in settings:', englishVoices);

        if (englishVoices.length > 0) {
            // Для iOS используем специальную обработку
            if (this.isIOS) {
                // На iOS часто доступен только один голос
                const availableVoice = englishVoices[0];
                if (availableVoice) {
                    this.voiceSelect.innerHTML = `
                        <option value="${availableVoice.name}" selected>
                            ${availableVoice.name} (iOS Voice)
                        </option>
                    `;
                    this.settings.voice = availableVoice.name;
                    this.saveSettings();
                    // Скрываем выбор голоса на iOS
                    this.voiceSelect.parentElement.style.display = 'none';
                }
            } else {
                // Стандартная обработка для других платформ
                const currentValue = this.voiceSelect.value;
                this.voiceSelect.innerHTML = englishVoices
                    .map(voice => `
                        <option value="${voice.name}" 
                                ${voice.name === (this.settings.voice || currentValue) ? 'selected' : ''}>
                            ${voice.name} (${voice.lang})
                        </option>
                    `).join('');

                if (!this.settings.voice || !englishVoices.find(v => v.name === this.settings.voice)) {
                    this.settings.voice = this.voiceSelect.value;
                    this.saveSettings();
                }
            }

            // Для Android Chrome добавляем специальную обработку
            if (this.isAndroid && this.isChrome) {
                // Удаляем старые обработчики
                const newSelect = this.voiceSelect.cloneNode(true);
                this.voiceSelect.parentNode.replaceChild(newSelect, this.voiceSelect);
                this.voiceSelect = newSelect;

                // Добавляем новый обработчик
                this.voiceSelect.addEventListener('change', () => {
                    const selectedVoice = englishVoices.find(v => v.name === this.voiceSelect.value);
                    if (selectedVoice) {
                        this.settings.voice = selectedVoice.name;
                        this.saveSettings();
                        // Не запускаем предпрослушивание автоматически
                        console.log('Voice changed to:', selectedVoice.name);
                    }
                });
            }
        }
    }

    updateUI() {
        this.voiceSelect.value = this.settings.voice || '';
        this.rateRange.value = this.settings.rate || 1.0;
        this.pitchRange.value = this.settings.pitch || 1.0;
        this.volumeRange.value = this.settings.volume || 1.0;
        this.updateRangeValues();
    }

    updateRangeValues() {
        this.rateValue.textContent = this.rateRange.value;
        this.pitchValue.textContent = this.pitchRange.value;
        this.volumeValue.textContent = this.volumeRange.value;
    }

    previewVoice() {
        if (!this.initialized && (this.isAndroid && this.isChrome || this.isIOS)) {
            this.forceInitVoices();
            return;
        }

        const utterance = new SpeechSynthesisUtterance('Hello, this is a preview of the selected voice.');
        const voices = window.speechSynthesis.getVoices();

        // Для iOS используем первый доступный голос
        if (this.isIOS) {
            const availableVoice = voices[0];
            if (availableVoice) {
                utterance.voice = availableVoice;
                console.log('Preview with iOS voice:', availableVoice.name);
            }
        } else {
            const selectedVoice = voices.find(v => v.name === this.voiceSelect.value);
            if (selectedVoice) {
                utterance.voice = selectedVoice;
                console.log('Preview with voice:', selectedVoice.name);
            }
        }
        
        utterance.lang = 'en-US';
        // Для iOS ограничиваем скорость
        utterance.rate = this.isIOS ? Math.min(parseFloat(this.rateRange.value) || 1.0, 1.0) : parseFloat(this.rateRange.value) || 1.0;
        utterance.pitch = parseFloat(this.pitchRange.value) || 1.0;
        utterance.volume = parseFloat(this.volumeRange.value) || 1.0;

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
            // Для iOS пробуем переинициализировать при ошибке
            if (this.isIOS && !this.initialized) {
                this.forceInitVoices();
            }
        };
        
        // Останавливаем предыдущее воспроизведение
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

        // Обработка изменений настроек
        this.rateRange.addEventListener('input', () => this.updateRangeValues());
        this.pitchRange.addEventListener('input', () => this.updateRangeValues());
        this.volumeRange.addEventListener('input', () => this.updateRangeValues());

        // Предпрослушивание голоса
        this.previewButton.addEventListener('click', () => this.previewVoice());

        // Сохранение и сброс настроек
        this.saveButton.addEventListener('click', () => {
            this.saveSettings();
            this.modal.classList.remove('show');
        });

        this.resetButton.addEventListener('click', () => {
            this.resetSettings();
        });
    }

    getSpeechSettings() {
        return this.settings;
    }
}

document.addEventListener('DOMContentLoaded', () => {
    window.settingsManager = new SettingsManager();
}); 