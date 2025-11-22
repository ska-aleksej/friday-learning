package ru.fridaylearning.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.fridaylearning.model.Level;
import java.util.List;
import java.util.Optional;

@Repository
public interface LevelRepository extends JpaRepository<Level, Long> {

    List<Level> findAllByOrderByDisplayOrderAsc();

    Optional<Level> findByName(String name);

    boolean existsByName(String name);
} 