package ru.fridaylearning.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.fridaylearning.model.Level;
import ru.fridaylearning.model.Unit;
import java.util.List;

@Repository
public interface UnitRepository extends JpaRepository<Unit, Long> {

    List<Unit> findByLevelOrderByDisplayOrderAsc(Level level);
    
    List<Unit> findByLevelIdOrderByDisplayOrderAsc(Long levelId);
    
    long countByLevelId(Long levelId);
} 