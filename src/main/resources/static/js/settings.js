class SettingsManager {
    constructor() {
        // Проверяем, есть ли необходимые элементы на странице
        if (!this.initializeElements()) {
            console.log('Settings elements not found on this page');
            return;
        }

        this.defaultSettings = {
            voice: null,
            rate: 1.0,
            pitch: 1.0,
            volume: 1.0
        };

        this.settings = this.loadSettings();
        this.initEventListeners();
        this.initVoices();
    }

    initializeElements() {
        // Получаем все необходимые элементы
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

        // Проверяем наличие всех необходимых элементов
        return this.modal && this.settingsButton && this.closeButton && 
               this.saveButton && this.resetButton && this.previewButton && 
               this.voiceSelect && this.rateRange && this.pitchRange && 
               this.volumeRange && this.rateValue && this.pitchValue && 
               this.volumeValue;
    }

    loadSettings() {
        const savedSettings = localStorage.getItem('speechSettings');
        if (!savedSettings) {
            // Если настроек нет, сохраняем значения по умолчанию
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

    initVoices() {
        // Получаем голоса сразу, если они доступны
        const voices = window.speechSynthesis.getVoices();
        if (voices.length > 0) {
            this.updateVoiceList(voices);
        }

        // Подписываемся на событие изменения голосов
        window.speechSynthesis.onvoiceschanged = () => {
            const voices = window.speechSynthesis.getVoices();
            this.updateVoiceList(voices);
        };
    }

    updateVoiceList(voices) {
        const englishVoices = voices.filter(voice => voice.lang.startsWith('en'));
        if (englishVoices.length > 0) {
            this.voiceSelect.innerHTML = englishVoices
                .map(voice => `
                    <option value="${voice.name}" 
                            ${voice.name === this.settings.voice ? 'selected' : ''}>
                        ${voice.name}
                    </option>
                `).join('');
            
            // Если голос не выбран, выбираем первый доступный
            if (!this.settings.voice && this.voiceSelect.value) {
                this.settings.voice = this.voiceSelect.value;
                this.saveSettings();
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
        const utterance = new SpeechSynthesisUtterance('Hello, this is a preview of the selected voice.');
        const voices = window.speechSynthesis.getVoices();
        const selectedVoice = voices.find(v => v.name === this.voiceSelect.value);
        
        if (selectedVoice) {
            utterance.voice = selectedVoice;
        }
        
        utterance.rate = parseFloat(this.rateRange.value) || 1.0;
        utterance.pitch = parseFloat(this.pitchRange.value) || 1.0;
        utterance.volume = parseFloat(this.volumeRange.value) || 1.0;
        
        // Останавливаем предыдущее воспроизведение
        window.speechSynthesis.cancel();
        
        // Воспроизводим новый голос
        window.speechSynthesis.speak(utterance);
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

// Инициализация менеджера настроек
document.addEventListener('DOMContentLoaded', () => {
    window.settingsManager = new SettingsManager();
}); 