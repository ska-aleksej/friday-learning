package site.fridaywords;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class FridayWordsApplication {

    public static void main(String[] args) {
        SpringApplication.run(FridayWordsApplication.class, args);
    }
} 