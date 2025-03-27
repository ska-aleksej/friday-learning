package site.fridaywords.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import site.fridaywords.model.Word;
import site.fridaywords.repository.WordRepository;
import site.fridaywords.service.WordService;

import jakarta.persistence.EntityNotFoundException;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class WordServiceImpl implements WordService {

    private final WordRepository wordRepository;

    @Autowired
    public WordServiceImpl(WordRepository wordRepository) {
        this.wordRepository = wordRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Word> getAllWords() {
        return wordRepository.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Word> getWordsByUnitId(Long unitId) {
        return wordRepository.findByUnitId(unitId);
    }

    @Override
    @Transactional(readOnly = true)
    public Word getWordById(Long id) {
        return wordRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Word not found with id: " + id));
    }

    @Override
    @Transactional(readOnly = true)
    public List<Word> searchWords(String query) {
        List<Word> results = new ArrayList<>();
        results.addAll(wordRepository.findByEnglishWordContainingIgnoreCase(query));
        results.addAll(wordRepository.findByRussianTranslationContainingIgnoreCase(query));
        return results;
    }

    @Override
    public Word createWord(Word word) {
        return wordRepository.save(word);
    }

    @Override
    public Word updateWord(Long id, Word wordDetails) {
        Word word = getWordById(id);
        word.setEnglishWord(wordDetails.getEnglishWord());
        word.setRussianTranslation(wordDetails.getRussianTranslation());
        word.setTranscription(wordDetails.getTranscription());
        word.setExampleSentence(wordDetails.getExampleSentence());
        return wordRepository.save(word);
    }

    @Override
    public void deleteWord(Long id) {
        Word word = getWordById(id);
        wordRepository.delete(word);
    }
} 