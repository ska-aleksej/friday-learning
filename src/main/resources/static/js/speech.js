class SpeechService {
    constructor() {
        this.synth = window.speechSynthesis;
    }

    speak(text) {
        if (this.synth.speaking) {
            this.synth.cancel();
        }

        const utterance = new SpeechSynthesisUtterance(text);
        utterance.lang = 'en-US';
        utterance.rate = 0.9;
        this.synth.speak(utterance);
    }
}

const speechService = new SpeechService(); 