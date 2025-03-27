package site.fridaywords.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import site.fridaywords.dto.WordRequestDto;
import site.fridaywords.dto.WordResponseDto;
import site.fridaywords.mapper.WordMapper;
import site.fridaywords.model.Unit;
import site.fridaywords.model.Word;
import site.fridaywords.repository.UnitRepository;
import site.fridaywords.repository.WordRepository;
import site.fridaywords.service.WordService;

import jakarta.persistence.EntityNotFoundException;
import java.util.ArrayList;
import java.util.List;

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
} 