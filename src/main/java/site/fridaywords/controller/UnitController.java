package site.fridaywords.controller;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import site.fridaywords.dto.UnitRequestDto;
import site.fridaywords.dto.UnitResponseDto;
import site.fridaywords.service.UnitService;

import java.util.List;

@RestController
@RequestMapping("/api/units")
public class UnitController {

    private final UnitService unitService;

    @Autowired
    public UnitController(UnitService unitService) {
        this.unitService = unitService;
    }

    @GetMapping
    public ResponseEntity<List<UnitResponseDto>> getAllUnits() {
        return ResponseEntity.ok(unitService.getAllUnits());
    }

    @GetMapping("/{id}")
    public ResponseEntity<UnitResponseDto> getUnitById(@PathVariable Long id) {
        return ResponseEntity.ok(unitService.getUnitById(id));
    }

    @GetMapping("/level/{levelId}")
    public ResponseEntity<List<UnitResponseDto>> getUnitsByLevelId(@PathVariable Long levelId) {
        return ResponseEntity.ok(unitService.getUnitsByLevelId(levelId));
    }

    @PostMapping
    public ResponseEntity<UnitResponseDto> createUnit(@Valid @RequestBody UnitRequestDto unitDto) {
        return new ResponseEntity<>(unitService.createUnit(unitDto), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<UnitResponseDto> updateUnit(
            @PathVariable Long id,
            @Valid @RequestBody UnitRequestDto unitDto) {
        return ResponseEntity.ok(unitService.updateUnit(id, unitDto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUnit(@PathVariable Long id) {
        unitService.deleteUnit(id);
        return ResponseEntity.noContent().build();
    }
} 