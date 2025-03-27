package site.fridaywords.service;

import site.fridaywords.model.Level;
import java.util.List;

public interface LevelService {
    List<Level> getAllLevels();
    Level getLevelById(Long id);
    Level getLevelByName(String name);
    Level createLevel(Level level);
    Level updateLevel(Long id, Level level);
    void deleteLevel(Long id);
} 