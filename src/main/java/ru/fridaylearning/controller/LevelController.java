package ru.fridaylearning.controller;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.fridaylearning.dto.LevelRequestDto;
import ru.fridaylearning.dto.LevelResponseDto;
import ru.fridaylearning.service.LevelService;

import java.util.List;

@RestController
@RequestMapping("/api/levels")
public class LevelController {

    private final LevelService levelService;

    @Autowired
    public LevelController(LevelService levelService) {
        this.levelService = levelService;
    }

    @GetMapping
    public ResponseEntity<List<LevelResponseDto>> getAllLevels() {
        return ResponseEntity.ok(levelService.getAllLevels());
    }

    @GetMapping("/{id}")
    public ResponseEntity<LevelResponseDto> getLevelById(@PathVariable Long id) {
        return ResponseEntity.ok(levelService.getLevelById(id));
    }

    @GetMapping("/name/{name}")
    public ResponseEntity<LevelResponseDto> getLevelByName(@PathVariable String name) {
        return ResponseEntity.ok(levelService.getLevelByName(name));
    }

    @PostMapping
    public ResponseEntity<LevelResponseDto> createLevel(@Valid @RequestBody LevelRequestDto levelDto) {
        return new ResponseEntity<>(levelService.createLevel(levelDto), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<LevelResponseDto> updateLevel(
            @PathVariable Long id,
            @Valid @RequestBody LevelRequestDto levelDto) {
        return ResponseEntity.ok(levelService.updateLevel(id, levelDto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteLevel(@PathVariable Long id) {
        levelService.deleteLevel(id);
        return ResponseEntity.noContent().build();
    }
} 