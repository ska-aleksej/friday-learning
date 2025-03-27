package site.fridaywords.service;

import site.fridaywords.model.Word;
import java.util.List;

public interface WordService {
    List<Word> getAllWords();
    List<Word> getWordsByUnitId(Long unitId);
    Word getWordById(Long id);
    List<Word> searchWords(String query);
    Word createWord(Word word);
    Word updateWord(Long id, Word word);
    void deleteWord(Long id);
} 