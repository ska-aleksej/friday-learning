let words = [];
let leftCard = null;
let rightCard = null;
let correctPairs = 0;
let englishContainer;
let russianContainer;
let progressBar;
let scoreElement;
let isProcessing = false;

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
    const shuffledEnglishWords = [...words].sort(() => Math.random() - 0.5);
    const shuffledRussianWords = [...words].sort(() => Math.random() - 0.5);

    englishContainer.innerHTML = '';
    russianContainer.innerHTML = '';

    shuffledEnglishWords.forEach(word => {
        const card = createWordCard(word, true);
        englishContainer.appendChild(card);
    });

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

        card.addEventListener('click', () => {
            if (!card.classList.contains('disabled')) {
                speechService.speak(word.englishWord);
            }
        });
    } else {
        card.innerHTML = `<div class="word-text">${word.russianTranslation}</div>`;
    }

    card.addEventListener('click', () => handleCardClick(card, word));
    return card;
}

function handleCardClick(card, word) {
    if (card.classList.contains('disabled') || isProcessing) return;

    if (leftCard === card) {
        card.classList.remove('selected');
        leftCard = null;
        return;
    }

    if (leftCard && 
        ((card.parentElement === englishContainer && leftCard.parentElement === englishContainer) ||
         (card.parentElement === russianContainer && leftCard.parentElement === russianContainer))) {
        leftCard.classList.remove('selected');
        leftCard = card;
        card.classList.add('selected');
        return;
    }

    if (!leftCard) {
        leftCard = card;
        card.classList.add('selected');
    } else {
        const isCorrect = checkPair(leftCard, card, word);
        
        if (isCorrect) {
            isProcessing = true;
            leftCard.classList.add('correct');
            card.classList.add('correct');
            leftCard.classList.remove('selected');
            card.classList.remove('selected');
            correctPairs++;
            updateScore();

            setTimeout(() => {
                leftCard.classList.remove('correct');
                card.classList.remove('correct');
                leftCard.classList.add('disabled');
                card.classList.add('disabled');
                leftCard = null;
                rightCard = null;
                isProcessing = false;
            }, 500);
            
            if (correctPairs === words.length) {
                setTimeout(() => {
                    loadNewWords();
                }, 1000);
            }
        } else {
            isProcessing = true;
            leftCard.classList.add('incorrect');
            card.classList.add('incorrect');
            
            setTimeout(() => {
                leftCard.classList.remove('selected', 'incorrect');
                card.classList.remove('selected','incorrect');
                leftCard = null;
                rightCard = null;
                isProcessing = false;
            }, 500);
        }
    }
}

function checkPair(card1, card2, word) {
    const isEnglish1 = card1.parentElement === englishContainer;
    const isEnglish2 = card2.parentElement === englishContainer;
    
    if (isEnglish1 === isEnglish2) return false;
    
    const wordId1 = card1.dataset.wordId;
    const wordId2 = card2.dataset.wordId;
    
    return wordId1 === wordId2;
}

function loadNewWords() {
    const unitInfo = document.querySelector('.unit-info');
    const unitId = unitInfo ? unitInfo.getAttribute('data-unit-id') : null;

    if (!unitId) {
        console.error('Unit ID not found');
        return;
    }

    correctPairs = 0;
    updateScore();

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