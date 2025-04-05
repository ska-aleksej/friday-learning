package ru.fridaylearning.service;

import ru.fridaylearning.dto.UnitRequestDto;
import ru.fridaylearning.dto.UnitResponseDto;
import java.util.List;

public interface UnitService {
    List<UnitResponseDto> getAllUnits();
    List<UnitResponseDto> getUnitsByLevelId(Long levelId);
    UnitResponseDto getUnitById(Long id);
    UnitResponseDto createUnit(UnitRequestDto unitDto);
    UnitResponseDto updateUnit(Long id, UnitRequestDto unitDto);
    void deleteUnit(Long id);
} 