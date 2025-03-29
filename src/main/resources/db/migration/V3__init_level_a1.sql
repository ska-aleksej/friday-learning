-- V2__Seed_A1_units.sql
INSERT INTO units (level_id, name, description, display_order) VALUES
    ((SELECT id FROM levels WHERE name = 'A1'), 'Unit 1 - Countries and Nationalities', 'Страны, национальности и базовые фразы', 1),
    ((SELECT id FROM levels WHERE name = 'A1'), 'Unit 2 - Places and Travel', 'Места, путешествия и направления', 2),
    ((SELECT id FROM levels WHERE name = 'A1'), 'Unit 3 - Family and Holidays', 'Семья, праздники и месяцы года', 3),
    ((SELECT id FROM levels WHERE name = 'A1'), 'Unit 4 - City and Places', 'Городские места и навигация', 4),
    ((SELECT id FROM levels WHERE name = 'A1'), 'Unit 5 - Everyday Objects', 'Повседневные предметы и технологии', 5),
    ((SELECT id FROM levels WHERE name = 'A1'), 'Unit 6 - Food and Activities', 'Еда, напитки и виды деятельности', 6),
    ((SELECT id FROM levels WHERE name = 'A1'), 'Unit 7 - Daily Routine', 'Распорядок дня и погода', 7),
    ((SELECT id FROM levels WHERE name = 'A1'), 'Unit 8 - Jobs and Professions', 'Профессии и рабочие места', 8),
    ((SELECT id FROM levels WHERE name = 'A1'), 'Unit 9 - Clothing and Shopping', 'Одежда и покупки', 9),
    ((SELECT id FROM levels WHERE name = 'A1'), 'Unit 10 - Memories and Experiences', 'Воспоминания и жизненный опыт', 10);

    -- Seed_A1_Unit1_words
    WITH unit_data AS (
        SELECT
            u.id AS unit_id
        FROM
            units u
        JOIN
            levels l ON u.level_id = l.id
        WHERE
            l.name = 'A1'
            AND u.display_order = 1  -- Unit 1
    )

    INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
    SELECT
        ud.unit_id,
        data.english_word,
        data.russian_translation,
        data.transcription,
        data.example_sentence
    FROM
        unit_data ud
    CROSS JOIN (
        -- Страны и национальности
        SELECT 'American' AS english_word, 'американский, американец' AS russian_translation, '/əˈmɛr.ɪ.kən/' AS transcription, 'She is American.' AS example_sentence UNION ALL
        SELECT 'Brazil', 'Бразилия', '/brəˈzɪl/', 'I want to visit Brazil.' UNION ALL
        SELECT 'Brazilian', 'бразильский, бразилец', '/brəˈzɪl.i.ən/', 'He is Brazilian.' UNION ALL
        SELECT 'British', 'британский, британец', '/ˈbrɪt.ɪʃ/', 'The British Museum is in London.' UNION ALL
        SELECT 'Canada', 'Канада', '/ˈkæn.ə.də/', 'Canada is very cold in winter.' UNION ALL
        SELECT 'Egypt', 'Египет', '/ˈiː.dʒɪpt/', 'Egypt has pyramids.' UNION ALL
        SELECT 'Egyptian', 'египетский, египтянин', '/iˈdʒɪp.ʃən/', 'The Egyptian museum is interesting.' UNION ALL
        SELECT 'Italy', 'Италия', '/ˈɪt.əl.i/', 'Pizza is from Italy.' UNION ALL
        SELECT 'Italian', 'итальянский, итальянец', '/ɪˈtæl.i.ən/', 'I love Italian food.' UNION ALL
        SELECT 'Mexico', 'Мексика', '/ˈmek.sɪ.koʊ/', 'Mexico is very warm.' UNION ALL
        SELECT 'Mexican', 'мексиканский, мексиканец', '/ˈmek.sɪ.kən/', 'Tacos are Mexican food.' UNION ALL
        SELECT 'Vietnam', 'Вьетнам', '/ˌvjetˈnæm/', 'Vietnam is in Asia.' UNION ALL
        SELECT 'Vietnamese', 'вьетнамский, вьетнамец', '/ˌvjet.nəˈmiːz/', 'Pho is Vietnamese soup.' UNION ALL
        SELECT 'Spain', 'Испания', '/speɪn/', 'Spain is sunny.' UNION ALL
        SELECT 'The United Kingdom', 'Соединенное Королевство', '/ðə juːˌnaɪ.tɪd ˈkɪŋ.dəm/', 'London is in the UK.' UNION ALL
        SELECT 'The United States of America', 'США', '/ðə juːˌnaɪ.tɪd steɪts əv əˈmer.ɪ.kə/', 'New York is in the USA.' UNION ALL

        -- Базовые фразы
        SELECT 'Hello', 'привет', '/həˈloʊ/', 'Hello! My name is Anna.' UNION ALL
        SELECT 'Hi', 'привет', '/haɪ/', 'Hi! How are you?' UNION ALL
        SELECT 'Goodbye', 'до свидания', '/ˌɡʊdˈbaɪ/', 'Goodbye! See you tomorrow!' UNION ALL
        SELECT 'Bye', 'пока', '/baɪ/', 'Bye! Have a nice day!' UNION ALL
        SELECT 'Good evening', 'добрый вечер', '/ˌɡʊd ˈiːv.nɪŋ/', 'Good evening! How are you?' UNION ALL
        SELECT 'Good night', 'спокойной ночи', '/ˌɡʊd ˈnaɪt/', 'Good night! Sweet dreams!' UNION ALL
        SELECT 'Nice to meet you', 'приятно познакомиться', '/ˌnaɪs tə ˈmiːt juː/', 'Nice to meet you! My name is Alex.' UNION ALL

        -- Общие слова
        SELECT 'Name', 'имя', '/neɪm/', 'My name is Olga.' UNION ALL
        SELECT 'Country', 'страна', '/ˈkʌn.tri/', 'Russia is a big country.' UNION ALL
        SELECT 'Nationality', 'национальность', '/ˌnæʃ.əˈnæl.ə.ti/', 'What is your nationality?' UNION ALL
        SELECT 'Language', 'язык', '/ˈlæŋ.ɡwɪdʒ/', 'English is an international language.' UNION ALL
        SELECT 'Capital letter', 'заглавная буква', '/ˈkæp.ɪ.təl ˈlet.ər/', 'Start with a capital letter.' UNION ALL
        SELECT 'City', 'город', '/ˈsɪt.i/', 'Moscow is a big city.' UNION ALL
        SELECT 'People', 'люди', '/ˈpiː.pəl/', 'Many people live here.' UNION ALL
        SELECT 'Photo', 'фотография', '/ˈfəʊ.təʊ/', 'This is my family photo.' UNION ALL

        -- Глаголы
        SELECT 'Speak', 'говорить', '/spiːk/', 'I speak English.' UNION ALL
        SELECT 'Understand', 'понимать', '/ˌʌn.dəˈstænd/', 'I understand Russian.' UNION ALL
        SELECT 'Repeat', 'повторять', '/rɪˈpiːt/', 'Repeat after me.' UNION ALL
        SELECT 'Listen', 'слушать', '/ˈlɪs.ən/', 'Listen to the teacher.' UNION ALL
        SELECT 'Read', 'читать', '/riːd/', 'I read books.' UNION ALL
        SELECT 'Write', 'писать', '/raɪt/', 'Write your name here.' UNION ALL
        SELECT 'Say', 'сказать', '/seɪ/', 'Say "Hello" in English.' UNION ALL
        SELECT 'Spell', 'говорить по буквам', '/spel/', 'Spell your name, please.' UNION ALL

        -- Предметы
        SELECT 'Notebook', 'блокнот', '/ˈnəʊt.bʊk/', 'Write in your notebook.' UNION ALL
        SELECT 'Pen', 'ручка', '/pen/', 'This is my pen.' UNION ALL
        SELECT 'Pencil', 'карандаш', '/ˈpen.səl/', 'I write with a pencil.' UNION ALL
        SELECT 'Table', 'стол', '/ˈteɪ.bəl/', 'The book is on the table.' UNION ALL
        SELECT 'Teacher', 'учитель', '/ˈtiː.tʃər/', 'Our teacher is kind.' UNION ALL
        SELECT 'Student', 'студент, ученик', '/ˈstjuː.dənt/', 'I am a student.' UNION ALL
        SELECT 'Classroom', 'аудитория', '/ˈklɑːs.ruːm/', 'We are in the classroom.'
    ) AS data
    WHERE EXISTS (SELECT 1 FROM unit_data);  -- Вставка только если юнит существует


    -- Seed_A1_Unit2_words
    WITH unit_data AS (
        SELECT
            u.id AS unit_id
        FROM
            units u
        JOIN
            levels l ON u.level_id = l.id
        WHERE
            l.name = 'A1'
            AND u.display_order = 2  -- Unit 2
    )

    INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
    SELECT
        ud.unit_id,
        data.english_word,
        data.russian_translation,
        data.transcription,
        data.example_sentence
    FROM
        unit_data ud
    CROSS JOIN (
        -- Места и направления
        SELECT 'Airport' AS english_word, 'аэропорт' AS russian_translation, '/ˈeə.pɔːrt/' AS transcription, 'We meet at the airport.' AS example_sentence UNION ALL
        SELECT 'Beach', 'пляж', '/biːtʃ/', 'The beach is beautiful.' UNION ALL
        SELECT 'City', 'город', '/ˈsɪt.i/', 'Moscow is a big city.' UNION ALL
        SELECT 'Country', 'страна', '/ˈkʌn.tri/', 'France is a beautiful country.' UNION ALL
        SELECT 'Desert', 'пустыня', '/ˈdez.ət/', 'The desert is very hot.' UNION ALL
        SELECT 'Hotel', 'отель', '/həʊˈtel/', 'We stay at a hotel.' UNION ALL
        SELECT 'Island', 'остров', '/ˈaɪ.lənd/', 'The island is small.' UNION ALL
        SELECT 'Lake', 'озеро', '/leɪk/', 'We swim in the lake.' UNION ALL
        SELECT 'Mountain', 'гора', '/ˈmaʊn.tɪn/', 'The mountain is high.' UNION ALL
        SELECT 'River', 'река', '/ˈrɪv.ər/', 'The river is long.' UNION ALL
        SELECT 'Sea', 'море', '/siː/', 'I swim in the sea.' UNION ALL
        SELECT 'Town', 'город (маленький)', '/taʊn/', 'My town is quiet.' UNION ALL
        SELECT 'Vacation', 'отпуск', '/veɪˈkeɪ.ʃən/', 'We are on vacation.' UNION ALL

        -- Транспорт
        SELECT 'Car', 'машина', '/kɑːr/', 'My car is red.' UNION ALL
        SELECT 'Plane', 'самолет', '/pleɪn/', 'The plane flies fast.' UNION ALL
        SELECT 'Train', 'поезд', '/treɪn/', 'The train arrives at 5 PM.' UNION ALL
        SELECT 'Bus', 'автобус', '/bʌs/', 'I go to school by bus.' UNION ALL

        -- Прилагательные
        SELECT 'Beautiful', 'красивый', '/ˈbjuː.tɪ.fəl/', 'She has a beautiful dress.' UNION ALL
        SELECT 'Cold', 'холодный', '/kəʊld/', 'Today is very cold.' UNION ALL
        SELECT 'Hot', 'жаркий', '/hɒt/', 'The tea is very hot.' UNION ALL
        SELECT 'Warm', 'теплый', '/wɔːm/', 'The weather is warm.' UNION ALL
        SELECT 'Old', 'старый', '/əʊld/', 'This house is old.' UNION ALL
        SELECT 'New', 'новый', '/njuː/', 'I have a new phone.' UNION ALL
        SELECT 'Big', 'большой', '/bɪɡ/', 'Russia is a big country.' UNION ALL
        SELECT 'Small', 'маленький', '/smɔːl/', 'The cat is small.' UNION ALL

        -- Цвета
        SELECT 'Black', 'черный', '/blæk/', 'The cat is black.' UNION ALL
        SELECT 'Blue', 'синий', '/bluː/', 'The sky is blue.' UNION ALL
        SELECT 'Brown', 'коричневый', '/braʊn/', 'I have brown eyes.' UNION ALL
        SELECT 'Green', 'зеленый', '/ɡriːn/', 'The grass is green.' UNION ALL
        SELECT 'Orange', 'оранжевый', '/ˈɒr.ɪndʒ/', 'The orange is orange.' UNION ALL
        SELECT 'Pink', 'розовый', '/pɪŋk/', 'Her dress is pink.' UNION ALL
        SELECT 'Red', 'красный', '/red/', 'The apple is red.' UNION ALL
        SELECT 'White', 'белый', '/waɪt/', 'The snow is white.' UNION ALL
        SELECT 'Yellow', 'желтый', '/ˈjel.əʊ/', 'The sun is yellow.' UNION ALL

        -- Дни недели
        SELECT 'Monday', 'понедельник', '/ˈmʌn.deɪ/', 'I have English on Monday.' UNION ALL
        SELECT 'Tuesday', 'вторник', '/ˈtjuːz.deɪ/', 'Tuesday is after Monday.' UNION ALL
        SELECT 'Wednesday', 'среда', '/ˈwenz.deɪ/', 'We meet on Wednesday.' UNION ALL
        SELECT 'Thursday', 'четверг', '/ˈθɜːz.deɪ/', 'Thursday is before Friday.' UNION ALL
        SELECT 'Friday', 'пятница', '/ˈfraɪ.deɪ/', 'Friday is my favorite day.' UNION ALL
        SELECT 'Saturday', 'суббота', '/ˈsæt.ə.deɪ/', 'I don''t work on Saturday.' UNION ALL
        SELECT 'Sunday', 'воскресенье', '/ˈsʌn.deɪ/', 'Sunday is a day of rest.' UNION ALL

        -- Другие слова
        SELECT 'Address', 'адрес', '/əˈdres/', 'What is your address?' UNION ALL
        SELECT 'Friend', 'друг', '/frend/', 'He is my best friend.' UNION ALL
        SELECT 'Happy', 'счастливый', '/ˈhæp.i/', 'I am happy today.' UNION ALL
        SELECT 'Key', 'ключ', '/kiː/', 'I can''t find my keys.' UNION ALL
        SELECT 'Map', 'карта', '/mæp/', 'We need a map.' UNION ALL
        SELECT 'Photo', 'фотография', '/ˈfəʊ.təʊ/', 'This is my photo.' UNION ALL
        SELECT 'Today', 'сегодня', '/təˈdeɪ/', 'Today is Monday.' UNION ALL
        SELECT 'Week', 'неделя', '/wiːk/', 'I work five days a week.'
    ) AS data
    WHERE EXISTS (SELECT 1 FROM unit_data);

    -- Seed_A1_Unit3_words
    WITH unit_data AS (
        SELECT
            u.id AS unit_id
        FROM
            units u
        JOIN
            levels l ON u.level_id = l.id
        WHERE
            l.name = 'A1'
            AND u.display_order = 3  -- Unit 3
    )

    INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
    SELECT
        ud.unit_id,
        data.english_word,
        data.russian_translation,
        data.transcription,
        data.example_sentence
    FROM
        unit_data ud
    CROSS JOIN (
        -- Семья
        SELECT 'Family' AS english_word, 'семья' AS russian_translation, '/ˈfæm.əl.i/' AS transcription, 'I love my family.' AS example_sentence UNION ALL
        SELECT 'Mother', 'мама', '/ˈmʌð.ər/', 'My mother is kind.' UNION ALL
        SELECT 'Father', 'папа', '/ˈfɑː.ðər/', 'My father is tall.' UNION ALL
        SELECT 'Parents', 'родители', '/ˈpeə.rənts/', 'My parents are teachers.' UNION ALL
        SELECT 'Brother', 'брат', '/ˈbrʌð.ər/', 'I have one brother.' UNION ALL
        SELECT 'Sister', 'сестра', '/ˈsɪs.tər/', 'My sister is young.' UNION ALL
        SELECT 'Son', 'сын', '/sʌn/', 'Their son is five.' UNION ALL
        SELECT 'Daughter', 'дочь', '/ˈdɔː.tər/', 'Her daughter is smart.' UNION ALL
        SELECT 'Grandfather', 'дедушка', '/ˈɡræn.fɑː.ðər/', 'My grandfather is old.' UNION ALL
        SELECT 'Grandmother', 'бабушка', '/ˈɡræn.mʌð.ər/', 'My grandmother cooks well.' UNION ALL
        SELECT 'Grandparents', 'бабушка и дедушка', '/ˈɡræn.peə.rənts/', 'I visit my grandparents.' UNION ALL
        SELECT 'Husband', 'муж', '/ˈhʌz.bənd/', 'Her husband is a doctor.' UNION ALL
        SELECT 'Wife', 'жена', '/waɪf/', 'His wife is friendly.' UNION ALL
        SELECT 'Children', 'дети', '/ˈtʃɪl.drən/', 'The children are playing.' UNION ALL
        SELECT 'Cousin', 'двоюродный брат/сестра', '/ˈkʌz.ən/', 'My cousin lives in Moscow.' UNION ALL
        SELECT 'Best friend', 'лучший друг', '/ˌbest ˈfrend/', 'Anna is my best friend.' UNION ALL

        -- Праздники
        SELECT 'Celebration', 'празднование', '/ˌsel.əˈbreɪ.ʃən/', 'The celebration is fun.' UNION ALL
        SELECT 'Christmas', 'Рождество', '/ˈkrɪs.məs/', 'We celebrate Christmas.' UNION ALL
        SELECT 'New Year', 'Новый год', '/ˌnjuː ˈjɪər/', 'Happy New Year!' UNION ALL
        SELECT 'Birthday', 'день рождения', '/ˈbɜːθ.deɪ/', 'Today is my birthday.' UNION ALL
        SELECT 'Wedding', 'свадьба', '/ˈwed.ɪŋ/', 'The wedding is beautiful.' UNION ALL
        SELECT 'Holiday', 'праздник', '/ˈhɒl.ə.deɪ/', 'I love summer holidays.' UNION ALL

        -- Месяцы
        SELECT 'January', 'январь', '/ˈdʒæn.ju.ə.ri/', 'January is cold.' UNION ALL
        SELECT 'February', 'февраль', '/ˈfeb.ru.ə.ri/', 'February is short.' UNION ALL
        SELECT 'March', 'март', '/mɑːtʃ/', 'Spring starts in March.' UNION ALL
        SELECT 'April', 'апрель', '/ˈeɪ.prəl/', 'April has rain.' UNION ALL
        SELECT 'May', 'май', '/meɪ/', 'May is warm.' UNION ALL
        SELECT 'June', 'июнь', '/dʒuːn/', 'Summer begins in June.' UNION ALL
        SELECT 'July', 'июль', '/dʒʊˈlaɪ/', 'July is hot.' UNION ALL
        SELECT 'August', 'август', '/ˈɔː.ɡəst/', 'We rest in August.' UNION ALL
        SELECT 'September', 'сентябрь', '/sepˈtem.bər/', 'School starts in September.' UNION ALL
        SELECT 'October', 'октябрь', '/ɒkˈtəʊ.bər/', 'October has colorful leaves.' UNION ALL
        SELECT 'November', 'ноябрь', '/nəʊˈvem.bər/', 'November is cold.' UNION ALL
        SELECT 'December', 'декабрь', '/dɪˈsem.bər/', 'December has snow.' UNION ALL

        -- Другие слова
        SELECT 'Animal', 'животное', '/ˈæn.ɪ.məl/', 'I love animals.' UNION ALL
        SELECT 'Card', 'открытка', '/kɑːd/', 'I send a birthday card.' UNION ALL
        SELECT 'Gift', 'подарок', '/ɡɪft/', 'This gift is for you.' UNION ALL
        SELECT 'Happy', 'счастливый', '/ˈhæp.i/', 'I am happy today.' UNION ALL
        SELECT 'Photo', 'фотография', '/ˈfəʊ.təʊ/', 'This is a family photo.' UNION ALL
        SELECT 'Traditional', 'традиционный', '/trəˈdɪʃ.ən.əl/', 'This is a traditional dish.' UNION ALL
        SELECT 'Young', 'молодой', '/jʌŋ/', 'My brother is young.'
    ) AS data
    WHERE EXISTS (SELECT 1 FROM unit_data);

    -- Seed_A1_Unit4_words
    WITH unit_data AS (
        SELECT
            u.id AS unit_id
        FROM
            units u
        JOIN
            levels l ON u.level_id = l.id
        WHERE
            l.name = 'A1'
            AND u.display_order = 4  -- Unit 4
    )

    INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
    SELECT
        ud.unit_id,
        data.english_word,
        data.russian_translation,
        data.transcription,
        data.example_sentence
    FROM
        unit_data ud
    CROSS JOIN (
        -- Продукты и места
        SELECT 'Apple' AS english_word, 'яблоко' AS russian_translation, '/ˈæp.əl/' AS transcription, 'I eat an apple.' AS example_sentence UNION ALL
        SELECT 'Banana', 'банан', '/bəˈnɑː.nə/', 'This banana is yellow.' UNION ALL
        SELECT 'Coffee', 'кофе', '/ˈkɒf.i/', 'I drink coffee.' UNION ALL
        SELECT 'Tea', 'чай', '/tiː/', 'Would you like some tea?' UNION ALL
        SELECT 'Salad', 'салат', '/ˈsæl.əd/', 'The salad is fresh.' UNION ALL
        SELECT 'Sandwich', 'бутерброд', '/ˈsæn.wɪdʒ/', 'I make a sandwich.' UNION ALL
        SELECT 'Water', 'вода', '/ˈwɔː.tər/', 'Drink more water.' UNION ALL

        -- Городские объекты
        SELECT 'Building' AS english_word, 'здание' AS russian_translation, '/ˈbɪl.dɪŋ/' AS transcription, 'This building is tall.' AS example_sentence UNION ALL
        SELECT 'Bridge', 'мост', '/brɪdʒ/', 'The bridge is old.' UNION ALL
        SELECT 'Bus station', 'автобусная остановка', '/ˈbʌs ˌsteɪ.ʃən/', 'Wait at the bus station.' UNION ALL
        SELECT 'Café', 'кафе', '/ˈkæf.eɪ/', 'Let''s meet at the café.' UNION ALL
        SELECT 'Capital', 'столица', '/ˈkæp.ɪ.təl/', 'London is a capital.' UNION ALL
        SELECT 'City', 'город', '/ˈsɪt.i/', 'I live in a big city.' UNION ALL
        SELECT 'Class', 'класс', '/klɑːs/', 'Our class is friendly.' UNION ALL
        SELECT 'Classroom', 'классная комната', '/ˈklɑːs.ruːm/', 'We study in the classroom.' UNION ALL
        SELECT 'Garden', 'сад', '/ˈɡɑː.dən/', 'The garden is beautiful.' UNION ALL
        SELECT 'Market', 'рынок', '/ˈmɑː.kɪt/', 'Buy fruit at the market.' UNION ALL
        SELECT 'Movie theatre', 'кинотеатр', '/ˈmuː.vi ˌθɪə.tər/', 'We go to the movie theatre.' UNION ALL
        SELECT 'Museum', 'музей', '/mjuˈziː.əm/', 'The museum is interesting.' UNION ALL
        SELECT 'Park', 'парк', '/pɑːk/', 'Children play in the park.' UNION ALL
        SELECT 'Restaurant', 'ресторан', '/ˈres.tər.ɒnt/', 'The restaurant is expensive.' UNION ALL
        SELECT 'River', 'река', '/ˈrɪv.ər/', 'The river is long.' UNION ALL
        SELECT 'Shopping street', 'торговая улица', '/ˈʃɒp.ɪŋ striːt/', 'The shopping street is busy.' UNION ALL
        SELECT 'Supermarket', 'супермаркет', '/ˈsuː.pəˌmɑː.kɪt/', 'I buy food at the supermarket.' UNION ALL
        SELECT 'Town', 'городок', '/taʊn/', 'This town is small.' UNION ALL
        SELECT 'Train station', 'вокзал', '/ˈtreɪn ˌsteɪ.ʃən/', 'The train arrives at the station.' UNION ALL
        SELECT 'Tree', 'дерево', '/triː/', 'The tree is green.' UNION ALL

        -- Прилагательные
        SELECT 'Closed' AS english_word, 'закрытый' AS russian_translation, '/kləʊzd/' AS transcription, 'The shop is closed.' AS example_sentence UNION ALL
        SELECT 'Dirty', 'грязный', '/ˈdɜː.ti/', 'The street is dirty.' UNION ALL
        SELECT 'Modern', 'современный', '/ˈmɒd.ən/', 'This building is modern.' UNION ALL
        SELECT 'New', 'новый', '/njuː/', 'I have a new book.' UNION ALL
        SELECT 'Old', 'старый', '/əʊld/', 'The house is old.' UNION ALL
        SELECT 'Open', 'открытый', '/ˈəʊ.pən/', 'The café is open.' UNION ALL
        SELECT 'Popular', 'популярный', '/ˈpɒp.jə.lər/', 'This place is popular.' UNION ALL
        SELECT 'Tall', 'высокий', '/tɔːl/', 'The building is tall.' UNION ALL
        SELECT 'Wrong', 'неправильный', '/rɒŋ/', 'This answer is wrong.' UNION ALL

        -- Другие слова
        SELECT 'Guidebook' AS english_word, 'путеводитель' AS russian_translation, '/ˈɡaɪd.bʊk/' AS transcription, 'We need a guidebook.' AS example_sentence UNION ALL
        SELECT 'Information center', 'информационный центр', '/ˌɪn.fəˈmeɪ.ʃən ˌsen.tər/', 'Ask at the information center.' UNION ALL
        SELECT 'Schedule', 'расписание', '/ˈʃed.juːl/', 'Check the bus schedule.' UNION ALL
        SELECT 'Sign', 'знак', '/saɪn/', 'Read the sign.' UNION ALL
        SELECT 'Snack', 'перекус', '/snæk/', 'I eat a snack.' UNION ALL
        SELECT 'Time zone', 'часовой пояс', '/ˈtaɪm zəʊn/', 'Moscow has one time zone.' UNION ALL
        SELECT 'Tower', 'башня', '/ˈtaʊ.ər/', 'The tower is high.' UNION ALL
        SELECT 'Vacation', 'отпуск', '/vəˈkeɪ.ʃən/', 'We plan a vacation.'
    ) AS data
    WHERE EXISTS (SELECT 1 FROM unit_data);

    -- Seed_A1_Unit5_words
    WITH unit_data AS (
        SELECT
            u.id AS unit_id
        FROM
            units u
        JOIN
            levels l ON u.level_id = l.id
        WHERE
            l.name = 'A1'
            AND u.display_order = 5  -- Unit 5
    )

    INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
    SELECT
        ud.unit_id,
        data.english_word,
        data.russian_translation,
        data.transcription,
        data.example_sentence
    FROM
        unit_data ud
    CROSS JOIN (
        -- Электроника и гаджеты
        SELECT 'Alarm clock' AS english_word, 'будильник' AS russian_translation, '/əˈlɑːrm ˌklɒk/' AS transcription, 'My alarm clock rings at 7 AM.' AS example_sentence UNION ALL
        SELECT 'App', 'приложение', '/æp/', 'This app is useful.' UNION ALL
        SELECT 'Battery', 'батарейка', '/ˈbæt.ər.i/', 'The battery is dead.' UNION ALL
        SELECT 'Cell phone', 'мобильный телефон', '/ˈsel ˌfəʊn/', 'My cell phone is new.' UNION ALL
        SELECT 'Computer', 'компьютер', '/kəmˈpjuː.tər/', 'I work on the computer.' UNION ALL
        SELECT 'Credit card', 'кредитная карта', '/ˈkred.ɪt ˌkɑːd/', 'Pay by credit card.' UNION ALL
        SELECT 'Gadget', 'гаджет', '/ˈɡædʒ.ɪt/', 'This gadget is fun.' UNION ALL
        SELECT 'Keyboard', 'клавиатура', '/ˈkiː.bɔːd/', 'The keyboard has letters.' UNION ALL
        SELECT 'Laptop', 'ноутбук', '/ˈlæp.tɒp/', 'My laptop is fast.' UNION ALL
        SELECT 'Memory stick', 'флешка', '/ˈmem.ər.i ˌstɪk/', 'Save files on the memory stick.' UNION ALL
        SELECT 'Screen', 'экран', '/skriːn/', 'The screen is big.' UNION ALL
        SELECT 'Tablet', 'планшет', '/ˈtæb.lət/', 'I read books on my tablet.' UNION ALL
        SELECT 'Touchscreen', 'сенсорный экран', '/ˈtʌtʃ.skriːn/', 'The phone has a touchscreen.' UNION ALL
        SELECT 'Web-cam', 'веб-камера', '/ˈweb.kæm/', 'We use a web-cam for calls.' UNION ALL

        -- Предметы быта
        SELECT 'Basket' AS english_word, 'корзина' AS russian_translation, '/ˈbɑː.skɪt/' AS transcription, 'Put clothes in the basket.' AS example_sentence UNION ALL
        SELECT 'Coffee machine', 'кофемашина', '/ˈkɒf.i məˌʃiːn/', 'The coffee machine makes espresso.' UNION ALL
        SELECT 'Diary', 'дневник', '/ˈdaɪ.ər.i/', 'I write in my diary.' UNION ALL
        SELECT 'Glasses', 'очки', '/ˈɡlɑː.sɪz/', 'I wear glasses.' UNION ALL
        SELECT 'Headphones', 'наушники', '/ˈhed.fəʊnz/', 'Listen with headphones.' UNION ALL
        SELECT 'Microwave oven', 'микроволновка', '/ˈmaɪ.krə.weɪv ˌʌv.ən/', 'Heat food in the microwave oven.' UNION ALL
        SELECT 'Purse', 'кошелек', '/pɜːs/', 'My purse is small.' UNION ALL
        SELECT 'Wallet', 'бумажник', '/ˈwɒl.ɪt/', 'Keep money in your wallet.' UNION ALL
        SELECT 'Watch', 'часы', '/wɒtʃ/', 'My watch shows time.' UNION ALL

        -- Деньги и валюта
        SELECT 'Cash' AS english_word, 'наличные' AS russian_translation, '/kæʃ/' AS transcription, 'I pay in cash.' AS example_sentence UNION ALL
        SELECT 'Dollar', 'доллар', '/ˈdɒl.ər/', 'One dollar is 100 cents.' UNION ALL
        SELECT 'Euro', 'евро', '/ˈjʊə.rəʊ/', 'We use euros in Spain.' UNION ALL
        SELECT 'Pound', 'фунт', '/paʊnd/', 'The bag costs 10 pounds.' UNION ALL

        -- Животные
        SELECT 'Bird' AS english_word, 'птица' AS russian_translation, '/bɜːd/' AS transcription, 'The bird sings.' AS example_sentence UNION ALL
        SELECT 'Dog', 'собака', '/dɒɡ/', 'My dog is friendly.' UNION ALL
        SELECT 'Lion', 'лев', '/ˈlaɪ.ən/', 'The lion is strong.' UNION ALL

        -- Действия
        SELECT 'Carry' AS english_word, 'нести' AS russian_translation, '/ˈkær.i/' AS transcription, 'I carry my bag.' AS example_sentence UNION ALL
        SELECT 'Drive', 'водить', '/draɪv/', 'I drive a car.' UNION ALL
        SELECT 'Fly', 'летать', '/flaɪ/', 'Birds fly high.' UNION ALL
        SELECT 'Help', 'помогать', '/help/', 'Can you help me?' UNION ALL
        SELECT 'Listen to', 'слушать', '/ˈlɪs.ən tuː/', 'Listen to music.' UNION ALL
        SELECT 'Speak', 'говорить', '/spiːk/', 'I speak English.' UNION ALL

        -- Другие слова
        SELECT 'Expensive' AS english_word, 'дорогой' AS russian_translation, '/ɪkˈspen.sɪv/' AS transcription, 'This phone is expensive.' AS example_sentence UNION ALL
        SELECT 'Guitar', 'гитара', '/ɡɪˈtɑːr/', 'He plays the guitar.' UNION ALL
        SELECT 'Intelligent', 'умный', '/ɪnˈtel.ɪ.dʒənt/', 'The student is intelligent.' UNION ALL
        SELECT 'Japanese', 'японский', '/ˌdʒæp.əˈniːz/', 'I study Japanese.' UNION ALL
        SELECT 'Kitchen', 'кухня', '/ˈkɪtʃ.ɪn/', 'We cook in the kitchen.' UNION ALL
        SELECT 'Mean', 'означать', '/miːn/', 'What does this word mean?' UNION ALL
        SELECT 'Passport', 'паспорт', '/ˈpɑːs.pɔːt/', 'Show your passport.' UNION ALL
        SELECT 'Piano', 'пианино', '/piˈæn.əʊ/', 'She plays the piano.' UNION ALL
        SELECT 'Plane', 'самолет', '/pleɪn/', 'The plane flies fast.' UNION ALL
        SELECT 'Possession', 'имущество', '/pəˈzeʃ.ən/', 'This is my possession.' UNION ALL
        SELECT 'Reporter', 'репортер', '/rɪˈpɔː.tər/', 'The reporter writes news.' UNION ALL
        SELECT 'Science', 'наука', '/ˈsaɪ.əns/', 'I like science.' UNION ALL
        SELECT 'Soccer ball', 'футбольный мяч', '/ˈsɒk.ər ˌbɔːl/', 'Kick the soccer ball.' UNION ALL
        SELECT 'Trip', 'поездка', '/trɪp/', 'We plan a trip.' UNION ALL
        SELECT 'Work', 'работать', '/wɜːk/', 'I work every day.'
    ) AS data
    WHERE EXISTS (SELECT 1 FROM unit_data);

    -- Seed_A1_Unit6_words
    WITH unit_data AS (
        SELECT
            u.id AS unit_id
        FROM
            units u
        JOIN
            levels l ON u.level_id = l.id
        WHERE
            l.name = 'A1'
            AND u.display_order = 6  -- Unit 6
    )

    INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
    SELECT
        ud.unit_id,
        data.english_word,
        data.russian_translation,
        data.transcription,
        data.example_sentence
    FROM
        unit_data ud
    CROSS JOIN (
        -- Еда и напитки
        SELECT 'Bread' AS english_word, 'хлеб' AS russian_translation, '/bred/' AS transcription, 'I eat bread for breakfast.' AS example_sentence UNION ALL
        SELECT 'Breakfast', 'завтрак', '/ˈbrek.fəst/', 'Breakfast is important.' UNION ALL
        SELECT 'Burger', 'бургер', '/ˈbɜː.ɡər/', 'I like cheeseburgers.' UNION ALL
        SELECT 'Cheese', 'сыр', '/tʃiːz/', 'The cheese is yellow.' UNION ALL
        SELECT 'Chicken', 'курица', '/ˈtʃɪk.ɪn/', 'We eat chicken for dinner.' UNION ALL
        SELECT 'Dinner', 'ужин', '/ˈdɪn.ər/', 'Dinner is at 7 PM.' UNION ALL
        SELECT 'Egg', 'яйцо', '/eɡ/', 'I boil an egg.' UNION ALL
        SELECT 'Fish', 'рыба', '/fɪʃ/', 'Fish is healthy.' UNION ALL
        SELECT 'Fruit', 'фрукты', '/fruːt/', 'Eat more fruit.' UNION ALL
        SELECT 'Lunch', 'обед', '/lʌntʃ/', 'Lunch time is 1 PM.' UNION ALL
        SELECT 'Meal', 'прием пищи', '/miːl/', 'This meal is delicious.' UNION ALL
        SELECT 'Meat', 'мясо', '/miːt/', 'I don''t eat meat.' UNION ALL  -- Экранированный апостроф
        SELECT 'Peach', 'персик', '/piːtʃ/', 'The peach is sweet.' UNION ALL
        SELECT 'Potato', 'картофель', '/pəˈteɪ.təʊ/', 'Mashed potato is soft.' UNION ALL
        SELECT 'Rice', 'рис', '/raɪs/', 'Rice with vegetables.' UNION ALL
        SELECT 'Soup', 'суп', '/suːp/', 'The soup is hot.' UNION ALL
        SELECT 'Tomato', 'помидор', '/təˈmɑː.təʊ/', 'Red tomatoes are ripe.' UNION ALL
        SELECT 'Vegetable', 'овощ', '/ˈvedʒ.tə.bəl/', 'Eat your vegetables.' UNION ALL
        SELECT 'Water', 'вода', '/ˈwɔː.tər/', 'Drink more water.' UNION ALL

        -- Времена дня
        SELECT 'Morning' AS english_word, 'утро' AS russian_translation, '/ˈmɔː.nɪŋ/' AS transcription, 'Good morning!' AS example_sentence UNION ALL
        SELECT 'Evening', 'вечер', '/ˈiːv.nɪŋ/', 'Good evening!' UNION ALL
        SELECT 'Midday', 'полдень', '/ˌmɪdˈdeɪ/', 'We meet at midday.' UNION ALL

        -- Виды деятельности
        SELECT 'Basketball' AS english_word, 'баскетбол' AS russian_translation, '/ˈbɑː.skɪt.bɔːl/' AS transcription, 'We play basketball.' AS example_sentence UNION ALL
        SELECT 'Cycling', 'езда на велосипеде', '/ˈsaɪ.klɪŋ/', 'Cycling is good exercise.' UNION ALL
        SELECT 'Free time', 'свободное время', '/ˈfriː ˌtaɪm/', 'I read in my free time.' UNION ALL
        SELECT 'Music', 'музыка', '/ˈmjuː.zɪk/', 'I listen to music.' UNION ALL
        SELECT 'Running', 'бег', '/ˈrʌn.ɪŋ/', 'Running is healthy.' UNION ALL
        SELECT 'Scuba diving', 'дайвинг', '/ˈskuː.bə ˌdaɪ.vɪŋ/', 'Scuba diving is exciting.' UNION ALL
        SELECT 'Soccer', 'футбол', '/ˈsɒk.ər/', 'They play soccer.' UNION ALL
        SELECT 'Swimming', 'плавание', '/ˈswɪm.ɪŋ/', 'Swimming is fun.' UNION ALL
        SELECT 'Tennis', 'теннис', '/ˈten.ɪs/', 'Let''s play tennis.' UNION ALL  -- Экранированный апостроф
        SELECT 'Triathlon', 'триатлон', '/traɪˈæθ.lɒn/', 'The triathlon is difficult.' UNION ALL

        -- Люди и профессии
        SELECT 'Fisherman' AS english_word, 'рыбак' AS russian_translation, '/ˈfɪʃ.ə.mən/' AS transcription, 'The fisherman catches fish.' AS example_sentence UNION ALL
        SELECT 'Scientist', 'ученый', '/ˈsaɪ.ən.tɪst/', 'The scientist works in a lab.' UNION ALL
        SELECT 'Vet', 'ветеринар', '/vet/', 'The vet helps animals.' UNION ALL
        SELECT 'Visitor', 'посетитель', '/ˈvɪz.ɪ.tər/', 'We have visitors today.' UNION ALL

        -- Числа и время
        SELECT 'Hundred' AS english_word, 'сто' AS russian_translation, '/ˈhʌn.drəd/' AS transcription, 'One hundred years.' AS example_sentence UNION ALL
        SELECT 'Kilometre', 'километр', '/kɪˈlɒm.ɪ.tər/', 'Walk five kilometres.' UNION ALL
        SELECT 'Million', 'миллион', '/ˈmɪl.jən/', 'A million stars.' UNION ALL
        SELECT 'Thousand', 'тысяча', '/ˈθaʊ.zənd/', 'Two thousand people.' UNION ALL
        SELECT 'Ticket', 'билет', '/ˈtɪk.ɪt/', 'Show your ticket.' UNION ALL
        SELECT 'Time', 'время', '/taɪm/', 'What time is it?' UNION ALL
        SELECT 'Tomorrow', 'завтра', '/təˈmɒr.əʊ/', 'See you tomorrow.' UNION ALL
        SELECT 'Weekend', 'выходные', '/ˌwiːkˈend/', 'I relax on weekends.' UNION ALL

        -- Разное
        SELECT 'Bone' AS english_word, 'кость' AS russian_translation, '/bəʊn/' AS transcription, 'The dog has a bone.' AS example_sentence UNION ALL
        SELECT 'Comedy', 'комедия', '/ˈkɒm.ə.di/', 'We watch a comedy.' UNION ALL
        SELECT 'Prize', 'приз', '/praɪz/', 'Win a prize.' UNION ALL
        SELECT 'Wildlife show', 'передача о природе', '/ˈwaɪld.laɪf ˌʃəʊ/', 'The wildlife show is interesting.' UNION ALL
        SELECT 'TV', 'телевизор', '/ˌtiːˈviː/', 'Turn on the TV.'
    ) AS data
    WHERE EXISTS (SELECT 1 FROM unit_data);

    -- Seed_A1_Unit7_words
    WITH unit_data AS (
        SELECT
            u.id AS unit_id
        FROM
            units u
        JOIN
            levels l ON u.level_id = l.id
        WHERE
            l.name = 'A1'
            AND u.display_order = 7  -- Unit 7
    )

    INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
    SELECT
        ud.unit_id,
        data.english_word,
        data.russian_translation,
        data.transcription,
        data.example_sentence
    FROM
        unit_data ud
    CROSS JOIN (
        -- Повседневные действия
        SELECT 'Get up' AS english_word, 'вставать' AS russian_translation, '/ɡet ʌp/' AS transcription, 'I get up at 7 AM.' AS example_sentence UNION ALL
        SELECT 'Lie down', 'лечь', '/laɪ daʊn/', 'Lie down and rest.' UNION ALL
        SELECT 'Sleep', 'спать', '/sliːp/', 'I sleep 8 hours.' UNION ALL
        SELECT 'Feed', 'кормить', '/fiːd/', 'Feed the cat.' UNION ALL
        SELECT 'Dress', 'одеваться', '/dres/', 'Dress warmly.' UNION ALL
        SELECT 'Eat', 'есть', '/iːt/', 'Eat your breakfast.' UNION ALL
        SELECT 'Study', 'учиться', '/ˈstʌd.i/', 'I study English.' UNION ALL
        SELECT 'Work', 'работать', '/wɜːk/', 'I work every day.' UNION ALL
        SELECT 'Finish', 'заканчивать', '/ˈfɪn.ɪʃ/', 'Finish your work.' UNION ALL
        SELECT 'Start', 'начинать', '/stɑːt/', 'Start your homework.' UNION ALL
        SELECT 'Go', 'идти', '/ɡəʊ/', 'Go to school.' UNION ALL
        SELECT 'Stay in touch', 'оставаться на связи', '/steɪ ɪn tʌtʃ/', 'Let''s stay in touch.' UNION ALL  -- Экранированный апостроф

        -- Эмоции и состояния
        SELECT 'Alone' AS english_word, 'один' AS russian_translation, '/əˈləʊn/' AS transcription, 'I live alone.' AS example_sentence UNION ALL
        SELECT 'Bored', 'скучающий', '/bɔːd/', 'I''m bored.' UNION ALL  -- Экранированный апостроф
        SELECT 'Cheerful', 'жизнерадостный', '/ˈtʃɪə.fəl/', 'She''s always cheerful.' UNION ALL
        SELECT 'Cold', 'холодный', '/kəʊld/', 'I''m cold.' UNION ALL
        SELECT 'Hot', 'горячий', '/hɒt/', 'The tea is hot.' UNION ALL
        SELECT 'Hungry', 'голодный', '/ˈhʌŋ.ɡri/', 'I''m hungry.' UNION ALL
        SELECT 'Thirsty', 'испытывающий жажду', '/ˈθɜː.sti/', 'Drink if you''re thirsty.' UNION ALL
        SELECT 'Tired', 'уставший', '/ˈtaɪəd/', 'I''m tired.' UNION ALL

        -- Погода и времена года
        SELECT 'Cloudy' AS english_word, 'облачно' AS russian_translation, '/ˈklaʊ.di/' AS transcription, 'Today is cloudy.' AS example_sentence UNION ALL
        SELECT 'Fall/Autumn', 'осень', '/fɔːl|ˈɔː.təm/', 'Leaves fall in autumn.' UNION ALL
        SELECT 'Ice', 'лед', '/aɪs/', 'The ice is cold.' UNION ALL
        SELECT 'Rainy', 'дождливый', '/ˈreɪ.ni/', 'It''s rainy today.' UNION ALL
        SELECT 'Snowy', 'снежный', '/ˈsnəʊ.i/', 'Winter is snowy.' UNION ALL
        SELECT 'Spring', 'весна', '/sprɪŋ/', 'Flowers bloom in spring.' UNION ALL
        SELECT 'Summer', 'лето', '/ˈsʌm.ər/', 'Summer is hot.' UNION ALL
        SELECT 'Sunny', 'солнечный', '/ˈsʌn.i/', 'It''s sunny outside.' UNION ALL
        SELECT 'Weather', 'погода', '/ˈweð.ər/', 'The weather is nice.' UNION ALL
        SELECT 'Wet', 'мокрый', '/wet/', 'The clothes are wet.' UNION ALL
        SELECT 'Windy', 'ветреный', '/ˈwɪn.di/', 'It''s windy today.' UNION ALL
        SELECT 'Winter', 'зима', '/ˈwɪn.tər/', 'Winter is cold.' UNION ALL

        -- Хобби и занятия
        SELECT 'Climbing' AS english_word, 'скалолазание' AS russian_translation, '/ˈklaɪ.mɪŋ/' AS transcription, 'Climbing is exciting.' AS example_sentence UNION ALL
        SELECT 'Cooking', 'готовка', '/ˈkʊk.ɪŋ/', 'I like cooking.' UNION ALL
        SELECT 'Dancing', 'танцы', '/ˈdɑːn.sɪŋ/', 'She loves dancing.' UNION ALL
        SELECT 'Painting', 'рисование', '/ˈpeɪn.tɪŋ/', 'Painting is relaxing.' UNION ALL
        SELECT 'Reading', 'чтение', '/ˈriː.dɪŋ/', 'Reading is fun.' UNION ALL
        SELECT 'Singing', 'пение', '/ˈsɪŋ.ɪŋ/', 'His singing is beautiful.' UNION ALL
        SELECT 'Swimming', 'плавание', '/ˈswɪm.ɪŋ/', 'Swimming is healthy.' UNION ALL
        SELECT 'Walking', 'ходьба', '/ˈwɔː.kɪŋ/', 'Walking is good exercise.' UNION ALL

        -- Другие слова
        SELECT 'Alarm clock' AS english_word, 'будильник' AS russian_translation, '/əˈlɑːm ˌklɒk/' AS transcription, 'The alarm clock rings.' AS example_sentence UNION ALL
        SELECT 'Bath', 'ванна', '/bɑːθ/', 'Take a bath.' UNION ALL
        SELECT 'Flower', 'цветок', '/ˈflaʊ.ər/', 'This flower is red.' UNION ALL
        SELECT 'Hand', 'рука', '/hænd/', 'Wash your hands.' UNION ALL
        SELECT 'Henna', 'хна', '/ˈhen.ə/', 'Henna is red.' UNION ALL
        SELECT 'Jersey', 'джерси', '/ˈdʒɜː.zi/', 'The jersey is comfortable.' UNION ALL
        SELECT 'Paragraph', 'параграф', '/ˈpær.ə.ɡrɑːf/', 'Read the paragraph.' UNION ALL
        SELECT 'Routine', 'рутина', '/ruːˈtiːn/', 'Daily routine is important.' UNION ALL
        SELECT 'Trunk', 'туловище', '/trʌŋk/', 'The elephant has a trunk.' UNION ALL
        SELECT 'Year', 'год', '/jɪər/', 'New Year is coming.'
    ) AS data
    WHERE EXISTS (SELECT 1 FROM unit_data);

    -- Seed_A1_Unit8_words
    WITH unit_data AS (
        SELECT
            u.id AS unit_id
        FROM
            units u
        JOIN
            levels l ON u.level_id = l.id
        WHERE
            l.name = 'A1'
            AND u.display_order = 8  -- Unit 8
    )

    INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
    SELECT
        ud.unit_id,
        data.english_word,
        data.russian_translation,
        data.transcription,
        data.example_sentence
    FROM
        unit_data ud
    CROSS JOIN (
        -- Профессии
        SELECT 'Doctor' AS english_word, 'врач' AS russian_translation, '/ˈdɒk.tər/' AS transcription, 'The doctor helps people.' AS example_sentence UNION ALL
        SELECT 'Engineer', 'инженер', '/ˌen.dʒɪˈnɪər/', 'An engineer builds things.' UNION ALL
        SELECT 'Painter', 'художник', '/ˈpeɪn.tər/', 'The painter draws pictures.' UNION ALL
        SELECT 'Photographer', 'фотограф', '/fəˈtɒɡ.rə.fər/', 'The photographer takes photos.' UNION ALL
        SELECT 'Receptionist', 'администратор', '/rɪˈsep.ʃən.ɪst/', 'The receptionist answers calls.' UNION ALL
        SELECT 'Store clerk', 'продавец', '/ˈstɔːr ˌklɜːk/', 'The store clerk helps customers.' UNION ALL
        SELECT 'Taxi driver', 'таксист', '/ˈtæk.si ˌdraɪ.vər/', 'The taxi driver knows the city.' UNION ALL
        SELECT 'Teacher', 'учитель', '/ˈtiː.tʃər/', 'The teacher explains lessons.' UNION ALL
        SELECT 'Waiter', 'официант', '/ˈweɪ.tər/', 'The waiter serves food.' UNION ALL

        -- Рабочие места
        SELECT 'College' AS english_word, 'колледж' AS russian_translation, '/ˈkɒl.ɪdʒ/' AS transcription, 'She studies at college.' AS example_sentence UNION ALL
        SELECT 'Office', 'офис', '/ˈɒf.ɪs/', 'He works in an office.' UNION ALL
        SELECT 'School', 'школа', '/skuːl/', 'Children learn at school.' UNION ALL
        SELECT 'University', 'университет', '/ˌjuː.nɪˈvɜː.sə.ti/', 'University is for higher education.' UNION ALL

        -- Действия
        SELECT 'Move into' AS english_word, 'въезжать' AS russian_translation, '/muːv ˈɪn.tuː/' AS transcription, 'We move into a new office.' AS example_sentence UNION ALL
        SELECT 'Push', 'толкать', '/pʊʃ/', 'Push the door to open.' UNION ALL
        SELECT 'Sell', 'продавать', '/sel/', 'They sell books.' UNION ALL
        SELECT 'Work with', 'работать с', '/wɜːk wɪð/', 'I work with computers.' UNION ALL

        -- Прилагательные
        SELECT 'Early' AS english_word, 'рано' AS russian_translation, '/ˈɜː.li/' AS transcription, 'I wake up early.' AS example_sentence UNION ALL
        SELECT 'On leave' AS english_word, 'в отпуске' AS russian_translation, '/ɒn liːv/', 'She is on leave this week.' UNION ALL
        SELECT 'On vacation' AS english_word, 'в отпуске' AS russian_translation, '/ɒn vəˈkeɪ.ʃən/', 'They''re on vacation.' UNION ALL  -- Экранированный апостроф

        -- Другие слова
        SELECT 'Board' AS english_word, 'доска' AS russian_translation, '/bɔːd/' AS transcription, 'Write on the board.' AS example_sentence UNION ALL
        SELECT 'Both', 'оба', '/bəʊθ/', 'Both answers are correct.' UNION ALL
        SELECT 'Classmate', 'одноклассник', '/ˈklɑːs.meɪt/', 'My classmate helps me.' UNION ALL
        SELECT 'Colleague', 'коллега', '/ˈkɒl.iːɡ/', 'My colleague is friendly.' UNION ALL
        SELECT 'Customer', 'клиент', '/ˈkʌs.tə.mər/', 'The customer buys products.' UNION ALL
        SELECT 'Forest', 'лес', '/ˈfɒr.ɪst/', 'The forest is green.' UNION ALL
        SELECT 'Inside', 'внутри', '/ɪnˈsaɪd/', 'It''s warm inside.' UNION ALL  -- Экранированный апостроф
        SELECT 'Jaguar', 'ягуар', '/ˈdʒæɡ.ju.ər/', 'The jaguar is fast.' UNION ALL
        SELECT 'Job', 'работа', '/dʒɒb/', 'I need a job.' UNION ALL
        SELECT 'Leopard', 'леопард', '/ˈlep.əd/', 'The leopard has spots.' UNION ALL
        SELECT 'Lion', 'лев', '/ˈlaɪ.ən/', 'The lion is strong.' UNION ALL
        SELECT 'Meeting', 'встреча', '/ˈmiː.tɪŋ/', 'We have a meeting at 3 PM.' UNION ALL
        SELECT 'Mountain', 'гора', '/ˈmaʊn.tɪn/', 'The mountain is high.' UNION ALL
        SELECT 'Notebook', 'блокнот', '/ˈnəʊt.bʊk/', 'Write in your notebook.' UNION ALL
        SELECT 'Outside', 'снаружи', '/ˌaʊtˈsaɪd/', 'It''s cold outside.' UNION ALL  -- Экранированный апостроф
        SELECT 'Own', 'собственный', '/əʊn/', 'I own this car.' UNION ALL
        SELECT 'Passenger', 'пассажир', '/ˈpæs.ɪn.dʒər/', 'The passenger waits for the bus.' UNION ALL
        SELECT 'Pen', 'ручка', '/pen/', 'Sign with this pen.' UNION ALL
        SELECT 'Pencil', 'карандаш', '/ˈpen.səl/', 'Draw with a pencil.' UNION ALL
        SELECT 'Report', 'отчет', '/rɪˈpɔːt/', 'Read the report.' UNION ALL
        SELECT 'Sometimes', 'иногда', '/ˈsʌm.taɪmz/', 'Sometimes I work late.' UNION ALL
        SELECT 'Train line', 'железная дорога', '/ˈtreɪn ˌlaɪn/', 'The train line goes to Moscow.' UNION ALL
        SELECT 'Tube', 'метро (лондонское)', '/tjuːb/', 'Take the tube to work.' UNION ALL
        SELECT 'Underground', 'метро', '/ˈʌn.də.ɡraʊnd/', 'The underground is fast.' UNION ALL
        SELECT 'Wild', 'дикий', '/waɪld/', 'The animal is wild.' UNION ALL
        SELECT 'Wildlife', 'дикая природа', '/ˈwaɪld.laɪf/', 'Protect wildlife.'
    ) AS data
    WHERE EXISTS (SELECT 1 FROM unit_data);

    -- V11__Seed_A1_Unit9_words.sql
    WITH unit_data AS (
        SELECT
            u.id AS unit_id
        FROM
            units u
        JOIN
            levels l ON u.level_id = l.id
        WHERE
            l.name = 'A1'
            AND u.display_order = 9  -- Unit 9
    )

    INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
    SELECT
        ud.unit_id,
        data.english_word,
        data.russian_translation,
        data.transcription,
        data.example_sentence
    FROM
        unit_data ud
    CROSS JOIN (
        SELECT 'Advice' AS english_word, 'совет' AS russian_translation, '/ədˈvaɪs/' AS transcription, 'Can you give me some advice?' AS example_sentence UNION ALL
        SELECT 'Bathtub', 'ванна', '/ˈbɑːθ.tʌb/', 'I relax in the bathtub.' UNION ALL
        SELECT 'Bed', 'кровать', '/bed/', 'I sleep in my bed.' UNION ALL
        SELECT 'Boat', 'лодка', '/bəʊt/', 'We row the boat on the lake.' UNION ALL
        SELECT 'Boot', 'ботинок', '/buːt/', 'I wear boots in winter.' UNION ALL
        SELECT 'Certainly', 'определенно', '/ˈsɜː.tən.li/', 'I will certainly help you.' UNION ALL
        SELECT 'Chair', 'стул', '/tʃeər/', 'Sit on the chair.' UNION ALL
        SELECT 'City center', 'центр города', '/ˈsɪti ˈsen.tər/', 'Let''s meet in the city center.' UNION ALL
        SELECT 'Coat', 'пальто', '/kəʊt/', 'Wear your coat, it''s cold.' UNION ALL
        SELECT 'Continue', 'продолжать', '/kənˈtɪn.juː/', 'Please continue your work.' UNION ALL
        SELECT 'Couch', 'диван', '/kaʊtʃ/', 'We sit on the couch.' UNION ALL
        SELECT 'Couple', 'пара', '/ˈkʌp.əl/', 'A couple is walking.' UNION ALL
        SELECT 'Cut', 'резать', '/kʌt/', 'Be careful with the knife when you cut.' UNION ALL
        SELECT 'Desk', 'рабочий стол', '/desk/', 'My computer is on the desk.' UNION ALL
        SELECT 'Different', 'разный', '/ˈdɪf.ər.ənt/', 'We have different opinions.' UNION ALL
        SELECT 'Dress', 'платье', '/dres/', 'She wears a beautiful dress.' UNION ALL
        SELECT 'Driver', 'водитель', '/ˈdraɪ.vər/', 'The driver knows the way.' UNION ALL
        SELECT 'Expensive', 'дорогой', '/ɪkˈspen.sɪv/', 'This phone is too expensive.' UNION ALL
        SELECT 'Flight', 'полет', '/flaɪt/', 'Our flight is at 6 PM.' UNION ALL
        SELECT 'Fridge', 'холодильник', '/frɪdʒ/', 'The milk is in the fridge.' UNION ALL
        SELECT 'Gift shop', 'магазин подарков', '/ˈɡɪft ʃɒp/', 'Let''s buy souvenirs at the gift shop.' UNION ALL
        SELECT 'Hard', 'твердый', '/hɑːd/', 'This bread is too hard.' UNION ALL
        SELECT 'Hat', 'шляпа', '/hæt/', 'He wears a hat in summer.' UNION ALL
        SELECT 'Hotel', 'отель', '/həʊˈtel/', 'We stay at a nice hotel.' UNION ALL
        SELECT 'In advance', 'заранее', '/ɪn ədˈvɑːns/', 'Book tickets in advance.' UNION ALL
        SELECT 'Jacket', 'куртка', '/ˈdʒæk.ɪt/', 'Take your jacket, it''s windy.' UNION ALL
        SELECT 'Jeans', 'джинсы', '/dʒiːnz/', 'I wear jeans every day.' UNION ALL
        SELECT 'Jumper', 'джемпер', '/ˈdʒʌm.pər/', 'This jumper is very warm.' UNION ALL
        SELECT 'Lake', 'озеро', '/leɪk/', 'We swim in the lake.' UNION ALL
        SELECT 'Lamp', 'лампа', '/læmp/', 'Turn on the lamp, please.' UNION ALL
        SELECT 'Non-stop', 'без остановки', '/ˌnɒnˈstɒp/', 'This is a non-stop flight.' UNION ALL
        SELECT 'Of course', 'конечно', '/əv ˈkɔːs/', 'Of course you can come!' UNION ALL
        SELECT 'Only', 'только', '/ˈəʊn.li/', 'Only three people came.' UNION ALL
        SELECT 'Pants', 'штаны', '/pænts/', 'These pants are too long.' UNION ALL
        SELECT 'Parking lot', 'парковка', '/ˈpɑː.kɪŋ ˌlɒt/', 'Leave the car in the parking lot.' UNION ALL
        SELECT 'Pool', 'бассейн', '/puːl/', 'The hotel has a swimming pool.' UNION ALL
        SELECT 'Ready', 'готовый', '/ˈred.i/', 'Dinner is ready!' UNION ALL
        SELECT 'Reservation', 'бронирование', '/ˌrez.əˈveɪ.ʃən/', 'I made a hotel reservation.' UNION ALL
        SELECT 'Room number', 'номер в отеле', '/ˈruːm ˌnʌm.bər/', 'What is your room number?' UNION ALL
        SELECT 'Scarf', 'шарф', '/skɑːf/', 'She wears a red scarf.' UNION ALL
        SELECT 'Shirt', 'рубашка', '/ʃɜːt/', 'He wears a white shirt.' UNION ALL
        SELECT 'Shoe', 'туфля', '/ʃuː/', 'These shoes are comfortable.' UNION ALL
        SELECT 'Shorts', 'шорты', '/ʃɔːts/', 'I wear shorts in summer.' UNION ALL
        SELECT 'Shower', 'душ', '/ˈʃaʊ.ər/', 'I take a shower every morning.' UNION ALL
        SELECT 'Skirt', 'юбка', '/skɜːt/', 'Her skirt is very long.' UNION ALL
        SELECT 'Soft', 'мягкий', '/sɒft/', 'This pillow is very soft.' UNION ALL
        SELECT 'Stay', 'останавливаться', '/steɪ/', 'We stay at a hotel.' UNION ALL
        SELECT 'Suitcase', 'чемодан', '/ˈsuːt.keɪs/', 'Pack your suitcase.' UNION ALL
        SELECT 'Sweater', 'свитер', '/ˈswet.ər/', 'It''s cold, wear a sweater.' UNION ALL
        SELECT 'T-shirt', 'футболка', '/ˈtiː.ʃɜːt/', 'I wear a T-shirt and jeans.' UNION ALL
        SELECT 'Tip', 'чаевые', '/tɪp/', 'Leave a tip for the waiter.' UNION ALL
        SELECT 'Too', 'тоже', '/tuː/', 'I like ice cream too.' UNION ALL
        SELECT 'Top', 'верхняя часть одежды', '/tɒp/', 'She wears a blue top.' UNION ALL
        SELECT 'Traditional', 'традиционный', '/trəˈdɪʃ.ən.əl/', 'This is a traditional dish.' UNION ALL
        SELECT 'Train', 'поезд', '/treɪn/', 'The train arrives at 5 PM.' UNION ALL
        SELECT 'Traveller', 'путешественник', '/ˈtræv.əl.ər/', 'The traveller has a big suitcase.' UNION ALL
        SELECT 'TV', 'телевизор', '/ˌtiːˈviː/', 'We watch TV in the evening.' UNION ALL
        SELECT 'Without', 'без', '/wɪˈðaʊt/', 'I drink tea without sugar.'
    ) AS data
    WHERE EXISTS (SELECT 1 FROM unit_data);


