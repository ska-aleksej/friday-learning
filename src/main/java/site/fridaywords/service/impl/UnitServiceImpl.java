package site.fridaywords.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import site.fridaywords.model.Unit;
import site.fridaywords.repository.UnitRepository;
import site.fridaywords.service.UnitService;

import jakarta.persistence.EntityNotFoundException;
import java.util.List;

@Service
@Transactional
public class UnitServiceImpl implements UnitService {

    private final UnitRepository unitRepository;

    @Autowired
    public UnitServiceImpl(UnitRepository unitRepository) {
        this.unitRepository = unitRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Unit> getAllUnits() {
        return unitRepository.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Unit> getUnitsByLevelId(Long levelId) {
        return unitRepository.findByLevelIdOrderByDisplayOrderAsc(levelId);
    }

    @Override
    @Transactional(readOnly = true)
    public Unit getUnitById(Long id) {
        return unitRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Unit not found with id: " + id));
    }

    @Override
    public Unit createUnit(Unit unit) {
        return unitRepository.save(unit);
    }

    @Override
    public Unit updateUnit(Long id, Unit unitDetails) {
        Unit unit = getUnitById(id);
        unit.setName(unitDetails.getName());
        unit.setDescription(unitDetails.getDescription());
        unit.setDisplayOrder(unitDetails.getDisplayOrder());
        return unitRepository.save(unit);
    }

    @Override
    public void deleteUnit(Long id) {
        Unit unit = getUnitById(id);
        unitRepository.delete(unit);
    }
} 