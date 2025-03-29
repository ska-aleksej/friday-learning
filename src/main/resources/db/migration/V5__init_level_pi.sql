-- V5__Seed_PI_units.sql
INSERT INTO units (level_id, name, description, display_order) VALUES
    ((SELECT id FROM levels WHERE name = 'PI'), 'Unit 1 - Lifestyle', 'Образ жизни и повседневные дела', 1),
    ((SELECT id FROM levels WHERE name = 'PI'), 'Unit 2 - Competitions', 'Соревнования и спортивные события', 2),
    ((SELECT id FROM levels WHERE name = 'PI'), 'Unit 3 - Transport', 'Транспорт и путешествия', 3),
    ((SELECT id FROM levels WHERE name = 'PI'), 'Unit 4 - Challenges', 'Вызовы и сложные задачи', 4),
    ((SELECT id FROM levels WHERE name = 'PI'), 'Unit 5 - The Environment', 'Окружающая среда и экология', 5),
    ((SELECT id FROM levels WHERE name = 'PI'), 'Unit 6 - Stages in Life', 'Этапы жизни и возраст', 6),
    ((SELECT id FROM levels WHERE name = 'PI'), 'Unit 7 - Work', 'Работа и профессии', 7),
    ((SELECT id FROM levels WHERE name = 'PI'), 'Unit 8 - Technology', 'Технологии и изобретения', 8),
    ((SELECT id FROM levels WHERE name = 'PI'), 'Unit 9 - Holidays', 'Праздники и отпуска', 9),
    ((SELECT id FROM levels WHERE name = 'PI'), 'Unit 10 - Products', 'Продукты и устройства', 10),
    ((SELECT id FROM levels WHERE name = 'PI'), 'Unit 11 - History', 'История и археология', 11),
    ((SELECT id FROM levels WHERE name = 'PI'), 'Unit 12 - Nature', 'Природа и окружающая среда', 12);


