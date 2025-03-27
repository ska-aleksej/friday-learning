package site.fridaywords.service;

import site.fridaywords.model.Unit;
import java.util.List;

public interface UnitService {
    List<Unit> getAllUnits();
    List<Unit> getUnitsByLevelId(Long levelId);
    Unit getUnitById(Long id);
    Unit createUnit(Unit unit);
    Unit updateUnit(Long id, Unit unit);
    void deleteUnit(Long id);
} 