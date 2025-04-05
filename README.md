#Сборка образа для прода:
mvn clean package -P prod docker:build





## Технический стек

### Backend
- **Основной фреймворк:** Spring Boot 3.2.x
- **Язык:** Java 17
- **Сборка проекта:** Maven
- **База данных:** H2 (embedded)
- **Миграции:** Flyway
- **Шаблонизатор:** Thymeleaf
- **API:** REST

### Зависимости Maven
```xml
<dependencies>
    <!-- Spring Boot -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-jpa</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-thymeleaf</artifactId>
    </dependency>

    <!-- Database -->
    <dependency>
        <groupId>com.h2database</groupId>
        <artifactId>h2</artifactId>
        <scope>runtime</scope>
    </dependency>
    <dependency>
        <groupId>org.flywaydb</groupId>
        <artifactId>flyway-core</artifactId>
    </dependency>

    <!-- Dev Tools -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-devtools</artifactId>
        <scope>runtime</scope>
        <optional>true</optional>
    </dependency>

    <!-- Test -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-test</artifactId>
        <scope>test</scope>
    </dependency>
</dependencies>
```

### Frontend
- **JavaScript:** Vanilla JS (ES6+)
- **HTML:** HTML5
- **CSS:** 
  - Flexbox/Grid для layout
  - CSS Variables для тем
  - Media Queries для адаптивности
- **API:** 
  - Fetch API для запросов
  - Web Speech API для озвучки

### Инструменты разработки
- **IDE:** 
  - IntelliJ IDEA для backend
  - VS Code для frontend
- **База данных:** 
  - DBeaver или pgAdmin для управления PostgreSQL
- **API тестирование:** 
  - Postman или curl
- **Браузеры для тестирования:** 
  - Chrome (последняя версия)
  - Firefox (последняя версия)
  - Safari Mobile
  - Chrome Mobile

### Минимальные требования к окружению
- JDK 17+
- Maven 3.8+
- PostgreSQL 15+
- Node.js 18+ (опционально, для инструментов разработки)

### Версионирование
- Git
- Семантическое версионирование (MAJOR.MINOR.PATCH)

### Деплой проекта
```bash
# Сборка JAR
mvn clean package

# Запуск приложения
java -jar target/language-trainer-0.0.1-SNAPSHOT.jar
```

### Преимущества использования H2:
1. Встроенная база данных (не требует установки)
2. Файловый режим (данные сохраняются между запусками)
3. Веб-консоль для просмотра данных
4. Совместимость с SQL
5. Легкий переход на PostgreSQL в будущем

### Структура проекта

### Требования к серверу
- JDK 17+
- PostgreSQL 15+
- Минимум 1GB RAM
- ~500MB места на диске

### Сборка проекта
```bash
# Сборка JAR файла
mvn clean package

# JAR файл будет создан в target/language-trainer-0.0.1-SNAPSHOT.jar
```

### Настройка базы данных
```sql
-- Создание базы данных и пользователя
CREATE DATABASE language_trainer;
CREATE USER language_trainer_user WITH PASSWORD 'your_password';
GRANT ALL PRIVILEGES ON DATABASE language_trainer TO language_trainer_user;
```

### Конфигурация приложения
Файл `application.properties`:
```properties
# H2 Database
spring.datasource.url=jdbc:h2:file:./data/language_trainer
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password=password

# H2 Console (опционально, для разработки)
spring.h2.console.enabled=true
spring.h2.console.path=/h2-console

# JPA/Hibernate
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
spring.jpa.hibernate.ddl-auto=none

# Миграции
spring.flyway.enabled=true
spring.flyway.baseline-on-migrate=true

# Сервер
server.port=8080
```

### Запуск приложения
```bash
# Запуск с настройками по умолчанию
java -jar target/language-trainer-0.0.1-SNAPSHOT.jar

# Запуск с переопределением настроек
java -jar target/language-trainer-0.0.1-SNAPSHOT.jar \
  --spring.datasource.password=new_password \
  --server.port=8081
```

### Проверка работоспособности
1. Открыть в браузере `http://localhost:8080`
2. Проверить доступность API: `http://localhost:8080/api/courses`
3. Проверить работу озвучки на странице тренировки

### Логирование
- Логи приложения пишутся в `logs/application.log`
- Уровень логирования настраивается в `application.properties`

### Обновление приложения
1. Остановить текущую версию
2. Сделать бэкап базы данных
3. Скопировать новый JAR файл
4. Запустить новую версию

### Рекомендации по безопасности
1. Использовать HTTPS если сервис будет в интернете
2. Изменить пароли по умолчанию
3. Настроить брандмауэр
4. Регулярное обновление системы

Теперь документация содержит все ключевые детали для восстановления контекста, включая:
1. Точное описание функционала
2. Ограничения MVP
3. Формат данных
4. Обработку ошибок
5. План дальнейшего развития

Это должно помочь сохранить полное понимание проекта и его требований. Хотите что-то ещё уточнить или добавить?

### Примеры классов модели

```java
@Entity
@Table(name = "words")
public class Word {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String englishWord;

    @Column(nullable = false)
    private String russianTranslation;

    private String transcription;

    @ManyToOne
    @JoinColumn(name = "unit_id", nullable = false)
    private Unit unit;

    // Конструкторы
    public Word() {
    }

    public Word(String englishWord, String russianTranslation, String transcription, Unit unit) {
        this.englishWord = englishWord;
        this.russianTranslation = russianTranslation;
        this.transcription = transcription;
        this.unit = unit;
    }

    // Геттеры и сеттеры
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Unit getUnit() {
        return unit;
    }

    public void setUnit(Unit unit) {
        this.unit = unit;
    }

    // equals, hashCode и toString
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Word word = (Word) o;
        return Objects.equals(id, word.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "Word{" +
                "id=" + id +
                ", englishWord='" + englishWord + '\'' +
                ", russianTranslation='" + russianTranslation + '\'' +
                ", transcription='" + transcription + '\'' +
                '}';
    }
}
```

### DTO для API
```java
public class WordDTO {
    private String englishWord;
    private String russianTranslation;
    private String transcription;

    // Конструкторы
    public WordDTO() {
    }

    public WordDTO(String englishWord, String russianTranslation, String transcription) {
        this.englishWord = englishWord;
        this.russianTranslation = russianTranslation;
        this.transcription = transcription;
    }

    // Геттеры и сеттеры
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
} 
```