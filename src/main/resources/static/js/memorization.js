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
        navigateToPreviousWord();
    });

    document.getElementById('nextButton').addEventListener('click', () => {
        navigateToNextWord();
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

    // Обработчик клавиш клавиатуры
    document.addEventListener('keydown', (event) => {
        if (event.key === 'ArrowLeft') {
            navigateToPreviousWord();
        } else if (event.key === 'ArrowRight') {
            navigateToNextWord();
        } else if (event.key === ' ') {
            // Предотвращаем прокрутку страницы при нажатии пробела
            event.preventDefault();
            const currentWord = words[currentIndex];
            speakWord(currentWord.englishWord);
        }
    });
});

function navigateToPreviousWord() {
    if (currentIndex === 0) {
        // Если мы на первом слове, переходим к последнему
        currentIndex = words.length - 1;
    } else {
        currentIndex--;
    }
    displayCurrentWord();
}

function navigateToNextWord() {
    if (currentIndex === words.length - 1) {
        // Если мы на последнем слове, переходим к первому
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
    updateNavigationButtons();
}

function speakWord(text) {
    const utterance = new SpeechSynthesisUtterance(text);
    const settings = window.settingsManager.getSpeechSettings();
    
    // Применяем настройки голоса
    const voices = window.speechSynthesis.getVoices();
    const selectedVoice = voices.find(v => v.name === settings.voice);
    if (selectedVoice) {
        utterance.voice = selectedVoice;
    }
    
    utterance.rate = settings.rate;
    utterance.pitch = settings.pitch;
    utterance.volume = settings.volume;
    
    window.speechSynthesis.speak(utterance);
}

function updateNavigationButtons() {
    const prevButton = document.getElementById('prevButton');
    const nextButton = document.getElementById('nextButton');
    
    // Кнопки всегда видны, так как навигация циклическая
    prevButton.classList.remove('hidden');
    nextButton.classList.remove('hidden');
} 