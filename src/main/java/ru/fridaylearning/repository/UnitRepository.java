package ru.fridaylearning.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.fridaylearning.model.Level;
import ru.fridaylearning.model.Unit;
import java.util.List;

@Repository
public interface UnitRepository extends JpaRepository<Unit, Long> {
    
    // Найти все разделы определенного уровня, отсортированные по порядку
    List<Unit> findByLevelOrderByDisplayOrderAsc(Level level);
    
    // Найти все разделы по ID уровня
    List<Unit> findByLevelIdOrderByDisplayOrderAsc(Long levelId);
    
    // Подсчитать количество разделов в уровне
    long countByLevelId(Long levelId);
} 