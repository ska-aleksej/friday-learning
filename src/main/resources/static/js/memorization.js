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

    // Загрузка всех слов юнита
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

    // Обработчики кнопок навигации
    document.getElementById('prevButton').addEventListener('click', () => {
        if (currentIndex > 0) {
            currentIndex--;
            displayCurrentWord();
        }
    });

    document.getElementById('nextButton').addEventListener('click', () => {
        if (currentIndex < words.length - 1) {
            currentIndex++;
            displayCurrentWord();
        }
    });

    // Обработчики для озвучивания
    document.getElementById('speakWord').addEventListener('click', () => {
        const currentWord = words[currentIndex];
        speakWord(currentWord.englishWord);
    });

    document.getElementById('speakExample').addEventListener('click', () => {
        const currentWord = words[currentIndex];
        speakWord(currentWord.exampleSentence);
    });
});

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

function speakWord(text) {
    const utterance = new SpeechSynthesisUtterance(text);
    utterance.lang = 'en-US';
    window.speechSynthesis.speak(utterance);
} 