package site.fridaywords.service;

import site.fridaywords.dto.UnitRequestDto;
import site.fridaywords.dto.UnitResponseDto;
import java.util.List;

public interface UnitService {
    List<UnitResponseDto> getAllUnits();
    List<UnitResponseDto> getUnitsByLevelId(Long levelId);
    UnitResponseDto getUnitById(Long id);
    UnitResponseDto createUnit(UnitRequestDto unitDto);
    UnitResponseDto updateUnit(Long id, UnitRequestDto unitDto);
    void deleteUnit(Long id);
} 