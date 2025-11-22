class SpeechService {
    constructor() {
        this.synth = window.speechSynthesis;
        this.isAndroid = /Android/i.test(navigator.userAgent);
        this.isChrome = /Chrome/i.test(navigator.userAgent);
        this.isIOS = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;
        this.isSafari = /^((?!chrome|android).)*safari/i.test(navigator.userAgent);
        this.voices = [];
        this.voicesLoaded = false;
        this.initialized = false;
        
        // Инициализируем голоса сразу при создании сервиса
        this.initVoices();
        
        // Для мобильных устройств добавляем дополнительную инициализацию
        if ((this.isAndroid && this.isChrome) || this.isIOS) {
            document.addEventListener('visibilitychange', () => {
                if (document.visibilityState === 'visible' && !this.initialized) {
                    this.forceInitVoices();
                }
            });
            
            // Для iOS Safari добавляем обработку при взаимодействии
            if (this.isIOS) {
                document.addEventListener('touchstart', () => {
                    if (!this.initialized) {
                        this.forceInitVoices();
                    }
                }, { once: true });
                
                // Для iOS Safari нужно перезапускать синтезатор при возвращении на вкладку
                document.addEventListener('visibilitychange', () => {
                    if (document.visibilityState === 'visible') {
                        this.synth.cancel();
                        if (!this.initialized) {
                            this.forceInitVoices();
                        }
                    }
                });
            }
            
            // Для Android Chrome пробуем инициализировать при первом взаимодействии
            if (this.isAndroid && this.isChrome) {
                document.addEventListener('click', () => {
                    if (!this.initialized) {
                        this.forceInitVoices();
                    }
                }, { once: true });
            }
        }
    }

    forceInitVoices() {
        if (this.initialized) return;
        
        console.log('Forcing voices initialization...');
        const utterance = new SpeechSynthesisUtterance('');
        utterance.lang = 'en-US';

        let attempts = 0;
        const tryGetVoices = () => {
            const voices = this.synth.getVoices();
            if (voices.length > 0) {
                this.voices = voices;
                this.voicesLoaded = true;
                this.initialized = true;
                console.log('Voices initialized successfully:', voices);

                if (window.settingsManager) {
                    window.settingsManager.updateVoiceList(voices);
                }
            } else if (attempts < 5) {
                attempts++;
                setTimeout(tryGetVoices, 500);
            }
        };
        
        this.synth.speak(utterance);
        this.synth.cancel();
        tryGetVoices();
    }

    initVoices() {
        // Получаем голоса сразу, если они доступны
        this.voices = this.synth.getVoices();
        if (this.voices.length > 0) {
            this.voicesLoaded = true;
            this.initialized = true;
            console.log('Voices loaded immediately:', this.voices);
        }

        // Подписываемся на событие изменения голосов
        this.synth.onvoiceschanged = () => {
            this.voices = this.synth.getVoices();
            if (this.voices.length > 0) {
                this.voicesLoaded = true;
                this.initialized = true;
                console.log('Voices changed:', this.voices);
                
                // Обновляем настройки, если они есть
                if (window.settingsManager) {
                    window.settingsManager.updateVoiceList(this.voices);
                }
            }
        };
    }

    async waitForVoices() {
        if (this.voicesLoaded) {
            return this.voices;
        }

        // Для Android Chrome пробуем принудительную инициализацию
        if (this.isAndroid && this.isChrome && !this.initialized) {
            this.forceInitVoices();
        }

        return new Promise((resolve) => {
            const checkVoices = () => {
                if (this.voices.length > 0) {
                    this.voicesLoaded = true;
                    this.initialized = true;
                    resolve(this.voices);
                } else {
                    setTimeout(checkVoices, 100);
                }
            };
            checkVoices();
        });
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
                voice: null,
                rate: 1.0,
                pitch: 1.0,
                volume: 1.0
            };

            // Для iOS Safari используем специальную обработку голосов
            if (this.isIOS) {
                // На iOS часто доступен только один голос, поэтому используем его
                const availableVoice = this.voices[0];
                if (availableVoice) {
                    utterance.voice = availableVoice;
                    console.log('Using available voice on iOS:', availableVoice.name);
                }
                // На iOS ограничиваем скорость для лучшей работы
                utterance.rate = Math.min(settings.rate, 1.0);
            } else {
                // Стандартная обработка голосов для других платформ
                if (settings.voice) {
                    const selectedVoice = this.voices.find(v => v.name === settings.voice);
                    if (selectedVoice) {
                        utterance.voice = selectedVoice;
                        console.log('Using selected voice:', selectedVoice.name);
                    } else {
                        const englishVoice = this.voices.find(v => v.lang.startsWith('en'));
                        if (englishVoice) {
                            utterance.voice = englishVoice;
                            console.log('Selected voice not found, using English voice:', englishVoice.name);
                        }
                    }
                } else {
                    const englishVoice = this.voices.find(v => v.lang.startsWith('en'));
                    if (englishVoice) {
                        utterance.voice = englishVoice;
                        console.log('No voice selected, using English voice:', englishVoice.name);
                    }
                }
            }

            // Устанавливаем язык и параметры
            utterance.lang = 'en-US';
            utterance.rate = this.isIOS ? Math.min(settings.rate, 1.0) : settings.rate;
            utterance.pitch = settings.pitch;
            utterance.volume = settings.volume;

            // Добавляем обработчики событий для отладки
            utterance.onstart = () => console.log('Speech started with voice:', utterance.voice?.name);
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
                if (this.isIOS && !this.initialized) {
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
            if (this.isIOS && !this.initialized) {
                this.forceInitVoices();
            }
        }
    }
}

const speechService = new SpeechService(); 