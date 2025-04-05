package ru.fridaylearning.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.fridaylearning.model.Level;
import java.util.List;
import java.util.Optional;

@Repository
public interface LevelRepository extends JpaRepository<Level, Long> {
    
    // Найти все уровни, отсортированные по порядку отображения
    List<Level> findAllByOrderByDisplayOrderAsc();
    
    // Найти уровень по имени (например, "A1", "PI", "B2")
    Optional<Level> findByName(String name);
    
    // Проверить существование уровня по имени
    boolean existsByName(String name);
} 