-- Seed_PI_Unit1_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'PI'
        AND u.display_order = 1  -- Unit 1 - Lifestyle
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
    SELECT 'abbreviation' AS english_word, 'аббревиатура' AS russian_translation, '/əˌbriː.viˈeɪ.ʃən/' AS transcription, 'UN is an abbreviation for United Nations.' AS example_sentence UNION ALL
    SELECT 'active life', 'активная жизнь', '/ˈæk.tɪv laɪf/', 'She leads a very active life with sports and travel.' UNION ALL
    SELECT 'address', 'адрес', '/əˈdres/', 'Please write your full address on the form.' UNION ALL
    SELECT 'asleep', 'спящий, сонный', '/əˈsliːp/', 'The baby fell asleep in the car.' UNION ALL
    SELECT 'backache', 'боль в спине, в пояснице', '/ˈbæk.eɪk/', 'I can''t play tennis today because of my backache.' UNION ALL
    SELECT 'better', 'лучше', '/ˈbet.ər/', 'This coffee tastes better than the one we had yesterday.' UNION ALL
    SELECT 'beyond', 'за пределами', '/biˈjɒnd/', 'The mountains beyond the lake are beautiful.' UNION ALL
    SELECT 'board game', 'настольная игра', '/ˈbɔːd ˌɡeɪm/', 'We play board games every Friday night.' UNION ALL
    SELECT 'break', 'перерыв', '/breɪk/', 'Let''s take a short break after this lesson.' UNION ALL
    SELECT 'card', 'открытка', '/kɑːd/', 'I sent my mother a birthday card.' UNION ALL
    SELECT 'catch', 'ловить, поймать', '/kætʃ/', 'Can you catch the ball?' UNION ALL
    SELECT 'chat', 'болтать', '/tʃæt/', 'We like to chat over a cup of coffee.' UNION ALL
    SELECT 'check', 'проверять', '/tʃek/', 'Please check your answers before submitting.' UNION ALL
    SELECT 'clubbing', 'посещение ночных клубов', '/ˈklʌb.ɪŋ/', 'They go clubbing every weekend.' UNION ALL
    SELECT 'contact details', 'контактные данные', '/ˈkɒn.tækt ˌdiː.teɪlz/', 'Please provide your contact details on the form.' UNION ALL
    SELECT 'cough', 'кашель, кашлять', '/kɒf/', 'I have a bad cough and sore throat.' UNION ALL
    SELECT 'cough sweet', 'леденецы от боли в горле', '/ˈkɒf ˌswiːt/', 'These cough sweets help with my sore throat.' UNION ALL
    SELECT 'country of origin', 'страна происхождения', '/ˌkʌn.tri əv ˈɒr.ɪ.dʒɪn/', 'The wine label shows its country of origin.' UNION ALL
    SELECT 'countryside', 'сельская местность', '/ˈkʌn.tri.saɪd/', 'We prefer living in the countryside.' UNION ALL
    SELECT 'cycle', 'ездить на велосипеде', '/ˈsaɪ.kəl/', 'I cycle to work every morning.' UNION ALL
    SELECT 'dependent', 'зависимый, подвластный', '/dɪˈpen.dənt/', 'Children are dependent on their parents.' UNION ALL
    SELECT 'earache', 'боль в ухе', '/ˈɪə.reɪk/', 'My son has an earache and can''t sleep.' UNION ALL
    SELECT 'eat out', 'есть вне дома', '/ˈiːt ˌaʊt/', 'We eat out at restaurants twice a week.' UNION ALL
    SELECT 'emergency', 'экстренные службы', '/ɪˈmɜː.dʒən.si/', 'Call emergency if you see a fire.' UNION ALL
    SELECT 'exercise', 'упражнение', '/ˈek.sə.saɪz/', 'Regular exercise is good for health.' UNION ALL
    SELECT 'explanation', 'explanation', '/ˌek.spləˈneɪ.ʃən/', 'The teacher gave a clear explanation.' UNION ALL
    SELECT 'explorer', 'исследователь', '/ɪkˈsplɔː.rər/', 'The explorer discovered new islands.' UNION ALL
    SELECT 'feel', 'чувствовать, ощущать', '/fiːl/', 'I feel happy today.' UNION ALL
    SELECT 'feel like', 'быть склонным, хотеть', '/ˈfiːl ˌlaɪk/', 'I feel like going for a walk.' UNION ALL
    SELECT 'fill in a form', 'заполнить бланк', '/ˌfɪl ɪn ə ˈfɔːm/', 'You need to fill in a form to apply.' UNION ALL
    SELECT 'gender', 'пол', '/ˈdʒen.dər/', 'Please indicate your gender on the form.' UNION ALL
    SELECT 'get home', 'добраться домой', '/ˌɡet ˈhəʊm/', 'I usually get home at 6 pm.' UNION ALL
    SELECT 'get up', 'вставать с постели', '/ˌɡet ˈʌp/', 'I get up at 7 o''clock every morning.' UNION ALL
    SELECT 'good health', 'в добром здравии', '/ˌɡʊd ˈhelθ/', 'My grandfather is in good health for his age.' UNION ALL
    SELECT 'headache', 'головная боль', '/ˈhed.eɪk/', 'I have a terrible headache today.' UNION ALL
    SELECT 'hiking', 'пеший туризм', '/ˈhaɪ.kɪŋ/', 'We go hiking in the mountains every summer.' UNION ALL
    SELECT 'hours', 'часы', '/aʊəz/', 'The museum is open for limited hours on Sundays.' UNION ALL
    SELECT 'ill', 'больной, нездоровый', '/ɪl/', 'She didn''t come to work because she''s ill.' UNION ALL
    SELECT 'jogging', 'бег трусцой', '/ˈdʒɒɡ.ɪŋ/', 'Jogging in the park is my morning routine.' UNION ALL
    SELECT 'karate', 'карате', '/kəˈrɑː.ti/', 'My son takes karate lessons twice a week.' UNION ALL
    SELECT 'lifestyle', 'образ жизни', '/ˈlaɪf.staɪl/', 'Healthy lifestyle includes good diet and exercise.' UNION ALL
    SELECT 'lower', 'ниже, понизить', '/ˈləʊ.ər/', 'Please lower your voice in the library.' UNION ALL
    SELECT 'marital status', 'семейное положение', '/ˌmær.ɪ.təl ˈsteɪ.təs/', 'The form asks for your marital status.' UNION ALL
    SELECT 'medication', 'лекарство', '/ˌmed.ɪˈkeɪ.ʃən/', 'Take this medication three times a day.' UNION ALL
    SELECT 'medicine', 'медицина, лекарство', '/ˈmed.ɪ.sən/', 'She studies medicine at university.' UNION ALL
    SELECT 'musical instrument', 'музыкальный инструмент', '/ˌmjuː.zɪ.kəl ˈɪn.strə.mənt/', 'Piano was my first musical instrument.' UNION ALL
    SELECT 'next of kin', 'ближайший родственник', '/ˌnekst əv ˈkɪn/', 'In case of emergency, contact next of kin.' UNION ALL
    SELECT 'nothing', 'ничего', '/ˈnʌθ.ɪŋ/', 'There''s nothing interesting on TV tonight.' UNION ALL
    SELECT 'occupation', 'род занятий, профессия', '/ˌɒk.jəˈpeɪ.ʃən/', 'What is your current occupation?' UNION ALL
    SELECT 'often', 'часто', '/ˈɒf.ən/', 'I often go swimming on weekends.' UNION ALL
    SELECT 'once or twice', 'один или два раза', '/ˌwʌns ɔː ˈtwaɪs/', 'I''ve been to Paris once or twice.' UNION ALL
    SELECT 'operation', 'операция, деятельность', '/ˌɒp.ərˈeɪ.ʃən/', 'The hospital performs many operations daily.' UNION ALL
    SELECT 'physical health', 'физическое здоровье', '/ˌfɪz.ɪ.kəl ˈhelθ/', 'Physical health is as important as mental health.' UNION ALL
    SELECT 'pill', 'таблетка', '/pɪl/', 'Take one pill before breakfast.' UNION ALL
    SELECT 'place of issue', 'место выдачи (паспорта)', '/ˌpleɪs əv ˈɪʃ.uː/', 'The passport shows place of issue.' UNION ALL
    SELECT 'play', 'играть', '/pleɪ/', 'Children play in the park after school.' UNION ALL
    SELECT 'play', 'пьеса', '/pleɪ/', 'We went to see a Shakespeare play.' UNION ALL
    SELECT 'postcode', 'почтовый индекс', '/ˈpəʊst.kəʊd/', 'Don''t forget to include the postcode.' UNION ALL
    SELECT 'qualifications', 'квалификация', '/ˌkwɒl.ɪ.fɪˈkeɪ.ʃənz/', 'The job requires specific qualifications.' UNION ALL
    SELECT 'relaxed', 'расслабленный', '/rɪˈlækst/', 'I feel relaxed after my vacation.' UNION ALL
    SELECT 'runny nose', 'насморк', '/ˌrʌn.i ˈnəʊz/', 'I have a runny nose because of allergies.' UNION ALL
    SELECT 'sick', 'больной, нездоровый', '/sɪk/', 'I was sick last week but now I''m better.' UNION ALL
    SELECT 'social media', 'социальные сети', '/ˌsəʊ.ʃəl ˈmiː.di.ə/', 'Many people spend hours on social media.' UNION ALL
    SELECT 'sore throat', 'больное горло', '/ˌsɔː ˈθrəʊt/', 'Hot tea helps with a sore throat.' UNION ALL
    SELECT 'spouse', 'супруг, супруга', '/spaʊs/', 'Please indicate your spouse''s name.' UNION ALL
    SELECT 'stay up', 'не ложиться спать, бодрствовать', '/ˌsteɪ ˈʌp/', 'We stayed up late watching movies.' UNION ALL
    SELECT 'stomach ache', 'боль в животе', '/ˈstʌm.ək eɪk/', 'I can''t eat, I have a stomach ache.' UNION ALL
    SELECT 'stressed', 'напряженный, загруженный', '/strest/', 'She looks stressed about her exams.' UNION ALL
    SELECT 'surfing', 'серфинг', '/ˈsɜː.fɪŋ/', 'Surfing is popular in Australia.' UNION ALL
    SELECT 'surgery', 'хирургия (операция)', '/ˈsɜː.dʒər.i/', 'The patient needs heart surgery.' UNION ALL
    SELECT 'surname', 'фамилия', '/ˈsɜː.neɪm/', 'What is your surname?' UNION ALL
    SELECT 'temperature', 'температура', '/ˈtem.prə.tʃər/', 'The normal body temperature is 37°C.' UNION ALL
    SELECT 'tired', 'уставший', '/taɪəd/', 'I''m too tired to go out tonight.' UNION ALL
    SELECT 'two or three times', 'два или три раза', '/ˌtuː ɔː ˈθriː taɪmz/', 'I visit my parents two or three times a month.' UNION ALL
    SELECT 'usually', 'обычно', '/ˈjuː.ʒu.ə.li/', 'I usually have coffee for breakfast.' UNION ALL
    SELECT 'wake up', 'просыпаться', '/ˌweɪk ˈʌp/', 'I wake up at 6:30 on weekdays.' UNION ALL
    SELECT 'walk', 'гулять', '/wɔːk/', 'We walk our dog twice a day.' UNION ALL
    SELECT 'yoga', 'йога', '/ˈjəʊ.ɡə/', 'Yoga helps me relax and stay flexible.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_PI_Unit2_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'PI'
        AND u.display_order = 2  -- Unit 2 - Competitions
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
    SELECT 'a long way ahead' AS english_word, 'долгий путь' AS russian_translation, '/ə ˈlɒŋ weɪ əˈhed/' AS transcription, 'We still have a long way ahead in this competition.' AS example_sentence UNION ALL
    SELECT 'advert', 'реклама', '/ˈæd.vɜːt/', 'I saw your advert in the newspaper.' UNION ALL
    SELECT 'allowed', 'разрешенный', '/əˈlaʊd/', 'Are cameras allowed in the stadium?' UNION ALL
    SELECT 'athlete', 'спортсмен', '/ˈæθ.liːt/', 'Professional athletes train every day.' UNION ALL
    SELECT 'baseball', 'бейсбол', '/ˈbeɪs.bɔːl/', 'Baseball is very popular in the USA.' UNION ALL
    SELECT 'beard', 'борода', '/bɪəd/', 'The player grew a beard for the championship.' UNION ALL
    SELECT 'bless', 'благословлять', '/bles/', 'The priest blessed the competitors.' UNION ALL
    SELECT 'box', 'коробка, ящик', '/bɒks/', 'Put the equipment back in the box.' UNION ALL
    SELECT 'celebration', 'празднование', '/ˌsel.ɪˈbreɪ.ʃən/', 'There was a big celebration after the victory.' UNION ALL
    SELECT 'championship', 'чемпионат', '/ˈtʃæm.pi.ən.ʃɪp/', 'Our team won the national championship.' UNION ALL
    SELECT 'chess', 'шахматы', '/tʃes/', 'He plays chess every weekend.' UNION ALL
    SELECT 'commentator', 'комментатор', '/ˈkɒm.ən.teɪ.tər/', 'The commentator described the action.' UNION ALL
    SELECT 'competitor', 'соперник, конкурент', '/kəmˈpet.ɪ.tər/', 'There were 20 competitors in the race.' UNION ALL
    SELECT 'crazy', 'сумасшедший', '/ˈkreɪ.zi/', 'That was a crazy finish to the game!' UNION ALL
    SELECT 'crowd', 'толпа', '/kraʊd/', 'The crowd cheered loudly.' UNION ALL
    SELECT 'display', 'показывать', '/dɪˈspleɪ/', 'The athletes displayed great skill.' UNION ALL
    SELECT 'entertainment', 'развлечение', '/ˌen.təˈteɪn.mənt/', 'The event provided great entertainment.' UNION ALL
    SELECT 'enthusiasm', 'энтузиазм', '/ɪnˈθjuː.zi.æz.əm/', 'She plays with great enthusiasm.' UNION ALL
    SELECT 'fall back', 'отступать', '/ˌfɔːl ˈbæk/', 'Our team fell back to third place.' UNION ALL
    SELECT 'fit', 'в хорошей форме', '/fɪt/', 'You need to be fit to compete.' UNION ALL
    SELECT 'goal', 'гол, цель, ворота', '/ɡəʊl/', 'He scored the winning goal.' UNION ALL
    SELECT 'goalkeeper', 'вратарь', '/ˈɡəʊlˌkiː.pər/', 'The goalkeeper made an amazing save.' UNION ALL
    SELECT 'gymnastics', 'гимнастика', '/dʒɪmˈnæs.tɪks/', 'She won a gold medal in gymnastics.' UNION ALL
    SELECT 'hard', 'трудный', '/hɑːd/', 'The competition was very hard.' UNION ALL
    SELECT 'headline', 'заголовок', '/ˈhed.laɪn/', 'The match made headlines worldwide.' UNION ALL
    SELECT 'hole', 'отверстие', '/həʊl/', 'The ball went straight into the hole.' UNION ALL
    SELECT 'important', 'важный', '/ɪmˈpɔː.tənt/', 'This is an important tournament.' UNION ALL
    SELECT 'interested', 'заинтересованный', '/ˈɪn.trəs.tɪd/', 'Are you interested in sports?' UNION ALL
    SELECT 'join', 'присоединяться', '/dʒɔɪn/', 'I want to join the chess club.' UNION ALL
    SELECT 'keep up', 'не отставать', '/ˌkiːp ˈʌp/', 'It was hard to keep up with the leaders.' UNION ALL
    SELECT 'lead', 'вести', '/liːd/', 'Our team leads by two points.' UNION ALL
    SELECT 'lie', 'лежать, лгать, ложь', '/laɪ/', 'Don''t lie about your score.' UNION ALL
    SELECT 'like the wind', 'подобно ветру', '/ˌlaɪk ðə ˈwɪnd/', 'He ran like the wind to the finish.' UNION ALL
    SELECT 'match', 'матч', '/mætʃ/', 'The football match starts at 3 pm.' UNION ALL
    SELECT 'medal', 'медаль', '/ˈmed.əl/', 'She won a silver medal.' UNION ALL
    SELECT 'membership fee', 'членский взнос', '/ˈmem.bə.ʃɪp fiː/', 'The membership fee is $50 per year.' UNION ALL
    SELECT 'mixture', 'смешивание, смесь', '/ˈmɪks.tʃər/', 'The crowd was a mixture of young and old.' UNION ALL
    SELECT 'moustache', 'усы', '/məˈstɑːʃ/', 'The referee had a big moustache.' UNION ALL
    SELECT 'notice', 'замечать', '/ˈnəʊ.tɪs/', 'Did you notice the new rules?' UNION ALL
    SELECT 'obligatory', 'обязательный', '/əˈblɪɡ.ə.tər.i/', 'Safety gear is obligatory.' UNION ALL
    SELECT 'pick up', 'поднимать', '/ˌpɪk ˈʌp/', 'Please pick up your medals.' UNION ALL
    SELECT 'pitch', 'футбольное поле', '/pɪtʃ/', 'The pitch was wet after the rain.' UNION ALL
    SELECT 'player', 'игрок', '/ˈpleɪ.ər/', 'He''s the best player on the team.' UNION ALL
    SELECT 'point', 'очко, балл', '/pɔɪnt/', 'We need one more point to win.' UNION ALL
    SELECT 'pole', 'жердь', '/pəʊl/', 'The pole vaulter broke the record.' UNION ALL
    SELECT 'prize', 'приз', '/praɪz/', 'The first prize is $10,000.' UNION ALL
    SELECT 'proud', 'гордиться', '/praʊd/', 'You should be proud of your effort.' UNION ALL
    SELECT 'race', 'гонка', '/reɪs/', 'The race starts at noon.' UNION ALL
    SELECT 'referee', 'судья', '/ˌref.əˈriː/', 'The referee made a controversial call.' UNION ALL
    SELECT 'rich', 'богатый', '/rɪtʃ/', 'The prize made him rich.' UNION ALL
    SELECT 'ring', 'ринг', '/rɪŋ/', 'The boxers entered the ring.' UNION ALL
    SELECT 'rival', 'соперник', '/ˈraɪ.vəl/', 'Our main rival is very strong.' UNION ALL
    SELECT 'rodeo', 'родео', '/ˈrəʊ.di.əʊ/', 'Cowboys compete in rodeos.' UNION ALL
    SELECT 'rule', 'правило', '/ruːl/', 'You must follow the rules.' UNION ALL
    SELECT 'runner', 'бегун', '/ˈrʌn.ər/', 'The Kenyan runners are very fast.' UNION ALL
    SELECT 'scream', 'кричать, крик', '/skriːm/', 'Fans screamed with excitement.' UNION ALL
    SELECT 'slow down', 'замедляться', '/ˌsləʊ ˈdaʊn/', 'Don''t slow down near the finish!' UNION ALL
    SELECT 'spectator', 'зритель', '/spekˈteɪ.tər/', 'Thousands of spectators watched.' UNION ALL
    SELECT 'starting point', 'отправная точка', '/ˈstɑː.tɪŋ pɔɪnt/', 'All runners at the starting point.' UNION ALL
    SELECT 'team', 'команда', '/tiːm/', 'Our team works well together.' UNION ALL
    SELECT 'teamwork', 'командная работа', '/ˈtiːm.wɜːk/', 'Good teamwork leads to success.' UNION ALL
    SELECT 'throw', 'бросать', '/θrəʊ/', 'Throw the ball to your partner.' UNION ALL
    SELECT 'time limit', 'ограничение во времени', '/ˈtaɪm ˌlɪm.ɪt/', 'There''s a 30-minute time limit.' UNION ALL
    SELECT 'wave', 'волна', '/weɪv/', 'The winner waved to the crowd.' UNION ALL
    SELECT 'winner', 'победитель', '/ˈwɪn.ər/', 'The winner received a trophy.' UNION ALL
    SELECT 'wrestling', 'реслинг', '/ˈres.lɪŋ/', 'Wrestling is an ancient sport.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_PI_Unit3_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'PI'
        AND u.display_order = 3  -- Unit 3 - Transport
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
    SELECT 'a bit' AS english_word, 'немного, чуть-чуть' AS russian_translation, '/ə ˈbɪt/' AS transcription, 'I''m a bit tired after the long journey.' AS example_sentence UNION ALL
    SELECT 'a little', 'немного', '/ə ˈlɪt.əl/', 'I speak a little French.' UNION ALL
    SELECT 'a lot', 'много', '/ə ˈlɒt/', 'We travel a lot for work.' UNION ALL
    SELECT 'aisle', 'проход между рядами', '/aɪl/', 'Please leave the aisle clear.' UNION ALL
    SELECT 'apologise', 'извиняться', '/əˈpɒl.ə.dʒaɪz/', 'The airline apologised for the delay.' UNION ALL
    SELECT 'arrivals area', 'зона прибытия', '/əˈraɪ.vəlz ˌeə.ri.ə/', 'Meet me in the arrivals area.' UNION ALL
    SELECT 'book', 'бронировать', '/bʊk/', 'I need to book train tickets.' UNION ALL
    SELECT 'camel', 'верблюд', '/ˈkæm.əl/', 'We rode camels in the desert.' UNION ALL
    SELECT 'can''t afford', 'не могу себе позволить', '/ˌkɑːnt əˈfɔːd/', 'I can''t afford first class.' UNION ALL
    SELECT 'carbon emissions', 'выбросы углекислого газа', '/ˌkɑː.bən ɪˈmɪʃ.ənz/', 'Planes produce carbon emissions.' UNION ALL
    SELECT 'change', 'сдача', '/tʃeɪndʒ/', 'Here''s your change from the ticket.' UNION ALL
    SELECT 'check in', 'зарегистрироваться', '/ˈtʃek ɪn/', 'We need to check in two hours before.' UNION ALL
    SELECT 'commute', 'ездить на работу', '/kəˈmjuːt/', 'I commute by train every day.' UNION ALL
    SELECT 'container ship', 'грузовое судно', '/kənˈteɪ.nə ʃɪp/', 'The container ship carries goods worldwide.' UNION ALL
    SELECT 'convenient', 'удобный', '/kənˈviː.ni.ənt/', 'The metro is very convenient.' UNION ALL
    SELECT 'degree', 'градус', '/dɪˈɡriː/', 'It''s 20 degrees outside.' UNION ALL
    SELECT 'drop off', 'высаживать (из машины)', '/ˌdrɒp ˈɒf/', 'Can you drop me off at the station?' UNION ALL
    SELECT 'energy', 'энергия', '/ˈen.ə.dʒi/', 'The train uses electric energy.' UNION ALL
    SELECT 'enormous', 'огромный, громадный', '/ɪˈnɔː.məs/', 'The cruise ship was enormous.' UNION ALL
    SELECT 'fare', 'плата за проезд', '/feər/', 'Bus fares increased this month.' UNION ALL
    SELECT 'ferry', 'паром', '/ˈfer.i/', 'We took the ferry to the island.' UNION ALL
    SELECT 'first class', 'первый класс', '/ˌfɜːst ˈklɑːs/', 'First class is more comfortable.' UNION ALL
    SELECT 'freeze', 'замораживать', '/friːz/', 'The lake freezes in winter.' UNION ALL
    SELECT 'frequent', 'частый', '/ˈfriː.kwənt/', 'There are frequent buses to the city.' UNION ALL
    SELECT 'fuel costs', 'стоимость топлива', '/ˈfjuː.əl kɒsts/', 'Fuel costs affect ticket prices.' UNION ALL
    SELECT 'gate', 'выход на посадку', '/ɡeɪt/', 'Our flight leaves from gate 12.' UNION ALL
    SELECT 'good condition', 'в хорошем состоянии', '/ˌɡʊd kənˈdɪʃ.ən/', 'The roads are in good condition.' UNION ALL
    SELECT 'hand-pulled', 'самодельный', '/ˈhænd pʊld/', 'We saw hand-pulled rickshaws.' UNION ALL
    SELECT 'husky', 'хаски (порода собак)', '/ˈhʌs.ki/', 'Huskies pull sledges in Alaska.' UNION ALL
    SELECT 'impressive', 'впечатляющий', '/ɪmˈpres.ɪv/', 'The new bridge is impressive.' UNION ALL
    SELECT 'lorry', 'грузовик', '/ˈlɒr.i/', 'The lorry carried heavy goods.' UNION ALL
    SELECT 'miniature', 'миниатюра', '/ˈmɪn.ə.tʃər/', 'He collects miniature trains.' UNION ALL
    SELECT 'much', 'много, очень', '/mʌtʃ/', 'Thank you very much for the ride.' UNION ALL
    SELECT 'on foot', 'пешком', '/ɒn ˈfʊt/', 'We explored the city on foot.' UNION ALL
    SELECT 'passenger', 'пассажир', '/ˈpæs.ɪn.dʒər/', 'All passengers must show tickets.' UNION ALL
    SELECT 'pedestrian', 'пешеход', '/pəˈdes.tri.ən/', 'Pedestrians should use crossings.' UNION ALL
    SELECT 'pick up', 'подбирать (на машине)', '/ˌpɪk ˈʌp/', 'I''ll pick you up at 8 am.' UNION ALL
    SELECT 'politician', 'политик', '/ˌpɒl.ɪˈtɪʃ.ən/', 'Politicians discussed transport policy.' UNION ALL
    SELECT 'public transport', 'общественный транспорт', '/ˌpʌb.lɪk ˈtræn.spɔːt/', 'I prefer public transport to driving.' UNION ALL
    SELECT 'punctual', 'пунктуальный', '/ˈpʌŋk.tʃu.əl/', 'Japanese trains are very punctual.' UNION ALL
    SELECT 'railway track', 'железнодорожный путь', '/ˈreɪl.weɪ træk/', 'Workers repaired the railway track.' UNION ALL
    SELECT 'rank', 'стоянка такси', '/ræŋk/', 'There''s a taxi rank outside.' UNION ALL
    SELECT 'receipt', 'чек, квитанция', '/rɪˈsiːt/', 'Keep your receipt for the ticket.' UNION ALL
    SELECT 'reliable', 'надежный', '/rɪˈlaɪ.ə.bəl/', 'This car is very reliable.' UNION ALL
    SELECT 'return', 'возвращаться', '/rɪˈtɜːn/', 'We return home by the same route.' UNION ALL
    SELECT 'rickshaw', 'рикша', '/ˈrɪk.ʃɔː/', 'We took a rickshaw in Bangkok.' UNION ALL
    SELECT 'rural', 'сельский', '/ˈrʊə.rəl/', 'Rural transport needs improvement.' UNION ALL
    SELECT 'rush hour', 'час пик', '/ˈrʌʃ ˌaʊər/', 'Avoid traveling during rush hour.' UNION ALL
    SELECT 'single', 'одинокий', '/ˈsɪŋ.ɡəl/', 'A single ticket costs less.' UNION ALL
    SELECT 'sledge', 'сани', '/sledʒ/', 'Children love riding on sledges.' UNION ALL
    SELECT 'stressful', 'напряженный', '/ˈstres.fəl/', 'Driving in cities is stressful.' UNION ALL
    SELECT 'stuck in traffic', 'застрять в пробке', '/ˌstʌk ɪn ˈtræf.ɪk/', 'We were stuck in traffic for hours.' UNION ALL
    SELECT 'suggest', 'предлагать', '/səˈdʒest/', 'I suggest we take the train.' UNION ALL
    SELECT 'symbol', 'символ', '/ˈsɪm.bəl/', 'The wheel is a symbol of travel.' UNION ALL
    SELECT 'traditional', 'традиционный', '/trəˈdɪʃ.ən.əl/', 'Traditional boats are still used.' UNION ALL
    SELECT 'traffic jam', 'пробка (на дороге)', '/ˈtræf.ɪk dʒæm/', 'There''s a big traffic jam downtown.' UNION ALL
    SELECT 'way of life', 'образ жизни', '/ˌweɪ əv ˈlaɪf/', 'Nomads have a different way of life.' UNION ALL
    SELECT 'window', 'окно', '/ˈwɪn.dəʊ/', 'I prefer a window seat.' UNION ALL
    SELECT 'workforce', 'рабочая сила', '/ˈwɜːk.fɔːs/', 'The transport workforce is large.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_PI_Unit4_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'PI'
        AND u.display_order = 4  -- Unit 4 - Challenges
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
    SELECT 'abroad' AS english_word, 'за границей' AS russian_translation, '/əˈbrɔːd/' AS transcription, 'She lives abroad now.' AS example_sentence UNION ALL
    SELECT 'accident', 'несчастный случай, авария', '/ˈæk.sɪ.dənt/', 'He had a car accident.' UNION ALL
    SELECT 'achievement', 'достижение', '/əˈtʃiːv.mənt/', 'Winning was a great achievement.' UNION ALL
    SELECT 'alive', 'живой', '/əˈlaɪv/', 'All passengers are alive.' UNION ALL
    SELECT 'ambition', 'амбиция', '/æmˈbɪʃ.ən/', 'Her ambition is to climb Everest.' UNION ALL
    SELECT 'answer', 'ответ', '/ˈɑːn.sər/', 'I need an answer by Friday.' UNION ALL
    SELECT 'architecture', 'архитектура', '/ˈɑː.kɪ.tek.tʃər/', 'The architecture is amazing.' UNION ALL
    SELECT 'bone', 'кость', '/bəʊn/', 'He broke a bone in his leg.' UNION ALL
    SELECT 'break', 'ломать', '/breɪk/', 'Don''t break the rules.' UNION ALL
    SELECT 'brush', 'чистить', '/brʌʃ/', 'Brush your teeth twice a day.' UNION ALL
    SELECT 'calm', 'спокойный', '/kɑːm/', 'Stay calm in emergencies.' UNION ALL
    SELECT 'camp', 'лагерь', '/kæmp/', 'We set up camp by the river.' UNION ALL
    SELECT 'campsite', 'палаточный лагерь', '/ˈkæmp.saɪt/', 'The campsite was full.' UNION ALL
    SELECT 'caver', 'спелеолог, исследователь пещер', '/ˈkeɪ.vər/', 'The caver explored deep caves.' UNION ALL
    SELECT 'challenge', 'вызов, сложная задача', '/ˈtʃæl.ɪndʒ/', 'This job is a real challenge.' UNION ALL
    SELECT 'close', 'близкий (друг)', '/kləʊs/', 'She''s a close friend.' UNION ALL
    SELECT 'crawl', 'ползать', '/krɔːl/', 'Babies crawl before walking.' UNION ALL
    SELECT 'crazy', 'сумасшедший', '/ˈkreɪ.zi/', 'That''s a crazy idea!' UNION ALL
    SELECT 'crossword', 'кроссворд', '/ˈkrɒs.wɜːd/', 'I do the crossword every day.' UNION ALL
    SELECT 'cube', 'куб', '/kjuːb/', 'A dice is a cube.' UNION ALL
    SELECT 'current', 'текущий (нынешный)', '/ˈkʌr.ənt/', 'The current situation is difficult.' UNION ALL
    SELECT 'cut', 'резать', '/kʌt/', 'Be careful not to cut yourself.' UNION ALL
    SELECT 'dangerous', 'опасный', '/ˈdeɪn.dʒər.əs/', 'Climbing is dangerous.' UNION ALL
    SELECT 'dead', 'мертвый', '/ded/', 'The phone battery is dead.' UNION ALL
    SELECT 'die', 'умирать', '/daɪ/', 'Plants die without water.' UNION ALL
    SELECT 'distance', 'расстояние', '/ˈdɪs.təns/', 'What''s the distance to Paris?' UNION ALL
    SELECT 'earthquake', 'землетрясение', '/ˈɜːθ.kweɪk/', 'The earthquake damaged buildings.' UNION ALL
    SELECT 'enter', 'участвовать', '/ˈen.tər/', 'He entered the competition.' UNION ALL
    SELECT 'evidence', 'доказательство', '/ˈev.ɪ.dəns/', 'There''s no evidence of damage.' UNION ALL
    SELECT 'experienced', 'опытный', '/ɪkˈspɪə.ri.ənst/', 'We need experienced climbers.' UNION ALL
    SELECT 'fall in love', 'влюбляться', '/ˌfɔːl ɪn ˈlʌv/', 'They fell in love during the trip.' UNION ALL
    SELECT 'fit in', 'приспосабливаться', '/ˌfɪt ˈɪn/', 'It''s hard to fit in sometimes.' UNION ALL
    SELECT 'friendly', 'дружелюбный', '/ˈfrend.li/', 'The locals were friendly.' UNION ALL
    SELECT 'geometry', 'геометрия', '/dʒiˈɒm.ə.tri/', 'Geometry is part of mathematics.' UNION ALL
    SELECT 'hard-working', 'трудолюбивый', '/ˌhɑːd ˈwɜː.kɪŋ/', 'She''s very hard-working.' UNION ALL
    SELECT 'hire', 'нанимать на работу, брать напрокат', '/haɪər/', 'We hired a car for the trip.' UNION ALL
    SELECT 'intelligent', 'умный', '/ɪnˈtel.ɪ.dʒənt/', 'Dolphins are intelligent animals.' UNION ALL
    SELECT 'islander', 'островитянин', '/ˈaɪ.lən.dər/', 'The islanders helped us.' UNION ALL
    SELECT 'lucky', 'удачливый', '/ˈlʌk.i/', 'You''re lucky to be alive!' UNION ALL
    SELECT 'make it', 'добраться (до места, до цели)', '/ˈmeɪk ɪt/', 'We finally made it to the top.' UNION ALL
    SELECT 'mechanic', 'механик', '/məˈkæn.ɪk/', 'The mechanic fixed our car.' UNION ALL
    SELECT 'memorize', 'заучивать наизусть', '/ˈmem.ə.raɪz/', 'I memorized all the rules.' UNION ALL
    SELECT 'mountain guide', 'горный гид', '/ˈmaʊn.tɪn ɡaɪd/', 'The mountain guide knew the way.' UNION ALL
    SELECT 'patient', 'терпеливый', '/ˈpeɪ.ʃənt/', 'You need to be patient.' UNION ALL
    SELECT 'player', 'игрок', '/ˈpleɪ.ər/', 'He''s a key player in the team.' UNION ALL
    SELECT 'positive', 'позитивный', '/ˈpɒz.ə.tɪv/', 'Stay positive despite challenges.' UNION ALL
    SELECT 'quiz', 'викторина', '/kwɪz/', 'We won the quiz competition.' UNION ALL
    SELECT 'risk', 'риск', '/rɪsk/', 'Don''t take unnecessary risks.' UNION ALL
    SELECT 'rope', 'веревка', '/rəʊp/', 'We need strong rope for climbing.' UNION ALL
    SELECT 'score', 'счет (в игре)', '/skɔːr/', 'What''s the score now?' UNION ALL
    SELECT 'sign', 'подпись', '/saɪn/', 'Please sign your name here.' UNION ALL
    SELECT 'slap', 'шлепать', '/slæp/', 'Don''t slap the table!' UNION ALL
    SELECT 'so', 'поэтому', '/səʊ/', 'It was raining, so we stayed in.' UNION ALL
    SELECT 'solution', 'решение', '/səˈluː.ʃən/', 'We found a good solution.' UNION ALL
    SELECT 'study', 'учиться', '/ˈstʌd.i/', 'I study English every day.' UNION ALL
    SELECT 'tent', 'палатка', '/tent/', 'We slept in a small tent.' UNION ALL
    SELECT 'test', 'проверять', '/test/', 'Test your equipment first.' UNION ALL
    SELECT 'toy', 'игрушка', '/tɔɪ/', 'Children love new toys.' UNION ALL
    SELECT 'trail', 'тропа, след', '/treɪl/', 'Follow the mountain trail.' UNION ALL
    SELECT 'voluntary work', 'волонтерская работа', '/ˌvɒl.ən.tər.i ˈwɜːk/', 'She does voluntary work.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_PI_Unit5_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'PI'
        AND u.display_order = 5  -- Unit 5 - The Environment
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
    SELECT 'about' AS english_word, 'о, около' AS russian_translation, '/əˈbaʊt/' AS transcription, 'There are about 20 trees in the park.' AS example_sentence UNION ALL
    SELECT 'aluminium foil', 'алюминиевая фольга', '/əˌluː.mɪ.nɪəm ˈfɔɪl/', 'Wrap the food in aluminium foil.' UNION ALL
    SELECT 'apologize', 'извиняться', '/əˈpɒl.ə.dʒaɪz/', 'The company apologized for the pollution.' UNION ALL
    SELECT 'assistance', 'помощь, содействие', '/əˈsɪs.təns/', 'We need assistance with recycling.' UNION ALL
    SELECT 'available', 'доступный, в наличии', '/əˈveɪ.lə.bəl/', 'Clean water should be available to all.' UNION ALL
    SELECT 'average speed', 'средняя скорость', '/ˌæv.ər.ɪdʒ ˈspiːd/', 'The average speed of wind increased.' UNION ALL
    SELECT 'best regards', 'с наилучшими пожеланиями', '/ˌbest rɪˈɡɑːdz/', 'End your email with "Best regards".' UNION ALL
    SELECT 'cancel', 'отменять', '/ˈkæn.səl/', 'They had to cancel the event due to rain.' UNION ALL
    SELECT 'cardboard', 'картон', '/ˈkɑːd.bɔːd/', 'Cardboard boxes are recyclable.' UNION ALL
    SELECT 'cause', 'быть причиной', '/kɔːz/', 'Pollution causes health problems.' UNION ALL
    SELECT 'cereal box', 'коробка хлопьев', '/ˈsɪə.ri.əl bɒks/', 'Recycle your cereal boxes.' UNION ALL
    SELECT 'collect', 'собирать', '/kəˈlekt/', 'We collect plastic for recycling.' UNION ALL
    SELECT 'confirmation', 'подтверждение', '/ˌkɒn.fəˈmeɪ.ʃən/', 'We received confirmation by email.' UNION ALL
    SELECT 'correspondence', 'переписка', '/ˌkɒr.ɪˈspɒn.dəns/', 'Keep all environmental correspondence.' UNION ALL
    SELECT 'crew', 'экипаж, команда', '/kruː/', 'The cleaning crew works daily.' UNION ALL
    SELECT 'delay', 'задержка', '/dɪˈleɪ/', 'The flight was delayed due to fog.' UNION ALL
    SELECT 'delighted', 'восхищенный', '/dɪˈlaɪ.tɪd/', 'We''re delighted with the clean beach.' UNION ALL
    SELECT 'dictionary', 'словарь', '/ˈdɪk.ʃən.ər.i/', 'Look up the word in the dictionary.' UNION ALL
    SELECT 'drop', 'ронять', '/drɒp/', 'Don''t drop litter on the ground.' UNION ALL
    SELECT 'electronics', 'электроника', '/ˌel.ekˈtrɒn.ɪks/', 'Recycle old electronics properly.' UNION ALL
    SELECT 'environmentalist', 'защитник окружающей среды', '/ɪnˌvaɪ.rənˈmen.təl.ɪst/', 'Environmentalists protest pollution.' UNION ALL
    SELECT 'environmentally-friendly', 'безопасный для окружающей среды', '/ɪnˌvaɪ.rən.men.təl.i ˈfrend.li/', 'We need more environmentally-friendly products.' UNION ALL
    SELECT 'e-rubbish', 'электронный мусор', '/ˈiː ˌrʌb.ɪʃ/', 'E-rubbish contains toxic materials.' UNION ALL
    SELECT 'exactly', 'точно, именно', '/ɪɡˈzækt.li/', 'That''s exactly what we need!' UNION ALL
    SELECT 'expect', 'ожидать, надеяться', '/ɪkˈspekt/', 'We expect better environmental policies.' UNION ALL
    SELECT 'fog', 'туман', '/fɒɡ/', 'The fog made driving dangerous.' UNION ALL
    SELECT 'formal', 'официальный', '/ˈfɔː.məl/', 'Send a formal complaint.' UNION ALL
    SELECT 'fountain', 'фонтан, источник', '/ˈfaʊn.tən/', 'The fountain uses recycled water.' UNION ALL
    SELECT 'freeze', 'замораживать', '/friːz/', 'Freeze your leftovers to reduce waste.' UNION ALL
    SELECT 'garbage', 'мусор', '/ˈɡɑː.bɪdʒ/', 'Take out the garbage, please.' UNION ALL
    SELECT 'giant', 'гигантский', '/ˈdʒaɪ.ənt/', 'The giant panda is endangered.' UNION ALL
    SELECT 'glass', 'стекло', '/ɡlɑːs/', 'Glass bottles can be recycled.' UNION ALL
    SELECT 'goat', 'козел, коза', '/ɡəʊt/', 'Goats help clear vegetation.' UNION ALL
    SELECT 'hold', 'держать, удерживать', '/həʊld/', 'Hold this bag while I recycle.' UNION ALL
    SELECT 'household appliance', 'бытовая техника', '/ˌhaʊs.həʊld əˈplaɪ.əns/', 'Old household appliances contain metals.' UNION ALL
    SELECT 'inform', 'информировать', '/ɪnˈfɔːm/', 'Inform people about recycling.' UNION ALL
    SELECT 'jar', 'банка', '/dʒɑːr/', 'Reuse glass jars for storage.' UNION ALL
    SELECT 'knot', 'узел, завязывать узел', '/nɒt/', 'Tie a knot in the recycling bag.' UNION ALL
    SELECT 'leather', 'кожа, кожаный', '/ˈleð.ər/', 'Genuine leather lasts longer.' UNION ALL
    SELECT 'length', 'длина', '/leŋθ/', 'Measure the length of the pipe.' UNION ALL
    SELECT 'local', 'местный', '/ˈləʊ.kəl/', 'Support local environmental groups.' UNION ALL
    SELECT 'melt', 'таять, плавить', '/melt/', 'Ice melts in the sun.' UNION ALL
    SELECT 'milk carton', 'пакет молока', '/ˈmɪlk ˌkɑː.tən/', 'Milk cartons are recyclable.' UNION ALL
    SELECT 'narrator', 'рассказчик', '/nəˈreɪ.tər/', 'The narrator explained the documentary.' UNION ALL
    SELECT 'natural satellite', 'естественный спутник', '/ˌnætʃ.ər.əl ˈsæt.əl.aɪt/', 'The Moon is Earth''s natural satellite.' UNION ALL
    SELECT 'nearly', 'почти', '/ˈnɪə.li/', 'We''ve nearly finished cleaning.' UNION ALL
    SELECT 'net', 'сеть', '/net/', 'Fishermen use nets to catch fish.' UNION ALL
    SELECT 'order', 'заказывать, порядок', '/ˈɔː.dər/', 'Order recycling bins online.' UNION ALL
    SELECT 'over', 'над, выше', '/ˈəʊ.vər/', 'The plane flew over the city.' UNION ALL
    SELECT 'pipe', 'труба, трубопровод', '/paɪp/', 'The pipe carries clean water.' UNION ALL
    SELECT 'pollution', 'загрязнение', '/pəˈluː.ʃən/', 'Air pollution affects health.' UNION ALL
    SELECT 'provide', 'обеспечивать', '/prəˈvaɪd/', 'The city provides recycling bins.' UNION ALL
    SELECT 'receive', 'получать, принимать', '/rɪˈsiːv/', 'We received new recycling guidelines.' UNION ALL
    SELECT 'recycle', 'перерабатывать', '/ˌriːˈsaɪ.kəl/', 'Recycle paper and plastic separately.' UNION ALL
    SELECT 'reduce', 'уменьшать, сокращать', '/rɪˈdjuːs/', 'Reduce your water usage.' UNION ALL
    SELECT 'refund', 'возврат денег', '/ˈriː.fʌnd/', 'You can get a refund for returned bottles.' UNION ALL
    SELECT 'renewable energy', 'возобновляемая энергия', '/rɪˌnjuː.ə.bəl ˈen.ə.dʒi/', 'Solar power is renewable energy.' UNION ALL
    SELECT 'reply', 'отвечать, ответ', '/rɪˈplaɪ/', 'We''re waiting for their reply.' UNION ALL
    SELECT 'request', 'просьба, запрос', '/rɪˈkwest/', 'Submit a request for information.' UNION ALL
    SELECT 'require', 'требовать', '/rɪˈkwaɪər/', 'The law requires recycling.' UNION ALL
    SELECT 'resell', 'перепродавать', '/ˌriːˈsel/', 'Resell items instead of throwing away.' UNION ALL
    SELECT 'rooftop', 'плоская крыша', '/ˈruːf.tɒp/', 'Rooftop gardens help cities.' UNION ALL
    SELECT 'rubbish', 'мусор', '/ˈrʌb.ɪʃ/', 'Put rubbish in the bin.' UNION ALL
    SELECT 'safely', 'безопасно', '/ˈseɪf.li/', 'Dispose of batteries safely.' UNION ALL
    SELECT 'satellite dish', 'спутниковая тарелка', '/ˈsæt.əl.aɪt ˌdɪʃ/', 'Satellite dishes collect signals.' UNION ALL
    SELECT 'scissors', 'ножницы', '/ˈsɪz.əz/', 'Use scissors to open packages.' UNION ALL
    SELECT 'sculpture', 'скульптура', '/ˈskʌlp.tʃər/', 'The sculpture is made from recycled metal.' UNION ALL
    SELECT 'search engine', 'поисковая система', '/ˈsɜːtʃ ˌen.dʒɪn/', 'Use a search engine to find information.' UNION ALL
    SELECT 'solar panel', 'солнечная батарея', '/ˈsəʊ.lə ˌpæn.əl/', 'Solar panels generate electricity.' UNION ALL
    SELECT 'stock', 'запас', '/stɒk/', 'We have a stock of recycled paper.' UNION ALL
    SELECT 'supplier', 'поставщик', '/səˈplaɪ.ər/', 'Our supplier uses eco-friendly packaging.' UNION ALL
    SELECT 'survive', 'выживать', '/səˈvaɪv/', 'Plants need water to survive.' UNION ALL
    SELECT 'take', 'занимать (время), садиться (в транспорт), принимать (душ)', '/teɪk/', 'It takes time to change habits.' UNION ALL
    SELECT 'throw away', 'выбрасывать', '/ˌθrəʊ əˈweɪ/', 'Don''t throw away old clothes.' UNION ALL
    SELECT 'tin can', 'консервная банка', '/ˈtɪn ˌkæn/', 'Tin cans are recyclable.' UNION ALL
    SELECT 'tower', 'башня', '/ˈtaʊ.ər/', 'The tower has solar panels.' UNION ALL
    SELECT 'trash', 'мусор', '/træʃ/', 'Take out the trash regularly.' UNION ALL
    SELECT 'user-friendly', 'удобный в использовании', '/ˌjuː.zə ˈfrend.li/', 'The recycling system should be user-friendly.' UNION ALL
    SELECT 'water tank', 'бак для воды', '/ˈwɔː.tə ˌtæŋk/', 'The water tank collects rainwater.' UNION ALL
    SELECT 'wave', 'махать', '/weɪv/', 'Wave goodbye to bad habits.' UNION ALL
    SELECT 'weight', 'вес, масса', '/weɪt/', 'Reduce the weight of your waste.' UNION ALL
    SELECT 'wood', 'дерево (материал)', '/wʊd/', 'Wood is a natural material.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_PI_Unit6_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'PI'
        AND u.display_order = 6  -- Unit 6 - Stages in Life
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
    SELECT 'Accept' AS english_word, 'принимать, соглашаться' AS russian_translation, '/əkˈsept/' AS transcription, 'I accept your invitation with pleasure.' AS example_sentence UNION ALL
    SELECT 'Adult', 'взрослый человек', '/ˈæd.ʌlt/', 'Adults pay full price for tickets.' UNION ALL
    SELECT 'Background', 'происхождение', '/ˈbæk.ɡraʊnd/', 'She comes from a musical background.' UNION ALL
    SELECT 'Ban', 'запрещать', '/bæn/', 'The school bans mobile phones.' UNION ALL
    SELECT 'Barbecue', 'шашлык', '/ˈbɑː.bɪ.kjuː/', 'We had a barbecue for my birthday.' UNION ALL
    SELECT 'Beautiful', 'красивый', '/ˈbjuː.tɪ.fəl/', 'She looked beautiful in her wedding dress.' UNION ALL
    SELECT 'Birth rate', 'уровень рождаемости', '/ˈbɜːθ ˌreɪt/', 'The birth rate is declining.' UNION ALL
    SELECT 'Campervan', 'автофургон', '/ˈkæm.pə.væn/', 'They traveled Europe in a campervan.' UNION ALL
    SELECT 'Candle', 'свеча', '/ˈkæn.dəl/', 'Blow out the birthday candles.' UNION ALL
    SELECT 'Career', 'карьера', '/kəˈrɪər/', 'She has a successful career in medicine.' UNION ALL
    SELECT 'Cattle', 'скот', '/ˈkæt.əl/', 'Farmers raise cattle for milk and meat.' UNION ALL
    SELECT 'Celebration', 'празднование, торжество', '/ˌsel.əˈbreɪ.ʃən/', 'The graduation celebration lasted all night.' UNION ALL
    SELECT 'Ceremony', 'церемония', '/ˈser.ɪ.mə.ni/', 'The award ceremony starts at 6 pm.' UNION ALL
    SELECT 'Child', 'ребенок', '/tʃaɪld/', 'Every child deserves education.' UNION ALL
    SELECT 'Client', 'клиент', '/ˈklaɪ.ənt/', 'The lawyer met with her client.' UNION ALL
    SELECT 'Colorful', 'красочный', '/ˈkʌl.ə.fəl/', 'The festival was colorful and loud.' UNION ALL
    SELECT 'Convince', 'убеждать, уверять', '/kənˈvɪns/', 'He convinced me to change my mind.' UNION ALL
    SELECT 'Costume', 'карнавальный костюм', '/ˈkɒs.tjuːm/', 'Children wear costumes at Halloween.' UNION ALL
    SELECT 'Cow', 'корова', '/kaʊ/', 'The cow produces fresh milk.' UNION ALL
    SELECT 'Culture', 'культура', '/ˈkʌl.tʃər/', 'We should respect different cultures.' UNION ALL
    SELECT 'Decline', 'снижаться, отклонять', '/dɪˈklaɪn/', 'The birth rate continues to decline.' UNION ALL
    SELECT 'Decoration', 'украшение', '/ˌdek.əˈreɪ.ʃən/', 'Christmas decorations brighten the house.' UNION ALL
    SELECT 'Delicious', 'очень вкусный', '/dɪˈlɪʃ.əs/', 'The wedding cake was delicious.' UNION ALL
    SELECT 'Disgusting', 'отвратительный', '/dɪsˈɡʌs.tɪŋ/', 'The spoiled milk tasted disgusting.' UNION ALL
    SELECT 'Drum', 'барабан', '/drʌm/', 'He plays drums in a band.' UNION ALL
    SELECT 'Dull', 'скучный', '/dʌl/', 'The lecture was dull and long.' UNION ALL
    SELECT 'Early', 'ранний, рано', '/ˈɜː.li/', 'I wake up early every day.' UNION ALL
    SELECT 'Earn', 'зарабатывать', '/ɜːn/', 'Teenagers can earn pocket money.' UNION ALL
    SELECT 'Elderly', 'пожилой', '/ˈel.dəl.i/', 'Elderly people need special care.' UNION ALL
    SELECT 'Engaged', 'помолвленный', '/ɪnˈɡeɪdʒd/', 'They got engaged last month.' UNION ALL
    SELECT 'Enormous', 'огромный', '/ɪˈnɔː.məs/', 'The wedding cake was enormous.' UNION ALL
    SELECT 'Escape', 'сбегать', '/ɪˈskeɪp/', 'The teenager tried to escape punishment.' UNION ALL
    SELECT 'Festival', 'фестиваль', '/ˈfes.tɪ.vəl/', 'The music festival attracts thousands.' UNION ALL
    SELECT 'Fifties', 'возраст от 50 до 59 лет', '/ˈfɪf.tiz/', 'My parents are in their fifties.' UNION ALL
    SELECT 'Financial control', 'финансовый контроль', '/faɪˌnæn.ʃəl kənˈtrəʊl/', 'Young adults need financial control.' UNION ALL
    SELECT 'Firework', 'фейерверк', '/ˈfaɪə.wɜːk/', 'Fireworks lit up the New Year''s sky.' UNION ALL
    SELECT 'Flag', 'флаг', '/flæɡ/', 'They raised the national flag.' UNION ALL
    SELECT 'Float', 'плот, паром', '/fləʊt/', 'The carnival float was colorful.' UNION ALL
    SELECT 'Formal event', 'официальное мероприятие', '/ˌfɔː.məl ɪˈvent/', 'Graduation is a formal event.' UNION ALL
    SELECT 'Freedom', 'свобода', '/ˈfriː.dəm/', 'Teenagers want more freedom.' UNION ALL
    SELECT 'Geographical feature', 'географическая особенность', '/ˌdʒi.əˈɡræf.ɪ.kəl ˈfiː.tʃər/', 'Mountains are geographical features.' UNION ALL
    SELECT 'Go back', 'возвращаться', '/ˌɡəʊ ˈbæk/', 'Let''s go back to our childhood home.' UNION ALL
    SELECT 'Groom', 'жених', '/ɡruːm/', 'The groom looked nervous before the wedding.' UNION ALL
    SELECT 'Hope', 'надеяться', '/həʊp/', 'I hope to have children someday.' UNION ALL
    SELECT 'Influence', 'влияние, воздействие', '/ˈɪn.flu.əns/', 'Parents have great influence on children.' UNION ALL
    SELECT 'Intend', 'намереваться', '/ɪnˈtend/', 'I intend to retire at 60.' UNION ALL
    SELECT 'Invent', 'изобретать', '/ɪnˈvent/', 'Teenagers often invent new slang words.' UNION ALL
    SELECT 'Invitation', 'приглашение', '/ˌɪn.vɪˈteɪ.ʃən/', 'We sent out wedding invitations.' UNION ALL
    SELECT 'Jazz band', 'джазовая группа', '/ˈdʒæz ˌbænd/', 'A jazz band played at the party.' UNION ALL
    SELECT 'Late', 'поздний, поздно', '/leɪt/', 'It''s never too late to learn.' UNION ALL
    SELECT 'Law', 'закон', '/lɔː/', 'There are laws protecting children.' UNION ALL
    SELECT 'Legal rights', 'законные права', '/ˌliː.ɡəl ˈraɪts/', 'Adults have full legal rights.' UNION ALL
    SELECT 'Line', 'очередь', '/laɪn/', 'Stand in line for tickets.' UNION ALL
    SELECT 'Mask', 'маска, маскировать', '/mɑːsk/', 'Children wore masks at the carnival.' UNION ALL
    SELECT 'Massive', 'крупный, огромный', '/ˈmæs.ɪv/', 'The wedding required massive preparation.' UNION ALL
    SELECT 'Mid', 'середина', '/mɪd/', 'He''s in his mid-thirties.' UNION ALL
    SELECT 'Middle-aged', 'средних лет', '/ˌmɪd.əl ˈeɪdʒd/', 'Middle-aged people often have teenagers.' UNION ALL
    SELECT 'Miserable', 'жалкий, несчастный', '/ˈmɪz.ər.ə.bəl/', 'The child looked miserable when sick.' UNION ALL
    SELECT 'Native', 'родной', '/ˈneɪ.tɪv/', 'She speaks her native language fluently.' UNION ALL
    SELECT 'Nature', 'природа', '/ˈneɪ.tʃər/', 'Children should play in nature more.' UNION ALL
    SELECT 'Parade', 'парад', '/pəˈreɪd/', 'There was a parade for the holiday.' UNION ALL
    SELECT 'Party', 'вечеринка', '/ˈpɑː.ti/', 'We''re having a birthday party.' UNION ALL
    SELECT 'Pension', 'пенсия', '/ˈpen.ʃən/', 'Retired people live on a pension.' UNION ALL
    SELECT 'Performer', 'выступающий', '/pəˈfɔː.mər/', 'The street performer entertained children.' UNION ALL
    SELECT 'Play by ear', 'импровизировать', '/ˌpleɪ baɪ ˈɪər/', 'Musicians can play by ear.' UNION ALL
    SELECT 'Retire', 'выходить на пенсию', '/rɪˈtaɪər/', 'My father will retire next year.' UNION ALL
    SELECT 'Salary', 'зарплата', '/ˈsæl.ər.i/', 'Adults work to earn a salary.' UNION ALL
    SELECT 'Smart', 'нарядный', '/smɑːt/', 'Wear something smart for the interview.' UNION ALL
    SELECT 'Social traditions', 'социальные традиции', '/ˌsəʊ.ʃəl trəˈdɪʃ.ənz/', 'Weddings are social traditions.' UNION ALL
    SELECT 'Steel drum', 'стальной барабан', '/ˈstiːl ˌdrʌm/', 'Steel drums played Caribbean music.' UNION ALL
    SELECT 'Stew', 'тушить', '/stjuː/', 'Grandma makes delicious beef stew.' UNION ALL
    SELECT 'Tasty', 'вкусный', '/ˈteɪ.sti/', 'The birthday cake was very tasty.' UNION ALL
    SELECT 'Teenager', 'подросток (13-19 лет)', '/ˈtiːn.eɪ.dʒər/', 'Teenagers often rebel against rules.' UNION ALL
    SELECT 'Text', 'писать смс', '/tekst/', 'Teenagers text constantly.' UNION ALL
    SELECT 'Tune', 'мелодия, мотив', '/tjuːn/', 'The band played a familiar tune.' UNION ALL
    SELECT 'View', 'вид', '/vjuː/', 'The elderly couple enjoyed the view.' UNION ALL
    SELECT 'Wedding', 'свадьба', '/ˈwed.ɪŋ/', 'Their wedding was last Saturday.' UNION ALL
    SELECT 'Wonderful', 'чудесный', '/ˈwʌn.də.fəl/', 'It''s wonderful to see children happy.' UNION ALL
    SELECT 'Young adult', 'молодой человек', '/ˌjʌŋ ˈæd.ʌlt/', 'Young adults face many challenges.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_PI_Unit7_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'PI'
        AND u.display_order = 7  -- Unit 7 - Work
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
    SELECT 'Accountant' AS english_word, 'Бухгалтер' AS russian_translation, '/əˈkaʊn.tənt/' AS transcription, 'The accountant checks our finances.' AS example_sentence UNION ALL
    SELECT 'Acre', 'Акр', '/ˈeɪ.kər/', 'The farm covers 50 acres.' UNION ALL
    SELECT 'Adventure', 'Приключение', '/ədˈven.tʃər/', 'His job is a real adventure.' UNION ALL
    SELECT 'Apply', 'Подавать (заявление)', '/əˈplaɪ/', 'I''ll apply for that job.' UNION ALL
    SELECT 'Basement', 'Подвал', '/ˈbeɪs.mənt/', 'The archives are in the basement.' UNION ALL
    SELECT 'Boring', 'Скучный', '/ˈbɔː.rɪŋ/', 'Factory work can be boring.' UNION ALL
    SELECT 'Bottle factory', 'Завод по производству бутылок', '/ˈbɒt.əl ˌfæk.tər.i/', 'He works at a bottle factory.' UNION ALL
    SELECT 'Canteen', 'Столовая', '/kænˈtiːn/', 'We eat lunch in the canteen.' UNION ALL
    SELECT 'Chef', 'Шеф-повар', '/ʃef/', 'The chef prepares delicious meals.' UNION ALL
    SELECT 'Computer programmer', 'Программист', '/kəmˈpjuː.tə ˌprəʊ.ɡræm.ər/', 'She''s a computer programmer.' UNION ALL
    SELECT 'Construction company', 'Строительная компания', '/kənˈstrʌk.ʃən ˌkʌm.pə.ni/', 'The construction company builds houses.' UNION ALL
    SELECT 'Corridor', 'Коридор', '/ˈkɒr.ɪ.dɔːr/', 'Offices line the corridor.' UNION ALL
    SELECT 'Cowboy', 'Ковбой', '/ˈkaʊ.bɔɪ/', 'Cowboys work on ranches.' UNION ALL
    SELECT 'CV', 'Резюме', '/ˌsiː ˈviː/', 'Send your CV with the application.' UNION ALL
    SELECT 'Date of birth', 'Дата рождения', '/ˌdeɪt əv ˈbɜːθ/', 'Include your date of birth.' UNION ALL
    SELECT 'Designer', 'Дизайнер', '/dɪˈzaɪ.nər/', 'The designer created a new logo.' UNION ALL
    SELECT 'Direct', 'Управлять', '/daɪˈrekt/', 'She directs the marketing team.' UNION ALL
    SELECT 'Drive', 'Вести машину', '/draɪv/', 'I drive to work every day.' UNION ALL
    SELECT 'Economics', 'Экономика', '/ˌiː.kəˈnɒm.ɪks/', 'He studied economics at university.' UNION ALL
    SELECT 'Electrician', 'Электрик', '/ˌɪ.lekˈtrɪʃ.ən/', 'The electrician fixed the wiring.' UNION ALL
    SELECT 'Emergency exit', 'Аварийный выход', '/ɪˌmɜː.dʒən.si ˈek.sɪt/', 'Know where the emergency exit is.' UNION ALL
    SELECT 'Engineer', 'Инженер', '/ˌen.dʒɪˈnɪər/', 'Engineers solve technical problems.' UNION ALL
    SELECT 'Entrance', 'Вход', '/ˈen.trəns/', 'Use the staff entrance.' UNION ALL
    SELECT 'Essential', 'Существенный', '/ɪˈsen.ʃəl/', 'Teamwork is essential here.' UNION ALL
    SELECT 'Farm', 'Ферма', '/fɑːm/', 'My uncle owns a dairy farm.' UNION ALL
    SELECT 'Fashion', 'Мода', '/ˈfæʃ.ən/', 'She works in the fashion industry.' UNION ALL
    SELECT 'Favor', 'Одолжение', '/ˈfeɪ.vər/', 'Can you do me a favor?' UNION ALL
    SELECT 'Flower', 'Цветок', '/ˈflaʊ.ər/', 'The office has fresh flowers.' UNION ALL
    SELECT 'Full-time', 'Полная занятость', '/ˌfʊl ˈtaɪm/', 'I work full-time hours.' UNION ALL
    SELECT 'Ground floor', 'Цокольный этаж', '/ˌɡraʊnd ˈflɔːr/', 'Reception is on the ground floor.' UNION ALL
    SELECT 'Image', 'Изображение', '/ˈɪm.ɪdʒ/', 'The company cares about its image.' UNION ALL
    SELECT 'Income', 'Доход', '/ˈɪŋ.kʌm/', 'What''s your annual income?' UNION ALL
    SELECT 'Increase', 'Увеличивать', '/ɪnˈkriːs/', 'We need to increase sales.' UNION ALL
    SELECT 'Journalist', 'Журналист', '/ˈdʒɜː.nə.lɪst/', 'The journalist wrote an article.' UNION ALL
    SELECT 'Marketing manager', 'Маркетолог', '/ˈmɑː.kɪ.tɪŋ ˌmæn.ɪ.dʒər/', 'Our marketing manager is creative.' UNION ALL
    SELECT 'Middle of nowhere', '«У чёрта на куличках»', '/ˌmɪd.əl əv ˈnəʊ.weər/', 'The factory is in the middle of nowhere.' UNION ALL
    SELECT 'Mistake', 'Ошибка', '/mɪˈsteɪk/', 'Everyone makes mistakes at work.' UNION ALL
    SELECT 'Moustache', 'Усы', '/məˈstɑːʃ/', 'The gardener has a big moustache.' UNION ALL
    SELECT 'Natural gas', 'Природный газ', '/ˌnætʃ.ər.əl ˈɡæs/', 'The plant uses natural gas.' UNION ALL
    SELECT 'Nurse', 'Медсестра', '/nɜːs/', 'Nurses work long hours.' UNION ALL
    SELECT 'Officer', 'Офицер', '/ˈɒf.ɪ.sər/', 'The police officer directed traffic.' UNION ALL
    SELECT 'Part-time', 'Частичная занятость', '/ˌpɑːt ˈtaɪm/', 'Students often work part-time.' UNION ALL
    SELECT 'Past experience', 'Предыдущий опыт', '/ˌpɑːst ɪkˈspɪə.ri.əns/', 'List your past experience.' UNION ALL
    SELECT 'Physical', 'Физический', '/ˈfɪz.ɪ.kəl/', 'Construction work is physical.' UNION ALL
    SELECT 'Plain', 'Равнина', '/pleɪn/', 'The farm is on a vast plain.' UNION ALL
    SELECT 'Polite', 'Вежливый', '/pəˈlaɪt/', 'Be polite to customers.' UNION ALL
    SELECT 'Politics', 'Политика', '/ˈpɒl.ə.tɪks/', 'Office politics can be tricky.' UNION ALL
    SELECT 'Position', 'Вакансия', '/pəˈzɪʃ.ən/', 'We''re advertising the position.' UNION ALL
    SELECT 'Pretty', 'Красивый', '/ˈprɪt.i/', 'She has a pretty office.' UNION ALL
    SELECT 'Price list', 'Прейскурант цен', '/ˈpraɪs ˌlɪst/', 'Check the price list.' UNION ALL
    SELECT 'Proper job', 'Надлежащая работа', '/ˌprɒp.ər ˈdʒɒb/', 'He finally got a proper job.' UNION ALL
    SELECT 'Ranch', 'Ранчо', '/rɑːntʃ/', 'Cowboys work on the ranch.' UNION ALL
    SELECT 'Receptionist', 'Секретарь', '/rɪˈsep.ʃən.ɪst/', 'The receptionist answers calls.' UNION ALL
    SELECT 'Reference', 'Упоминание', '/ˈref.ər.əns/', 'Provide work references.' UNION ALL
    SELECT 'Representative', 'Представитель', '/ˌrep.rɪˈzen.tə.tɪv/', 'Meet our sales representative.' UNION ALL
    SELECT 'Salary', 'Зарплата', '/ˈsæl.ər.i/', 'The salary is competitive.' UNION ALL
    SELECT 'Science', 'Наука', '/ˈsaɪ.əns/', 'He works in computer science.' UNION ALL
    SELECT 'Shop assistant', 'Продавец', '/ˈʃɒp əˌsɪs.tənt/', 'The shop assistant helped me.' UNION ALL
    SELECT 'Skill', 'Навык', '/skɪl/', 'Communication is an important skill.' UNION ALL
    SELECT 'Skilled', 'Квалифицированный', '/skɪld/', 'We need skilled workers.' UNION ALL
    SELECT 'Staff', 'Сотрудники', '/stɑːf/', 'Our staff are well-trained.' UNION ALL
    SELECT 'Stairs', 'Лестница', '/steəz/', 'Use the stairs in emergencies.' UNION ALL
    SELECT 'Steel', 'Сталь', '/stiːl/', 'The factory produces steel.' UNION ALL
    SELECT 'Through', 'Через', '/θruː/', 'We''re open through Saturday.' UNION ALL
    SELECT 'Train', 'Тренировать', '/treɪn/', 'We train new employees.' UNION ALL
    SELECT 'Truck', 'Грузовик', '/trʌk/', 'The truck delivers goods.' UNION ALL
    SELECT 'Wages', 'Сдельная з/п', '/ˈweɪ.dʒɪz/', 'Wages are paid weekly.' UNION ALL
    SELECT 'Work experience', 'Опыт работы', '/ˈwɜːk ɪkˌspɪə.ri.əns/', 'Do you have relevant work experience?' UNION ALL
    SELECT 'X-ray', 'Рентген', '/ˈeks.reɪ/', 'The doctor examined the X-ray.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);


