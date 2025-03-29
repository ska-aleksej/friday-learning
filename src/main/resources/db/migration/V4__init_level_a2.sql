-- V4__Seed_A2_units.sql
INSERT INTO units (level_id, name, description, display_order) VALUES
    ((SELECT id FROM levels WHERE name = 'A2'), 'Unit 1 - People', 'Люди, родственные связи и личные данные', 1),
    ((SELECT id FROM levels WHERE name = 'A2'), 'Unit 2 - Possessions', 'Личные вещи и предметы обихода', 2),
    ((SELECT id FROM levels WHERE name = 'A2'), 'Unit 3 - Places', 'Места и их характеристики', 3),
    ((SELECT id FROM levels WHERE name = 'A2'), 'Unit 4 - Free Time', 'Свободное время и хобби', 4),
    ((SELECT id FROM levels WHERE name = 'A2'), 'Unit 5 - Food', 'Еда, напитки и кулинария', 5),
    ((SELECT id FROM levels WHERE name = 'A2'), 'Unit 6 - Past Lives', 'Прошлые жизни и исторические личности', 6),
    ((SELECT id FROM levels WHERE name = 'A2'), 'Unit 7 - Journeys', 'Путешествия и транспорт', 7),
    ((SELECT id FROM levels WHERE name = 'A2'), 'Unit 8 - Appearance', 'Внешность и одежда', 8),
    ((SELECT id FROM levels WHERE name = 'A2'), 'Unit 9 - Entertainment', 'Развлечения и медиа', 9),
    ((SELECT id FROM levels WHERE name = 'A2'), 'Unit 10 - Learning', 'Обучение и образование', 10),
    ((SELECT id FROM levels WHERE name = 'A2'), 'Unit 11 - Tourism', 'Туризм и путешествия', 11),
    ((SELECT id FROM levels WHERE name = 'A2'), 'Unit 12 - The Earth', 'Земля, природа и экология', 12);


-- Seed_A2_Unit1_words
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'A2'
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
    SELECT 'Agriculture' AS english_word, 'сельское хозяйство' AS russian_translation, '/ˈæɡ.rɪ.kʌl.tʃər/' AS transcription, 'My grandfather worked in agriculture.' AS example_sentence UNION ALL
    SELECT 'Population', 'население', '/ˌpɒp.jəˈleɪ.ʃən/', 'The population of the city is growing.' UNION ALL
    SELECT 'Aunt', 'тётя', '/ɑːnt/', 'My aunt visits us every summer.' UNION ALL
    SELECT 'Region', 'регион', '/ˈriː.dʒən/', 'This region is famous for its wines.' UNION ALL
    SELECT 'City', 'город', '/ˈsɪt.i/', 'I live in a big city.' UNION ALL
    SELECT 'Relationship', 'отношения', '/rɪˈleɪ.ʃən.ʃɪp/', 'We have a good relationship.' UNION ALL
    SELECT 'Country', 'страна', '/ˈkʌn.tri/', 'I want to visit another country.' UNION ALL
    SELECT 'Repeat', 'повторять', '/rɪˈpiːt/', 'Can you repeat that, please?' UNION ALL
    SELECT 'Country of birth', 'страна рождения', '/ˈkʌn.tri əv bɜːθ/', 'My country of birth is Russia.' UNION ALL
    SELECT 'Single', 'одинокий', '/ˈsɪŋ.ɡəl/', 'She is single and happy.' UNION ALL
    SELECT 'Cousin', 'двоюродный брат/сестра', '/ˈkʌz.ən/', 'My cousin lives in Moscow.' UNION ALL
    SELECT 'Speak', 'говорить', '/spiːk/', 'I speak English and Russian.' UNION ALL
    SELECT 'Elephant', 'слон', '/ˈel.ɪ.fənt/', 'Elephants are big animals.' UNION ALL
    SELECT 'Spell', 'произносить по буквам', '/spel/', 'How do you spell your name?' UNION ALL
    SELECT 'Explorer', 'исследователь', '/ɪkˈsplɔː.rər/', 'He is a famous explorer.' UNION ALL
    SELECT 'Stand', 'стоять', '/stænd/', 'Please stand up.' UNION ALL
    SELECT 'Fact', 'факт', '/fækt/', 'That''s an interesting fact.' UNION ALL
    SELECT 'Father', 'отец', '/ˈfɑː.ðər/', 'My father is a doctor.' UNION ALL
    SELECT 'Start', 'начинать', '/stɑːt/', 'Let''s start the lesson.' UNION ALL
    SELECT 'Female', 'женщина', '/ˈfiː.meɪl/', 'She is the only female in the team.' UNION ALL
    SELECT 'Step', 'шаг', '/step/', 'Watch your step!' UNION ALL
    SELECT 'Filmmaker', 'кинорежиссер', '/ˈfɪlmˌmeɪ.kər/', 'The filmmaker won an award.' UNION ALL
    SELECT 'Stepbrother', 'сводный брат', '/ˈstepˌbrʌð.ər/', 'My stepbrother is older than me.' UNION ALL
    SELECT 'First name', 'имя', '/ˈfɜːst ˌneɪm/', 'What is your first name?' UNION ALL
    SELECT 'Stepmother', 'мачеха', '/ˈstepˌmʌð.ər/', 'Her stepmother is very kind.' UNION ALL
    SELECT 'Grandmother', 'бабушка', '/ˈɡræn.mʌð.ər/', 'My grandmother bakes pies.' UNION ALL
    SELECT 'Surname', 'фамилия', '/ˈsɜː.neɪm/', 'How is your surname spelled?' UNION ALL
    SELECT 'Grandparent', 'бабушка, дедушка', '/ˈɡræn.peə.rənt/', 'My grandparents live in the village.' UNION ALL
    SELECT 'Use', 'использовать', '/juːz/', 'Can I use your phone?' UNION ALL
    SELECT 'Half-brother', 'единокровный брат', '/ˈhɑːfˌbrʌð.ər/', 'We have the same father but different mothers.' UNION ALL
    SELECT 'Wife', 'жена', '/waɪf/', 'His wife is a teacher.' UNION ALL
    SELECT 'Have', 'иметь', '/hæv/', 'I have two sisters.' UNION ALL
    SELECT 'Work', 'работа', '/wɜːk/', 'Where do you work?' UNION ALL
    SELECT 'Industry', 'промышленность', '/ˈɪn.də.stri/', 'He works in the car industry.' UNION ALL
    SELECT 'Internet', 'интернет', '/ˈɪn.tə.net/', 'I use the internet every day.' UNION ALL
    SELECT 'Introduce', 'представлять', '/ˌɪn.trəˈdjuːs/', 'Let me introduce my friend.' UNION ALL
    SELECT 'Job', 'работа', '/dʒɒb/', 'I''m looking for a new job.' UNION ALL
    SELECT 'Journalist', 'журналист', '/ˈdʒɜː.nə.lɪst/', 'She is a journalist for a newspaper.' UNION ALL
    SELECT 'Live', 'жить', '/lɪv/', 'Where do you live?' UNION ALL
    SELECT 'Male', 'мужчина', '/meɪl/', 'The male population is smaller here.' UNION ALL
    SELECT 'Married', 'женатый, замужняя', '/ˈmær.id/', 'They''ve been married for 10 years.' UNION ALL
    SELECT 'Mobile phone', 'мобильный телефон', '/ˌməʊ.baɪl ˈfəʊn/', 'I lost my mobile phone.' UNION ALL
    SELECT 'Mother', 'мама', '/ˈmʌð.ər/', 'My mother calls me every day.' UNION ALL
    SELECT 'Mother-in-law', 'теща, свекровь', '/ˈmʌð.ər ɪn lɔː/', 'My mother-in-law is visiting us.' UNION ALL
    SELECT 'Nephew', 'племянник', '/ˈnef.juː/', 'My nephew is five years old.' UNION ALL
    SELECT 'Niece', 'племянница', '/niːs/', 'My niece started school.' UNION ALL
    SELECT 'Occupation', 'род занятий', '/ˌɒk.jəˈpeɪ.ʃən/', 'What''s your occupation?' UNION ALL
    SELECT 'Opinion', 'мнение', '/əˈpɪn.jən/', 'What''s your opinion about this?' UNION ALL
    SELECT 'Parent', 'родитель', '/ˈpeə.rənt/', 'Parents should help their children.' UNION ALL
    SELECT 'Percentage', 'процент', '/pəˈsen.tɪdʒ/', 'What percentage of people agree?' UNION ALL
    SELECT 'Photographer', 'фотограф', '/fəˈtɒɡ.rə.fər/', 'The photographer took our picture.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);


