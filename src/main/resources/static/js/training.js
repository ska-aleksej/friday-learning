// Объявляем переменные в глобальной области видимости
let words = [];
let selectedCard = null;
let correctPairs = 0;
let englishContainer;
let russianContainer;
let progressBar;
let scoreElement;

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
    // Перемешиваем слова
    const shuffledWords = [...words].sort(() => Math.random() - 0.5);
    
    // Очищаем контейнеры
    englishContainer.innerHTML = '';
    russianContainer.innerHTML = '';

    // Создаем карточки для английских слов
    shuffledWords.forEach(word => {
        const card = createWordCard(word, true);
        englishContainer.appendChild(card);
    });

    // Создаем карточки для русских слов
    shuffledWords.forEach(word => {
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
    if (card.classList.contains('disabled')) return;

    // Если кликнули на уже выбранную карточку, снимаем выделение
    if (selectedCard === card) {
        card.classList.remove('selected');
        selectedCard = null;
        return;
    }

    // Если выбрана карточка в том же столбце, меняем выделение
    if (selectedCard && 
        ((card.parentElement === englishContainer && selectedCard.parentElement === englishContainer) ||
         (card.parentElement === russianContainer && selectedCard.parentElement === russianContainer))) {
        selectedCard.classList.remove('selected');
        selectedCard = card;
        card.classList.add('selected');
        return;
    }

    if (!selectedCard) {
        // Первый выбор
        selectedCard = card;
        card.classList.add('selected');
    } else {
        // Второй выбор (только если карточки из разных столбцов)
        const isCorrect = checkPair(selectedCard, card, word);
        
        if (isCorrect) {
            // Правильная пара
            selectedCard.classList.add('correct');
            card.classList.add('correct');
            selectedCard.classList.remove('selected');
            card.classList.remove('selected');
            correctPairs++;
            updateScore();
            
            // Через 1 секунду делаем карточки неактивными
            setTimeout(() => {
                selectedCard.classList.remove('correct');
                card.classList.remove('correct');
                selectedCard.classList.add('disabled');
                card.classList.add('disabled');
            }, 1000);
            
            if (correctPairs === words.length) {
                setTimeout(() => {
                    loadNewWords();
                }, 1500);
            }
        } else {
            // Неправильная пара
            selectedCard.classList.add('incorrect');
            card.classList.add('incorrect');
            
            setTimeout(() => {
                selectedCard.classList.remove('selected', 'incorrect');
                card.classList.remove('incorrect');
            }, 1000);
        }
        
        selectedCard = null;
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