let words = [];
let currentIndex = 0;
let progressBar;
let scoreElement;

document.addEventListener('DOMContentLoaded', function() {
    progressBar = document.getElementById('progressBar');
    scoreElement = document.getElementById('score');
    
    const unitInfo = document.querySelector('.unit-info');
    const unitId = unitInfo ? unitInfo.getAttribute('data-unit-id') : null;

    if (!unitId) {
        console.error('Unit ID not found');
        return;
    }

    fetch(`/api/words/unit/${unitId}/all`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(loadedWords => {
            console.log('Loaded words:', loadedWords);
            if (!loadedWords || loadedWords.length === 0) {
                throw new Error('No words loaded');
            }
            words = loadedWords;
            updateScore();
            displayCurrentWord();
        })
        .catch(error => {
            console.error('Error loading words:', error);
        });

    document.getElementById('prevButton').addEventListener('click', () => {
        navigateToPreviousWord();
    });

    document.getElementById('nextButton').addEventListener('click', () => {
        navigateToNextWord();
    });

    document.getElementById('speakWord').addEventListener('click', () => {
        const currentWord = words[currentIndex];
        speechService.speak(currentWord.englishWord);
    });

    document.getElementById('speakExample').addEventListener('click', () => {
        const currentWord = words[currentIndex];
        speechService.speak(currentWord.exampleSentence);
    });

    document.addEventListener('keydown', (event) => {
        if (event.key === 'ArrowLeft') {
            navigateToPreviousWord();
        } else if (event.key === 'ArrowRight') {
            navigateToNextWord();
        } else if (event.key === ' ') {
            event.preventDefault();
            const currentWord = words[currentIndex];
            speechService.speak(currentWord.englishWord);
        }
    });
});

function navigateToPreviousWord() {
    if (currentIndex === 0) {
        currentIndex = words.length - 1;
    } else {
        currentIndex--;
    }
    displayCurrentWord();
}

function navigateToNextWord() {
    if (currentIndex === words.length - 1) {
        currentIndex = 0;
    } else {
        currentIndex++;
    }
    displayCurrentWord();
}

function updateScore() {
    const progress = ((currentIndex + 1) / words.length) * 100;
    progressBar.style.width = `${progress}%`;
    scoreElement.textContent = `${currentIndex + 1}/${words.length}`;
}

function displayCurrentWord() {
    const word = words[currentIndex];
    document.getElementById('englishWord').textContent = word.englishWord;
    document.getElementById('transcription').textContent = word.transcription;
    document.getElementById('russianWord').textContent = word.russianTranslation;
    document.getElementById('example').textContent = word.exampleSentence;
    updateScore();
}