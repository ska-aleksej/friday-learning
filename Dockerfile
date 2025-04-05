# Базовый образ (легкая версия Java 17)
FROM eclipse-temurin:17-jre-alpine

# Рабочая директория внутри контейнера
WORKDIR /app

# Копируем JAR-файл
COPY target/*.jar app.jar

# Открываем порт
EXPOSE 8080

# Команда запуска
ENTRYPOINT ["java", "-jar", "app.jar", "--spring.profiles.active=prod"]