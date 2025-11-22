package ru.fridaylearning.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class WordRequestDto {
    
    @NotNull(message = "Unit ID is required")
    private Long unitId;
    
    @NotBlank(message = "English word is required")
    @Size(max = 100, message = "English word cannot exceed 100 characters")
    private String englishWord;
    
    @NotBlank(message = "Russian translation is required")
    @Size(max = 100, message = "Russian translation cannot exceed 100 characters")
    private String russianTranslation;
    
    @Size(max = 100, message = "Transcription cannot exceed 100 characters")
    private String transcription;
    
    @Size(max = 500, message = "Example sentence cannot exceed 500 characters")
    private String exampleSentence;

    public Long getUnitId() {
        return unitId;
    }

    public void setUnitId(Long unitId) {
        this.unitId = unitId;
    }

    public String getEnglishWord() {
        return englishWord;
    }

    public void setEnglishWord(String englishWord) {
        this.englishWord = englishWord;
    }

    public String getRussianTranslation() {
        return russianTranslation;
    }

    public void setRussianTranslation(String russianTranslation) {
        this.russianTranslation = russianTranslation;
    }

    public String getTranscription() {
        return transcription;
    }

    public void setTranscription(String transcription) {
        this.transcription = transcription;
    }

    public String getExampleSentence() {
        return exampleSentence;
    }

    public void setExampleSentence(String exampleSentence) {
        this.exampleSentence = exampleSentence;
    }
} 