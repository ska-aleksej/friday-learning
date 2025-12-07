class SpeechService {
    constructor() {
        this.synth = window.speechSynthesis;
        this.isAndroid = /Android/i.test(navigator.userAgent);
        this.isChrome = /Chrome/i.test(navigator.userAgent);
        this.isIOS = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;
        this.isOpera = /Opera/i.test(navigator.userAgent) ||
                      (/OPR/i.test(navigator.userAgent) && /Chrome/i.test(navigator.userAgent));
        this.voices = [];
        this.voicesLoaded = false;

        // Инициализируем голоса сразу при создании сервиса
        this.initVoices();

        // Для мобильных устройств и Opera добавляем дополнительную инициализацию
        if ((this.isAndroid && this.isChrome) || this.isIOS || this.isOpera) {
            document.addEventListener('visibilitychange', () => {
                if (document.visibilityState === 'visible' && !this.voicesLoaded) {
                    this.forceInitVoices();
                }
            });

            // Для iOS Safari добавляем обработку при взаимодействии
            if (this.isIOS) {
                document.addEventListener('touchstart', () => {
                    if (!this.voicesLoaded) {
                        this.forceInitVoices();
                    }
                }, { once: true });

                // Для iOS Safari нужно перезапускать синтезатор при возвращении на вкладку
                document.addEventListener('visibilitychange', () => {
                    if (document.visibilityState === 'visible') {
                        this.synth.cancel();
                        if (!this.voicesLoaded) {
                            this.forceInitVoices();
                        }
                    }
                });
            }

            // Для Android Chrome пробуем инициализировать при первом взаимодействии
            if (this.isAndroid && this.isChrome) {
                document.addEventListener('click', () => {
                    if (!this.voicesLoaded) {
                        this.forceInitVoices();
                    }
                }, { once: true });
            }
        }
    }

    forceInitVoices() {
        if (this.voicesLoaded) return;

        console.log('Forcing voices initialization...');

        // Для Opera используем специальную инициализацию
        if (this.isOpera) {
            console.log('Using Opera-specific voice initialization');
            // Создаем несколько utterance для увеличения шанса загрузки
            const utterances = [];
            for (let i = 0; i < 3; i++) {
                utterances.push(new SpeechSynthesisUtterance(''));
                utterances[i].lang = 'en-US';
            }

            // Проигрываем и отменяем каждый
            utterances.forEach(u => {
                this.synth.speak(u);
            });
            this.synth.cancel();
        } else {
            const utterance = new SpeechSynthesisUtterance('');
            utterance.lang = 'en-US';
            this.synth.speak(utterance);
            this.synth.cancel();
        }

        let attempts = 0;
        // Для Opera увеличиваем количество попыток и задержку
        const maxAttempts = this.isOpera ? 15 : 5;
        const delay = this.isOpera ? 1000 : 500;

        const tryGetVoices = () => {
            const voices = this.synth.getVoices();
            if (voices.length > 0) {
                this.onVoicesReady(voices);
            } else if (attempts < maxAttempts) {
                attempts++;
                console.log(`Voice loading attempt ${attempts}/${maxAttempts}...`);
                setTimeout(tryGetVoices, delay);
            } else {
                console.log(`Failed to load voices after ${maxAttempts} attempts`);
                // Для Opera пытаемся еще раз через 3 секунды
                if (this.isOpera) {
                    console.log('Opera: Making final attempt after 3 seconds...');
                    setTimeout(() => {
                        const finalVoices = this.synth.getVoices();
                        if (finalVoices.length > 0) {
                            this.onVoicesReady(finalVoices);
                        } else {
                            console.log('Opera: Final voice loading attempt failed');
                            this.onVoicesReady([]);
                        }
                    }, 3000);
                } else {
                    this.onVoicesReady([]);
                }
            }
        };

        tryGetVoices();
    }

    initVoices() {
        const voices = this.synth.getVoices();
        if (voices.length > 0) {
            this.onVoicesReady(voices);
        }

        this.synth.onvoiceschanged = () => {
            const voices = this.synth.getVoices();
            this.onVoicesReady(voices);
        };
    }

    onVoicesReady(voices) {
        console.log('Speech service voices loaded:', voices);
        this.voices = voices;
        this.voicesLoaded = true;

        // Уведомляем settingsManager если он существует
        if (window.settingsManager && window.settingsManager.voicesLoaded) {
            // Если settingsManager уже инициализирован, уведомляем его о смене голосов
            window.settingsManager.updateVoiceList(voices);
        }
    }

    async waitForVoices() {
        if (this.voicesLoaded) {
            return this.voices;
        }

        // Для Android Chrome и Opera пробуем принудительную инициализацию
        if ((this.isAndroid && this.isChrome || this.isOpera) && !this.voicesLoaded) {
            this.forceInitVoices();
        }

        return new Promise((resolve) => {
            // Для Opera используем увеличенный таймаут
            const checkInterval = this.isOpera ? 500 : 100;
            let attempts = 0;
            const maxAttempts = this.isOpera ? 60 : 100; // 30 секунд для Opera, 10 для других

            const checkVoices = () => {
                if (this.voicesLoaded && this.voices.length > 0) {
                    resolve(this.voices);
                } else if (attempts < maxAttempts) {
                    attempts++;
                    if (this.isOpera && attempts % 10 === 0) {
                        console.log(`Opera: Still waiting for voices... (${attempts}/${maxAttempts})`);
                    }
                    setTimeout(checkVoices, checkInterval);
                } else {
                    console.warn(this.isOpera ?
                        'Opera: Timeout waiting for voices, continuing anyway...' :
                        'Timeout waiting for voices');
                    resolve(this.voices);
                }
            };
            checkVoices();
        });
    }

    getEnglishVoice(settingsVoice) {
        // Возвращает подходящий английский голос
        if (settingsVoice) {
            const selectedVoice = this.voices.find(v => v.name === settingsVoice);
            if (selectedVoice && selectedVoice.lang.startsWith('en')) {
                return selectedVoice;
            }
        }

        // Ищем любой английский голос
        const englishVoice = this.voices.find(v => v.lang.startsWith('en'));
        if (englishVoice) {
            console.log('Using English voice:', englishVoice.name);
            return englishVoice;
        }

        // Если английских голосов нет, null (будет использован системный)
        console.log('No English voice found');
        return null;
    }

    async speak(text) {
        if (!text) return;

        // Для iOS Safari останавливаем текущее воспроизведение и очищаем очередь
        if (this.isIOS) {
            this.synth.cancel();
            // Даем небольшую паузу для iOS
            await new Promise(resolve => setTimeout(resolve, 100));
        } else if (this.synth.speaking) {
            this.synth.cancel();
        }

        try {
            // Ждем загрузки голосов
            await this.waitForVoices();

            const utterance = new SpeechSynthesisUtterance(text);
            const settings = window.settingsManager?.getSpeechSettings() || {
                voice: null
            };

            // Для iOS Safari используем специальную обработку голосов
            if (this.isIOS) {
                // На iOS не устанавливаем голос совсем, используем только lang
                // Системный голос (Siri) мультиязычен и переключится на en-US
                console.log('Using iOS system voice with en-US language');
                utterance.lang = 'en-US';
            } else if (this.isOpera) {
                // Для Opera особая обработка
                console.log('Opera: Special voice handling');
                const voice = this.getEnglishVoice(settings.voice);

                if (voice) {
                    // Проверяем, что голос действительно английский
                    if (voice.lang.startsWith('en')) {
                        utterance.voice = voice;
                        utterance.lang = voice.lang;
                        console.log('Opera: Using English voice:', voice.name);
                    } else {
                        // Если голос не английский, не используем его, а только устанавливаем язык
                        utterance.lang = 'en-US';
                        console.warn('Opera: Selected voice is not English, using system voice with en-US');
                    }
                } else {
                    // Если английских голосов нет, пытаемся заставить системный говорить по-английски
                    utterance.lang = 'en-US';
                    // Для Opera можно попробовать установить предпочтительный язык
                    utterance.pitch = 1;
                    utterance.rate = 0.9; // Немного медленнее для лучшего понимания
                    console.log('Opera: No English voice available, using system voice with en-US');
                }
            } else {
                // Выбираем подходящий английский голос для других браузеров
                const voice = this.getEnglishVoice(settings.voice);

                if (voice) {
                    utterance.voice = voice;
                    utterance.lang = voice.lang; // Используем язык голоса, а не жестко en-US
                    console.log('Using voice:', voice.name, 'with lang:', voice.lang);
                } else {
                    // Если нет английского голоса, все равно устанавливаем en-US
                    utterance.lang = 'en-US';
                    console.log('No English voice available, using system voice with en-US');
                }
            }

            // Добавляем обработчики событий для отладки
            utterance.onstart = () => console.log('Speech started with voice:', utterance.voice?.name || 'system');
            utterance.onend = () => {
                console.log('Speech ended');
                // Для iOS Safari очищаем очередь после окончания
                if (this.isIOS) {
                    this.synth.cancel();
                }
            };
            utterance.onerror = (event) => {
                console.error('Speech error:', event);
                // Для iOS Safari пробуем переинициализировать при ошибке
                if (this.isIOS && !this.voicesLoaded) {
                    this.forceInitVoices();
                }
            };

            // Для iOS Safari добавляем небольшую задержку перед воспроизведением
            if (this.isIOS) {
                await new Promise(resolve => setTimeout(resolve, 50));
            }

            this.synth.speak(utterance);
        } catch (error) {
            console.error('Error in speech synthesis:', error);
            // Для iOS Safari пробуем переинициализировать при ошибке
            if (this.isIOS && !this.voicesLoaded) {
                this.forceInitVoices();
            }
        }
    }
}

const speechService = new SpeechService(); 