package ru.fridaylearning.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.fridaylearning.model.Unit;
import ru.fridaylearning.model.Word;
import java.util.List;

@Repository
public interface WordRepository extends JpaRepository<Word, Long> {

    List<Word> findByUnit(Unit unit);

    List<Word> findByUnitId(Long unitId);

    List<Word> findByEnglishWordContainingIgnoreCase(String englishWord);

    List<Word> findByRussianTranslationContainingIgnoreCase(String russianTranslation);

    long countByUnitId(Long unitId);
} 