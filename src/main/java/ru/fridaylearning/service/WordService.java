package ru.fridaylearning.service;

import ru.fridaylearning.dto.WordRequestDto;
import ru.fridaylearning.dto.WordResponseDto;
import java.util.List;

public interface WordService {
    List<WordResponseDto> getAllWords();
    List<WordResponseDto> getWordsByUnitId(Long unitId);
    WordResponseDto getWordById(Long id);
    List<WordResponseDto> searchWords(String query);
    WordResponseDto createWord(WordRequestDto wordDto);
    WordResponseDto updateWord(Long id, WordRequestDto wordDto);
    void deleteWord(Long id);
    List<WordResponseDto> getRandomWordsByUnitId(Long unitId, int count);
} 