-- Seed_A1_Unit10_words
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'A1'
        AND u.display_order = 10  -- Unit 10
)

INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT
    ud.unit_id,
    data.english_word,
    data.russian_translation,
    data.transcription,
    data.example_sentence
FROM
    unit_data ud
CROSS JOIN (
    SELECT '2 years ago' AS english_word, '2 года назад' AS russian_translation, '/tuː jɪəz əˈɡəʊ/' AS transcription, 'I moved here 2 years ago.' AS example_sentence UNION ALL
    SELECT 'Area', 'площадь, территория', '/ˈeə.ri.ə/', 'This area is very quiet.' UNION ALL
    SELECT 'Art', 'искусство', '/ɑːt/', 'She studies art history.' UNION ALL
    SELECT 'Friendly', 'дружелюбный', '/ˈfrend.li/', 'The neighbors are friendly.' UNION ALL
    SELECT 'Be asleep', 'спать', '/bi əˈsliːp/', 'The baby is asleep.' UNION ALL
    SELECT 'At home', 'дома', '/ət ˈhəʊm/', 'I stay at home today.' UNION ALL
    SELECT 'At that time', 'в то время', '/ət ðæt taɪm/', 'At that time, I was a student.' UNION ALL
    SELECT 'At the top', 'на вершине', '/ət ðə tɒp/', 'There''s a flag at the top.' UNION ALL
    SELECT 'Be good at', 'быть хорошим в чём-то', '/bi ɡʊd ət/', 'She is good at drawing.' UNION ALL
    SELECT 'Best friend', 'лучший друг', '/best frend/', 'He is my best friend.' UNION ALL
    SELECT 'Bored', 'скучающий', '/bɔːd/', 'I''m bored with this game.' UNION ALL
    SELECT 'Busy', 'занятый', '/ˈbɪz.i/', 'The doctor is busy now.' UNION ALL
    SELECT 'Celebrity', 'знаменитость', '/səˈleb.rɪ.ti/', 'We saw a celebrity.' UNION ALL
    SELECT 'Childhood', 'детство', '/ˈtʃaɪld.hʊd/', 'I had a happy childhood.' UNION ALL
    SELECT 'Colour', 'цвет', '/ˈkʌl.ər/', 'What''s your favorite colour?' UNION ALL
    SELECT 'Date', 'дата', '/deɪt/', 'What''s the date today?' UNION ALL
    SELECT 'Different', 'разный, другой', '/ˈdɪf.ər.ənt/', 'We have different tastes.' UNION ALL
    SELECT 'Digital', 'цифровой', '/ˈdɪdʒ.ɪ.təl/', 'I prefer digital watches.' UNION ALL
    SELECT 'Don''t worry', 'Не беспокойся', '/dəʊnt ˈwʌr.i/', 'Don''t worry, everything is fine.' UNION ALL
    SELECT 'Explore', 'исследовать', '/ɪkˈsplɔːr/', 'We explore new places.' UNION ALL
    SELECT 'Explorer', 'исследователь', '/ɪkˈsplɔː.rər/', 'He wants to be an explorer.' UNION ALL
    SELECT 'Famous', 'известный', '/ˈfeɪ.məs/', 'This is a famous museum.' UNION ALL
    SELECT 'First job', 'первая работа', '/fɜːst dʒɒb/', 'My first job was in a cafe.' UNION ALL
    SELECT 'For example', 'например', '/fɔːr ɪɡˈzɑːm.pəl/', 'I like fruits, for example, apples.' UNION ALL
    SELECT 'From...until', 'с...по...', '/frɒm...ʌnˈtɪl/', 'I work from 9 until 5.' UNION ALL
    SELECT 'Funny', 'смешной', '/ˈfʌn.i/', 'This movie is very funny.' UNION ALL
    SELECT 'Great', 'великий, великолепный', '/ɡreɪt/', 'You did a great job!' UNION ALL
    SELECT 'Hear', 'слышать', '/hɪər/', 'I can''t hear you well.' UNION ALL
    SELECT 'Hero', 'герой', '/ˈhɪə.rəʊ/', 'He is a war hero.' UNION ALL
    SELECT 'I don''t remember', 'Я не помню', '/aɪ dəʊnt rɪˈmem.bər/', 'I don''t remember his name.' UNION ALL
    SELECT 'I remember', 'я помню', '/aɪ rɪˈmem.bər/', 'I remember that day.' UNION ALL
    SELECT 'I think', 'я думаю', '/aɪ θɪŋk/', 'I think it''s true.' UNION ALL
    SELECT 'I''m not sure', 'Я не уверен(а)', '/aɪm nɒt ʃɔːr/', 'I''m not sure about this.' UNION ALL
    SELECT 'I''m sorry I''m late', 'Простите, я опоздал(а)', '/aɪm ˈsɒr.i aɪm leɪt/', 'I''m sorry I''m late for the meeting.' UNION ALL
    SELECT 'Important', 'важный', '/ɪmˈpɔː.tənt/', 'This is an important letter.' UNION ALL
    SELECT 'In space', 'в космосе', '/ɪn speɪs/', 'Astronauts live in space.' UNION ALL
    SELECT 'In traffic', 'в пробке', '/ɪn ˈtræf.ɪk/', 'We are stuck in traffic.' UNION ALL
    SELECT 'Invention', 'изобретение', '/ɪnˈven.ʃən/', 'The telephone was a great invention.' UNION ALL
    SELECT 'It''s ok', 'Все нормально', '/ɪts əʊˈkeɪ/', 'It''s ok, don''t worry.' UNION ALL
    SELECT 'Kind', 'добрый', '/kaɪnd/', 'She is a kind person.' UNION ALL
    SELECT 'Land', 'земля', '/lænd/', 'We saw land from the ship.' UNION ALL
    SELECT 'Last', 'последний', '/lɑːst/', 'This is my last question.' UNION ALL
    SELECT 'Memories', 'воспоминания', '/ˈmem.ər.iz/', 'I have good memories of school.' UNION ALL
    SELECT 'Nature', 'природа', '/ˈneɪ.tʃər/', 'I love nature.' UNION ALL
    SELECT 'North Pole', 'Северный полюс', '/nɔːθ pəʊl/', 'Penguins live near the North Pole.' UNION ALL
    SELECT 'On the moon', 'на луне', '/ɒn ðə muːn/', 'People walked on the moon.' UNION ALL
    SELECT 'Part', 'часть', '/pɑːt/', 'This is part of the story.' UNION ALL
    SELECT 'Present', 'подарок', '/ˈprez.ənt/', 'I got a birthday present.' UNION ALL
    SELECT 'Rich', 'богатый', '/rɪtʃ/', 'He is very rich.' UNION ALL
    SELECT 'Round-the-world', 'вокруг света', '/ˌraʊnd ðə ˈwɜːld/', 'They made a round-the-world trip.' UNION ALL
    SELECT 'Small town', 'маленький город', '/smɔːl taʊn/', 'I grew up in a small town.' UNION ALL
    SELECT 'South Pole', 'Южный полюс', '/saʊθ pəʊl/', 'It''s very cold at the South Pole.' UNION ALL
    SELECT 'Space', 'космос', '/speɪs/', 'Rockets fly into space.' UNION ALL
    SELECT 'Successful', 'успешный', '/səkˈses.fəl/', 'She is a successful writer.' UNION ALL
    SELECT 'Talk', 'разговаривать', '/tɔːk/', 'We talk every day.' UNION ALL
    SELECT 'Team', 'команда', '/tiːm/', 'Our team won the game.' UNION ALL
    SELECT 'Today', 'сегодня', '/təˈdeɪ/', 'Today is Monday.' UNION ALL
    SELECT 'Toy', 'игрушка', '/tɔɪ/', 'The child plays with a toy.' UNION ALL
    SELECT 'Video recorder', 'видеомагнитофон', '/ˈvɪd.i.əʊ rɪˌkɔː.dər/', 'We watched films on a video recorder.' UNION ALL
    SELECT 'War', 'война', '/wɔːr/', 'War is terrible.' UNION ALL
    SELECT 'Was born', 'родился', '/wəz bɔːn/', 'I was born in 1990.' UNION ALL
    SELECT 'Who is this?', 'Кто это?', '/huː ɪz ðɪs/', 'Who is this in the photo?' UNION ALL
    SELECT 'Year', 'год', '/jɪər/', 'Next year I''ll travel.' UNION ALL
    SELECT 'Young', 'молодой', '/jʌŋ/', 'She looks very young.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);