-- Seed_PI_Unit8_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'PI'
        AND u.display_order = 8  -- Unit 8 - Technology
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
    SELECT 'as a result' AS english_word, 'в результате' AS russian_translation, '/əz ə rɪˈzʌlt/' AS transcription, 'As a result, the device works better.' AS example_sentence UNION ALL
    SELECT 'astronaut', 'астронавт', '/ˈæs.trə.nɔːt/', 'Astronauts use advanced technology.' UNION ALL
    SELECT 'awareness', 'осведомленность', '/əˈweə.nəs/', 'The app increases environmental awareness.' UNION ALL
    SELECT 'backwards', 'назад, обратно', '/ˈbæk.wədz/', 'The robot can move backwards.' UNION ALL
    SELECT 'basic', 'основной, базовый', '/ˈbeɪ.sɪk/', 'You need basic computer skills.' UNION ALL
    SELECT 'battery', 'батарея', '/ˈbæt.ər.i/', 'My phone battery is low.' UNION ALL
    SELECT 'bored', 'скучающий', '/bɔːd/', 'Children get bored without technology.' UNION ALL
    SELECT 'bur', 'колючка', '/bɜːr/', 'The bur stuck to my clothes.' UNION ALL
    SELECT 'button', 'кнопка', '/ˈbʌt.ən/', 'Press the power button.' UNION ALL
    SELECT 'charge', 'заряжать', '/tʃɑːdʒ/', 'I need to charge my laptop.' UNION ALL
    SELECT 'come down', 'спускаться, опускаться', '/ˌkʌm ˈdaʊn/', 'The drone came down slowly.' UNION ALL
    SELECT 'connect', 'подключать, соединять', '/kəˈnekt/', 'Connect the cable to the port.' UNION ALL
    SELECT 'contrasting', 'контрастирующий', '/kənˈtrɑː.stɪŋ/', 'The screen shows contrasting colors.' UNION ALL
    SELECT 'decision', 'решение', '/dɪˈsɪʒ.ən/', 'The computer makes quick decisions.' UNION ALL
    SELECT 'die out', 'вымирать', '/ˌdaɪ ˈaʊt/', 'Old technologies die out.' UNION ALL
    SELECT 'dirt', 'грязь', '/dɜːt/', 'Keep electronics away from dirt.' UNION ALL
    SELECT 'disappear', 'исчезать', '/ˌdɪs.əˈpɪər/', 'The message disappeared from the screen.' UNION ALL
    SELECT 'download', 'скачивать', '/ˌdaʊnˈləʊd/', 'Download the latest update.' UNION ALL
    SELECT 'effect', 'влияние, эффект', '/ɪˈfekt/', 'The special effects were amazing.' UNION ALL
    SELECT 'equipment', 'оборудование', '/ɪˈkwɪp.mənt/', 'We need new laboratory equipment.' UNION ALL
    SELECT 'experiment', 'эксперимент', '/ɪkˈsper.ɪ.mənt/', 'The experiment proved the theory.' UNION ALL
    SELECT 'firstly', 'во-первых', '/ˈfɜːst.li/', 'Firstly, check the power supply.' UNION ALL
    SELECT 'flipper', 'плавник, ласта', '/ˈflɪp.ər/', 'The robot has flippers for swimming.' UNION ALL
    SELECT 'forever', 'навсегда', '/fərˈev.ər/', 'Digital data can last forever.' UNION ALL
    SELECT 'forwards', 'вперед, дальше', '/ˈfɔː.wədz/', 'The car moved forwards automatically.' UNION ALL
    SELECT 'go up', 'подниматься, идти вверх', '/ˌɡəʊ ˈʌp/', 'The elevator went up to the 10th floor.' UNION ALL
    SELECT 'hairdryer', 'фен', '/ˈheə.draɪ.ər/', 'The hotel provides a hairdryer.' UNION ALL
    SELECT 'however', 'однако', '/haʊˈev.ər/', 'However, the technology has limits.' UNION ALL
    SELECT 'hungry', 'голодный', '/ˈhʌŋ.ɡri/', 'The robot doesn''t get hungry.' UNION ALL
    SELECT 'in addition', 'к тому же', '/ɪn əˈdɪʃ.ən/', 'In addition, we need more memory.' UNION ALL
    SELECT 'in other words', 'другими словами', '/ɪn ˌʌð.ə ˈwɜːdz/', 'In other words, it''s user-friendly.' UNION ALL
    SELECT 'instructions', 'инструкции', '/ɪnˈstrʌk.ʃənz/', 'Read the instructions carefully.' UNION ALL
    SELECT 'lens', 'линза', '/lenz/', 'The camera lens is scratched.' UNION ALL
    SELECT 'lever', 'рычаг, рукоятка', '/ˈliː.vər/', 'Pull the lever to start.' UNION ALL
    SELECT 'log in', 'войти в (аккаунт)', '/ˌlɒɡ ˈɪn/', 'Log in with your username.' UNION ALL
    SELECT 'mathematical problem', 'математическая задача', '/ˌmæθ.əmˌæt.ɪ.kəl ˈprɒb.ləm/', 'The computer solved the mathematical problem.' UNION ALL
    SELECT 'music download', 'скачивание музыки', '/ˈmjuː.zɪk ˌdaʊn.ləʊd/', 'Music downloads are popular.' UNION ALL
    SELECT 'neglect', 'пренебрегать', '/nɪˈɡlekt/', 'Don''t neglect software updates.' UNION ALL
    SELECT 'new ideas', 'новые идеи', '/ˌnjuː aɪˈdɪəz/', 'We welcome new ideas.' UNION ALL
    SELECT 'on the other hand', 'с другой стороны', '/ɒn ði ˌʌð.ə ˈhænd/', 'On the other hand, it''s expensive.' UNION ALL
    SELECT 'optician', 'окулист', '/ɒpˈtɪʃ.ən/', 'The optician checked my eyes.' UNION ALL
    SELECT 'pipe', 'труба', '/paɪp/', 'The pipe carries internet cables.' UNION ALL
    SELECT 'press', 'нажимать', '/pres/', 'Press the button firmly.' UNION ALL
    SELECT 'propeller', 'пропеллер', '/prəˈpel.ər/', 'The drone''s propeller broke.' UNION ALL
    SELECT 'pull', 'тянуть, тащить', '/pʊl/', 'Pull the cord to start.' UNION ALL
    SELECT 'pump', 'насос, качать', '/pʌmp/', 'The pump circulates water.' UNION ALL
    SELECT 'push', 'толкать, нажимать', '/pʊʃ/', 'Push the door to open.' UNION ALL
    SELECT 'remote control', 'пульт', '/rɪˌməʊt kənˈtrəʊl/', 'The remote control needs batteries.' UNION ALL
    SELECT 'repetitive', 'повторяющийся', '/rɪˈpet.ə.tɪv/', 'The task is repetitive and boring.' UNION ALL
    SELECT 'result', 'результат', '/rɪˈzʌlt/', 'We got excellent results.' UNION ALL
    SELECT 'run off', 'удирать, убегать', '/ˌrʌn ˈɒf/', 'The robot ran off its battery.' UNION ALL
    SELECT 'schooled', 'обученный', '/skuːld/', 'The AI is well schooled.' UNION ALL
    SELECT 'search', 'поиск, искать', '/sɜːtʃ/', 'Search for the file online.' UNION ALL
    SELECT 'set up', 'устанавливать', '/ˌset ˈʌp/', 'Set up the new software.' UNION ALL
    SELECT 'shift', 'смена, сдвиг', '/ʃɪft/', 'Workers do 8-hour shifts.' UNION ALL
    SELECT 'silicone oil', 'силиконовые масла', '/ˌsɪl.ɪ.kəʊn ˈɔɪl/', 'The machine uses silicone oil.' UNION ALL
    SELECT 'skin', 'кожа', '/skɪn/', 'The device has a leather skin.' UNION ALL
    SELECT 'sleep', 'спать, сон', '/sliːp/', 'Put the computer to sleep.' UNION ALL
    SELECT 'slow down', 'помедленнее', '/ˌsləʊ ˈdaʊn/', 'Slow down the process.' UNION ALL
    SELECT 'source', 'источник', '/sɔːs/', 'The power source is solar.' UNION ALL
    SELECT 'subscribe', 'подписываться', '/səbˈskraɪb/', 'Subscribe to our newsletter.' UNION ALL
    SELECT 'sun cream', 'крем от солнца', '/ˈsʌn ˌkriːm/', 'Use sun cream outdoors.' UNION ALL
    SELECT 'touch', 'трогать', '/tʌtʃ/', 'The touch screen is sensitive.' UNION ALL
    SELECT 'towel', 'полотенце', '/taʊəl/', 'Dry your hands with a towel.' UNION ALL
    SELECT 'turn on', 'включать', '/ˌtɜːn ˈɒn/', 'Turn on the device first.' UNION ALL
    SELECT 'upload', 'загружать', '/ˌʌpˈləʊd/', 'Upload your files to the cloud.' UNION ALL
    SELECT 'vending machine', 'автомат с едой', '/ˈven.dɪŋ məˌʃiːn/', 'Buy snacks from the vending machine.' UNION ALL
    SELECT 'water supply', 'водоснабжение', '/ˈwɔː.tə səˌplaɪ/', 'The water supply was interrupted.' UNION ALL
    SELECT 'wheel', 'колесо', '/wiːl/', 'The robot has four wheels.' UNION ALL
    SELECT 'wind turbine', 'ветряная турбина', '/ˈwɪnd ˌtɜː.baɪn/', 'Wind turbines generate electricity.' UNION ALL
    SELECT 'wireless technology', 'беспроводные технологии', '/ˌwaɪə.ləs tekˈnɒl.ə.dʒi/', 'Wireless technology is convenient.' UNION ALL
    SELECT 'write', 'писать, написать', '/raɪt/', 'Write your password here.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_PI_Unit9_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'PI'
        AND u.display_order = 9  -- Unit 9 - Holidays
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
    SELECT 'abroad' AS english_word, 'за границей' AS russian_translation, '/əˈbrɔːd/' AS transcription, 'We''re traveling abroad this summer.' AS example_sentence UNION ALL
    SELECT 'accommodation', 'жилье, размещение', '/əˌkɒm.əˈdeɪ.ʃən/', 'Book your accommodation early.' UNION ALL
    SELECT 'amazed/amazing', 'изумленный/изумительный', '/əˈmeɪzd/ /əˈmeɪ.zɪŋ/', 'The ancient ruins were amazing.' UNION ALL
    SELECT 'annoyed/annoying', 'раздраженный/раздражающий', '/əˈnɔɪd/ /əˈnɔɪ.ɪŋ/', 'The delayed flight was annoying.' UNION ALL
    SELECT 'architecture', 'архитектура', '/ˈɑː.kɪ.tek.tʃər/', 'We admired the local architecture.' UNION ALL
    SELECT 'bone', 'кость, останки', '/bəʊn/', 'The museum displayed dinosaur bones.' UNION ALL
    SELECT 'book', 'бронировать', '/bʊk/', 'Did you book the hotel?' UNION ALL
    SELECT 'catacomb', 'катакомба', '/ˈkæt.ə.kəʊm/', 'We visited the ancient catacombs.' UNION ALL
    SELECT 'ceiling', 'потолок', '/ˈsiː.lɪŋ/', 'The ceiling was beautifully painted.' UNION ALL
    SELECT 'confirm', 'подтверждать', '/kənˈfɜːm/', 'Please confirm your booking.' UNION ALL
    SELECT 'face', 'сталкиваться', '/feɪs/', 'We faced some travel problems.' UNION ALL
    SELECT 'fascinated/fascinating', 'очарован/очаровательный', '/ˈfæs.ɪ.neɪ.tɪd/ /ˈfæs.ɪ.neɪ.tɪŋ/', 'The history was fascinating.' UNION ALL
    SELECT 'fortunately', 'к счастью', '/ˈfɔː.tʃən.ət.li/', 'Fortunately, our flight was on time.' UNION ALL
    SELECT 'frightened/frightening', 'напуганный/пугающий', '/ˈfraɪ.tənd/ /ˈfraɪ.tən.ɪŋ/', 'The storm was frightening.' UNION ALL
    SELECT 'get', 'удаваться что-либо сделать', '/ɡet/', 'Did you get to see everything?' UNION ALL
    SELECT 'gift', 'подарок', '/ɡɪft/', 'Buy souvenirs as gifts.' UNION ALL
    SELECT 'gondolier', 'гондольер', '/ˌɡɒn.dəˈlɪər/', 'The gondolier sang beautifully.' UNION ALL
    SELECT 'grateful', 'благодарный', '/ˈɡreɪt.fəl/', 'We''re grateful for the help.' UNION ALL
    SELECT 'in advance', 'заранее', '/ɪn ədˈvɑːns/', 'Book tickets in advance.' UNION ALL
    SELECT 'look forward to', 'ждать с нетерпением', '/ˌlʊk ˈfɔː.wəd tu/', 'I look forward to the trip.' UNION ALL
    SELECT 'move away', 'съехать, уехать', '/ˌmuːv əˈweɪ/', 'We moved away from the crowd.' UNION ALL
    SELECT 'place', 'место', '/pleɪs/', 'This is a beautiful place.' UNION ALL
    SELECT 'property', 'имущество', '/ˈprɒp.ə.ti/', 'Insure your property when traveling.' UNION ALL
    SELECT 'rent', 'арендовать', '/rent/', 'We rented a car for the week.' UNION ALL
    SELECT 'secret', 'секрет, тайна', '/ˈsiː.krət/', 'The locals know secret spots.' UNION ALL
    SELECT 'senior', 'пожилой', '/ˈsiː.ni.ər/', 'Senior citizens get discounts.' UNION ALL
    SELECT 'sightseeing', 'осмотр достопримечательностей', '/ˈsaɪt.siː.ɪŋ/', 'We did sightseeing all day.' UNION ALL
    SELECT 'sing', 'петь', '/sɪŋ/', 'The tourists sang together.' UNION ALL
    SELECT 'skeleton', 'скелет', '/ˈskel.ə.tən/', 'The museum had a whale skeleton.' UNION ALL
    SELECT 'song', 'песня', '/sɒŋ/', 'We learned a local song.' UNION ALL
    SELECT 'stay', 'останавливаться', '/steɪ/', 'Where are you staying?' UNION ALL
    SELECT 'stone', 'камень, каменный', '/stəʊn/', 'The stone bridge was ancient.' UNION ALL
    SELECT 'suddenly', 'вдруг, внезапно', '/ˈsʌd.ən.li/', 'Suddenly, it started raining.' UNION ALL
    SELECT 'sunbathing', 'загорание', '/ˈsʌn.beɪ.ðɪŋ/', 'We enjoyed sunbathing on the beach.' UNION ALL
    SELECT 'take place', 'происходить, иметь место', '/ˌteɪk ˈpleɪs/', 'The festival takes place annually.' UNION ALL
    SELECT 'trader', 'торговец', '/ˈtreɪ.dər/', 'The trader sold handmade crafts.' UNION ALL
    SELECT 'tunnel', 'туннель', '/ˈtʌn.əl/', 'We walked through the old tunnel.' UNION ALL
    SELECT 'underground', 'метрополитен', '/ˈʌn.də.ɡraʊnd/', 'Take the underground to the center.' UNION ALL
    SELECT 'unpack', 'распаковывать', '/ʌnˈpæk/', 'I''ll unpack my suitcase later.' UNION ALL
    SELECT 'worried', 'обеспокоенный', '/ˈwʌr.id/', 'Don''t be worried about the flight.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_PI_Unit10_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'PI'
        AND u.display_order = 10  -- Unit 10 - Products
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
    SELECT 'About us' AS english_word, 'о нас' AS russian_translation, '/əˈbaʊt ʌs/' AS transcription, 'Read the "About us" page.' AS example_sentence UNION ALL
    SELECT 'Advert', 'реклама', '/ˈæd.vɜːt/', 'The advert was very creative.' UNION ALL
    SELECT 'Basket', 'корзина', '/ˈbɑː.skɪt/', 'Add items to your basket.' UNION ALL
    SELECT 'Cassette', 'кассета', '/kəˈset/', 'Cassettes are now obsolete.' UNION ALL
    SELECT 'Catch', 'ловить, поймать', '/kætʃ/', 'This product will catch your eye.' UNION ALL
    SELECT 'Classic', 'классический', '/ˈklæs.ɪk/', 'It''s a classic design.' UNION ALL
    SELECT 'Collide', 'сталкиваться, вступать в противоречие', '/kəˈlaɪd/', 'The products collided in the market.' UNION ALL
    SELECT 'Comment', 'комментировать', '/ˈkɒm.ent/', 'Customers can comment online.' UNION ALL
    SELECT 'Complain', 'жаловаться', '/kəmˈpleɪn/', 'Complain about faulty products.' UNION ALL
    SELECT 'Confidence', 'уверенность', '/ˈkɒn.fɪ.dəns/', 'We have confidence in our products.' UNION ALL
    SELECT 'Contact', 'контактировать, общаться', '/ˈkɒn.tækt/', 'Contact customer service.' UNION ALL
    SELECT 'Content', 'содержание', '/ˈkɒn.tent/', 'Check the product content.' UNION ALL
    SELECT 'Design', 'проектировать', '/dɪˈzaɪn/', 'We design innovative products.' UNION ALL
    SELECT 'Device', 'устройство, прибор', '/dɪˈvaɪs/', 'The device is easy to use.' UNION ALL
    SELECT 'Digital device', 'электронное устройство', '/ˌdɪdʒ.ɪ.təl dɪˈvaɪs/', 'Digital devices are everywhere.' UNION ALL
    SELECT 'Earn a living', 'зарабатывать на жизнь', '/ˌɜːn ə ˈlɪv.ɪŋ/', 'They earn a living selling crafts.' UNION ALL
    SELECT 'Feature', 'особенность', '/ˈfiː.tʃər/', 'This phone has great features.' UNION ALL
    SELECT 'Feedback', 'обратная связь', '/ˈfiːd.bæk/', 'We appreciate customer feedback.' UNION ALL
    SELECT 'Fill', 'наполнять, заполнять', '/fɪl/', 'Fill the form to order.' UNION ALL
    SELECT 'Have something to oneself', 'иметь что-то в своём распоряжении', '/hæv ˌsʌm.θɪŋ tə wʌnˈself/', 'I have the office to myself today.' UNION ALL
    SELECT 'Headphones', 'наушники', '/ˈhed.fəʊnz/', 'These headphones are wireless.' UNION ALL
    SELECT 'Home page', 'домашняя страница', '/ˈhəʊm ˌpeɪdʒ/', 'Our home page has promotions.' UNION ALL
    SELECT 'Link', 'ссылка', '/lɪŋk/', 'Click the product link.' UNION ALL
    SELECT 'Obstacle', 'препятствие, помеха', '/ˈɒb.stə.kəl/', 'High prices are an obstacle.' UNION ALL
    SELECT 'Old-fashioned', 'старомодный, устаревший', '/ˌəʊld ˈfæʃ.ənd/', 'The design looks old-fashioned.' UNION ALL
    SELECT 'Overhear', 'подслушивать, нечаянно услышать', '/ˌəʊ.vəˈhɪər/', 'I overheard their product discussion.' UNION ALL
    SELECT 'Produce', 'производить, выпускать', '/prəˈdjuːs/', 'We produce eco-friendly goods.' UNION ALL
    SELECT 'Prototype', 'прототип, опытный образец', '/ˈprəʊ.tə.taɪp/', 'The prototype worked perfectly.' UNION ALL
    SELECT 'Quality of life', 'уровень жизни', '/ˌkwɒl.ə.ti əv ˈlaɪf/', 'Good products improve quality of life.' UNION ALL
    SELECT 'Recognize', 'признавать, узнавать', '/ˈrek.əɡ.naɪz/', 'I recognize this brand logo.' UNION ALL
    SELECT 'Search', 'поиск, искать', '/sɜːtʃ/', 'Search for products online.' UNION ALL
    SELECT 'Stuff', 'хлам (барахло)', '/stʌf/', 'Don''t buy useless stuff.' UNION ALL
    SELECT 'Test', 'тестировать', '/test/', 'We test all products thoroughly.' UNION ALL
    SELECT 'Ultra-sonic beam', 'ультразвуковой луч', '/ˌʌl.trə ˈsɒn.ɪk biːm/', 'The device uses ultra-sonic beams.' UNION ALL
    SELECT 'Up-to-date', 'современный, новейший', '/ˌʌp tə ˈdeɪt/', 'Our technology is up-to-date.' UNION ALL
    SELECT 'Use', 'использовать, пользоваться', '/juːz/', 'Learn how to use the product.' UNION ALL
    SELECT 'Used to', 'Раньше', '/ˈjuːst tu/', 'I used to have a different phone.' UNION ALL
    SELECT 'Vibrate', 'вибрировать, дрожать', '/vaɪˈbreɪt/', 'The phone vibrates silently.' UNION ALL
    SELECT 'Visual impairment', 'ухудшение зрения', '/ˌvɪʒ.u.əl ɪmˈpeə.mənt/', 'The device helps those with visual impairment.' UNION ALL
    SELECT 'Walk into', 'заходить в', '/ˌwɔːk ˈɪn.tu/', 'Walk into any electronics store.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_PI_Unit11_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'PI'
        AND u.display_order = 11  -- Unit 11 - History
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
    SELECT 'actually' AS english_word, 'на самом деле' AS russian_translation, '/ˈæk.tʃu.ə.li/' AS transcription, 'He''s actually a famous historian.' AS example_sentence UNION ALL
    SELECT 'African-American', 'афроамериканец', '/ˌæf.rɪ.kən əˈmer.ɪ.kən/', 'African-American history is important.' UNION ALL
    SELECT 'archaeologist', 'археолог', '/ˌɑː.kiˈɒl.ə.dʒɪst/', 'The archaeologist discovered ruins.' UNION ALL
    SELECT 'card', 'открытка', '/kɑːd/', 'This historical card is valuable.' UNION ALL
    SELECT 'classical music', 'классическая музыка', '/ˌklæs.ɪ.kəl ˈmjuː.zɪk/', 'Classical music has rich history.' UNION ALL
    SELECT 'coin', 'монета', '/kɔɪn/', 'Ancient coins tell history.' UNION ALL
    SELECT 'collector', 'сборщик, коллекционер', '/kəˈlek.tər/', 'The collector owns rare artifacts.' UNION ALL
    SELECT 'community', 'сообщество', '/kəˈmjuː.nə.ti/', 'The local community preserves history.' UNION ALL
    SELECT 'connection', 'связь, соединение', '/kəˈnek.ʃən/', 'There''s a historical connection.' UNION ALL
    SELECT 'copy', 'экземпляр', '/ˈkɒp.i/', 'This is a copy of the original.' UNION ALL
    SELECT 'curious', 'любопытный', '/ˈkjʊə.ri.əs/', 'I''m curious about ancient Egypt.' UNION ALL
    SELECT 'desperately', 'отчаянно, безнадежно', '/ˈdes.pər.ət.li/', 'They desperately searched for relics.' UNION ALL
    SELECT 'diary', 'дневник, ежедневник', '/ˈdaɪə.ri/', 'Read the soldier''s war diary.' UNION ALL
    SELECT 'disappointing', 'разочаровывающий', '/ˌdɪs.əˈpɔɪn.tɪŋ/', 'The museum was disappointing.' UNION ALL
    SELECT 'drawing', 'рисунок, рисование', '/ˈdrɔː.ɪŋ/', 'The cave drawing was ancient.' UNION ALL
    SELECT 'email', 'электронная почта', '/ˈiː.meɪl/', 'Email the historical society.' UNION ALL
    SELECT 'expedition', 'экспедиция', '/ˌek.spəˈdɪʃ.ən/', 'The expedition discovered ruins.' UNION ALL
    SELECT 'fridge', 'холодильник', '/frɪdʒ/', 'Modern fridges preserve food.' UNION ALL
    SELECT 'function', 'функция', '/ˈfʌŋk.ʃən/', 'This artifact''s function is unknown.' UNION ALL
    SELECT 'interstellar space', 'межзвездное пространство', '/ˌɪn.təˈstel.ə speɪs/', 'Interstellar space fascinates scientists.' UNION ALL
    SELECT 'jazz', 'джаз', '/dʒæz/', 'Jazz has interesting origins.' UNION ALL
    SELECT 'launch', 'запускать, запуск', '/lɔːntʃ/', 'The rocket launch made history.' UNION ALL
    SELECT 'law', 'закон, право', '/lɔː/', 'Ancient laws were strict.' UNION ALL
    SELECT 'letter', 'письмо', '/ˈlet.ər/', 'Historical letters reveal secrets.' UNION ALL
    SELECT 'life form', 'форма жизни', '/ˈlaɪf ˌfɔːm/', 'Scientists seek new life forms.' UNION ALL
    SELECT 'mission', 'миссия, задача', '/ˈmɪʃ.ən/', 'The space mission succeeded.' UNION ALL
    SELECT 'moon', 'луна', '/muːn/', 'The moon landing was historic.' UNION ALL
    SELECT 'news reporter', 'репортер', '/ˈnjuːz rɪˌpɔː.tər/', 'The news reporter covered the event.' UNION ALL
    SELECT 'newspaper', 'газета', '/ˈnjuːzˌpeɪ.pər/', 'Old newspapers provide history.' UNION ALL
    SELECT 'note', 'банкнота', '/nəʊt/', 'The old note was valuable.' UNION ALL
    SELECT 'oxygen', 'кислород', '/ˈɒk.sɪ.dʒən/', 'Early Earth had little oxygen.' UNION ALL
    SELECT 'painting', 'картина', '/ˈpeɪn.tɪŋ/', 'The historical painting was restored.' UNION ALL
    SELECT 'phone conversation', 'телефонный разговор', '/ˈfəʊn ˌkɒn.vəˈseɪ.ʃən/', 'Phone conversations weren''t recorded.' UNION ALL
    SELECT 'planet', 'планета', '/ˈplæn.ɪt/', 'Earth is our home planet.' UNION ALL
    SELECT 'post-it-note', 'бумага для заметок клеящаяся, стикер', '/ˈpəʊst.ɪt nəʊt/', 'Post-it notes are modern inventions.' UNION ALL
    SELECT 'pot', 'горшок, котелок, кастрюля', '/pɒt/', 'Ancient cooking pots were found.' UNION ALL
    SELECT 'presentation', 'предоставление, показ', '/ˌprez.ənˈteɪ.ʃən/', 'The history presentation was engaging.' UNION ALL
    SELECT 'radio programme', 'радиопрограмма', '/ˈreɪ.di.əʊ ˌprəʊ.ɡræm/', 'Listen to the history radio programme.' UNION ALL
    SELECT 'robber', 'грабитель, разбойник', '/ˈrɒb.ər/', 'The robber stole artifacts.' UNION ALL
    SELECT 'sand', 'песок', '/sænd/', 'The desert sand preserved ruins.' UNION ALL
    SELECT 'solar system', 'солнечная система', '/ˈsəʊ.lə ˌsɪs.təm/', 'Our solar system has 8 planets.' UNION ALL
    SELECT 'soldier', 'солдат', '/ˈsəʊl.dʒər/', 'The soldier''s diary survived.' UNION ALL
    SELECT 'spacecraft', 'космический корабль', '/ˈspeɪs.krɑːft/', 'The spacecraft made history.' UNION ALL
    SELECT 'statue', 'статуя, памятник', '/ˈstætʃ.uː/', 'The ancient statue was damaged.' UNION ALL
    SELECT 'steal', 'воровать, красть', '/stiːl/', 'Thieves steal historical artifacts.' UNION ALL
    SELECT 'surprised', 'удивленный', '/səˈpraɪzd/', 'We were surprised by the discovery.' UNION ALL
    SELECT 'text message', 'текстовое сообщение', '/ˈtekst ˌmes.ɪdʒ/', 'Text messages weren''t possible historically.' UNION ALL
    SELECT 'tomb', 'гробница, могила', '/tuːm/', 'The pharaoh''s tomb was discovered.' UNION ALL
    SELECT 'universe', 'вселенная', '/ˈjuː.nɪ.vɜːs/', 'The universe is incredibly old.' UNION ALL
    SELECT 'village', 'деревня', '/ˈvɪl.ɪdʒ/', 'The medieval village was reconstructed.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_PI_Unit12_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'PI'
        AND u.display_order = 12  -- Unit 12 - Nature
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
    SELECT 'At the start' AS english_word, 'поначалу' AS russian_translation, '/ət ðə ˈstɑːt/' AS transcription, 'At the start, the forest seemed quiet.' AS example_sentence UNION ALL
    SELECT 'Bear', 'медведь', '/beər/', 'We saw a bear in the woods.' UNION ALL
    SELECT 'Break', 'ломать', '/breɪk/', 'Don''t break tree branches.' UNION ALL
    SELECT 'Bright', 'яркий', '/braɪt/', 'The bright sun warmed us.' UNION ALL
    SELECT 'Chimpanzee', 'шимпанзе', '/ˌtʃɪm.pænˈziː/', 'Chimpanzees are intelligent primates.' UNION ALL
    SELECT 'Climate', 'климат', '/ˈklaɪ.mət/', 'The tropical climate is humid.' UNION ALL
    SELECT 'Cloud', 'облако, туча', '/klaʊd/', 'Dark clouds brought rain.' UNION ALL
    SELECT 'Conservation', 'охрана природы', '/ˌkɒn.səˈveɪ.ʃən/', 'Conservation protects wildlife.' UNION ALL
    SELECT 'Coral', 'коралл', '/ˈkɒr.əl/', 'Coral reefs are fragile.' UNION ALL
    SELECT 'Crocodile', 'крокодил', '/ˈkrɒk.ə.daɪl/', 'The crocodile hid in the water.' UNION ALL
    SELECT 'Cubic foot', 'кубический фут', '/ˌkjuː.bɪk ˈfʊt/', 'Measure water in cubic feet.' UNION ALL
    SELECT 'Dark', 'темный', '/dɑːk/', 'The cave was completely dark.' UNION ALL
    SELECT 'Demand', 'требовать', '/dɪˈmɑːnd/', 'Plants demand sunlight.' UNION ALL
    SELECT 'Desert', 'пустыня', '/ˈdez.ət/', 'The desert is extremely dry.' UNION ALL
    SELECT 'Discovery', 'открытие', '/dɪˈskʌv.ər.i/', 'The discovery excited scientists.' UNION ALL
    SELECT 'Eagle', 'орёл', '/ˈiː.ɡəl/', 'An eagle soared overhead.' UNION ALL
    SELECT 'East shore', 'восточный берег', '/ˌiːst ˈʃɔːr/', 'We camped on the east shore.' UNION ALL
    SELECT 'Electrical energy', 'электроэнергия', '/ɪˌlek.trɪ.kəl ˈen.ə.dʒi/', 'Lightning produces electrical energy.' UNION ALL
    SELECT 'Elephant', 'слон', '/ˈel.ɪ.fənt/', 'Elephants are magnificent animals.' UNION ALL
    SELECT 'Endangered', 'вымирающий', '/ɪnˈdeɪn.dʒəd/', 'Pandas are endangered species.' UNION ALL
    SELECT 'Exhibition', 'выставка', '/ˌek.sɪˈbɪʃ.ən/', 'The nature exhibition was educational.' UNION ALL
    SELECT 'Fall', 'падать', '/fɔːl/', 'Leaves fall in autumn.' UNION ALL
    SELECT 'Field', 'поле', '/fiːld/', 'Wildflowers grew in the field.' UNION ALL
    SELECT 'Flood', 'наводнение', '/flʌd/', 'The flood damaged crops.' UNION ALL
    SELECT 'Flow', 'течение', '/fləʊ/', 'The river''s flow was strong.' UNION ALL
    SELECT 'Foreigner', 'иностранец', '/ˈfɒr.ə.nər/', 'Foreigners admired the landscape.' UNION ALL
    SELECT 'Forest', 'лес', '/ˈfɒr.ɪst/', 'The forest was dense and green.' UNION ALL
    SELECT 'Garden', 'сад, огород', '/ˈɡɑː.dən/', 'We grew vegetables in the garden.' UNION ALL
    SELECT 'Gibbon', 'гиббон', '/ˈɡɪb.ən/', 'Gibbons swing through trees.' UNION ALL
    SELECT 'Glass', 'стекло, стакан', '/ɡlɑːs/', 'Recycle glass bottles.' UNION ALL
    SELECT 'Grind', 'молоть', '/ɡraɪnd/', 'The mill grinds grain.' UNION ALL
    SELECT 'Hail', 'град', '/heɪl/', 'Hail damaged the crops.' UNION ALL
    SELECT 'Hard to handle', 'трудно иметь дело', '/ˌhɑːd tə ˈhæn.dl/', 'Wild animals are hard to handle.' UNION ALL
    SELECT 'Illegal', 'незаконный', '/ɪˈliː.ɡəl/', 'Poaching is illegal.' UNION ALL
    SELECT 'Lack', 'отсутствие', '/læk/', 'Lack of rain caused drought.' UNION ALL
    SELECT 'Lecture', 'лекция', '/ˈlek.tʃər/', 'The nature lecture was fascinating.' UNION ALL
    SELECT 'Lightning', 'молния', '/ˈlaɪt.nɪŋ/', 'Lightning flashed across the sky.' UNION ALL
    SELECT 'Luggage', 'багаж', '/ˈlʌɡ.ɪdʒ/', 'Pack light luggage for hiking.' UNION ALL
    SELECT 'Metal frame', 'металлический каркас', '/ˈmet.əl ˌfreɪm/', 'The greenhouse has a metal frame.' UNION ALL
    SELECT 'Monkey', 'обезьяна', '/ˈmʌŋ.ki/', 'Monkeys chattered in the trees.' UNION ALL
    SELECT 'Mountain', 'гора', '/ˈmaʊn.tɪn/', 'We climbed the high mountain.' UNION ALL
    SELECT 'Multi-coloured', 'разноцветный', '/ˌmʌl.tiˈkʌl.əd/', 'The bird had multi-coloured feathers.' UNION ALL
    SELECT 'Natural habitat', 'естественная среда обитания', '/ˌnætʃ.ər.əl ˈhæb.ɪ.tæt/', 'Protect animals'' natural habitat.' UNION ALL
    SELECT 'Outwards', 'наружу, за пределы', '/ˈaʊt.wədz/', 'The tree branches grew outwards.' UNION ALL
    SELECT 'Performance', 'представление, производительность', '/pəˈfɔː.məns/', 'The solar panels'' performance improved.' UNION ALL
    SELECT 'Poacher', 'браконьер', '/ˈpəʊ.tʃər/', 'Poachers threaten wildlife.' UNION ALL
    SELECT 'Powder', 'порошок, пудра', '/ˈpaʊ.dər/', 'The powder was actually pollen.' UNION ALL
    SELECT 'Protect', 'защищать, охранять', '/prəˈtekt/', 'Laws protect endangered species.' UNION ALL
    SELECT 'Release', 'выпускать (отпускать)', '/rɪˈliːs/', 'We released the rescued bird.' UNION ALL
    SELECT 'Rescue', 'спасать, спасение', '/ˈres.kjuː/', 'The animal rescue was successful.' UNION ALL
    SELECT 'Scorpion', 'скорпион', '/ˈskɔː.pi.ən/', 'The scorpion hid under a rock.' UNION ALL
    SELECT 'Shine', 'светить, сиять', '/ʃaɪn/', 'The sun shines brightly.' UNION ALL
    SELECT 'Snowstorm', 'снежная буря', '/ˈsnəʊ.stɔːm/', 'The snowstorm blocked roads.' UNION ALL
    SELECT 'Spaceship', 'космический корабль', '/ˈspeɪs.ʃɪp/', 'The spaceship studied Earth.' UNION ALL
    SELECT 'Special care', 'особый уход', '/ˌspeʃ.əl ˈkeər/', 'Endangered species need special care.' UNION ALL
    SELECT 'Species', 'виды (биол.)', '/ˈspiː.ʃiːz/', 'Many species face extinction.' UNION ALL
    SELECT 'Sponsor', 'спонсор', '/ˈspɒn.sər/', 'Companies sponsor conservation.' UNION ALL
    SELECT 'Spread', 'распространять', '/spred/', 'The fire spread quickly.' UNION ALL
    SELECT 'Start a new life', 'начать новую жизнь', '/ˌstɑːt ə ˌnjuː ˈlaɪf/', 'The cubs started a new life in the wild.' UNION ALL
    SELECT 'Storm', 'буря, шторм', '/stɔːm/', 'The storm uprooted trees.' UNION ALL
    SELECT 'Storm chaser', 'преследователь штормов, наблюдатель', '/ˈstɔːm ˌtʃeɪ.sər/', 'Storm chasers study weather.' UNION ALL
    SELECT 'Submarine', 'подводная лодка', '/ˌsʌb.məˈriːn/', 'The submarine explored the deep.' UNION ALL
    SELECT 'Support', 'поддержка, поддерживать', '/səˈpɔːt/', 'Support wildlife charities.' UNION ALL
    SELECT 'Surface', 'поверхность', '/ˈsɜː.fɪs/', 'Oil floated on the water''s surface.' UNION ALL
    SELECT 'Thunder', 'гром, греметь', '/ˈθʌn.dər/', 'Thunder rumbled in the distance.' UNION ALL
    SELECT 'Thunderstorm', 'гроза', '/ˈθʌn.də.stɔːm/', 'The thunderstorm was intense.' UNION ALL
    SELECT 'Tiger', 'тигр', '/ˈtaɪ.ɡər/', 'Tigers are magnificent predators.' UNION ALL
    SELECT 'Tool', 'инструмент', '/tuːl/', 'Monkeys use simple tools.' UNION ALL
    SELECT 'Tornado', 'торнадо', '/tɔːˈneɪ.dəʊ/', 'The tornado caused destruction.' UNION ALL
    SELECT 'Tourist attraction', 'достопримечательность', '/ˌtʊə.rɪst əˈtræk.ʃən/', 'The canyon is a tourist attraction.' UNION ALL
    SELECT 'Tourist destination', 'туристическое направление', '/ˌtʊə.rɪst ˌdes.tɪˈneɪ.ʃən/', 'The national park is a popular tourist destination.' UNION ALL
    SELECT 'Unlikely', 'маловероятно', '/ʌnˈlaɪ.kli/', 'Snow in summer is unlikely.' UNION ALL
    SELECT 'Victim', 'жертва', '/ˈvɪk.tɪm/', 'The flood had many victims.' UNION ALL
    SELECT 'West coast', 'западное побережье', '/ˌwest ˈkəʊst/', 'The west coast has cliffs.' UNION ALL
    SELECT 'Windscreen', 'лобовое стекло', '/ˈwɪnd.skriːn/', 'The windscreen cracked in the storm.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);