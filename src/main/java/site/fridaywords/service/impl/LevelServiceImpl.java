package site.fridaywords.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import site.fridaywords.model.Level;
import site.fridaywords.repository.LevelRepository;
import site.fridaywords.service.LevelService;

import jakarta.persistence.EntityNotFoundException;
import java.util.List;

@Service
@Transactional
public class LevelServiceImpl implements LevelService {

    private final LevelRepository levelRepository;

    @Autowired
    public LevelServiceImpl(LevelRepository levelRepository) {
        this.levelRepository = levelRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Level> getAllLevels() {
        return levelRepository.findAllByOrderByDisplayOrderAsc();
    }

    @Override
    @Transactional(readOnly = true)
    public Level getLevelById(Long id) {
        return levelRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Level not found with id: " + id));
    }

    @Override
    @Transactional(readOnly = true)
    public Level getLevelByName(String name) {
        return levelRepository.findByName(name)
                .orElseThrow(() -> new EntityNotFoundException("Level not found with name: " + name));
    }

    @Override
    public Level createLevel(Level level) {
        if (levelRepository.existsByName(level.getName())) {
            throw new IllegalArgumentException("Level already exists with name: " + level.getName());
        }
        return levelRepository.save(level);
    }

    @Override
    public Level updateLevel(Long id, Level levelDetails) {
        Level level = getLevelById(id);
        level.setDescription(levelDetails.getDescription());
        level.setDisplayOrder(levelDetails.getDisplayOrder());
        return levelRepository.save(level);
    }

    @Override
    public void deleteLevel(Long id) {
        Level level = getLevelById(id);
        levelRepository.delete(level);
    }
} 