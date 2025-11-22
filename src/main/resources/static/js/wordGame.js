class WordGame {
    constructor(unitId) {
        this.unitId = unitId;
        this.words = [];
        this.currentWords = [];
        this.score = 0;
        this.selectedWord = null;
        
        this.englishWordsContainer = document.getElementById('englishWords');
        this.russianWordsContainer = document.getElementById('russianWords');
        this.scoreElement = document.getElementById('score');
        this.progressBar = document.getElementById('progressBar');
        
        this.loadWords();
    }

    async loadWords() {
        try {
            const response = await fetch(`/api/words/unit/${this.unitId}/random?count=5`);
            if (!response.ok) throw new Error('Failed to load words');
            
            this.currentWords = await response.json();
            this.renderWords();
        } catch (error) {
            console.error('Error loading words:', error);
        }
    }

    renderWords() {
        this.englishWordsContainer.innerHTML = '';
        this.russianWordsContainer.innerHTML = '';

        const shuffledRussian = [...this.currentWords].sort(() => Math.random() - 0.5);

        this.currentWords.forEach(word => {
            const button = this.createWordButton(word.englishWord, 'english');
            this.englishWordsContainer.appendChild(button);
        });

        shuffledRussian.forEach(word => {
            const button = this.createWordButton(word.russianTranslation, 'russian');
            this.russianWordsContainer.appendChild(button);
        });
    }

    createWordButton(text, type) {
        const button = document.createElement('button');
        button.className = 'word-button';
        button.textContent = text;
        
        button.addEventListener('click', () => {
            if (type === 'english') {
                speechService.speak(text);
            }
            this.handleWordClick(button, text, type);
        });
        
        return button;
    }

    handleWordClick(button, text, type) {
        if (button.classList.contains('correct')) return;

        if (!this.selectedWord) {
            this.selectedWord = { button, text, type };
            button.classList.add('selected');
            return;
        }

        if (this.selectedWord.type === type) {
            this.selectedWord.button.classList.remove('selected');
            this.selectedWord = { button, text, type };
            button.classList.add('selected');
            return;
        }

        const isCorrect = this.checkPair(this.selectedWord, { button, text, type });
        
        if (isCorrect) {
            this.selectedWord.button.classList.remove('selected');
            this.selectedWord.button.classList.add('correct');
            button.classList.add('correct');
            this.score += 10;
            this.scoreElement.textContent = this.score;

            if (this.checkAllMatched()) {
                setTimeout(() => this.loadWords(), 1000);
            }
        } else {
            this.selectedWord.button.classList.add('wrong');
            button.classList.add('wrong');
            setTimeout(() => {
                this.selectedWord.button.classList.remove('selected', 'wrong');
                button.classList.remove('wrong');
            }, 1000);
        }

        this.selectedWord = null;
    }

    checkPair(first, second) {
        const word = this.currentWords.find(w => 
            (first.type === 'english' && w.englishWord === first.text) ||
            (second.type === 'english' && w.englishWord === second.text)
        );

        return word && 
               ((first.type === 'english' && word.russianTranslation === second.text) ||
                (second.type === 'english' && word.russianTranslation === first.text));
    }

    checkAllMatched() {
        return Array.from(this.englishWordsContainer.children)
            .every(button => button.classList.contains('correct'));
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const game = new WordGame(unitId);
}); 