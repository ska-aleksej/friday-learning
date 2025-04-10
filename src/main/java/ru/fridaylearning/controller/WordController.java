package ru.fridaylearning.controller;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.fridaylearning.dto.WordRequestDto;
import ru.fridaylearning.dto.WordResponseDto;
import ru.fridaylearning.service.WordService;

import java.util.List;

@RestController
@RequestMapping("/api/words")
public class WordController {

    private final WordService wordService;

    @Autowired
    public WordController(WordService wordService) {
        this.wordService = wordService;
    }

    @GetMapping
    public ResponseEntity<List<WordResponseDto>> getAllWords() {
        return ResponseEntity.ok(wordService.getAllWords());
    }

    @GetMapping("/{id}")
    public ResponseEntity<WordResponseDto> getWordById(@PathVariable Long id) {
        return ResponseEntity.ok(wordService.getWordById(id));
    }

    @GetMapping("/unit/{unitId}")
    public ResponseEntity<List<WordResponseDto>> getWordsByUnitId(@PathVariable Long unitId) {
        return ResponseEntity.ok(wordService.getWordsByUnitId(unitId));
    }

    @GetMapping("/search")
    public ResponseEntity<List<WordResponseDto>> searchWords(@RequestParam String query) {
        return ResponseEntity.ok(wordService.searchWords(query));
    }

    @PostMapping
    public ResponseEntity<WordResponseDto> createWord(@Valid @RequestBody WordRequestDto wordDto) {
        return new ResponseEntity<>(wordService.createWord(wordDto), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<WordResponseDto> updateWord(
            @PathVariable Long id,
            @Valid @RequestBody WordRequestDto wordDto) {
        return ResponseEntity.ok(wordService.updateWord(id, wordDto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteWord(@PathVariable Long id) {
        wordService.deleteWord(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/unit/{unitId}/random")
    public ResponseEntity<List<WordResponseDto>> getRandomWords(
            @PathVariable Long unitId,
            @RequestParam(defaultValue = "5") int count) {
        return ResponseEntity.ok(wordService.getRandomWordsByUnitId(unitId, count));
    }

    @GetMapping("/unit/{unitId}/all")
    public ResponseEntity<List<WordResponseDto>> getAllWordsByUnitId(@PathVariable Long unitId) {
        return ResponseEntity.ok(wordService.getWordsByUnitId(unitId));
    }
} 