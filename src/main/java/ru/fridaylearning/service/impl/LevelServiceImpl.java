package ru.fridaylearning.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.fridaylearning.dto.LevelRequestDto;
import ru.fridaylearning.dto.LevelResponseDto;
import ru.fridaylearning.mapper.LevelMapper;
import ru.fridaylearning.model.Level;
import ru.fridaylearning.repository.LevelRepository;
import ru.fridaylearning.service.LevelService;

import jakarta.persistence.EntityNotFoundException;
import java.util.List;

@Service
@Transactional
public class LevelServiceImpl implements LevelService {

    private final LevelRepository levelRepository;
    private final LevelMapper levelMapper;

    @Autowired
    public LevelServiceImpl(LevelRepository levelRepository, LevelMapper levelMapper) {
        this.levelRepository = levelRepository;
        this.levelMapper = levelMapper;
    }

    @Override
    @Transactional(readOnly = true)
    public List<LevelResponseDto> getAllLevels() {
        List<Level> levels = levelRepository.findAllByOrderByDisplayOrderAsc();
        return levelMapper.toDtoList(levels);
    }

    @Override
    @Transactional(readOnly = true)
    public LevelResponseDto getLevelById(Long id) {
        Level level = levelRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Level not found with id: " + id));
        return levelMapper.toDto(level);
    }

    @Override
    @Transactional(readOnly = true)
    public LevelResponseDto getLevelByName(String name) {
        Level level = levelRepository.findByName(name)
                .orElseThrow(() -> new EntityNotFoundException("Level not found with name: " + name));
        return levelMapper.toDto(level);
    }

    @Override
    public LevelResponseDto createLevel(LevelRequestDto levelDto) {
        if (levelRepository.existsByName(levelDto.getName())) {
            throw new IllegalArgumentException("Level already exists with name: " + levelDto.getName());
        }
        Level level = levelMapper.toEntity(levelDto);
        level = levelRepository.save(level);
        return levelMapper.toDto(level);
    }

    @Override
    public LevelResponseDto updateLevel(Long id, LevelRequestDto levelDto) {
        Level level = levelRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Level not found with id: " + id));
        levelMapper.updateEntity(level, levelDto);
        level = levelRepository.save(level);
        return levelMapper.toDto(level);
    }

    @Override
    public void deleteLevel(Long id) {
        if (!levelRepository.existsById(id)) {
            throw new EntityNotFoundException("Level not found with id: " + id);
        }
        levelRepository.deleteById(id);
    }
} 