package ru.fridaylearning.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.fridaylearning.model.Unit;
import ru.fridaylearning.model.Word;
import java.util.List;

@Repository
public interface WordRepository extends JpaRepository<Word, Long> {
    
    // Найти все слова определенного раздела
    List<Word> findByUnit(Unit unit);
    
    // Найти все слова по ID раздела
    List<Word> findByUnitId(Long unitId);
    
    // Поиск слов по английскому слову (частичное совпадение, игнорируя регистр)
    List<Word> findByEnglishWordContainingIgnoreCase(String englishWord);
    
    // Поиск слов по русскому переводу (частичное совпадение, игнорируя регистр)
    List<Word> findByRussianTranslationContainingIgnoreCase(String russianTranslation);
    
    // Подсчитать количество слов в разделе
    long countByUnitId(Long unitId);
} 