package site.fridaywords.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import site.fridaywords.dto.UnitRequestDto;
import site.fridaywords.dto.UnitResponseDto;
import site.fridaywords.mapper.UnitMapper;
import site.fridaywords.model.Level;
import site.fridaywords.model.Unit;
import site.fridaywords.repository.LevelRepository;
import site.fridaywords.repository.UnitRepository;
import site.fridaywords.service.UnitService;

import jakarta.persistence.EntityNotFoundException;
import java.util.List;

@Service
@Transactional
public class UnitServiceImpl implements UnitService {

    private final UnitRepository unitRepository;
    private final LevelRepository levelRepository;
    private final UnitMapper unitMapper;

    @Autowired
    public UnitServiceImpl(UnitRepository unitRepository, 
                          LevelRepository levelRepository,
                          UnitMapper unitMapper) {
        this.unitRepository = unitRepository;
        this.levelRepository = levelRepository;
        this.unitMapper = unitMapper;
    }

    @Override
    @Transactional(readOnly = true)
    public List<UnitResponseDto> getAllUnits() {
        List<Unit> units = unitRepository.findAll();
        return unitMapper.toDtoList(units);
    }

    @Override
    @Transactional(readOnly = true)
    public List<UnitResponseDto> getUnitsByLevelId(Long levelId) {
        List<Unit> units = unitRepository.findByLevelIdOrderByDisplayOrderAsc(levelId);
        return unitMapper.toDtoList(units);
    }

    @Override
    @Transactional(readOnly = true)
    public UnitResponseDto getUnitById(Long id) {
        Unit unit = unitRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Unit not found with id: " + id));
        return unitMapper.toDto(unit);
    }

    @Override
    public UnitResponseDto createUnit(UnitRequestDto unitDto) {
        Level level = levelRepository.findById(unitDto.getLevelId())
                .orElseThrow(() -> new EntityNotFoundException("Level not found with id: " + unitDto.getLevelId()));
        
        Unit unit = unitMapper.toEntity(unitDto);
        unit.setLevel(level);
        unit = unitRepository.save(unit);
        return unitMapper.toDto(unit);
    }

    @Override
    public UnitResponseDto updateUnit(Long id, UnitRequestDto unitDto) {
        Unit unit = unitRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Unit not found with id: " + id));
        
        if (!unit.getLevel().getId().equals(unitDto.getLevelId())) {
            Level newLevel = levelRepository.findById(unitDto.getLevelId())
                    .orElseThrow(() -> new EntityNotFoundException("Level not found with id: " + unitDto.getLevelId()));
            unit.setLevel(newLevel);
        }
        
        unitMapper.updateEntity(unit, unitDto);
        unit = unitRepository.save(unit);
        return unitMapper.toDto(unit);
    }

    @Override
    public void deleteUnit(Long id) {
        if (!unitRepository.existsById(id)) {
            throw new EntityNotFoundException("Unit not found with id: " + id);
        }
        unitRepository.deleteById(id);
    }
} 