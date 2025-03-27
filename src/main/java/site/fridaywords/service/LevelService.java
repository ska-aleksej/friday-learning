package site.fridaywords.service;

import site.fridaywords.dto.LevelRequestDto;
import site.fridaywords.dto.LevelResponseDto;
import java.util.List;

public interface LevelService {
    List<LevelResponseDto> getAllLevels();
    LevelResponseDto getLevelById(Long id);
    LevelResponseDto getLevelByName(String name);
    LevelResponseDto createLevel(LevelRequestDto levelDto);
    LevelResponseDto updateLevel(Long id, LevelRequestDto levelDto);
    void deleteLevel(Long id);
} 