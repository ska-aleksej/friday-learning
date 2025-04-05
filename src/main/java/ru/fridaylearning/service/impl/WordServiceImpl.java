package ru.fridaylearning.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.fridaylearning.dto.WordRequestDto;
import ru.fridaylearning.dto.WordResponseDto;
import ru.fridaylearning.mapper.WordMapper;
import ru.fridaylearning.model.Unit;
import ru.fridaylearning.model.Word;
import ru.fridaylearning.repository.UnitRepository;
import ru.fridaylearning.repository.WordRepository;
import ru.fridaylearning.service.WordService;

import jakarta.persistence.EntityNotFoundException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class WordServiceImpl implements WordService {

    private final WordRepository wordRepository;
    private final UnitRepository unitRepository;
    private final WordMapper wordMapper;

    @Autowired
    public WordServiceImpl(WordRepository wordRepository, 
                         UnitRepository unitRepository,
                         WordMapper wordMapper) {
        this.wordRepository = wordRepository;
        this.unitRepository = unitRepository;
        this.wordMapper = wordMapper;
    }

    @Override
    @Transactional(readOnly = true)
    public List<WordResponseDto> getAllWords() {
        List<Word> words = wordRepository.findAll();
        return wordMapper.toDtoList(words);
    }

    @Override
    @Transactional(readOnly = true)
    public List<WordResponseDto> getWordsByUnitId(Long unitId) {
        List<Word> words = wordRepository.findByUnitId(unitId);
        return wordMapper.toDtoList(words);
    }

    @Override
    @Transactional(readOnly = true)
    public WordResponseDto getWordById(Long id) {
        Word word = wordRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Word not found with id: " + id));
        return wordMapper.toDto(word);
    }

    @Override
    @Transactional(readOnly = true)
    public List<WordResponseDto> searchWords(String query) {
        List<Word> words = new ArrayList<>();
        words.addAll(wordRepository.findByEnglishWordContainingIgnoreCase(query));
        words.addAll(wordRepository.findByRussianTranslationContainingIgnoreCase(query));
        return wordMapper.toDtoList(words);
    }

    @Override
    public WordResponseDto createWord(WordRequestDto wordDto) {
        Unit unit = unitRepository.findById(wordDto.getUnitId())
                .orElseThrow(() -> new EntityNotFoundException("Unit not found with id: " + wordDto.getUnitId()));
        
        Word word = wordMapper.toEntity(wordDto);
        word.setUnit(unit);
        word = wordRepository.save(word);
        return wordMapper.toDto(word);
    }

    @Override
    public WordResponseDto updateWord(Long id, WordRequestDto wordDto) {
        Word word = wordRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Word not found with id: " + id));
        
        if (!word.getUnit().getId().equals(wordDto.getUnitId())) {
            Unit newUnit = unitRepository.findById(wordDto.getUnitId())
                    .orElseThrow(() -> new EntityNotFoundException("Unit not found with id: " + wordDto.getUnitId()));
            word.setUnit(newUnit);
        }
        
        wordMapper.updateEntity(word, wordDto);
        word = wordRepository.save(word);
        return wordMapper.toDto(word);
    }

    @Override
    public void deleteWord(Long id) {
        if (!wordRepository.existsById(id)) {
            throw new EntityNotFoundException("Word not found with id: " + id);
        }
        wordRepository.deleteById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public List<WordResponseDto> getRandomWordsByUnitId(Long unitId, int count) {
        List<Word> words = wordRepository.findByUnitId(unitId);
        Collections.shuffle(words);
        return wordMapper.toDtoList(words.stream()
                .limit(count)
                .collect(Collectors.toList()));
    }
} 