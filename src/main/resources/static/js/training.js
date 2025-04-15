// Объявляем переменные в глобальной области видимости
let words = [];
let leftCard = null;
let rightCard = null;
let correctPairs = 0;
let englishContainer;
let russianContainer;
let progressBar;
let scoreElement;
let isProcessing = false; // Флаг для блокировки обработки кликов

document.addEventListener('DOMContentLoaded', function() {
    englishContainer = document.getElementById('englishWords');
    russianContainer = document.getElementById('russianWords');
    progressBar = document.getElementById('progressBar');
    scoreElement = document.getElementById('score');
    
    const unitInfo = document.querySelector('.unit-info');
    const unitId = unitInfo ? unitInfo.getAttribute('data-unit-id') : null;

    if (!unitId) {
        console.error('Unit ID not found');
        englishContainer.innerHTML = '<p>Ошибка: ID юнита не найден</p>';
        return;
    }

    // Загрузка слов
    fetch(`/api/words/unit/${unitId}/random?count=5`)
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
            displayWords();
        })
        .catch(error => {
            console.error('Error loading words:', error);
            englishContainer.innerHTML = '<p>Ошибка при загрузке слов</p>';
        });
});

function updateScore() {
    const progress = (correctPairs / words.length) * 100;
    progressBar.style.width = `${progress}%`;
    scoreElement.textContent = `${correctPairs}/${words.length}`;
}

function displayWords() {
    // Перемешиваем слова для каждого столбца отдельно
    const shuffledEnglishWords = [...words].sort(() => Math.random() - 0.5);
    const shuffledRussianWords = [...words].sort(() => Math.random() - 0.5);

    // Очищаем контейнеры
    englishContainer.innerHTML = '';
    russianContainer.innerHTML = '';

    // Создаем карточки для английских слов
    shuffledEnglishWords.forEach(word => {
        const card = createWordCard(word, true);
        englishContainer.appendChild(card);
    });

    // Создаем карточки для русских слов
    shuffledRussianWords.forEach(word => {
        const card = createWordCard(word, false);
        russianContainer.appendChild(card);
    });
}

function createWordCard(word, isEnglish) {
    const card = document.createElement('div');
    card.className = 'word-card';
    card.dataset.wordId = word.id;
    
    if (isEnglish) {
        card.innerHTML = `<div class="word-text">${word.englishWord}</div>`;
        
        // Добавляем озвучивание для английских слов
        card.addEventListener('click', () => {
            if (!card.classList.contains('disabled')) {
                speakWord(word.englishWord);
            }
        });
    } else {
        card.innerHTML = `<div class="word-text">${word.russianTranslation}</div>`;
    }

    card.addEventListener('click', () => handleCardClick(card, word));
    return card;
}

function handleCardClick(card, word) {
    // Если карточка отключена или идет обработка предыдущего клика, игнорируем
    if (card.classList.contains('disabled') || isProcessing) return;

    // Если кликнули на уже выбранную карточку, снимаем выделение
    if (leftCard === card) {
        card.classList.remove('selected');
        leftCard = null;
        return;
    }

    // Если выбрана карточка в том же столбце, меняем выделение
    if (leftCard && 
        ((card.parentElement === englishContainer && leftCard.parentElement === englishContainer) ||
         (card.parentElement === russianContainer && leftCard.parentElement === russianContainer))) {
        leftCard.classList.remove('selected');
        leftCard = card;
        card.classList.add('selected');
        return;
    }

    if (!leftCard) {
        // Первый выбор
        leftCard = card;
        card.classList.add('selected');
    } else {
        // Второй выбор (только если карточки из разных столбцов)
        const isCorrect = checkPair(leftCard, card, word);
        
        if (isCorrect) {
            // Правильная пара
            isProcessing = true; // Блокируем обработку кликов
            leftCard.classList.add('correct');
            card.classList.add('correct');
            leftCard.classList.remove('selected');
            card.classList.remove('selected');
            correctPairs++;
            updateScore();

            // Через 1 секунду делаем карточки неактивными
            setTimeout(() => {
                leftCard.classList.remove('correct');
                card.classList.remove('correct');
                leftCard.classList.add('disabled');
                card.classList.add('disabled');
                leftCard = null;
                rightCard = null;
                isProcessing = false; // Разблокируем обработку кликов
            }, 500);
            
            if (correctPairs === words.length) {
                setTimeout(() => {
                    loadNewWords();
                }, 1000);
            }
        } else {
            // Неправильная пара
            isProcessing = true; // Блокируем обработку кликов
            leftCard.classList.add('incorrect');
            card.classList.add('incorrect');
            
            setTimeout(() => {
                leftCard.classList.remove('selected', 'incorrect');
                card.classList.remove('selected','incorrect');
                leftCard = null;
                rightCard = null;
                isProcessing = false; // Разблокируем обработку кликов
            }, 500);
        }
    }
}

function checkPair(card1, card2, word) {
    const isEnglish1 = card1.parentElement === englishContainer;
    const isEnglish2 = card2.parentElement === englishContainer;
    
    if (isEnglish1 === isEnglish2) return false; // Обе карточки из одного столбца
    
    const wordId1 = card1.dataset.wordId;
    const wordId2 = card2.dataset.wordId;
    
    return wordId1 === wordId2;
}

function speakWord(text) {
    const utterance = new SpeechSynthesisUtterance(text);
    utterance.lang = 'en-US';
    window.speechSynthesis.speak(utterance);
}

// Добавим функцию для загрузки новых слов
function loadNewWords() {
    const unitInfo = document.querySelector('.unit-info');
    const unitId = unitInfo ? unitInfo.getAttribute('data-unit-id') : null;

    if (!unitId) {
        console.error('Unit ID not found');
        return;
    }

    // Сбрасываем счетчик
    correctPairs = 0;
    updateScore();

    // Загружаем новые слова
    fetch(`/api/words/unit/${unitId}/random?count=5`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(loadedWords => {
            console.log('Loaded new words:', loadedWords);
            if (!loadedWords || loadedWords.length === 0) {
                throw new Error('No words loaded');
            }
            words = loadedWords;
            displayWords();
        })
        .catch(error => {
            console.error('Error loading new words:', error);
            englishContainer.innerHTML = '<p>Ошибка при загрузке новых слов</p>';
        });
} 