-- Seed_A2_Unit2_words
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'A2'
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
    SELECT 'Advert' AS english_word, 'Реклама' AS russian_translation, '/ˈæd.vɜːt/' AS transcription, 'I saw an advert for this product on TV.' AS example_sentence UNION ALL
    SELECT 'Apartment', 'Квартира', '/əˈpɑːt.mənt/', 'We rent a small apartment in the city center.' UNION ALL
    SELECT 'Armchair', 'Кресло', '/ˈɑːm.tʃeər/', 'This armchair is very comfortable.' UNION ALL
    SELECT 'Bad', 'Плохой', '/bæd/', 'The weather is bad today.' UNION ALL
    SELECT 'Belgian', 'Бельгийский', '/ˈbel.dʒən/', 'Belgian chocolate is famous worldwide.' UNION ALL
    SELECT 'Blinds', 'Жалюзи', '/blaɪndz/', 'We have new blinds in our living room.' UNION ALL
    SELECT 'Boot', 'Ботинок', '/buːt/', 'I need new winter boots.' UNION ALL
    SELECT 'Bottle', 'Бутылка', '/ˈbɒt.əl/', 'Could you bring me a bottle of water?' UNION ALL
    SELECT 'Brazilian', 'Бразильский', '/brəˈzɪl.jən/', 'Brazilian coffee is very strong.' UNION ALL
    SELECT 'British', 'Британский', '/ˈbrɪt.ɪʃ/', 'The British museum is in London.' UNION ALL
    SELECT 'Camera', 'Камера', '/ˈkæm.rə/', 'I take photos with my new camera.' UNION ALL
    SELECT 'Carpet', 'Ковёр', '/ˈkɑː.pɪt/', 'There''s a beautiful carpet in my room.' UNION ALL
    SELECT 'Chair', 'Стул', '/tʃeər/', 'Please sit on this chair.' UNION ALL
    SELECT 'Climbing', 'Скалолазание', '/ˈklaɪ.mɪŋ/', 'Climbing is my favorite sport.' UNION ALL
    SELECT 'Computer', 'Компьютер', '/kəmˈpjuː.tər/', 'I work on my computer every day.' UNION ALL
    SELECT 'Cupboard', 'Кухонный шкаф', '/ˈkʌb.əd/', 'The plates are in the cupboard.' UNION ALL
    SELECT 'Currency', 'Валюта', '/ˈkʌr.ən.si/', 'What currency do they use in Japan?' UNION ALL
    SELECT 'Curtains', 'Шторы', '/ˈkɜː.tənz/', 'We need to wash the curtains.' UNION ALL
    SELECT 'Desk', 'Письменный стол', '/desk/', 'My desk is near the window.' UNION ALL
    SELECT 'Diving', 'Дайвинг', '/ˈdaɪ.vɪŋ/', 'Diving is popular in tropical countries.' UNION ALL
    SELECT 'Dollar', 'Доллар', '/ˈdɒl.ər/', 'The dollar is strong today.' UNION ALL
    SELECT 'Drawer', 'Выдвижной ящик', '/drɔːr/', 'My socks are in the top drawer.' UNION ALL
    SELECT 'Dutch', 'Голландский', '/dʌtʃ/', 'Dutch cheese is very tasty.' UNION ALL
    SELECT 'English', 'Английский', '/ˈɪŋ.ɡlɪʃ/', 'I study English language.' UNION ALL
    SELECT 'Euro', 'Евро', '/ˈjʊə.rəʊ/', 'I need to change dollars to euros.' UNION ALL
    SELECT 'Expensive', 'Дорогой', '/ɪkˈspen.sɪv/', 'This phone is too expensive for me.' UNION ALL
    SELECT 'First-aid-kit', 'Аптечка', '/ˌfɜːstˈeɪd.kɪt/', 'Every car should have a first-aid-kit.' UNION ALL
    SELECT 'Forward', 'Переслать', '/ˈfɔː.wəd/', 'Could you forward this email to me?' UNION ALL
    SELECT 'French', 'Французский', '/frentʃ/', 'I love French cuisine.' UNION ALL
    SELECT 'Glove', 'Перчатка', '/ɡlʌv/', 'I lost one glove from this pair.' UNION ALL
    SELECT 'Good luck', 'Удачи!', '/ˌɡʊd ˈlʌk/', 'Good luck with your exam!' UNION ALL
    SELECT 'Hat', 'Шляпа', '/hæt/', 'Wear a hat, it''s sunny today.' UNION ALL
    SELECT 'Kayaking', 'Каякинг', '/ˈkaɪ.æk.ɪŋ/', 'Kayaking on this river is amazing.' UNION ALL
    SELECT 'Knife', 'Нож', '/naɪf/', 'Be careful with that sharp knife.' UNION ALL
    SELECT 'Lamp', 'Лампа', '/læmp/', 'The lamp on my desk is broken.' UNION ALL
    SELECT 'Laptop', 'Ноутбук', '/ˈlæp.tɒp/', 'I take my laptop to work every day.' UNION ALL
    SELECT 'Large', 'Большой', '/lɑːdʒ/', 'We need a large table for the party.' UNION ALL
    SELECT 'Letterbox', 'Почтовый ящик', '/ˈlet.ə.bɒks/', 'The postman put letters in our letterbox.' UNION ALL
    SELECT 'Map', 'Карта', '/mæp/', 'Let''s look at the map of the city.' UNION ALL
    SELECT 'Medium', 'Средний', '/ˈmiː.di.əm/', 'I''ll take a medium size coffee.' UNION ALL
    SELECT 'Miss', 'Скучать', '/mɪs/', 'I miss my family when I travel.' UNION ALL
    SELECT 'Modern', 'Современный', '/ˈmɒd.ən/', 'This is a very modern building.' UNION ALL
    SELECT 'Money', 'Деньги', '/ˈmʌn.i/', 'I need to withdraw some money.' UNION ALL
    SELECT 'Old', 'Старый', '/əʊld/', 'This is an old but comfortable chair.' UNION ALL
    SELECT 'Package', 'Посылка', '/ˈpæk.ɪdʒ/', 'I''m waiting for a package from China.' UNION ALL
    SELECT 'Pen', 'Ручка', '/pen/', 'Can I borrow your pen for a minute?' UNION ALL
    SELECT 'Picture', 'Картина', '/ˈpɪk.tʃər/', 'There''s a beautiful picture on the wall.' UNION ALL
    SELECT 'Plant', 'Растение', '/plɑːnt/', 'I water my plants every morning.' UNION ALL
    SELECT 'Pound', 'Фунт стерлингов', '/paʊnd/', 'The pound is the British currency.' UNION ALL
    SELECT 'Roller blade', 'Роликовые коньки', '/ˈrəʊ.lə ˌbleɪd/', 'My son loves his new roller blades.' UNION ALL
    SELECT 'Rucksack', 'Рюкзак', '/ˈrʌk.sæk/', 'I take a rucksack when I go hiking.' UNION ALL
    SELECT 'Rug', 'Коврик', '/rʌɡ/', 'There''s a soft rug near my bed.' UNION ALL
    SELECT 'Shelf', 'Полка', '/ʃelf/', 'Put the books back on the shelf.' UNION ALL
    SELECT 'Slow', 'Медленный', '/sləʊ/', 'The internet connection is very slow today.' UNION ALL
    SELECT 'Small', 'Маленький', '/smɔːl/', 'We live in a small but cozy apartment.' UNION ALL
    SELECT 'Sofa', 'Диван', '/ˈsəʊ.fə/', 'Let''s sit on the sofa and talk.' UNION ALL
    SELECT 'Television', 'Телевизор', '/ˈtel.ɪ.vɪʒ.ən/', 'We watch television in the evening.' UNION ALL
    SELECT 'Torch', 'Фонарь', '/tɔːtʃ/', 'Take a torch when you go camping.' UNION ALL
    SELECT 'Useful', 'Полезный', '/ˈjuːs.fəl/', 'This dictionary is very useful.' UNION ALL
    SELECT 'Useless', 'Бесполезный', '/ˈjuːs.ləs/', 'This broken phone is useless now.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_A2_Unit3_words
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'A2'
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
    SELECT 'Accountant' AS english_word, 'Бухгалтер' AS russian_translation, '/əˈkaʊn.tənt/' AS transcription, 'My sister is an accountant in a big company.' AS example_sentence UNION ALL
    SELECT 'Archaeologist', 'Археолог', '/ˌɑː.kiˈɒl.ə.dʒɪst/', 'Archaeologists study ancient civilizations.' UNION ALL
    SELECT 'Art gallery', 'Картинная галерея', '/ˈɑːt ˌɡæl.ər.i/', 'We visited an art gallery yesterday.' UNION ALL
    SELECT 'Away', 'Вдали', '/əˈweɪ/', 'My parents live far away.' UNION ALL
    SELECT 'Beautiful', 'Красивый', '/ˈbjuː.tɪ.fəl/', 'This is a beautiful painting.' UNION ALL
    SELECT 'Big', 'Большой', '/bɪɡ/', 'Moscow is a very big city.' UNION ALL
    SELECT 'Boat', 'Лодка', '/bəʊt/', 'We went fishing in a small boat.' UNION ALL
    SELECT 'Book', 'Книга', '/bʊk/', 'I''m reading an interesting book.' UNION ALL
    SELECT 'Car', 'Машина', '/kɑːr/', 'We traveled by car.' UNION ALL
    SELECT 'Cheap', 'Дешёвый', '/tʃiːp/', 'This hotel is cheap but comfortable.' UNION ALL
    SELECT 'Classroom', 'Учебный класс', '/ˈklɑːs.ruːm/', 'Our classroom is on the second floor.' UNION ALL
    SELECT 'Clean', 'Чистый', '/kliːn/', 'Keep your room clean.' UNION ALL
    SELECT 'Client', 'Клиент', '/ˈklaɪ.ənt/', 'We have an important client today.' UNION ALL
    SELECT 'Colleague', 'Коллега', '/ˈkɒl.iːɡ/', 'My colleague helps me with work.' UNION ALL
    SELECT 'Community', 'Сообщество', '/kəˈmjuː.nə.ti/', 'Our local community is very friendly.' UNION ALL
    SELECT 'Crowded', 'Многолюдный', '/ˈkraʊ.dɪd/', 'The metro is very crowded in the morning.' UNION ALL
    SELECT 'Dirty', 'Грязный', '/ˈdɜː.ti/', 'The streets are dirty after the rain.' UNION ALL
    SELECT 'Doctor', 'Врач', '/ˈdɒk.tər/', 'You should see a doctor.' UNION ALL
    SELECT 'First language', 'Родной язык', '/ˌfɜːst ˈlæŋ.ɡwɪdʒ/', 'Russian is my first language.' UNION ALL
    SELECT 'Free', 'Бесплатный', '/friː/', 'This museum is free on Sundays.' UNION ALL
    SELECT 'History', 'История', '/ˈhɪs.tər.i/', 'I love reading history books.' UNION ALL
    SELECT 'Hospital', 'Больница', '/ˈhɒs.pɪ.təl/', 'My brother works in a hospital.' UNION ALL
    SELECT 'Ingredient', 'Ингредиент', '/ɪnˈɡriː.di.ənt/', 'What ingredients do we need for this recipe?' UNION ALL
    SELECT 'Learn', 'Изучать', '/lɜːn/', 'Children learn quickly.' UNION ALL
    SELECT 'Look', 'Смотреть', '/lʊk/', 'Look at this beautiful view!' UNION ALL
    SELECT 'Medical centre', 'Медицинский центр', '/ˈmed.ɪ.kəl ˌsen.tər/', 'There''s a medical centre near our house.' UNION ALL
    SELECT 'Meet', 'Встречаться', '/miːt/', 'Let''s meet at the café.' UNION ALL
    SELECT 'Native language', 'Родной язык', '/ˌneɪ.tɪv ˈlæŋ.ɡwɪdʒ/', 'English is not my native language.' UNION ALL
    SELECT 'Noisy', 'Шумный', '/ˈnɔɪ.zi/', 'This street is too noisy at night.' UNION ALL
    SELECT 'Office', 'Офис', '/ˈɒf.ɪs/', 'Our office is in the city center.' UNION ALL
    SELECT 'Official language', 'Официальный язык', '/əˌfɪʃ.əl ˈlæŋ.ɡwɪdʒ/', 'French is the official language in France.' UNION ALL
    SELECT 'Old', 'Старый', '/əʊld/', 'This is an old but beautiful building.' UNION ALL
    SELECT 'Park', 'Парк', '/pɑːk/', 'Let''s walk in the park.' UNION ALL
    SELECT 'Pilot', 'Пилот', '/ˈpaɪ.lət/', 'My uncle is a pilot.' UNION ALL
    SELECT 'Plane', 'Самолёт', '/pleɪn/', 'The plane arrives at 6 PM.' UNION ALL
    SELECT 'Polluted', 'Загрязнённый', '/pəˈluː.tɪd/', 'The air in big cities is often polluted.' UNION ALL
    SELECT 'Popular', 'Популярный', '/ˈpɒp.jə.lər/', 'This café is very popular.' UNION ALL
    SELECT 'Post office', 'Почтовое отделение', '/ˈpəʊst ˌɒf.ɪs/', 'I need to go to the post office.' UNION ALL
    SELECT 'Pre-schooler', 'Дошкольник', '/ˌpriːˈskuː.lər/', 'My daughter is a pre-schooler.' UNION ALL
    SELECT 'Quiet', 'Тихий', '/ˈkwaɪ.ət/', 'This is a quiet neighborhood.' UNION ALL
    SELECT 'Read', 'Читать', '/riːd/', 'I read books every evening.' UNION ALL
    SELECT 'Relax', 'Отдыхать', '/rɪˈlæks/', 'I relax on weekends.' UNION ALL
    SELECT 'Restaurant', 'Ресторан', '/ˈres.trɒnt/', 'Let''s have dinner at a restaurant.' UNION ALL
    SELECT 'Sailor', 'Моряк', '/ˈseɪ.lər/', 'My grandfather was a sailor.' UNION ALL
    SELECT 'Sales assistant', 'Продавец-консультант', '/ˈseɪlz əˌsɪs.tənt/', 'The sales assistant helped me choose a dress.' UNION ALL
    SELECT 'Sea life', 'Морские обитатели', '/ˈsiː ˌlaɪf/', 'We saw amazing sea life while diving.' UNION ALL
    SELECT 'Second language', 'Второй язык', '/ˌsek.ənd ˈlæŋ.ɡwɪdʒ/', 'English is my second language.' UNION ALL
    SELECT 'See', 'Видеть', '/siː/', 'I can''t see anything without my glasses.' UNION ALL
    SELECT 'Ship', 'Корабль', '/ʃɪp/', 'The ship arrived at the port.' UNION ALL
    SELECT 'Shop', 'Магазин', '/ʃɒp/', 'There''s a new shop in our street.' UNION ALL
    SELECT 'Stay', 'Оставаться', '/steɪ/', 'We''ll stay at a hotel.' UNION ALL
    SELECT 'Teacher', 'Учитель', '/ˈtiː.tʃər/', 'Our teacher explains everything clearly.' UNION ALL
    SELECT 'Theatre', 'Театр', '/ˈθɪə.tər/', 'Let''s go to the theatre tonight.' UNION ALL
    SELECT 'Tourist', 'Турист', '/ˈtʊə.rɪst/', 'There are many tourists in this city.' UNION ALL
    SELECT 'Tourist information', 'Бюро информации', '/ˌtʊə.rɪst ˌɪn.fəˈmeɪ.ʃən/', 'We got a map at the tourist information.' UNION ALL
    SELECT 'Traffic light', 'Светофор', '/ˈtræf.ɪk ˌlaɪt/', 'Wait for the green traffic light.' UNION ALL
    SELECT 'Ugly', 'Уродливый', '/ˈʌɡ.li/', 'This building is really ugly.' UNION ALL
    SELECT 'Waiter', 'Официант', '/ˈweɪ.tər/', 'The waiter brought our food.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_A2_Unit4_words
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'A2'
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
    SELECT 'Allotment' AS english_word, 'участок' AS russian_translation, '/əˈlɒt.mənt/' AS transcription, 'My grandfather has an allotment where he grows vegetables.' AS example_sentence UNION ALL
    SELECT 'Ball', 'мяч', '/bɔːl/', 'Children are playing with a ball in the park.' UNION ALL
    SELECT 'Baseball', 'бейсбол', '/ˈbeɪs.bɔːl/', 'Baseball is popular in the USA.' UNION ALL
    SELECT 'Basketball', 'баскетбол', '/ˈbɑː.skɪt.bɔːl/', 'We play basketball at school.' UNION ALL
    SELECT 'Boxing', 'бокс', '/ˈbɒk.sɪŋ/', 'My brother does boxing three times a week.' UNION ALL
    SELECT 'Browse the internet', 'просматривать интернет', '/braʊz ði ˈɪn.tə.net/', 'I browse the internet every evening.' UNION ALL
    SELECT 'Coffee', 'кофе', '/ˈkɒf.i/', 'I drink coffee in the morning.' UNION ALL
    SELECT 'Collocation', 'словосочетание', '/ˌkɒl.əˈkeɪ.ʃən/', 'Learning collocations helps you speak better.' UNION ALL
    SELECT 'Computer game', 'компьютерная игра', '/kəmˈpjuː.tə ɡeɪm/', 'My son loves computer games.' UNION ALL
    SELECT 'Concert', 'концерт', '/ˈkɒn.sət/', 'We went to a rock concert last night.' UNION ALL
    SELECT 'Cricket', 'крикет', '/ˈkrɪk.ɪt/', 'Cricket is popular in England.' UNION ALL
    SELECT 'Cycling', 'езда на велосипеде', '/ˈsaɪ.klɪŋ/', 'Cycling is good for health.' UNION ALL
    SELECT 'Exciting', 'захватывающий', '/ɪkˈsaɪ.tɪŋ/', 'This movie is really exciting.' UNION ALL
    SELECT 'Film', 'фильм', '/fɪlm/', 'Let''s watch a film tonight.' UNION ALL
    SELECT 'Fishing', 'рыбалка', '/ˈfɪʃ.ɪŋ/', 'My father goes fishing every weekend.' UNION ALL
    SELECT 'Football', 'футбол', '/ˈfʊt.bɔːl/', 'Football is the most popular sport in the world.' UNION ALL
    SELECT 'Friend', 'друг', '/frend/', 'I''m meeting my friend tomorrow.' UNION ALL
    SELECT 'Frisbee', 'летающая тарелка', '/ˈfrɪz.bi/', 'We play frisbee in the park.' UNION ALL
    SELECT 'Golf', 'гольф', '/ɡɒlf/', 'Golf is an expensive sport.' UNION ALL
    SELECT 'Gym', 'спортзал', '/dʒɪm/', 'I go to the gym three times a week.' UNION ALL
    SELECT 'Ice hockey', 'хоккей на льду', '/ˈaɪs ˌhɒk.i/', 'Ice hockey is popular in Russia.' UNION ALL
    SELECT 'Identical', 'идентичный', '/aɪˈden.tɪ.kəl/', 'These two pictures are identical.' UNION ALL
    SELECT 'Musical instrument', 'музыкальный инструмент', '/ˌmjuː.zɪ.kəl ˈɪn.strə.mənt/', 'I play several musical instruments.' UNION ALL
    SELECT 'On your own', 'самостоятельно', '/ɒn jɔːr əʊn/', 'I prefer to travel on my own.' UNION ALL
    SELECT 'Online game', 'онлайн игра', '/ˌɒn.laɪn ˈɡeɪm/', 'Many children play online games.' UNION ALL
    SELECT 'Online shopping', 'покупки в интернете', '/ˌɒn.laɪn ˈʃɒp.ɪŋ/', 'Online shopping is very convenient.' UNION ALL
    SELECT 'Phone call', 'телефонный звонок', '/ˈfəʊn ˌkɔːl/', 'I had an important phone call.' UNION ALL
    SELECT 'Running', 'бег', '/ˈrʌn.ɪŋ/', 'Running is good for your heart.' UNION ALL
    SELECT 'Sailing', 'парусный спорт', '/ˈseɪ.lɪŋ/', 'Sailing is popular in coastal cities.' UNION ALL
    SELECT 'Skiing', 'катание на лыжах', '/ˈskiː.ɪŋ/', 'We go skiing every winter.' UNION ALL
    SELECT 'Snow', 'снег', '/snəʊ/', 'Children love playing in the snow.' UNION ALL
    SELECT 'Snowboarding', 'сноубординг', '/ˈsnəʊ.bɔː.dɪŋ/', 'Snowboarding is more difficult than skiing.' UNION ALL
    SELECT 'Social media', 'социальные сети', '/ˌsəʊ.ʃəl ˈmiː.di.ə/', 'Many people spend too much time on social media.' UNION ALL
    SELECT 'Surfing', 'серфинг', '/ˈsɜː.fɪŋ/', 'Surfing is popular in Australia.' UNION ALL
    SELECT 'Swimming', 'плавание', '/ˈswɪm.ɪŋ/', 'Swimming is my favorite sport.' UNION ALL
    SELECT 'Taekwondo', 'Тхэквондо', '/taɪˈkwɒn.dəʊ/', 'My daughter does taekwondo.' UNION ALL
    SELECT 'Team', 'команда', '/tiːm/', 'Our team won the competition.' UNION ALL
    SELECT 'Tennis', 'теннис', '/ˈten.ɪs/', 'We play tennis every Sunday.' UNION ALL
    SELECT 'Text', 'писать сообщение', '/tekst/', 'I''ll text you later.' UNION ALL
    SELECT 'Video', 'видео', '/ˈvɪd.i.əʊ/', 'Let''s make a video of our trip.' UNION ALL
    SELECT 'Walk', 'гулять', '/wɔːk/', 'We walk in the park every evening.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_A2_Unit5_words
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'A2'
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
    SELECT 'Anything else' AS english_word, 'Что-нибудь ещё?' AS russian_translation, '/ˈen.i.θɪŋ els/' AS transcription, 'Would you like anything else with your coffee?' AS example_sentence UNION ALL
    SELECT 'Best before (date)', 'Срок годности', '/ˌbest bɪˈfɔːr deɪt/', 'Check the best before date on the milk.' UNION ALL
    SELECT 'Bill', 'Счёт', '/bɪl/', 'Can we have the bill, please?' UNION ALL
    SELECT 'Cereal', 'Хлопья', '/ˈsɪə.ri.əl/', 'I eat cereal for breakfast.' UNION ALL
    SELECT 'Ceviche', 'Севиче', '/səˈviː.tʃeɪ/', 'Ceviche is a popular dish in Peru.' UNION ALL
    SELECT 'Cheese', 'Сыр', '/tʃiːz/', 'This cheese is very tasty.' UNION ALL
    SELECT 'Chicken', 'Курица', '/ˈtʃɪk.ɪn/', 'We''re having chicken for dinner.' UNION ALL  -- Экранированный апостроф
    SELECT 'Chips', 'Чипсы', '/tʃɪps/', 'I like potato chips.' UNION ALL
    SELECT 'Chocolate', 'Шоколад', '/ˈtʃɒk.lət/', 'Dark chocolate is my favorite.' UNION ALL
    SELECT 'Chop', 'Рубить', '/tʃɒp/', 'Chop the onions finely.' UNION ALL
    SELECT 'Colon', 'Двоеточие', '/ˈkəʊ.lɒn/', 'Use a colon before a list.' UNION ALL
    SELECT 'Cost', 'Стоимость', '/kɒst/', 'What''s the cost of this meal?' UNION ALL  -- Экранированный апостроф
    SELECT 'Curry', 'Карри', '/ˈkʌr.i/', 'Indian curry can be very spicy.' UNION ALL
    SELECT 'Delicious', 'Вкусный', '/dɪˈlɪʃ.əs/', 'This soup is delicious!' UNION ALL
    SELECT 'Dessert', 'Десерт', '/dɪˈzɜːt/', 'What''s for dessert today?' UNION ALL  -- Экранированный апостроф
    SELECT 'Drink', 'Напиток', '/drɪŋk/', 'Would you like a drink?' UNION ALL
    SELECT 'Egg', 'Яйцо', '/eɡ/', 'I eat two eggs for breakfast.' UNION ALL
    SELECT 'Eggplant', 'Баклажан', '/ˈeɡ.plɑːnt/', 'Eggplant is used in many dishes.' UNION ALL
    SELECT 'Fat', 'Жир', '/fæt/', 'This meat has too much fat.' UNION ALL
    SELECT 'Final course', 'Последнее блюдо', '/ˈfaɪ.nəl kɔːs/', 'The final course was ice cream.' UNION ALL
    SELECT 'Fish', 'Рыба', '/fɪʃ/', 'We eat fish every Friday.' UNION ALL
    SELECT 'Flour', 'Мука', '/flaʊər/', 'We need flour to make bread.' UNION ALL
    SELECT 'Full stop', 'Точка', '/ˌfʊl ˈstɒp/', 'Put a full stop at the end.' UNION ALL
    SELECT 'Glass', 'Стакан', '/ɡlɑːs/', 'I drink water from a glass.' UNION ALL
    SELECT 'Healthy', 'Здоровый', '/ˈhel.θi/', 'Fruits and vegetables are healthy.' UNION ALL
    SELECT 'Juice', 'Сок', '/dʒuːs/', 'Orange juice is rich in vitamin C.' UNION ALL
    SELECT 'Kabsa', 'Кабса', '/ˈkæb.sə/', 'Kabsa is a traditional Saudi dish.' UNION ALL
    SELECT 'Kilo', 'Килограмм', '/ˈkiː.ləʊ/', 'I bought a kilo of apples.' UNION ALL
    SELECT 'Label', 'Этикетка', '/ˈleɪ.bəl/', 'Read the label before buying.' UNION ALL
    SELECT 'Lamb', 'Ягнятина', '/læm/', 'Lamb is popular in Middle Eastern cuisine.' UNION ALL
    SELECT 'Law-fat', 'Низкокалорийный', '/ˌlɔː ˈfæt/', 'I prefer law-fat yogurt.' UNION ALL
    SELECT 'Leaf', 'Лист', '/liːf/', 'This tree has beautiful leaves.' UNION ALL
    SELECT 'Lemon', 'Лимон', '/ˈlem.ən/', 'Add some lemon to your tea.' UNION ALL
    SELECT 'Lentil', 'Чечевица', '/ˈlen.təl/', 'Lentil soup is very nutritious.' UNION ALL
    SELECT 'Main course', 'Основное блюдо', '/ˌmeɪn ˈkɔːs/', 'The main course was steak.' UNION ALL
    SELECT 'Menu', 'Меню', '/ˈmen.juː/', 'Let''s look at the menu.' UNION ALL  -- Экранированный апостроф
    SELECT 'Mix', 'Смешивать', '/mɪks/', 'Mix the ingredients well.' UNION ALL
    SELECT 'Natural', 'Натуральный', '/ˈnætʃ.ər.əl/', 'This juice is 100% natural.' UNION ALL
    SELECT 'Nut', 'Орех', '/nʌt/', 'I''m allergic to nuts.' UNION ALL  -- Экранированный апостроф
    SELECT 'Onion', 'Лук', '/ˈʌn.jən/', 'Chop the onion finely.' UNION ALL
    SELECT 'Orange', 'Апельсин', '/ˈɒr.ɪndʒ/', 'I eat an orange every day.' UNION ALL
    SELECT 'Order', 'Заказывать', '/ˈɔː.dər/', 'We''ll order pizza tonight.' UNION ALL  -- Экранированный апостроф
    SELECT 'Packet', 'Пакет', '/ˈpæk.ɪt/', 'A packet of sugar, please.' UNION ALL
    SELECT 'Pasta', 'Макароны', '/ˈpæs.tə/', 'I love pasta with cheese.' UNION ALL
    SELECT 'Pepper', 'Перец', '/ˈpep.ər/', 'Add some black pepper.' UNION ALL
    SELECT 'Piece', 'Кусочек', '/piːs/', 'Can I have a piece of cake?' UNION ALL
    SELECT 'Pierogi', 'Вареники', '/pɪˈrɒ.ɡi/', 'Pierogi are traditional Polish dumplings.' UNION ALL
    SELECT 'Pizza', 'Пицца', '/ˈpiːt.sə/', 'Let''s order pizza for dinner.' UNION ALL  -- Экранированный апостроф
    SELECT 'Point', 'Точка', '/pɔɪnt/', 'You have a good point.' UNION ALL
    SELECT 'Potato', 'Картофель', '/pəˈteɪ.təʊ/', 'Mashed potato is my favorite.' UNION ALL
    SELECT 'Pour', 'Наливать', '/pɔːr/', 'Pour the milk slowly.' UNION ALL
    SELECT 'Prawn', 'Креветка', '/prɔːn/', 'Prawn cocktail is delicious.' UNION ALL
    SELECT 'Punctuation', 'Пунктуация', '/ˌpʌŋk.tʃuˈeɪ.ʃən/', 'English punctuation is important.' UNION ALL
    SELECT 'Raisin', 'Изюм', '/ˈreɪ.zən/', 'I add raisins to my oatmeal.' UNION ALL
    SELECT 'Rice', 'Рис', '/raɪs/', 'Rice is a staple food in Asia.' UNION ALL
    SELECT 'Root', 'Корень', '/ruːt/', 'Ginger is a root plant.' UNION ALL
    SELECT 'Salt', 'Соль', '/sɒlt/', 'Add a pinch of salt.' UNION ALL
    SELECT 'Satay', 'Сате', '/ˈsæt.eɪ/', 'Satay is popular in Indonesia.' UNION ALL
    SELECT 'Sauce', 'Соус', '/sɔːs/', 'This sauce is too spicy.' UNION ALL
    SELECT 'Seaweed', 'Морские водоросли', '/ˈsiː.wiːd/', 'Seaweed is used in sushi.' UNION ALL
    SELECT 'Serve', 'Обслуживать', '/sɜːv/', 'They serve great food here.' UNION ALL
    SELECT 'Slice', 'Ломтик', '/slaɪs/', 'A slice of bread, please.' UNION ALL
    SELECT 'Smell', 'Запах', '/smel/', 'I love the smell of coffee.' UNION ALL
    SELECT 'Spread', 'Распространять', '/spred/', 'Spread the butter evenly.' UNION ALL
    SELECT 'Starter', 'Закуска', '/ˈstɑː.tər/', 'We''ll have garlic bread as a starter.' UNION ALL  -- Экранированный апостроф
    SELECT 'Stem', 'Стебель', '/stem/', 'The flower stem is green.' UNION ALL
    SELECT 'Superfood', 'Суперфуд', '/ˈsuː.pə.fuːd/', 'Avocado is considered a superfood.' UNION ALL
    SELECT 'Taste', 'Пробовать', '/teɪst/', 'Taste this soup, it''s delicious!' UNION ALL  -- Экранированный апостроф
    SELECT 'Tin', 'Консервная банка', '/tɪn/', 'Open a tin of beans.' UNION ALL
    SELECT 'Tuna', 'Тунец', '/ˈtjuː.nə/', 'Tuna salad is healthy.' UNION ALL
    SELECT 'Water', 'Вода', '/ˈwɔː.tər/', 'Drink more water.' UNION ALL
    SELECT 'Wheat', 'Пшеница', '/wiːt/', 'This bread is made from wheat.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_A2_Unit6_words
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'A2'
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
    SELECT 'Artist' AS english_word, 'художник' AS russian_translation, '/ˈɑː.tɪst/' AS transcription, 'Van Gogh was a famous artist.' AS example_sentence UNION ALL
    SELECT 'Attach', 'прикреплять', '/əˈtætʃ/', 'Attach the file to your email.' UNION ALL
    SELECT 'Attend', 'посещать', '/əˈtend/', 'I attend English classes.' UNION ALL
    SELECT 'Belong', 'принадлежать', '/bɪˈlɒŋ/', 'This book belongs to me.' UNION ALL
    SELECT 'Boring', 'скучный', '/ˈbɔː.rɪŋ/', 'This movie is really boring.' UNION ALL
    SELECT 'Comment', 'комментировать', '/ˈkɒm.ent/', 'Please comment on my post.' UNION ALL
    SELECT 'Diary', 'дневник', '/ˈdaɪə.ri/', 'I keep a personal diary.' UNION ALL
    SELECT 'Fantastic', 'фантастический', '/fænˈtæs.tɪk/', 'We had a fantastic holiday!' UNION ALL
    SELECT 'Fine', 'прекрасный', '/faɪn/', 'I''m fine, thank you.' UNION ALL  -- Экранированный апостроф
    SELECT 'Fitness tracker', 'фитнес браслет', '/ˈfɪt.nəs ˌtræk.ər/', 'My fitness tracker counts steps.' UNION ALL
    SELECT 'Fun', 'весело', '/fʌn/', 'We had fun at the party.' UNION ALL
    SELECT 'Funny', 'веселый', '/ˈfʌn.i/', 'This joke isn''t funny.' UNION ALL  -- Экранированный апостроф
    SELECT 'Great', 'великолепный', '/ɡreɪt/', 'That''s a great idea!' UNION ALL  -- Экранированный апостроф
    SELECT 'Hope', 'надежда', '/həʊp/', 'I hope you''ll come.' UNION ALL  -- Экранированный апостроф
    SELECT 'Incredible', 'невероятный', '/ɪnˈkred.ə.bəl/', 'The view was incredible.' UNION ALL
    SELECT 'King', 'король', '/kɪŋ/', 'The king ruled for 50 years.' UNION ALL
    SELECT 'Look forward to', 'ждать с нетерпением', '/lʊk ˈfɔː.wəd tuː/', 'I look forward to your visit.' UNION ALL
    SELECT 'Musician', 'музыкант', '/mjuˈzɪʃ.ən/', 'My brother is a musician.' UNION ALL
    SELECT 'Nice', 'милый', '/naɪs/', 'She''s a very nice person.' UNION ALL  -- Экранированный апостроф
    SELECT 'Not bad', 'неплохо', '/nɒt bæd/', 'The food was not bad.' UNION ALL
    SELECT 'Not very good', 'не очень хорошо', '/nɒt ˈver.i ɡʊd/', 'My English is not very good.' UNION ALL
    SELECT 'Painting', 'картина', '/ˈpeɪn.tɪŋ/', 'This painting is valuable.' UNION ALL
    SELECT 'President', 'президент', '/ˈprez.ɪ.dənt/', 'The president gave a speech.' UNION ALL
    SELECT 'Queen', 'королева', '/kwiːn/', 'The queen visited the hospital.' UNION ALL
    SELECT 'Remind', 'напоминать', '/rɪˈmaɪnd/', 'Remind me to call John.' UNION ALL
    SELECT 'Scared', 'испуганный', '/skeəd/', 'I''m scared of spiders.' UNION ALL  -- Экранированный апостроф
    SELECT 'Scary', 'пугающий', '/ˈskeə.ri/', 'Horror films are too scary.' UNION ALL
    SELECT 'Scientist', 'ученый', '/ˈsaɪən.tɪst/', 'Marie Curie was a famous scientist.' UNION ALL
    SELECT 'Share', 'делиться', '/ʃeər/', 'Let''s share the pizza.' UNION ALL  -- Экранированный апостроф
    SELECT 'Terrible', 'страшный', '/ˈter.ə.bəl/', 'I had a terrible dream.' UNION ALL
    SELECT 'Wardrobe', 'гардероб', '/ˈwɔː.drəʊb/', 'My wardrobe is full of clothes.' UNION ALL
    SELECT 'Wow', 'вот это да!', '/waʊ/', 'Wow, that''s amazing!' UNION ALL  -- Экранированный апостроф
    SELECT 'Write down', 'записывать', '/raɪt daʊn/', 'Write down your ideas.' UNION ALL
    SELECT 'Writer', 'писатель', '/ˈraɪ.tər/', 'Tolstoy was a great writer.' UNION ALL
    SELECT 'Yours sincerely', 'искренне Ваш', '/jɔːz sɪnˈsɪə.li/', 'The letter ended with "Yours sincerely".'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_A2_Unit7_words
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'A2'
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
    SELECT 'Ancient' AS english_word, 'древний' AS russian_translation, '/ˈeɪn.ʃənt/' AS transcription, 'We saw ancient ruins in Greece.' AS example_sentence UNION ALL
    SELECT 'Borrow', 'брать взаймы', '/ˈbɒr.əʊ/', 'Can I borrow your pen?' UNION ALL
    SELECT 'Buy', 'покупать', '/baɪ/', 'I want to buy a new phone.' UNION ALL
    SELECT 'Cable car', 'фуникулер', '/ˈkeɪ.bəl ˌkɑːr/', 'We took the cable car to the mountain.' UNION ALL
    SELECT 'Cash', 'наличные', '/kæʃ/', 'Do you have enough cash?' UNION ALL
    SELECT 'Celebration', 'празднование', '/ˌsel.əˈbreɪ.ʃən/', 'The wedding celebration was wonderful.' UNION ALL
    SELECT 'Change', 'менять', '/tʃeɪndʒ/', 'I need to change some dollars.' UNION ALL
    SELECT 'Coin', 'монета', '/kɔɪn/', 'This old coin is valuable.' UNION ALL
    SELECT 'Credit card', 'кредитная карта', '/ˈkred.ɪt ˌkɑːd/', 'Can I pay by credit card?' UNION ALL
    SELECT 'Dangerous', 'опасный', '/ˈdeɪn.dʒər.əs/', 'This road is dangerous at night.' UNION ALL
    SELECT 'Decay', 'гнить', '/dɪˈkeɪ/', 'The fruit started to decay.' UNION ALL
    SELECT 'Difficult', 'трудный', '/ˈdɪf.ɪ.kəlt/', 'This exercise is too difficult.' UNION ALL
    SELECT 'Drive', 'водить машину', '/draɪv/', 'I can''t drive a car.' UNION ALL  -- Экранированный апостроф
    SELECT 'Event', 'событие', '/ɪˈvent/', 'The concert was a big event.' UNION ALL
    SELECT 'Festival', 'фестиваль', '/ˈfes.tɪ.vəl/', 'We attended a music festival.' UNION ALL
    SELECT 'Fly', 'летать', '/flaɪ/', 'I''m afraid to fly.' UNION ALL  -- Экранированный апостроф
    SELECT 'Go', 'идти', '/ɡəʊ/', 'Let''s go to the park.' UNION ALL  -- Экранированный апостроф
    SELECT 'Huge', 'огромный', '/hjuːdʒ/', 'This building is huge!' UNION ALL
    SELECT 'Jungle', 'джунгли', '/ˈdʒʌŋ.ɡəl/', 'Tigers live in the jungle.' UNION ALL
    SELECT 'Lay', 'класть', '/leɪ/', 'Lay the book on the table.' UNION ALL
    SELECT 'Lend', 'давать в долг', '/lend/', 'Can you lend me some money?' UNION ALL
    SELECT 'Nightclub', 'ночной клуб', '/ˈnaɪt.klʌb/', 'We went to a nightclub.' UNION ALL
    SELECT 'Pay', 'платить', '/peɪ/', 'I''ll pay for dinner.' UNION ALL  -- Экранированный апостроф
    SELECT 'Port', 'порт', '/pɔːt/', 'The ship arrived at the port.' UNION ALL
    SELECT 'Safe', 'безопасный', '/seɪf/', 'Is this neighborhood safe?' UNION ALL
    SELECT 'Sculptor', 'скульптор', '/ˈskʌlp.tər/', 'Michelangelo was a great sculptor.' UNION ALL
    SELECT 'Shallow', 'мелкий', '/ˈʃæl.əʊ/', 'The water here is shallow.' UNION ALL
    SELECT 'Skin', 'кожа', '/skɪn/', 'My skin is sensitive to sun.' UNION ALL
    SELECT 'Smooth', 'гладкий', '/smuːð/', 'This surface is very smooth.' UNION ALL
    SELECT 'Spend', 'тратить', '/spend/', 'I spend too much money.' UNION ALL
    SELECT 'Square', 'площадь', '/skweər/', 'There''s a fountain in the square.' UNION ALL  -- Экранированный апостроф
    SELECT 'Step', 'ступенька', '/step/', 'Be careful on these steps.' UNION ALL
    SELECT 'Take', 'брать', '/teɪk/', 'Take your umbrella, it''s raining.' UNION ALL  -- Экранированный апостроф
    SELECT 'Take out', 'вынимать', '/teɪk aʊt/', 'Take out the trash, please.' UNION ALL
    SELECT 'Ticket', 'билет', '/ˈtɪk.ɪt/', 'I bought a train ticket.' UNION ALL
    SELECT 'Time', 'время', '/taɪm/', 'What time is it?' UNION ALL
    SELECT 'Tiny', 'крошечный', '/ˈtaɪ.ni/', 'This apartment is tiny.' UNION ALL
    SELECT 'Travel by', 'путешествовать', '/ˈtræv.əl baɪ/', 'We travel by train.' UNION ALL
    SELECT 'Turn', 'повернуть', '/tɜːn/', 'Turn left at the corner.' UNION ALL
    SELECT 'View', 'вид', '/vjuː/', 'The view from here is beautiful.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_A2_Unit8_words
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'A2'
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
    SELECT 'Advertisement' AS english_word, 'Реклама' AS russian_translation, '/ədˈvɜː.tɪs.mənt/' AS transcription, 'I saw an advertisement for this product on TV.' AS example_sentence UNION ALL
    SELECT 'Appearance', 'Внешний вид', '/əˈpɪə.rəns/', 'Her appearance changed after the makeover.' UNION ALL
    SELECT 'Arm', 'Рука', '/ɑːm/', 'He broke his arm playing football.' UNION ALL
    SELECT 'Bag', 'Сумка', '/bæɡ/', 'My bag is full of books.' UNION ALL
    SELECT 'Beard', 'Борода', '/bɪəd/', 'He grew a beard last winter.' UNION ALL
    SELECT 'Belt', 'Ремень', '/belt/', 'I need a new belt for these trousers.' UNION ALL
    SELECT 'Carnival', 'Карнавал', '/ˈkɑː.nɪ.vəl/', 'The Rio carnival is world-famous.' UNION ALL
    SELECT 'Clarinet', 'Кларнет', '/ˌklær.ɪˈnet/', 'She plays the clarinet in an orchestra.' UNION ALL
    SELECT 'Clown', 'Клоун', '/klaʊn/', 'The clown made children laugh.' UNION ALL
    SELECT 'Coat', 'Пальто', '/kəʊt/', 'Wear your coat, it''s cold outside.' UNION ALL  -- Экранированный апостроф
    SELECT 'Colorful', 'Разноцветный', '/ˈkʌl.ə.fəl/', 'She wore a colorful dress.' UNION ALL
    SELECT 'Costume', 'Костюм', '/ˈkɒs.tjuːm/', 'Halloween costumes can be scary.' UNION ALL
    SELECT 'Dinosaur', 'Динозавр', '/ˈdaɪ.nə.sɔːr/', 'Children love dinosaur toys.' UNION ALL
    SELECT 'Doll', 'Кукла', '/dɒl/', 'My daughter has a collection of dolls.' UNION ALL
    SELECT 'Dress', 'Платье', '/dres/', 'She bought a new dress for the party.' UNION ALL
    SELECT 'Drum', 'Барабан', '/drʌm/', 'He plays drums in a band.' UNION ALL
    SELECT 'Ear', 'Ухо', '/ɪər/', 'She has earrings in both ears.' UNION ALL
    SELECT 'Eye', 'Глаз', '/aɪ/', 'He has beautiful blue eyes.' UNION ALL
    SELECT 'Firework', 'Фейерверк', '/ˈfaɪə.wɜːk/', 'We watched fireworks on New Year''s Eve.' UNION ALL  -- Экранированный апостроф
    SELECT 'Foot', 'Ступня', '/fʊt/', 'My foot hurts after walking.' UNION ALL
    SELECT 'Formal', 'Официальный', '/ˈfɔː.məl/', 'This event requires formal clothes.' UNION ALL
    SELECT 'Hair', 'Волосы', '/heər/', 'She has long blonde hair.' UNION ALL
    SELECT 'Hand', 'Кисть руки', '/hænd/', 'Wash your hands before eating.' UNION ALL
    SELECT 'Head', 'Голова', '/hed/', 'I have a headache.' UNION ALL
    SELECT 'Height', 'Рост', '/haɪt/', 'What''s your height?' UNION ALL  -- Экранированный апостроф
    SELECT 'Jacket', 'Куртка', '/ˈdʒæk.ɪt/', 'This jacket is too warm for summer.' UNION ALL
    SELECT 'Jeans', 'Джинсы', '/dʒiːnz/', 'I wear jeans almost every day.' UNION ALL
    SELECT 'Jewellery', 'Украшения', '/ˈdʒuː.əl.ri/', 'She doesn''t wear much jewellery.' UNION ALL  -- Экранированный апостроф
    SELECT 'Leg', 'Нога', '/leɡ/', 'He broke his leg skiing.' UNION ALL
    SELECT 'Leggings', 'Леггинсы', '/ˈleɡ.ɪŋz/', 'Yoga leggings are comfortable.' UNION ALL
    SELECT 'Make-up', 'Макияж', '/ˈmeɪk.ʌp/', 'She does her make-up every morning.' UNION ALL
    SELECT 'Mask', 'Маска', '/mɑːsk/', 'We wore masks during the pandemic.' UNION ALL
    SELECT 'Mouth', 'Рот', '/maʊθ/', 'Open your mouth wide.' UNION ALL
    SELECT 'Neck', 'Шея', '/nek/', 'She wore a scarf around her neck.' UNION ALL
    SELECT 'Nervous', 'Нервный', '/ˈnɜː.vəs/', 'I''m nervous before exams.' UNION ALL  -- Экранированный апостроф
    SELECT 'Parade', 'Парад', '/pəˈreɪd/', 'There was a parade on Independence Day.' UNION ALL
    SELECT 'Possession', 'Имущество', '/pəˈzeʃ.ən/', 'This ring is my most valuable possession.' UNION ALL
    SELECT 'Rodeo', 'Родео', '/ˈrəʊ.di.əʊ/', 'Rodeo is popular in America.' UNION ALL
    SELECT 'Scarf', 'Шарф', '/skɑːf/', 'I lost my favorite scarf.' UNION ALL
    SELECT 'Shirt', 'Рубашка', '/ʃɜːt/', 'He wears a shirt to work.' UNION ALL
    SELECT 'Shoe', 'Туфля', '/ʃuː/', 'These shoes are uncomfortable.' UNION ALL
    SELECT 'Shorts', 'Шорты', '/ʃɔːts/', 'It''s too cold for shorts today.' UNION ALL  -- Экранированный апостроф
    SELECT 'Shoulder', 'Плечо', '/ˈʃəʊl.dər/', 'She hurt her shoulder playing tennis.' UNION ALL
    SELECT 'Skirt', 'Юбка', '/skɜːt/', 'This skirt is too long.' UNION ALL
    SELECT 'Sock', 'Носок', '/sɒk/', 'I need new socks.' UNION ALL
    SELECT 'Suit', 'Костюм', '/suːt/', 'He looks handsome in a suit.' UNION ALL
    SELECT 'Sunglasses', 'Солнцезащитные очки', '/ˈsʌnˌɡlɑː.sɪz/', 'Wear sunglasses to protect your eyes.' UNION ALL
    SELECT 'Superhero', 'Супергерой', '/ˈsuː.pəˌhɪə.rəʊ/', 'Children love superhero movies.' UNION ALL
    SELECT 'Tie', 'Галстук', '/taɪ/', 'He wears a tie to the office.' UNION ALL
    SELECT 'Top', 'Топ', '/tɒp/', 'This top matches my skirt.' UNION ALL
    SELECT 'Toy', 'Игрушка', '/tɔɪ/', 'The child got many toys for Christmas.' UNION ALL
    SELECT 'Trainer', 'Кроссовок', '/ˈtreɪ.nər/', 'I need new trainers for the gym.' UNION ALL
    SELECT 'Trousers', 'Брюки', '/ˈtraʊ.zəz/', 'These trousers need ironing.' UNION ALL
    SELECT 'Trumpet', 'Труба', '/ˈtrʌm.pɪt/', 'He plays trumpet in a jazz band.' UNION ALL
    SELECT 'T-shirt', 'Футболка', '/ˈtiː.ʃɜːt/', 'I sleep in an old T-shirt.' UNION ALL
    SELECT 'Uniform', 'Униформа', '/ˈjuː.nɪ.fɔːm/', 'Schoolchildren wear uniforms.' UNION ALL
    SELECT 'Unusual', 'Необычный', '/ʌnˈjuː.ʒu.əl/', 'She has an unusual hairstyle.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_A2_Unit9_words
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'A2'
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
    SELECT 'Animation' AS english_word, 'Анимационный фильм' AS russian_translation, '/ˌæn.ɪˈmeɪ.ʃən/' AS transcription, 'My children love animation films.' AS example_sentence UNION ALL
    SELECT 'Art exhibition', 'Художественная выставка', '/ɑːt ˌek.sɪˈbɪʃ.ən/', 'We visited an art exhibition last weekend.' UNION ALL
    SELECT 'Bird', 'Птица', '/bɜːd/', 'I hear birds singing every morning.' UNION ALL
    SELECT 'Camera trap', 'Фотоловушка', '/ˈkæm.rə ˌtræp/', 'Scientists use camera traps to study wildlife.' UNION ALL
    SELECT 'Comedy', 'Комедия', '/ˈkɒm.ə.di/', 'Let''s watch a comedy tonight.' UNION ALL  -- Экранированный апостроф
    SELECT 'Comedy show', 'Комедийное шоу', '/ˈkɒm.ə.di ʃəʊ/', 'This comedy show is hilarious.' UNION ALL
    SELECT 'Documentary', 'Документальный фильм', '/ˌdɒk.jəˈmen.tər.i/', 'We watched a documentary about climate change.' UNION ALL
    SELECT 'Drama series', 'Драматический сериал', '/ˈdrɑː.mə ˌsɪə.riːz/', 'This drama series has 10 episodes.' UNION ALL
    SELECT 'Episode', 'Серия', '/ˈep.ɪ.səʊd/', 'I missed last night''s episode.' UNION ALL  -- Экранированный апостроф
    SELECT 'Fantasy', 'Фантастика', '/ˈfæn.tə.si/', 'The Lord of the Rings is a fantasy novel.' UNION ALL
    SELECT 'Flower', 'Цветок', '/flaʊər/', 'She received beautiful flowers.' UNION ALL
    SELECT 'Fruit', 'Фрукты', '/fruːt/', 'Eat more fruits and vegetables.' UNION ALL
    SELECT 'Grass', 'Трава', '/ɡrɑːs/', 'The grass needs cutting.' UNION ALL
    SELECT 'Horror film', 'Фильм ужасов', '/ˈhɒr.ə ˌfɪlm/', 'I don''t like horror films.' UNION ALL  -- Экранированный апостроф
    SELECT 'Kangaroo', 'Кенгуру', '/ˌkæŋ.ɡəˈruː/', 'Kangaroos live in Australia.' UNION ALL
    SELECT 'Mountain', 'Гора', '/ˈmaʊn.tɪn/', 'We climbed a high mountain.' UNION ALL
    SELECT 'Perfume', 'Духи', '/ˈpɜː.fjuːm/', 'This perfume smells wonderful.' UNION ALL
    SELECT 'Prefer', 'Предпочитать', '/prɪˈfɜːr/', 'I prefer tea to coffee.' UNION ALL
    SELECT 'Quiz show', 'Телевикторина', '/ˈkwɪz ˌʃəʊ/', 'My grandfather watches quiz shows.' UNION ALL
    SELECT 'Rainforest', 'Тропический лес', '/ˈreɪn.fɒr.ɪst/', 'Rainforests are important for our planet.' UNION ALL
    SELECT 'Rock', 'Скала', '/rɒk/', 'The ship hit a rock.' UNION ALL
    SELECT 'Romantic comedy', 'Романтическая комедия', '/rəʊˌmæn.tɪk ˈkɒm.ə.di/', 'They watched a romantic comedy on their date.' UNION ALL
    SELECT 'Science-fiction film', 'Научно-фантастический фильм', '/ˌsaɪəns ˈfɪk.ʃən ˌfɪlm/', 'Star Wars is a famous science-fiction film.' UNION ALL
    SELECT 'Sea', 'Море', '/siː/', 'We swam in the sea every day.' UNION ALL
    SELECT 'Sky', 'Небо', '/skaɪ/', 'The sky is clear today.' UNION ALL
    SELECT 'Species', 'Вид', '/ˈspiː.ʃiːz/', 'Many species are endangered.' UNION ALL
    SELECT 'Sports programme', 'Спортивная программа', '/ˈspɔːts ˌprəʊ.ɡræm/', 'He watches sports programmes every weekend.' UNION ALL
    SELECT 'Stadium', 'Стадион', '/ˈsteɪ.di.əm/', 'The stadium was full of fans.' UNION ALL
    SELECT 'Team', 'Команда', '/tiːm/', 'Our team won the championship.' UNION ALL
    SELECT 'Thriller', 'Триллер', '/ˈθrɪl.ər/', 'This thriller kept me on the edge of my seat.' UNION ALL
    SELECT 'Tree', 'Дерево', '/triː/', 'This old tree is 200 years old.' UNION ALL
    SELECT 'Violent', 'Жестокий', '/ˈvaɪə.lənt/', 'I don''t like violent movies.' UNION ALL  -- Экранированный апостроф
    SELECT 'Wildlife documentary', 'Документальный фильм о природе', '/ˈwaɪld.laɪf ˌdɒk.jəˈmen.tər.i/', 'David Attenborough makes wonderful wildlife documentaries.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_A2_Unit10_words
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'A2'
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
    SELECT 'Biology' AS english_word, 'Биология' AS russian_translation, '/baɪˈɒl.ə.dʒi/' AS transcription, 'I study biology at school.' AS example_sentence UNION ALL
    SELECT 'Bite your fingernails', 'Грызть ногти', '/baɪt jɔːr ˈfɪŋ.ɡə.neɪlz/', 'Don''t bite your fingernails, it''s a bad habit.' UNION ALL  -- Экранированный апостроф
    SELECT 'Brush your teeth', 'Чистить зубы', '/brʌʃ jɔːr tiːθ/', 'Brush your teeth twice a day.' UNION ALL
    SELECT 'Chemical', 'Химический', '/ˈkem.ɪ.kəl/', 'This product contains harmful chemicals.' UNION ALL
    SELECT 'Chemistry', 'Химия', '/ˈkem.ɪ.stri/', 'Chemistry was my favorite subject.' UNION ALL
    SELECT 'Cigarette', 'Сигарета', '/ˌsɪɡ.əˈret/', 'Smoking cigarettes is bad for health.' UNION ALL
    SELECT 'Discover', 'Совершать открытие', '/dɪˈskʌv.ər/', 'Columbus discovered America.' UNION ALL
    SELECT 'Dress down', 'Одеваться небрежно', '/dres daʊn/', 'On Fridays we can dress down at work.' UNION ALL
    SELECT 'Dress up', 'Наряжаться', '/dres ʌp/', 'Children dress up for Halloween.' UNION ALL
    SELECT 'Email address', 'Электронный адрес', '/ˈiː.meɪl əˌdres/', 'What''s your email address?' UNION ALL  -- Экранированный апостроф
    SELECT 'Energy', 'Энергия', '/ˈen.ə.dʒi/', 'Solar energy is renewable.' UNION ALL
    SELECT 'Fail', 'Провалиться', '/feɪl/', 'I don''t want to fail my exam.' UNION ALL  -- Экранированный апостроф
    SELECT 'Forget', 'Забывать', '/fəˈɡet/', 'Don''t forget to call your mother.' UNION ALL  -- Экранированный апостроф
    SELECT 'Geography', 'География', '/dʒiˈɒɡ.rə.fi/', 'We''re studying European geography.' UNION ALL  -- Экранированный апостроф
    SELECT 'Get up', 'Вставать', '/ɡet ʌp/', 'I get up at 7 AM every day.' UNION ALL
    SELECT 'Give up', 'Бросать', '/ɡɪv ʌp/', 'Don''t give up learning English!' UNION ALL
    SELECT 'Go up', 'Подниматься', '/ɡəʊ ʌp/', 'Prices go up every year.' UNION ALL
    SELECT 'Habit', 'Привычка', '/ˈhæb.ɪt/', 'Smoking is a bad habit.' UNION ALL
    SELECT 'Invent', 'Изобретать', '/ɪnˈvent/', 'Alexander Bell invented the telephone.' UNION ALL
    SELECT 'Know', 'Знать', '/nəʊ/', 'I know the answer to this question.' UNION ALL
    SELECT 'Learn', 'Изучать', '/lɜːn/', 'Children learn languages quickly.' UNION ALL
    SELECT 'Literature', 'Литература', '/ˈlɪt.rə.tʃər/', 'Russian literature is famous worldwide.' UNION ALL
    SELECT 'Mathematics', 'Математика', '/ˌmæθˈmæt.ɪks/', 'Mathematics is difficult for many students.' UNION ALL
    SELECT 'Pass', 'Сдать экзамен', '/pɑːs/', 'I hope to pass all my exams.' UNION ALL
    SELECT 'Physics', 'Физика', '/ˈfɪz.ɪks/', 'Physics explains how the world works.' UNION ALL
    SELECT 'Practice', 'Практиковаться', '/ˈpræk.tɪs/', 'You need to practice speaking English.' UNION ALL
    SELECT 'Professional', 'Профессионал', '/prəˈfeʃ.ən.əl/', 'He''s a professional photographer.' UNION ALL  -- Экранированный апостроф
    SELECT 'Remember', 'Помнить', '/rɪˈmem.bər/', 'I remember my first day at school.' UNION ALL
    SELECT 'Shower', 'Душ', '/ʃaʊər/', 'I take a shower every morning.' UNION ALL
    SELECT 'Smoke', 'Курить', '/sməʊk/', 'Don''t smoke, it''s bad for you.' UNION ALL  -- Экранированный апостроф
    SELECT 'Study', 'Учиться', '/ˈstʌd.i/', 'I study English three times a week.' UNION ALL
    SELECT 'Teach', 'Учить', '/tiːtʃ/', 'My mother teaches mathematics.' UNION ALL
    SELECT 'Tone', 'Тон', '/təʊn/', 'I don''t like your angry tone.' UNION ALL
    SELECT 'Understand', 'Понимать', '/ˌʌn.dəˈstænd/', 'Do you understand this rule?' UNION ALL
    SELECT 'Urgent', 'Срочный', '/ˈɜː.dʒənt/', 'This is an urgent message.' UNION ALL
    SELECT 'Voicemail', 'Голосовая почта', '/ˈvɔɪs.meɪl/', 'Leave a message on my voicemail.' UNION ALL
    SELECT 'Wake up', 'Просыпаться', '/weɪk ʌp/', 'I usually wake up at 6:30.' UNION ALL
    SELECT 'Website', 'Веб-сайт', '/ˈweb.saɪt/', 'Our company has a new website.' UNION ALL
    SELECT 'Win', 'Побеждать', '/wɪn/', 'I hope our team will win.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_A2_Unit11_words
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'A2'
        AND u.display_order = 11  -- Unit 11
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
    SELECT 'Advantage' AS english_word, 'Преимущество' AS russian_translation, '/ədˈvɑːn.tɪdʒ/' AS transcription, 'One advantage of this hotel is its location.' AS example_sentence UNION ALL
    SELECT 'Appreciate', 'Ценить', '/əˈpriː.ʃi.eɪt/', 'I appreciate your help.' UNION ALL
    SELECT 'Backpacking', 'Пеший туризм', '/ˈbæk.pæk.ɪŋ/', 'We went backpacking in the mountains.' UNION ALL
    SELECT 'Book', 'Бронировать', '/bʊk/', 'I need to book a hotel room.' UNION ALL
    SELECT 'Break', 'Перерыв', '/breɪk/', 'Let''s take a short break.' UNION ALL  -- Экранированный апостроф
    SELECT 'Brochure', 'Брошюра', '/ˈbrəʊ.ʃər/', 'The travel agency gave us a brochure.' UNION ALL
    SELECT 'Camping', 'Поход с палатками', '/ˈkæm.pɪŋ/', 'We go camping every summer.' UNION ALL
    SELECT 'Carry-on', 'Ручная кладь', '/ˈkær.i.ɒn/', 'My carry-on bag is small.' UNION ALL
    SELECT 'Check in', 'Регистрироваться', '/tʃek ɪn/', 'We need to check in at the airport.' UNION ALL
    SELECT 'Climate', 'Климат', '/ˈklaɪ.mət/', 'The tropical climate is humid.' UNION ALL
    SELECT 'Comfortable', 'Комфортный', '/ˈkʌm.fə.tə.bəl/', 'These shoes are very comfortable.' UNION ALL
    SELECT 'Cruise', 'Морской круиз', '/kruːz/', 'We took a cruise around the Mediterranean.' UNION ALL
    SELECT 'Desert', 'Пустыня', '/ˈdez.ət/', 'The Sahara is the largest desert.' UNION ALL
    SELECT 'Destination', 'Пункт назначения', '/ˌdes.tɪˈneɪ.ʃən/', 'Our destination is Paris.' UNION ALL
    SELECT 'Facility', 'Удобство', '/fəˈsɪl.ə.ti/', 'The hotel has excellent facilities.' UNION ALL
    SELECT 'Feedback', 'Отзыв', '/ˈfiːd.bæk/', 'Please leave your feedback.' UNION ALL
    SELECT 'Guide', 'Гид', '/ɡaɪd/', 'The guide showed us the city.' UNION ALL
    SELECT 'Helpful', 'Полезный', '/ˈhelp.fəl/', 'The staff were very helpful.' UNION ALL
    SELECT 'Hiking', 'Поход', '/ˈhaɪ.kɪŋ/', 'We went hiking in the national park.' UNION ALL
    SELECT 'In advance', 'Заранее', '/ɪn ədˈvɑːns/', 'Book your tickets in advance.' UNION ALL
    SELECT 'Leisure', 'Досуг', '/ˈleʒ.ər/', 'What do you do in your leisure time?' UNION ALL
    SELECT 'License', 'Лицензия', '/ˈlaɪ.səns/', 'You need a license to drive.' UNION ALL
    SELECT 'Multicultural', 'Многокультурный', '/ˌmʌl.tiˈkʌl.tʃər.əl/', 'London is a multicultural city.' UNION ALL
    SELECT 'Package holiday', 'Турпакет', '/ˈpæk.ɪdʒ ˌhɒl.ə.deɪ/', 'We bought a package holiday to Spain.' UNION ALL
    SELECT 'Recommend', 'Рекомендовать', '/ˌrek.əˈmend/', 'Can you recommend a good restaurant?' UNION ALL
    SELECT 'Rent', 'Арендовать', '/rent/', 'We want to rent a car.' UNION ALL
    SELECT 'Return ticket', 'Билет туда-обратно', '/rɪˈtɜːn ˌtɪk.ɪt/', 'A return ticket is cheaper.' UNION ALL
    SELECT 'Right-hand side', 'Правая сторона', '/ˌraɪt.hænd ˈsaɪd/', 'In England they drive on the right-hand side.' UNION ALL
    SELECT 'Sightseeing', 'Осмотр достопримечательностей', '/ˈsaɪt.siː.ɪŋ/', 'We did some sightseeing in Rome.' UNION ALL
    SELECT 'Souvenir', 'Сувенир', '/ˌsuː.vənˈɪər/', 'I bought souvenirs for my friends.' UNION ALL
    SELECT 'Suggestion', 'Предложение', '/səˈdʒes.tʃən/', 'Do you have any suggestions?' UNION ALL
    SELECT 'Sun cream', 'Солнцезащитный крем', '/ˈsʌn ˌkriːm/', 'Don''t forget sun cream at the beach.' UNION ALL  -- Экранированный апостроф
    SELECT 'Temperature', 'Температура', '/ˈtem.prə.tʃər/', 'The temperature reached 30°C.' UNION ALL
    SELECT 'Tourism', 'Туризм', '/ˈtʊə.rɪ.zəm/', 'Tourism is important for the economy.' UNION ALL
    SELECT 'Travel', 'Путешествовать', '/ˈtræv.əl/', 'I love to travel abroad.' UNION ALL
    SELECT 'Umbrella', 'Зонт', '/ʌmˈbrel.ə/', 'Take an umbrella, it might rain.' UNION ALL
    SELECT 'Visa', 'Виза', '/ˈviː.zə/', 'You need a visa to visit the USA.' UNION ALL
    SELECT 'Visit', 'Посещать', '/ˈvɪz.ɪt/', 'We want to visit the museum.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_A2_Unit12_words
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'A2'
        AND u.display_order = 12  -- Unit 12
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
    SELECT 'Air' AS english_word, 'Воздух' AS russian_translation, '/eər/' AS transcription, 'The air is fresh in the mountains.' AS example_sentence UNION ALL
    SELECT 'Amount', 'Количество', '/əˈmaʊnt/', 'A large amount of water is needed.' UNION ALL
    SELECT 'Announcement', 'Объявление', '/əˈnaʊns.mənt/', 'Listen to the airport announcements.' UNION ALL
    SELECT 'Area', 'Область', '/ˈeə.ri.ə/', 'This area is dangerous at night.' UNION ALL
    SELECT 'Astronomer', 'Астроном', '/əˈstrɒn.ə.mər/', 'Astronomers study stars and planets.' UNION ALL
    SELECT 'Average', 'Средний', '/ˈæv.ər.ɪdʒ/', 'The average temperature is 20°C.' UNION ALL
    SELECT 'Charity', 'Благотворительность', '/ˈtʃær.ə.ti/', 'We donated money to charity.' UNION ALL
    SELECT 'Degree', 'Градус', '/dɪˈɡriː/', 'Water boils at 100 degrees Celsius.' UNION ALL
    SELECT 'Distance', 'Расстояние', '/ˈdɪs.təns/', 'What''s the distance to Moscow?' UNION ALL  -- Экранированный апостроф
    SELECT 'Environmentally-friendly', 'Экологичный', '/ɪnˌvaɪ.rənˈmen.təl.i ˈfrend.li/', 'We use environmentally-friendly products.' UNION ALL
    SELECT 'Equator', 'Экватор', '/ɪˈkweɪ.tər/', 'It''s hot near the equator.' UNION ALL  -- Экранированный апостроф
    SELECT 'Exercise class', 'Занятия физкультурой', '/ˈek.sə.saɪz ˌklɑːs/', 'I attend an exercise class twice a week.' UNION ALL
    SELECT 'Forest', 'Лес', '/ˈfɒr.ɪst/', 'We walked through the forest.' UNION ALL
    SELECT 'Hemisphere', 'Полушарие', '/ˈhem.ɪ.sfɪər/', 'Russia is in the northern hemisphere.' UNION ALL
    SELECT 'Invitation', 'Приглашение', '/ˌɪn.vɪˈteɪ.ʃən/', 'I received a wedding invitation.' UNION ALL
    SELECT 'Island', 'Остров', '/ˈaɪ.lənd/', 'Malta is a small island.' UNION ALL
    SELECT 'Kilogram', 'Килограмм', '/ˈkɪl.ə.ɡræm/', 'I bought a kilogram of apples.' UNION ALL
    SELECT 'Kilometer', 'Километр', '/ˈkɪl.ə.miː.tər/', 'It''s five kilometers to the city.' UNION ALL  -- Экранированный апостроф
    SELECT 'Lake', 'Озеро', '/leɪk/', 'Lake Baikal is very deep.' UNION ALL
    SELECT 'Land', 'Земля', '/lænd/', 'We saw land after a week at sea.' UNION ALL
    SELECT 'Liquid', 'Жидкость', '/ˈlɪk.wɪd/', 'Water is a liquid at room temperature.' UNION ALL
    SELECT 'Litre', 'Литр', '/ˈliː.tər/', 'The car needs five litres of oil.' UNION ALL
    SELECT 'Metre', 'Метр', '/ˈmiː.tər/', 'This room is three metres wide.' UNION ALL
    SELECT 'Notice', 'Замечать', '/ˈnəʊ.tɪs/', 'Did you notice anything strange?' UNION ALL
    SELECT 'Ocean', 'Океан', '/ˈəʊ.ʃən/', 'The Pacific Ocean is the largest.' UNION ALL
    SELECT 'Orbit', 'Орбита', '/ˈɔː.bɪt/', 'The Earth orbits the Sun.' UNION ALL
    SELECT 'Pick up', 'Подбирать', '/pɪk ʌp/', 'Please pick up your litter.' UNION ALL
    SELECT 'Planet', 'Планета', '/ˈplæn.ɪt/', 'Earth is our planet.' UNION ALL
    SELECT 'Politician', 'Политик', '/ˌpɒl.ɪˈtɪʃ.ən/', 'The politician gave a speech.' UNION ALL
    SELECT 'Protect', 'Защищать', '/prəˈtekt/', 'We must protect nature.' UNION ALL
    SELECT 'Quantity', 'Количество', '/ˈkwɒn.tə.ti/', 'Add a small quantity of salt.' UNION ALL
    SELECT 'Rainfall', 'Осадки', '/ˈreɪn.fɔːl/', 'The rainfall was heavy this year.' UNION ALL
    SELECT 'Respectful', 'Уважительный', '/rɪˈspekt.fəl/', 'Be respectful to your teachers.' UNION ALL
    SELECT 'River', 'Река', '/ˈrɪv.ər/', 'The Volga is the longest river in Europe.' UNION ALL
    SELECT 'Rock', 'Скала', '/rɒk/', 'The ship hit a rock.' UNION ALL
    SELECT 'Rubbish', 'Мусор', '/ˈrʌb.ɪʃ/', 'Don''t leave rubbish in the park.' UNION ALL  -- Экранированный апостроф
    SELECT 'Scholarship', 'Стипендия', '/ˈskɒl.ə.ʃɪp/', 'She got a university scholarship.' UNION ALL
    SELECT 'Square metre', 'Квадратный метр', '/ˌskweər ˈmiː.tər/', 'This flat is 50 square metres.' UNION ALL
    SELECT 'Star', 'Звезда', '/stɑːr/', 'We looked at the stars at night.' UNION ALL
    SELECT 'Weight', 'Вес', '/weɪt/', 'What''s your weight?'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);