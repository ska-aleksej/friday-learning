package ru.fridaylearning.service;

import ru.fridaylearning.dto.LevelRequestDto;
import ru.fridaylearning.dto.LevelResponseDto;
import java.util.List;

public interface LevelService {
    List<LevelResponseDto> getAllLevels();
    LevelResponseDto getLevelById(Long id);
    LevelResponseDto getLevelByName(String name);
    LevelResponseDto createLevel(LevelRequestDto levelDto);
    LevelResponseDto updateLevel(Long id, LevelRequestDto levelDto);
    void deleteLevel(Long id);
} 