-- Таблица уровней языка
CREATE TABLE levels (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(3) NOT NULL UNIQUE,  -- A1, A2, PI, B1, B1+, B2, C1, C2
    description VARCHAR(500),
    display_order INT NOT NULL,       -- для правильного порядка отображения
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

-- Таблица разделов (юнитов)
CREATE TABLE units (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    level_id BIGINT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    display_order INT NOT NULL,       -- для порядка отображения внутри уровня
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    FOREIGN KEY (level_id) REFERENCES levels(id)
);

-- Таблица слов
CREATE TABLE words (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    unit_id BIGINT NOT NULL,
    english_word VARCHAR(200) NOT NULL,
    russian_translation VARCHAR(200) NOT NULL,
    transcription VARCHAR(200),
    example_sentence VARCHAR(500),    -- пример использования
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    FOREIGN KEY (unit_id) REFERENCES units(id)
);

-- Индексы для оптимизации запросов
CREATE INDEX idx_levels_display_order ON levels(display_order);
CREATE INDEX idx_units_level_id ON units(level_id);
CREATE INDEX idx_units_display_order ON units(display_order);
CREATE INDEX idx_words_unit_id ON words(unit_id); 