# Friday Words - Приложение для изучения английского языка

## Описание проекта
Friday Words - это веб-приложение для изучения английского языка, разработанное на Spring Boot. Приложение позволяет пользователям изучать новые слова, проходить тренировки и отслеживать свой прогресс.

## Технический стек

### Backend
- **Framework:** Spring Boot 3.2.x
- **Язык:** Java 17
- **Сборка:** Maven
- **База данных:** H2 (встроенная)
- **ORM:** JPA/Hibernate
- **Миграции:** Flyway
- **Шаблонизатор:** Thymeleaf
- **API:** REST

### Frontend
- **JavaScript:** Vanilla JS (ES6+)
- **HTML:** HTML5
- **CSS:** 
  - Flexbox/Grid
  - CSS Variables
  - Media Queries
- **API:** 
  - Fetch API
  - Web Speech API

## Быстрый старт

### Предварительные требования
- JDK 17+
- Maven 3.8+
- Git

### Установка и запуск
```bash
# Клонирование репозитория
git clone [url-репозитория]

# Сборка проекта
mvn clean package

# Запуск приложения
java -jar target/language-trainer-0.0.1-SNAPSHOT.jar
```

### Сборка Docker образа
```bash
mvn clean package -P prod docker:build
```

## Структура проекта
```
src/
├── main/
│   ├── java/
│   │   └── com/fridaywords/
│   │       ├── controller/
│   │       ├── model/
│   │       ├── repository/
│   │       ├── service/
│   │       └── LanguageTrainerApplication.java
│   └── resources/
│       ├── static/
│       ├── templates/
│       ├── application.properties
│       └── db/migration/
└── test/
```

## Конфигурация

### База данных (H2)
```properties
spring.datasource.url=jdbc:h2:file:./data/language_trainer
spring.datasource.username=sa
spring.datasource.password=password
spring.h2.console.enabled=true
spring.h2.console.path=/h2-console
```

### JPA/Hibernate
```properties
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
spring.jpa.hibernate.ddl-auto=none
spring.flyway.enabled=true
spring.flyway.baseline-on-migrate=true
```

## Модели данных

### Word (Слово)
```java
@Entity
@Table(name = "words")
public class Word {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String englishWord;
    private String russianTranslation;
    private String transcription;
    
    @ManyToOne
    @JoinColumn(name = "unit_id")
    private Unit unit;
    
    // Геттеры, сеттеры и другие методы
}
```

## API Endpoints

### Слова
- `GET /api/words` - получить все слова
- `GET /api/words/{id}` - получить слово по ID
- `POST /api/words` - создать новое слово
- `PUT /api/words/{id}` - обновить слово
- `DELETE /api/words/{id}` - удалить слово

## Разработка

### Рекомендуемые инструменты
- **IDE:** IntelliJ IDEA
- **База данных:** DBeaver
- **API тестирование:** Postman
- **Браузеры:** Chrome, Firefox

### Логирование
- Логи приложения: `logs/application.log`
- Настройка уровня логирования в `application.properties`

## Безопасность
1. Использовать HTTPS для продакшена
2. Изменить пароли по умолчанию
3. Настроить брандмауэр
4. Регулярно обновлять систему

## Лицензия
[Указать лицензию]

## Контакты
[Контактная информация]