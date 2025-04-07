let words = [];
let currentIndex = 0;
let correctAnswers = 0;
let progressBar;
let scoreElement;
let wordInput;
let resultMessage;
let firstAttempt = true; // Флаг для отслеживания первой попытки

document.addEventListener('DOMContentLoaded', function() {
    progressBar = document.getElementById('progressBar');
    scoreElement = document.getElementById('score');
    wordInput = document.getElementById('wordInput');
    resultMessage = document.getElementById('resultMessage');
    
    const unitInfo = document.querySelector('.unit-info');
    const unitId = unitInfo ? unitInfo.getAttribute('data-unit-id') : null;

    if (!unitId) {
        console.error('Unit ID not found');
        return;
    }

    // Загрузка случайных слов
    loadWords(unitId);

    // Обработчик кнопки озвучивания
    document.getElementById('speakButton').addEventListener('click', () => {
        const currentWord = words[currentIndex];
        speakWord(currentWord.englishWord);
    });

    // Обработчик кнопки проверки
    document.getElementById('checkButton').addEventListener('click', checkAnswer);

    // Обработчик кнопки нового набора
    document.getElementById('newSetButton').addEventListener('click', () => {
        loadNewWords(unitId);
    });

    // Обработчик нажатия Enter в поле ввода
    wordInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            checkAnswer();
        }
    });
    
    // Предотвращаем потерю фокуса при вводе на мобильных устройствах
    wordInput.addEventListener('blur', (e) => {
        // Небольшая задержка, чтобы дать время для обработки клика по кнопке
        setTimeout(() => {
            if (document.activeElement !== document.getElementById('checkButton')) {
                wordInput.focus();
            }
        }, 100);
    });
});

function loadWords(unitId) {
    fetch(`/api/words/unit/${unitId}/random?count=10`)
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
            currentIndex = 0;
            correctAnswers = 0;
            firstAttempt = true;
            updateScore();
            displayCurrentWord();
        })
        .catch(error => {
            console.error('Error loading words:', error);
            resultMessage.textContent = 'Ошибка при загрузке слов';
            resultMessage.className = 'result-message incorrect';
        });
}

function updateScore() {
    const progress = (correctAnswers / words.length) * 100;
    progressBar.style.width = `${progress}%`;
    scoreElement.textContent = `${correctAnswers}/${words.length}`;
}

function displayCurrentWord() {
    const word = words[currentIndex];
    document.getElementById('russianTranslation').textContent = word.russianTranslation;
    wordInput.value = '';
    resultMessage.textContent = '';
    resultMessage.className = 'result-message';
    firstAttempt = true; // Сбрасываем флаг первой попытки для нового слова
    wordInput.focus();
}

function checkAnswer() {
    const currentWord = words[currentIndex];
    const userAnswer = wordInput.value.trim().toLowerCase();
    const correctAnswer = currentWord.englishWord.toLowerCase();

    if (userAnswer === correctAnswer) {
        resultMessage.textContent = 'Правильно!';
        resultMessage.className = 'result-message correct';
        
        // Увеличиваем счетчик только если это первая попытка
        if (firstAttempt) {
            correctAnswers++;
            updateScore();
        }
        
        // Автоматически переходим к следующему слову через 1 секунду
        setTimeout(() => {
            currentIndex++;
            if (currentIndex < words.length) {
                displayCurrentWord();
            } else {
                // Если все слова пройдены, загружаем новый набор
                resultMessage.textContent = `Набор завершен! Правильных ответов: ${correctAnswers}/${words.length}`;
                resultMessage.className = 'result-message';
                
                // Загружаем новый набор через 2 секунды
                setTimeout(() => {
                    const unitId = document.querySelector('.unit-info').getAttribute('data-unit-id');
                    loadNewWords(unitId);
                }, 2000);
            }
        }, 1000);
    } else {
        resultMessage.textContent = `Неправильно. Правильный ответ: ${correctAnswer}`;
        resultMessage.className = 'result-message incorrect';
        firstAttempt = false; // Отмечаем, что это не первая попытка
    }
}

function speakWord(word) {
    if ('speechSynthesis' in window) {
        const utterance = new SpeechSynthesisUtterance(word);
        utterance.lang = 'en-US';
        utterance.rate = 0.8; // Немного замедляем произношение
        speechSynthesis.speak(utterance);
    } else {
        resultMessage.textContent = 'Ваш браузер не поддерживает озвучивание';
        resultMessage.className = 'result-message incorrect';
    }
}

function loadNewWords(unitId) {
    resultMessage.textContent = 'Загрузка нового набора слов...';
    resultMessage.className = 'result-message';
    loadWords(unitId);
} 