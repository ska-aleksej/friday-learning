INSERT INTO units (level_id, name, description, display_order) VALUES
    ((SELECT id FROM levels WHERE name = 'B1+'), 'Unit 1', 'Personal Development & Relationships', 1),
    ((SELECT id FROM levels WHERE name = 'B1+'), 'Unit 2', 'Skills & Career Development', 2),
    ((SELECT id FROM levels WHERE name = 'B1+'), 'Unit 3', 'Travel & Adventure', 3),
    ((SELECT id FROM levels WHERE name = 'B1+'), 'Unit 4', 'Accidents & Legal Matters', 4),
    ((SELECT id FROM levels WHERE name = 'B1+'), 'Unit 5', 'Business & Entrepreneurship', 5),
    ((SELECT id FROM levels WHERE name = 'B1+'), 'Unit 6', 'Entertainment & Services', 6),
    ((SELECT id FROM levels WHERE name = 'B1+'), 'Unit 7', 'Health & Transportation', 7),
    ((SELECT id FROM levels WHERE name = 'B1+'), 'Unit 8', 'Environment & Life Events', 8),
    ((SELECT id FROM levels WHERE name = 'B1+'), 'Unit 9', 'Society & Quality of Life', 9),
    ((SELECT id FROM levels WHERE name = 'B1+'), 'Unit 10', 'Professions & Personal Values', 10);

-- Seed_B1Plus_Unit1_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'B1+'
        AND u.display_order = 1
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
    SELECT 'be allergic to something' AS english_word, 'иметь аллергию на что-то' AS russian_translation, '/bi əˈlɜrdʒɪk tu ˈsʌmθɪŋ/' AS transcription, 'I can''t eat peanuts because I''m allergic to them.' AS example_sentence UNION ALL
    SELECT 'book in advance', 'бронировать заранее', '/bʊk ɪn ədˈvæns/', 'We should book the hotel in advance for our summer vacation.' UNION ALL
    SELECT 'decent', 'приличный, порядочный', '/ˈdisənt/', 'He found a decent apartment at a reasonable price.' UNION ALL
    SELECT 'delicious', 'вкусный', '/dɪˈlɪʃəs/', 'This chocolate cake is absolutely delicious!' UNION ALL
    SELECT 'fancy', 'нравиться, воображать', '/ˈfænsi/', 'Do you fancy going to the cinema tonight?' UNION ALL
    SELECT 'get someone''s order wrong', 'перепутать заказ', '/ɡɛt ˈsʌmwʌnz ˈɔrdər rɔŋ/', 'The waiter got our order wrong and brought pasta instead of pizza.' UNION ALL
    SELECT 'good value', 'хорошее соотношение цены и качества', '/ɡʊd ˈvælju/', 'This smartphone offers good value for its features.' UNION ALL
    SELECT 'good value for money', 'хорошее соотношение цены и качества', '/ɡʊd ˈvælju fər ˈmʌni/', 'The new laptop is good value for money considering its performance.' UNION ALL
    SELECT 'outdoor heater', 'уличный обогреватель', '/ˈaʊtˌdɔr ˈhitər/', 'The café has outdoor heaters so we can sit outside even in winter.' UNION ALL
    SELECT 'packed', 'переполненный, битком набитый', '/pækt/', 'The restaurant was packed with customers on Friday night.' UNION ALL
    SELECT 'plenty of choice', 'широкий выбор', '/ˈplɛnti ʌv tʃɔɪs/', 'The supermarket has plenty of choice in organic products.' UNION ALL
    SELECT 'put up the prices', 'повысить цены', '/pʊt ʌp ðə ˈpraɪsɪz/', 'The company had to put up the prices due to inflation.' UNION ALL
    SELECT 'service', 'услуга (обслуживание)', '/ˈsɜrvɪs/', 'The service at this hotel is excellent and very professional.' UNION ALL
    SELECT 'set menu', 'комплексный обед', '/sɛt ˈmɛnju/', 'They offer a three-course set menu for $25 during lunch.' UNION ALL
    SELECT 'spicy food', 'острая пища', '/ˈspaɪsi fud/', 'I love spicy food, especially Indian and Mexican cuisine.' UNION ALL
    SELECT 'suit everyone', 'подходить всем', '/sut ˈɛvriˌwʌn/', 'It''s hard to find a movie that will suit everyone''s tastes.' UNION ALL
    SELECT 'terrace', 'терраса, веранда/открытое кафе', '/ˈtɛrəs/', 'We had coffee on the terrace overlooking the garden.' UNION ALL
    SELECT 'the fish place', 'рыбный ресторанчик', '/ðə fɪʃ pleɪs/', 'Let''s try the fish place downtown, I heard it''s amazing.' UNION ALL
    SELECT 'the Indian place', 'индийский ресторанчик', '/ðə ˈɪndiən pleɪs/', 'We''re going to the Indian place for dinner tonight.' UNION ALL
    SELECT 'top quality', 'высшее качество', '/tɑp ˈkwɑləti/', 'This store sells top quality furniture at reasonable prices.' UNION ALL
    SELECT 'vegetarian', 'вегетарианец', '/ˌvɛdʒɪˈtɛriən/', 'She became a vegetarian two years ago for health reasons.' UNION ALL
    SELECT 'wait ages', 'ждать вечность', '/weɪt ˈeɪdʒɪz/', 'We had to wait ages for our food to arrive at the restaurant.' UNION ALL
    SELECT 'a strong personality', 'сильная личность', '/ə strɔŋ ˌpɜrsəˈnæləti/', 'You need a strong personality to succeed in this business.' UNION ALL
    SELECT 'a very popular building', 'очень популярное здание', '/ə ˈvɛri ˈpɑpjələr ˈbɪldɪŋ/', 'The Empire State Building is a very popular building among tourists.' UNION ALL
    SELECT 'adapt', 'приспосабливаться', '/əˈdæpt/', 'Animals must adapt to their environment to survive.' UNION ALL
    SELECT 'architect', 'архитектор', '/ˈɑrkəˌtɛkt/', 'The architect designed a modern glass and steel building.' UNION ALL
    SELECT 'attract attention', 'привлекать внимание', '/əˈtrækt əˈtɛnʃən/', 'The bright colors of the painting attract immediate attention.' UNION ALL
    SELECT 'became famous for', 'прославилась', '/bɪˈkeɪm ˈfeɪməs fɔr/', 'She became famous for her unique architectural style.' UNION ALL
    SELECT 'both', 'и то и другое', '/boʊθ/', 'Both options seem good, but we need to choose one.' UNION ALL
    SELECT 'confident', 'уверенный в себе', '/ˈkɑnfədənt/', 'He felt confident about his presentation skills.' UNION ALL
    SELECT 'create', 'создавать, творить', '/kriˈeɪt/', 'Artists create beautiful works that inspire people.' UNION ALL
    SELECT 'damage a building', 'разрушить здание', '/ˈdæmɪdʒ ə ˈbɪldɪŋ/', 'The earthquake damaged several buildings in the city center.' UNION ALL
    SELECT 'build a building', 'построить здание', '/bɪld ə ˈbɪldɪŋ/', 'It took three years to build this office building.' UNION ALL
    SELECT 'an empty building', 'пустое здание', '/ən ˈɛmpti ˈbɪldɪŋ/', 'The old factory has been an empty building for years.' UNION ALL
    SELECT 'a public building', 'общественное здание', '/ə ˈpʌblɪk ˈbɪldɪŋ/', 'The library is an important public building in our community.' UNION ALL
    SELECT 'design buildings', 'проектировать здания', '/dɪˈzaɪn ˈbɪldɪŋz/', 'She designs buildings that are both functional and beautiful.' UNION ALL
    SELECT 'designs will be completed', 'проекты будут завершены', '/dɪˈzaɪnz wɪl bi kəmˈplitɪd/', 'The architect said the designs will be completed by next month.' UNION ALL
    SELECT 'develop own style', 'разработать собственный стиль', '/dɪˈvɛləp oʊn staɪl/', 'Every artist needs to develop their own style over time.' UNION ALL
    SELECT 'early designs', 'ранние проекты', '/ˈɜrli dɪˈzaɪnz/', 'His early designs were quite different from his later work.' UNION ALL
    SELECT 'exciting', 'волнующий, захватывающий', '/ɪkˈsaɪtɪŋ/', 'Moving to a new country is both scary and exciting.' UNION ALL
    SELECT 'female', 'женского пола, женский', '/ˈfimeɪl/', 'She was the first female architect to win this prestigious award.' UNION ALL
    SELECT 'finish university', 'окончить университет', '/ˈfɪnɪʃ ˌjunəˈvɜrsəti/', 'He will finish university next year with a degree in engineering.' UNION ALL
    SELECT 'For a long time', 'долгое время', '/fɔr ə lɔŋ taɪm/', 'For a long time, people didn''t appreciate her innovative designs.' UNION ALL
    SELECT 'foreign architects', 'иностранные архитекторы', '/ˈfɔrən ˈɑrkəˌtɛkts/', 'Many foreign architects contributed to the city''s skyline.' UNION ALL
    SELECT 'get a degree in', 'получить степень, ученое звание, диплом в', '/ɡɛt ə dɪˈɡri ɪn/', 'She got a degree in architecture from Harvard University.' UNION ALL
    SELECT 'go to university', 'ходить в университет', '/ɡoʊ tu ˌjunəˈvɜrsəti/', 'He plans to go to university after finishing high school.' UNION ALL
    SELECT 'study at university', 'учиться в университете', '/ˈstʌdi æt ˌjunəˈvɜrsəti/', 'She studies at university and works part-time.' UNION ALL
    SELECT 'a top university', 'престижный университет', '/ə tɑp ˌjunəˈvɜrsəti/', 'He was accepted to a top university in the United States.' UNION ALL
    SELECT 'a private university', 'частный университет', '/ə ˈpraɪvət ˌjunəˈvɜrsəti/', 'Private universities often have higher tuition fees.' UNION ALL
    SELECT 'grew up', 'вырос, повзрослел', '/ɡru ʌp/', 'She grew up in a small town but moved to the city for work.' UNION ALL
    SELECT 'heart attack', 'сердечный приступ', '/hɑrt əˈtæk/', 'He had a heart attack last year but has recovered well.' UNION ALL
    SELECT 'in a row', 'подряд, последовательно', '/ɪn ə roʊ/', 'It rained for five days in a row during our vacation.' UNION ALL
    SELECT 'like least', 'нравится меньше всего', '/laɪk list/', 'Of all the subjects, math is the one I like least.' UNION ALL
    SELECT 'look for ways', 'искать способы', '/lʊk fɔr weɪz/', 'We need to look for ways to reduce our expenses.' UNION ALL
    SELECT 'look like', 'выглядеть как, быть похожим на', '/lʊk laɪk/', 'The new building looks like a spaceship from the future.' UNION ALL
    SELECT 'make plans', 'строить планы', '/meɪk plænz/', 'We should make plans for our summer vacation soon.' UNION ALL
    SELECT 'change your plans', 'поменять планы', '/tʃeɪndʒ jɔr plænz/', 'We had to change our plans when it started raining.' UNION ALL
    SELECT 'modern', 'современный, новый', '/ˈmɑdərn/', 'The museum features modern art from the 20th century.' UNION ALL
    SELECT 'mostly educated outside of her home country', 'в основном получила образование за пределами ее родной страны', '/ˈmoʊstli ˈɛdʒəˌkeɪtɪd ˈaʊtˌsaɪd ʌv hɜr hoʊm ˈkʌntri/', 'She was mostly educated outside of her home country, attending schools in Europe and America.' UNION ALL
    SELECT 'new and different ways', 'новые и разные способы', '/nu ænd ˈdɪfərənt weɪz/', 'Scientists are finding new and different ways to combat climate change.' UNION ALL
    SELECT 'opened her first office', 'открыла свой первый офис', '/ˈoʊpənd hɜr fɜrst ˈɔfɪs/', 'After graduating, she opened her first office in downtown Chicago.' UNION ALL
    SELECT 'outside Europe', 'за пределами Европы', '/ˈaʊtˌsaɪd ˈjʊrəp/', 'The company has several projects outside Europe, mainly in Asia.' UNION ALL
    SELECT 'paint a picture', 'нарисовать красками картину', '/peɪnt ə ˈpɪktʃər/', 'She likes to paint pictures of landscapes and nature.' UNION ALL
    SELECT 'draw a picture', 'нарисовать карандашом картину', '/drɔ ə ˈpɪktʃər/', 'The child can draw pictures of animals very well.' UNION ALL
    SELECT 'a colourful picture', 'цветная картина', '/ə ˈkʌlərfəl ˈpɪktʃər/', 'The artist created a colourful picture of the market scene.' UNION ALL
    SELECT 'pictures were shown', 'картины были показаны', '/ˈpɪktʃərz wɜr ʃoʊn/', 'Her pictures were shown at the gallery for the first time last month.' UNION ALL
    SELECT 'Plans failed', 'Планы не удались', '/plænz feɪld/', 'Our plans failed when the weather turned bad unexpectedly.' UNION ALL
    SELECT 'politician', 'политик', '/ˌpɑləˈtɪʃən/', 'The local politician promised to improve public transportation.' UNION ALL
    SELECT 'remain', 'оставаться', '/rɪˈmeɪn/', 'Please remain seated until the plane comes to a complete stop.' UNION ALL
    SELECT 'remember', 'помнить, вспоминать', '/rɪˈmɛmbər/', 'I can''t remember where I put my keys this morning.' UNION ALL
    SELECT 'skill', 'умение, навык', '/skɪl/', 'Learning a new language requires time and skill development.' UNION ALL
    SELECT 'spend time', 'проводить время', '/spɛnd taɪm/', 'I like to spend time with my family on weekends.' UNION ALL
    SELECT 'straight lines', 'прямые линии', '/streɪt laɪnz/', 'The architect prefers using straight lines in his designs.' UNION ALL
    SELECT 'tell a story', 'рассказывать рассказ', '/tɛl ə ˈstɔri/', 'Grandparents often tell stories about their childhood.' UNION ALL
    SELECT 'read a story', 'читать рассказ', '/rid ə ˈstɔri/', 'My mother used to read stories to me before bedtime.' UNION ALL
    SELECT 'a true story', 'правдивый рассказ', '/ə tru ˈstɔri/', 'The movie is based on a true story from World War II.' UNION ALL
    SELECT 'a love story', 'рассказ о любви', '/ə lʌv ˈstɔri/', 'She wrote a beautiful love story that became a bestseller.' UNION ALL
    SELECT 'the curve', 'кривая, изгиб', '/ðə kɜrv/', 'The road has a dangerous curve that drivers need to be careful of.' UNION ALL
    SELECT 'The problem was made even worse', 'Проблема усугубилась', '/ðə ˈprɑbləm wəz meɪd ˈivən wɜrs/', 'The problem was made even worse by the lack of communication.' UNION ALL
    SELECT 'while at university', 'вo время учебы в университете', '/waɪl æt ˌjunəˈvɜrsəti/', 'She started her first business while at university.' UNION ALL
    SELECT 'win a competition', 'выиграть соревнование', '/wɪn ə ˌkɑmpəˈtɪʃən/', 'Our team worked hard to win the competition.' UNION ALL
    SELECT 'work costs too much', 'работа стоит слишком дорого', '/wɜrk kɔsts tu mʌtʃ/', 'We can''t proceed with the renovation because the work costs too much.' UNION ALL
    SELECT 'works of art', 'произведения искусства', '/wɜrks ʌv ɑrt/', 'The museum displays works of art from different historical periods.' UNION ALL
    SELECT 'binge-watch', 'Смотреть без перерыва', '/bɪndʒ wɑtʃ/', 'On rainy weekends, I like to binge-watch my favorite TV series.' UNION ALL
    SELECT 'cost a fortune', 'Стоить целое состояние', '/kɔst ə ˈfɔrtʃən/', 'That luxury car must have cost a fortune!' UNION ALL
    SELECT 'get on with', 'Ладить с кем-то', '/ɡɛt ɔn wɪð/', 'It''s important to get on with your colleagues at work.' UNION ALL
    SELECT 'get stuck in traffic', 'Застрять в пробке', '/ɡɛt stʌk ɪn ˈtræfɪk/', 'I got stuck in traffic and arrived 30 minutes late.' UNION ALL
    SELECT 'get talking to somebody', 'Поговорить с кем-то', '/ɡɛt ˈtɔkɪŋ tu ˈsʌmˌbɑdi/', 'I got talking to my neighbor yesterday and found out we have a lot in common.' UNION ALL
    SELECT 'give up', 'сдаться', '/ɡɪv ʌp/', 'Don''t give up on your dreams, no matter how hard it gets.' UNION ALL
    SELECT 'go on', 'продолжать', '/ɡoʊ ɔn/', 'Please go on with your story, it''s very interesting.' UNION ALL
    SELECT 'go out for dinner', 'Пойти ужинать', '/ɡoʊ aʊt fər ˈdɪnər/', 'Let''s go out for dinner to celebrate your promotion.' UNION ALL
    SELECT 'hang on', 'Опереться, держаться', '/hæŋ ɔn/', 'Hang on tight, the bus is about to start moving.' UNION ALL
    SELECT 'hurry up', 'торопиться', '/ˈhɜri ʌp/', 'Hurry up or we''ll miss the beginning of the movie!' UNION ALL
    SELECT 'in a row', 'Подряд, в ряд', '/ɪn ə roʊ/', 'She won three games in a row at the tournament.' UNION ALL
    SELECT 'make a fortune', 'Заработать состояние', '/meɪk ə ˈfɔrtʃən/', 'He made a fortune by investing in technology companies early.' UNION ALL
    SELECT 'pass on', 'передавать', '/pæs ɔn/', 'Could you pass on the message to John when you see him?' UNION ALL
    SELECT 'pick up', 'подбирать', '/pɪk ʌp/', 'I''ll pick up some groceries on my way home from work.' UNION ALL
    SELECT 'queue', 'Очередь, стоять в очереди', '/kju/', 'We had to queue for an hour to get tickets for the concert.' UNION ALL
    SELECT 'rely on', 'Положиться на кого-то, на что-то', '/rɪˈlaɪ ɔn/', 'You can always rely on your best friend for support.' UNION ALL
    SELECT 'stay up late', 'поздно ложиться спать', '/steɪ ʌp leɪt/', 'I stayed up late last night finishing my project.' UNION ALL
    SELECT 'throw a party', 'Устроить вечеринку', '/θroʊ ə ˈpɑrti/', 'We''re going to throw a party for Sarah''s birthday next weekend.' UNION ALL
    SELECT 'tidy up', 'прибраться', '/ˈtaɪdi ʌp/', 'I need to tidy up my room before my guests arrive.' UNION ALL
    SELECT 'to be worth it', 'Стоить того, быть стоящим чего-то', '/tu bi wɜrθ ɪt/', 'The hike was difficult, but the amazing view was worth it.' UNION ALL
    SELECT 'I don''t care.', 'мне все равно', '/aɪ doʊnt kɛr/', 'I don''t care what we eat for dinner, you choose.' UNION ALL
    SELECT 'I don''t have any strong feelings either way.', 'Меня это не очень волнует.', '/aɪ doʊnt hæv ˈɛni strɔŋ ˈfilɪŋz ˈiðər weɪ/', 'About the color of the walls, I don''t have any strong feelings either way.' UNION ALL
    SELECT 'I don''t think it''s my kind of place.', 'Не думаю, что это мое место.', '/aɪ doʊnt θɪŋk ɪts maɪ kaɪnd əv pleɪs/', 'That nightclub seems too loud - I don''t think it''s my kind of place.' UNION ALL
    SELECT 'I''d prefer not to ...', 'Я бы предпочел не ...', '/aɪd prɪˈfɜr nɑt tu/', 'I''d prefer not to discuss this matter in public.' UNION ALL
    SELECT 'I''d rather be by the beach.', 'Я бы предпочел быть на пляже.', '/aɪd ˈræðər bi baɪ ðə bitʃ/', 'Instead of being in the city, I''d rather be by the beach.' UNION ALL
    SELECT 'I''d stay in a tent', 'Я бы остался в палатке', '/aɪd steɪ ɪn ə tɛnt/', 'I''d stay in a tent to experience nature more closely.' UNION ALL
    SELECT 'If it was just up to me', 'Если бы это было только мое решение', '/ɪf ɪt wəz ʤʌst ʌp tu mi/', 'If it was just up to me, we would leave right now.' UNION ALL
    SELECT 'If it was just up to me, I''d go to London.', 'Если бы это было только мое решение, я бы поехал в Лондон.', '/ɪf ɪt wəz ʤʌst ʌp tu mi aɪd ɡoʊ tu ˈlʌndən/', 'If it was just up to me, I''d go to London for our vacation.' UNION ALL
    SELECT 'It doesn''t make any difference to me.', 'Мне все равно', '/ɪt ˈdʌzənt meɪk ˈɛni ˈdɪfərəns tu mi/', 'We can eat Italian or Chinese food - it doesn''t make any difference to me.' UNION ALL
    SELECT 'Neither of them are my kind of place.', 'Ни одно из этих мест не для меня', '/ˈniðər ʌv ðɛm ɑr maɪ kaɪnd əv pleɪs/', 'Both restaurants seem too fancy - neither of them are my kind of place.' UNION ALL
    SELECT 'rather than', 'вместо того, чтобы', '/ˈræðər ðən/', 'I''d prefer to walk rather than take the bus.' UNION ALL
    SELECT 'the idea of travelling by train rather than by plane', 'идея путешествовать поездом, а не самолетом', '/ði aɪˈdiə əv ˈtrævəlɪŋ baɪ treɪn ˈræðər ðən baɪ pleɪn/', 'I like the idea of travelling by train rather than by plane - it''s more scenic.' UNION ALL
    SELECT 'there''s not much to do in the countryside', 'в деревне особо нечего делать', '/ðɛrz nɑt mʌʧ tu du ɪn ðə ˈkʌntriˌsaɪd/', 'Teenagers often complain that there''s not much to do in the countryside.' UNION ALL
    SELECT 'to be honest', 'честно говоря', '/tu bi ˈɑnɪst/', 'To be honest, I didn''t really enjoy the movie that much.' UNION ALL
    SELECT 'We''d be happy', 'мы были бы счастливы', '/wid bi ˈhæpi/', 'We''d be happy to help you with your moving next weekend.' UNION ALL
    SELECT 'Whatever', 'без разницы', '/wətˈɛvər/', 'Whatever you decide to cook for dinner will be fine with me.' UNION ALL
    SELECT 'Which car would you buy?', 'какую машину вы бы купили?', '/wɪʧ kɑr wʊd ju baɪ/', 'If money wasn''t an issue, which car would you buy?' UNION ALL
    SELECT 'Which one do you prefer?', 'Какой ты предпочитаешь?', '/wɪʧ wʌn du ju prɪˈfɜr/', 'We have chocolate and vanilla ice cream - which one do you prefer?'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);


-- Seed_B1Plus_Unit2_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'B1+'
        AND u.display_order = 2
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
    SELECT 'at times' AS english_word, 'порой' AS russian_translation, '/æt taɪmz/' AS transcription, 'At times, I feel overwhelmed with work.' AS example_sentence UNION ALL
    SELECT 'be good at', 'быть хорошим в', '/bi ɡʊd æt/', 'She''s really good at playing the piano.' UNION ALL
    SELECT 'be in touch with', 'быть на связи с', '/bi ɪn tʌtʃ wɪð/', 'I''ll be in touch with you next week about the project.' UNION ALL
    SELECT 'be keen on cooking', 'очень сильно увлекаться готовкой', '/bi kin ɔn ˈkʊkɪŋ/', 'My brother is really keen on cooking Italian food.' UNION ALL
    SELECT 'be no expert', 'не быть экспертом', '/bi noʊ ˈɛkspɜrt/', 'I''m no expert, but I think this painting is beautiful.' UNION ALL
    SELECT 'be useless at', 'быть никудышным в', '/bi ˈjusləs æt/', 'I''m completely useless at fixing computers.' UNION ALL
    SELECT 'become highly skilled', 'становиться высококвалифицированным специалистом', '/bɪˈkʌm ˈhaɪli skɪld/', 'After years of practice, she became highly skilled in graphic design.' UNION ALL
    SELECT 'compete against each other', 'соперничать друг с другом', '/kəmˈpit əˈɡɛnst iʧ ˈʌðər/', 'The two companies constantly compete against each other.' UNION ALL
    SELECT 'cookery book', 'кулинарная книга', '/ˈkʊkəri bʊk/', 'I bought a new cookery book with healthy recipes.' UNION ALL
    SELECT 'craft activities', 'поделки из бумаги', '/kræft ækˈtɪvətiz/', 'Children enjoy doing craft activities at summer camp.' UNION ALL
    SELECT 'develop my technique', 'развивать свою технику исполнения', '/dɪˈvɛləp maɪ tɛkˈnik/', 'I need to develop my technique if I want to play professionally.' UNION ALL
    SELECT 'develop your technique', 'улучшать технику', '/dɪˈvɛləp jɔr tɛkˈnik/', 'Regular practice will help you develop your technique.' UNION ALL
    SELECT 'do a 10K race', 'участвовать в 10км забеге', '/du ə 10k reɪs/', 'He trained for months to do a 10K race.' UNION ALL
    SELECT 'do a language exchange with someone', 'обмениваться языковой практикой с кем-то', '/du ə ˈlæŋɡwɪʤ ɪksˈʧeɪnʤ wɪð ˈsʌmˌwʌn/', 'I do a language exchange with a Spanish student twice a week.' UNION ALL
    SELECT 'download a few apps', 'скачать несколько приложений', '/ˈdaʊnˌloʊd ə fju æps/', 'I downloaded a few apps to help me learn French.' UNION ALL
    SELECT 'get back to basics', 'вернуться к истокам', '/ɡɛt bæk tu ˈbeɪsɪks/', 'Sometimes you need to get back to basics and simplify your life.' UNION ALL
    SELECT 'give it a time', 'дать этому время', '/ɡɪv ɪt ə taɪm/', 'Don''t worry about making mistakes - just give it time.' UNION ALL
    SELECT 'go over', 'еще раз пройти', '/ɡoʊ ˈoʊvər/', 'Let''s go over the instructions one more time.' UNION ALL
    SELECT 'have a go (at something)', 'попробовать', '/hæv ə ɡoʊ/', 'Why don''t you have a go at playing the guitar?' UNION ALL
    SELECT 'have a long way to go', 'предстоит долгий путь', '/hæv ə lɔŋ weɪ tu ɡoʊ/', 'I can play a few chords, but I have a long way to go.' UNION ALL
    SELECT 'in the hope of becoming famous', 'в надежде стать знаменитым', '/ɪn ðə hoʊp ʌv bɪˈkʌmɪŋ ˈfeɪməs/', 'He moved to Hollywood in the hope of becoming famous.' UNION ALL
    SELECT 'It''s been a bit of a challenge', 'Это немного вызов', '/ɪts bɪn ə bɪt ʌv ə ˈʧæləndʒ/', 'Learning Chinese has been a bit of a challenge for me.' UNION ALL
    SELECT 'lead a stressful life', 'вести напряженную жизнь', '/lid ə ˈstrɛsfəl laɪf/', 'Many people in big cities lead a stressful life.' UNION ALL
    SELECT 'make a lot of progress', 'делать большой прогресс', '/meɪk ə lɑt ʌv ˈprɑɡrəs/', 'She''s made a lot of progress in her English studies.' UNION ALL
    SELECT 'overnight', 'в одночасье', '/ˈoʊvərnaɪt/', 'Success doesn''t happen overnight - it takes hard work.' UNION ALL
    SELECT 'start to improve', 'начать улучшаться', '/stɑrt tu ɪmˈpruv/', 'My tennis game started to improve after taking lessons.' UNION ALL
    SELECT 'Teaching English interests me.', 'Обучение английскому меня интересует.', '/ˈtiʧɪŋ ˈɪŋɡlɪʃ ˈɪntrəsts mi/', 'Teaching English interests me as a potential career.' UNION ALL
    SELECT 'though', 'хотя, однако', '/ðoʊ/', 'It''s difficult, though not impossible.' UNION ALL
    SELECT 'to get good at something', 'стать в чем-то лучше', '/tu ɡɛt ɡʊd æt ˈsʌmθɪŋ/', 'It takes practice to get good at playing chess.' UNION ALL
    SELECT 'train every day', 'тренироваться каждый день', '/treɪn ˈɛvri deɪ/', 'Athletes train every day to stay in shape.' UNION ALL
    SELECT 'try out new skills', 'пробовать новые навыки', '/traɪ aʊt nu skɪlz/', 'I like to try out new skills in my free time.' UNION ALL
    SELECT 'as soon as', 'как только', '/æz sun æz/', 'I''ll call you as soon as I arrive.' UNION ALL
    SELECT 'at a particular time and place', 'в определенное время и в определенном месте', '/æt ə pərˈtɪkjələr taɪm ænd pleɪs/', 'The meeting will be at a particular time and place.' UNION ALL
    SELECT 'be satisfied with', 'быть довольным, удовлетворенным чем-то', '/bi ˈsætɪsfaɪd wɪð/', 'Are you satisfied with your new job?' UNION ALL
    SELECT 'bearable', 'терпимый, сносный', '/ˈbɛrəbəl/', 'The heat was just bearable with the air conditioning.' UNION ALL
    SELECT 'distraction', 'отвлечение', '/dɪˈstrækʃən/', 'I need a quiet place to work without distractions.' UNION ALL
    SELECT 'expect', 'ожидать, надеяться', '/ɪkˈspɛkt/', 'I expect the package to arrive tomorrow.' UNION ALL
    SELECT 'flexible working hours', 'гибкий рабочий график', '/ˈflɛksəbəl ˈwɜrkɪŋ ˈaʊərz/', 'Many companies now offer flexible working hours.' UNION ALL
    SELECT 'Freezing', 'морозный', '/ˈfrizɪŋ/', 'It''s freezing outside - don''t forget your coat!' UNION ALL
    SELECT 'friendly place to work', 'приятное место для работы', '/ˈfrɛndli pleɪs tu wɜrk/', 'This company is known as a friendly place to work.' UNION ALL
    SELECT 'get distracted by', 'отвлекаться на что-то', '/ɡɛt dɪˈstræktɪd baɪ/', 'I often get distracted by social media when I''m working.' UNION ALL
    SELECT 'health and safety rules', 'правила техники безопасности', '/hɛlθ ænd ˈseɪfti rulz/', 'All employees must follow health and safety rules.' UNION ALL
    SELECT 'hindrance', 'помеха, препятствие', '/ˈhɪndrəns/', 'The bad weather was a hindrance to our travel plans.' UNION ALL
    SELECT 'I didn''t get any kind of welcome', 'меня никак не поприветствовали', '/aɪ ˈdɪdənt ɡɛt ˈɛni kaɪnd ʌv ˈwɛlkəm/', 'On my first day, I didn''t get any kind of welcome from the team.' UNION ALL
    SELECT 'I was shown around the site', 'мне показали территорию', '/aɪ wəz ʃoʊn əˈraʊnd ðə saɪt/', 'During orientation, I was shown around the site by my manager.' UNION ALL
    SELECT 'legislation', 'законодательство', '/ˌlɛʤɪsˈleɪʃən/', 'New legislation will affect how businesses operate.' UNION ALL
    SELECT 'made me feel comfortable', 'заставил меня почувствовать себя комфортно', '/meɪd mi fil ˈkʌmftəbəl/', 'My new colleagues made me feel comfortable right away.' UNION ALL
    SELECT 'practice drill', 'учебная тренировка, тревога', '/ˈpræktɪs drɪl/', 'We had a fire practice drill at the office yesterday.' UNION ALL
    SELECT 'the layout of the building', 'планировка здания', '/ðə ˈleɪaʊt ʌv ðə ˈbɪldɪŋ/', 'It took me weeks to learn the layout of the building.' UNION ALL
    SELECT 'to be left to my own devices', 'быть предоставленным самому себе', '/tu bi lɛft tu maɪ oʊn dɪˈvaɪsɪz/', 'I prefer to be left to my own devices when I''m working.' UNION ALL
    SELECT 'welcome meeting', 'приветственная встреча', '/ˈwɛlkəm ˈmitɪŋ/', 'There''s a welcome meeting for new employees on Monday.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);


-- Seed_B1Plus_Unit3_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'B1+'
        AND u.display_order = 3
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
    SELECT 'a nature reserve' AS english_word, 'Природный заповедник' AS russian_translation, '/ə ˈneɪʧər rɪˈzɜrv/' AS transcription, 'We saw many wild animals in the nature reserve.' AS example_sentence UNION ALL
    SELECT 'amazing scenery', 'Потрясающий пейзаж', '/əˈmeɪzɪŋ ˈsinəri/', 'The amazing scenery made the long hike worthwhile.' UNION ALL
    SELECT 'be into the landscape', 'Увлекаться пейзажем', '/bi ˈɪntu ðə ˈlændskeɪp/', 'As a photographer, I''m really into the landscape of this region.' UNION ALL
    SELECT 'be round the old town', 'Гулять по старому городу', '/bi raʊnd ðə oʊld taʊn/', 'Let''s be round the old town this afternoon.' UNION ALL
    SELECT 'climb to the top of the dam', 'Взобраться на вершину дамбы', '/klaɪm tu ðə tɑp ʌv ðə dæm/', 'It was exhausting to climb to the top of the dam.' UNION ALL
    SELECT 'climb to the top of the tower', 'Взобраться на вершину башни', '/klaɪm tu ðə tɑp ʌv ðə ˈtaʊər/', 'We climbed to the top of the tower for a panoramic view.' UNION ALL
    SELECT 'do a lot of sightseeing', 'Осматривать достопримечательности', '/du ə lɑt ʌv ˈsaɪtˌsiɪŋ/', 'When I visit Paris, I like to do a lot of sightseeing.' UNION ALL
    SELECT 'do rafting down the river', 'Заниматься рафтингом', '/du ˈræftɪŋ daʊn ðə ˈrɪvər/', 'We''re going to do rafting down the river this weekend.' UNION ALL
    SELECT 'enjoy the wonderful view (from the mountains)', 'Наслаждаться прекрасным видом (с гор)', '/ɪnˈʤɔɪ ðə ˈwʌndərfəl vju/', 'We stopped to enjoy the wonderful view from the mountains.' UNION ALL
    SELECT 'go backpacking', 'Идти в поход', '/ɡoʊ ˈbækˌpækɪŋ/', 'Next summer, we plan to go backpacking in the Rockies.' UNION ALL
    SELECT 'go on a zip wire across a waterfall', 'Идти по канатной дороге через водопад', '/ɡoʊ ɔn ə zɪp waɪr əˈkrɔs ə ˈwɔtərˌfɔl/', 'The most exciting part was to go on a zip wire across a waterfall.' UNION ALL
    SELECT 'go to an elephant reserve', 'Идти в заповедник слонов', '/ɡoʊ tu ən ˈɛləfənt rɪˈzɜrv/', 'In Thailand, we went to an elephant reserve to see these magnificent animals.' UNION ALL
    SELECT 'go to the night market', 'Идти на ночной рынок', '/ɡoʊ tu ðə naɪt ˈmɑrkɪt/', 'Let''s go to the night market to try some local street food.' UNION ALL
    SELECT 'have a great view of the valley/the surrounding landscape', 'Иметь чудесный вид на долину, пейзаж вокруг', '/hæv ə ɡreɪt vju ʌv ðə ˈvæli/', 'Our hotel room had a great view of the valley below.' UNION ALL
    SELECT 'have you ever been to? (Yes, I have/No, have you?)', 'ты когда-нибудь был в?', '/hæv ju ˈɛvər bɪn tu/', 'Have you ever been to Japan? No, have you?' UNION ALL
    SELECT 'I''m thinking of going there later', 'я думаю поехать туда позже', '/aɪm ˈθɪŋkɪŋ ʌv ˈɡoʊɪŋ ðɛr ˈleɪtər/', 'I''m thinking of going there later this afternoon.' UNION ALL
    SELECT 'incredible beaches', 'Потрясающие пляжи', '/ɪnˈkrɛdəbəl ˈbiʧɪz/', 'The Caribbean has some incredible beaches with white sand.' UNION ALL
    SELECT 'it has everything you could wish for', 'Там есть все, о чем ты мог мечтать', '/ɪt hæz ˈɛvriθɪŋ ju kʊd wɪʃ fɔr/', 'This resort has everything you could wish for - pools, spa, and great restaurants.' UNION ALL
    SELECT 'it''s great value for money', 'это отличное соотношение цены и качества', '/ɪts ɡreɪt ˈvælju fər ˈmʌni/', 'This hotel is great value for money considering its amenities.' UNION ALL
    SELECT 'it''s not easy to get to', 'это нелегко добраться до', '/ɪts nɑt ˈizi tu ɡɛt tu/', 'The remote village isn''t easy to get to, but it''s worth the trip.' UNION ALL
    SELECT 'it''s perfect for couples (families/students)', 'идеально подходит для пар', '/ɪts ˈpɜrfɪkt fɔr ˈkʌpəlz/', 'This romantic restaurant is perfect for couples.' UNION ALL
    SELECT 'it''s supposed to be amazing', 'это непременно должно быть удивительным', '/ɪts səˈpoʊzd tu bi əˈmeɪzɪŋ/', 'The new museum is supposed to be amazing - everyone''s talking about it.' UNION ALL
    SELECT 'I''ve heard it''s amazing', 'я слышал это потрясающе', '/aɪv hɜrd ɪts əˈmeɪzɪŋ/', 'I''ve heard it''s amazing, so we should definitely visit.' UNION ALL
    SELECT 'kayak on the river', 'Плыть на байдарке по реке', '/ˈkaɪæk ɔn ðə ˈrɪvər/', 'We decided to kayak on the river for a different perspective.' UNION ALL
    SELECT 'learn about the medieval fort', 'Узнать про средневековый порт', '/lɜrn əˈbaʊt ðə ˌmɛdiˈivəl fɔrt/', 'At the museum, we learned about the medieval fort that once stood here.' UNION ALL
    SELECT 'see a huge range of wildlife', 'Увидеть разнообразие дикой природы', '/si ə hjuʤ reɪnʤ ʌv ˈwaɪldlaɪf/', 'On safari, you can see a huge range of wildlife.' UNION ALL
    SELECT 'steep cliffs/path', 'Крутые скалы, тропинка', '/stip klɪfs/', 'Be careful on the steep path near the cliffs.' UNION ALL
    SELECT 'take a boat up the river', 'Сесть на лодку вверх по реке', '/teɪk ə boʊt ʌp ðə ˈrɪvər/', 'We''ll take a boat up the river to reach the waterfall.' UNION ALL
    SELECT 'take a coach tour', 'Взять автобусную экскурсию', '/teɪk ə koʊʧ tʊr/', 'The easiest way to see the city is to take a coach tour.' UNION ALL
    SELECT 'take a guided tour', 'Взять экскурсионный тур', '/teɪk ə ˈɡaɪdɪd tʊr/', 'I recommend taking a guided tour to learn about the history.' UNION ALL
    SELECT 'take a walking tour', 'Взять пешеходную экскурсию', '/teɪk ə ˈwɔkɪŋ tʊr/', 'We joined a walking tour of the historic district.' UNION ALL
    SELECT 'through a cave', 'Через пещеру', '/θru ə keɪv/', 'The path goes through a cave with amazing rock formations.' UNION ALL
    SELECT 'visit the ancient remains/temples', 'Посетить древние развалины/храмы', '/ˈvɪzɪt ðə ˈeɪnʃənt rɪˈmeɪnz/', 'In Greece, we visited the ancient remains of the Acropolis.' UNION ALL
    SELECT 'visit the recently restored temple', 'Посетить недавно восстановленный храм', '/ˈvɪzɪt ðə ˈrisəntli rɪˈstɔrd ˈtɛmpəl/', 'The recently restored temple looks magnificent.' UNION ALL
    SELECT 'what did you think of it?', 'что же ты думаешь об этом?', '/wʌt dɪd ju θɪŋk ʌv ɪt/', 'You visited Rome last year - what did you think of it?' UNION ALL
    SELECT 'what''s it like?', 'какое это место?', '/wʌts ɪt laɪk/', 'I''m considering visiting Bali - what''s it like?'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);


-- Seed_B1Plus_Unit4_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'B1+'
        AND u.display_order = 4
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
    SELECT 'bend down' AS english_word, 'наклоняться' AS russian_translation, '/bɛnd daʊn/' AS transcription, 'I had to bend down to pick up the coins I dropped.' AS example_sentence UNION ALL
    SELECT 'catch fire', 'загореться', '/kæʧ ˈfaɪər/', 'The dry leaves caught fire quickly in the heat.' UNION ALL
    SELECT 'cause a lot of damage', 'нанести большой ущерб', '/kɔz ə lɑt ʌv ˈdæmɪʤ/', 'The storm caused a lot of damage to the coastal towns.' UNION ALL
    SELECT 'check the wrong box', 'поставить флажок не в том поле', '/ʧɛk ðə rɔŋ bɑks/', 'Be careful not to check the wrong box on the application form.' UNION ALL
    SELECT 'crash into the car', 'врезаться в машину', '/kræʃ ˈɪntu ðə kɑr/', 'The bicycle crashed into the car at the intersection.' UNION ALL
    SELECT 'cut the grass', 'косить траву', '/kʌt ðə ɡræs/', 'I need to cut the grass before it gets too long.' UNION ALL
    SELECT 'do plumbing', 'заниматься сантехнической работой', '/du ˈplʌmɪŋ/', 'My uncle knows how to do plumbing and fixed our leaky faucet.' UNION ALL
    SELECT 'drive over one''s foot', 'переехать через чью-то ногу', '/draɪv ˈoʊvər wʌnz fʊt/', 'The shopping cart accidentally drove over my foot at the supermarket.' UNION ALL
    SELECT 'end up', 'окончиться в конечном итоге', '/ɛnd ʌp/', 'We got lost and ended up in a completely different neighborhood.' UNION ALL
    SELECT 'fit', 'подходить по размеру', '/fɪt/', 'These shoes don''t fit me - they''re too small.' UNION ALL
    SELECT 'flood the apartment', 'затопить квартиру', '/flʌd ði əˈpɑrtmənt/', 'The broken pipe flooded the apartment below us.' UNION ALL
    SELECT 'fall down the stairs', 'падать с лестницы', '/fɔl daʊn ðə stɛrz/', 'Be careful not to fall down the stairs in the dark.' UNION ALL
    SELECT 'get charged extra money', 'выставить дополнительный счет', '/ɡɛt ʧɑrʤd ˈɛkstrə ˈmʌni/', 'I got charged extra money for the special delivery service.' UNION ALL
    SELECT 'go into one''s leg', 'попасть в ногу', '/ɡoʊ ˈɪntu wʌnz lɛɡ/', 'The nail went into my leg when I was working in the garden.' UNION ALL
    SELECT 'go out to everyone', 'отправиться всем', '/ɡoʊ aʊt tu ˈɛvriˌwʌn/', 'The email with instructions will go out to everyone tomorrow.' UNION ALL
    SELECT 'hurt one''s toe', 'удариться пальцем на ноге', '/hɜrt wʌnz toʊ/', 'I hurt my toe when I kicked the table leg accidentally.' UNION ALL
    SELECT 'knock', 'ударять', '/nɑk/', 'Please knock before entering the office.' UNION ALL
    SELECT 'knock over', 'опрокинуть', '/nɑk ˈoʊvər/', 'The cat knocked over the vase while playing.' UNION ALL
    SELECT 'leave the tap on', 'оставить кран включенным', '/liv ðə tæp ɔn/', 'Don''t leave the tap on when you''re brushing your teeth.' UNION ALL
    SELECT 'measure the height wrong', 'неправильно измерить высоту', '/ˈmɛʒər ðə haɪt rɔŋ/', 'I measured the height wrong, so the shelf doesn''t fit.' UNION ALL
    SELECT 'mix up the dates', 'спутать даты', '/mɪks ʌp ðə deɪts/', 'I mixed up the dates and missed my doctor''s appointment.' UNION ALL
    SELECT 'pick something up', 'поднять что-то', '/pɪk ˈsʌmθɪŋ ʌp/', 'Can you pick up the book that fell on the floor?' UNION ALL
    SELECT 'press the button by mistake', 'нажать кнопку по ошибке', '/prɛs ðə ˈbʌtən baɪ mɪsˈteɪk/', 'I pressed the button by mistake and deleted the important file.' UNION ALL
    SELECT 'slip', 'скользить', '/slɪp/', 'Be careful not to slip on the wet floor.' UNION ALL
    SELECT 'spill oil all over the floor', 'пролить масло на пол', '/spɪl ɔɪl ɔl ˈoʊvər ðə flɔr/', 'I spilled oil all over the floor while cooking dinner.' UNION ALL
    SELECT 'tick the wrong box', 'поставьте галочку не в том поле', '/tɪk ðə rɔŋ bɑks/', 'Make sure you don''t tick the wrong box on the voting form.' UNION ALL
    SELECT 'trip over a bag', 'споткнуться о сумку', '/trɪp ˈoʊvər ə bæɡ/', 'I tripped over a bag someone left in the hallway.' UNION ALL
    SELECT 'turn off the cooker', 'выключить плиту', '/tɜrn ɔf ðə ˈkʊkər/', 'Don''t forget to turn off the cooker before leaving the kitchen.' UNION ALL
    SELECT 'turn up', 'появляться', '/tɜrn ʌp/', 'He didn''t turn up for the meeting this morning.' UNION ALL
    SELECT 'apparently', 'очевидно', '/əˈpɛrəntli/', 'Apparently, the meeting has been postponed until next week.' UNION ALL
    SELECT 'arson', 'поджог', '/ˈɑrsən/', 'The police suspect arson was the cause of the fire.' UNION ALL
    SELECT 'assailant', 'противник, нападающий', '/əˈseɪlənt/', 'The victim couldn''t identify her assailant in the dark.' UNION ALL
    SELECT 'assault', 'нападение', '/əˈsɔlt/', 'He was charged with assault after the fight.' UNION ALL
    SELECT 'be on trial', 'быть под следствием', '/bi ɔn traɪəl/', 'The former CEO is currently on trial for fraud.' UNION ALL
    SELECT 'burglar', 'взломщик', '/ˈbɜrɡlər/', 'The burglar was caught by security cameras.' UNION ALL
    SELECT 'burglary', 'кража со взломом', '/ˈbɜrɡləri/', 'There was a burglary at the jewelry store last night.' UNION ALL
    SELECT 'claim', 'утверждать', '/kleɪm/', 'The company claims their product is the best on the market.' UNION ALL
    SELECT 'cub', 'детеныш', '/kʌb/', 'The lioness protected her cub from danger.' UNION ALL
    SELECT 'cybercrime', 'киберпреступность', '/ˈsaɪbərkraɪm/', 'Cybercrime has become a major concern for businesses.' UNION ALL
    SELECT 'drug trafficking', 'наркоторговля', '/drʌɡ ˈtræfɪkɪŋ/', 'He was arrested for involvement in drug trafficking.' UNION ALL
    SELECT 'embezzlement', 'хищение, растрата', '/ɪmˈbɛzəlmənt/', 'The accountant was accused of embezzlement from company funds.' UNION ALL
    SELECT 'embezzler', 'растратчик', '/ɪmˈbɛzlər/', 'The embezzler was sentenced to five years in prison.' UNION ALL
    SELECT 'extortionist', 'вымогатель', '/ɪkˈstɔrʃənɪst/', 'The extortionist demanded money in exchange for not releasing sensitive information.' UNION ALL
    SELECT 'forge', 'подделывать', '/fɔrʤ/', 'He tried to forge his manager''s signature on the document.' UNION ALL
    SELECT 'fraud', 'мошенничество', '/frɔd/', 'She was a victim of credit card fraud.' UNION ALL
    SELECT 'get out of jail', 'выйти из тюрьмы', '/ɡɛt aʊt ʌv ʤeɪl/', 'He got out of jail after serving three years of his sentence.' UNION ALL
    SELECT 'harasser', 'домогатель', '/həˈræsər/', 'The company fired the employee who was a known harasser.' UNION ALL
    SELECT 'harassment', 'преследование, домогательство', '/həˈræsmənt/', 'She filed a complaint about workplace harassment.' UNION ALL
    SELECT 'manslaughter', 'непредумышленное убийство', '/ˈmænˌslɔtər/', 'He was charged with manslaughter after the fatal car accident.' UNION ALL
    SELECT 'mugger', 'уличный грабитель', '/ˈmʌɡər/', 'The mugger stole her purse and ran away.' UNION ALL
    SELECT 'mugging', 'уличное ограбление', '/ˈmʌɡɪŋ/', 'There has been an increase in muggings in this area.' UNION ALL
    SELECT 'shoplifting', 'воровство в магазинах', '/ˈʃɑpˌlɪftɪŋ/', 'The teenager was caught shoplifting from the department store.' UNION ALL
    SELECT 'smuggling', 'контрабанда', '/ˈsmʌɡlɪŋ/', 'Customs officers discovered drugs being smuggled in the cargo.' UNION ALL
    SELECT 'theft', 'кража', '/θɛft/', 'The theft of the valuable painting was reported to the police.' UNION ALL
    SELECT 'thief', 'вор', '/θif/', 'The thief was captured on security cameras.' UNION ALL
    SELECT 'thieves', 'воры', '/θivz/', 'The thieves broke into the house while the owners were on vacation.' UNION ALL
    SELECT 'threat', 'угроза', '/θrɛt/', 'He received a threat warning him not to testify.' UNION ALL
    SELECT 'trial', 'судебный процесс', '/ˈtraɪəl/', 'The trial lasted for three weeks before the verdict was reached.' UNION ALL
    SELECT 'vandal', 'вандал, хулиган', '/ˈvændəl/', 'Vandals spray-painted graffiti on the school walls.' UNION ALL
    SELECT 'a deal', 'сделка', '/ə dil/', 'We made a deal to split the profits equally.' UNION ALL
    SELECT 'appropriate solution', 'подходящее решение', '/əˈproʊpriət səˈluʃən/', 'We need to find an appropriate solution to this problem.' UNION ALL
    SELECT 'be cracked', 'треснувший', '/bi krækt/', 'The phone screen is cracked after I dropped it.' UNION ALL
    SELECT 'be fair', 'быть справедливым', '/bi fɛr/', 'The teacher tried to be fair to all students in the class.' UNION ALL
    SELECT 'charge someone for something', 'взимать плату с кого-либо за что-либо', '/ʧɑrʤ ˈsʌmˌwʌn fɔr ˈsʌmθɪŋ/', 'They charged me extra for the express shipping.' UNION ALL
    SELECT 'complaint', 'жалоба, претензия', '/kəmˈpleɪnt/', 'I filed a complaint about the poor service I received.' UNION ALL
    SELECT 'delivery', 'доставка, поставка', '/dɪˈlɪvəri/', 'The delivery of the furniture is scheduled for tomorrow.' UNION ALL
    SELECT 'engine', 'двигатель', '/ˈɛnʤən/', 'The car''s engine needs to be repaired.' UNION ALL
    SELECT 'exchange', 'обмен', '/ɪksˈʧeɪnʤ/', 'I need to exchange this shirt for a smaller size.' UNION ALL
    SELECT 'fault with something', 'поломка/ошибка в чем-то', '/fɔlt wɪð ˈsʌmθɪŋ/', 'There seems to be a fault with the electrical system.' UNION ALL
    SELECT 'fix something', 'починить что-либо', '/fɪks ˈsʌmθɪŋ/', 'Can you fix my computer? It''s not working properly.' UNION ALL
    SELECT 'get a loan', 'получить кредит', '/ɡɛt ə loʊn/', 'We need to get a loan to buy our first house.' UNION ALL
    SELECT 'give a refund', 'дать возмещение', '/ɡɪv ə ˈrifʌnd/', 'The store agreed to give me a refund for the defective product.' UNION ALL
    SELECT 'get a refund', 'получить возмещение', '/ɡɛt ə ˈrifʌnd/', 'I managed to get a refund after complaining about the service.' UNION ALL
    SELECT 'guarantee', 'гарантия, гарантировать', '/ˌɡɛrənˈti/', 'This product comes with a two-year guarantee.' UNION ALL
    SELECT 'in each case', 'в каждом случае', '/ɪn iʧ keɪs/', 'In each case, the results were consistent with our predictions.' UNION ALL
    SELECT 'overcharge', 'назначать завышенную цену', '/ˈoʊvərˌʧɑrʤ/', 'The restaurant overcharged us for the drinks.' UNION ALL
    SELECT 'pay off', 'покрывать (долги)', '/peɪ ɔf/', 'It took them ten years to pay off their mortgage.' UNION ALL
    SELECT 'pile of rubbish', 'куча мусора', '/paɪl ʌv ˈrʌbɪʃ/', 'There was a pile of rubbish left on the sidewalk.' UNION ALL
    SELECT 'sort out (a problem)', 'разобраться с проблемой', '/sɔrt aʊt/', 'We need to sort out this problem before it gets worse.' UNION ALL
    SELECT 'sort out the gear', 'разобраться с передачами', '/sɔrt aʊt ðə ɡɪr/', 'I need to sort out the gear on my bicycle - it''s not shifting properly.' UNION ALL
    SELECT 'take something back', 'вернуть что-то (в магазин)', '/teɪk ˈsʌmθɪŋ bæk/', 'I need to take this sweater back because it doesn''t fit.' UNION ALL
    SELECT 'Good luck with everything', 'Удачи во всем', '/ɡʊd lʌk wɪð ˈɛvriθɪŋ/', 'Good luck with everything in your new job!' UNION ALL
    SELECT 'I bet he''s had enough by now', 'Готова поспорить, ему уже это надоело', '/aɪ bɛt hiz hæd ɪˈnaʊf baɪ naʊ/', 'I bet he''s had enough by now of all these meetings.' UNION ALL
    SELECT 'I bet you''re really annoyed', 'Ты, наверное, очень раздосадован', '/aɪ bɛt jʊr ˈrɪəli əˈnɔɪd/', 'I bet you''re really annoyed about the canceled flight.' UNION ALL
    SELECT 'I hope you get the job', 'Надеюсь, тебя возьмут на работу', '/aɪ hoʊp ju ɡɛt ðə ʤɑb/', 'I hope you get the job - you''d be perfect for it!' UNION ALL
    SELECT 'I really hope it all goes well', 'Я очень надеюсь, все будет хорошо', '/aɪ ˈrɪəli hoʊp ɪt ɔl ɡoʊz wɛl/', 'I really hope it all goes well with your surgery tomorrow.' UNION ALL
    SELECT 'I''m sorry to hear that', 'Мне жаль это слышать', '/aɪm ˈsɔri tu hɪr ðæt/', 'I''m sorry to hear that you''re not feeling well.' UNION ALL
    SELECT 'So what happened?', 'Итак, что случилось?', '/soʊ wʌt ˈhæpənd/', 'So what happened after I left the party?' UNION ALL
    SELECT 'So what happens next?', 'И что будет дальше?', '/soʊ wʌt ˈhæpənz nɛkst/', 'So what happens next in the story?' UNION ALL
    SELECT 'Well done!', 'молодец', '/wɛl dʌn/', 'Well done! You passed the exam with flying colors.' UNION ALL
    SELECT 'What a pain!', 'Какая досада!', '/wʌt ə peɪn/', 'What a pain! I forgot my keys at home again.' UNION ALL
    SELECT 'You poor thing!', 'бедняжка', '/ju pʊr θɪŋ/', 'You poor thing! You look exhausted after working all night.' UNION ALL
    SELECT 'You sound like you''ve made up your mind.', 'Похоже, ты уже определилась, что будешь делать', '/ju saʊnd laɪk juv meɪd ʌp jɔr maɪnd/', 'You sound like you''ve made up your mind about moving to another city.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);


-- Seed_B1Plus_Unit5_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'B1+'
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
    SELECT 'break even' AS english_word, 'выйти в ноль' AS russian_translation, '/breɪk ˈivən/' AS transcription, 'It took two years for the business to break even.' AS example_sentence UNION ALL
    SELECT 'competitor', 'конкурент', '/kəmˈpɛtətər/', 'Our main competitor just launched a new product.' UNION ALL
    SELECT 'Entrepreneur', 'бизнесмен, предприниматель', '/ˌɑntrəprəˈnɜr/', 'She''s a successful entrepreneur with three companies.' UNION ALL
    SELECT 'expand a business', 'расширять бизнес', '/ɪkˈspænd ə ˈbɪznəs/', 'They plan to expand the business to international markets.' UNION ALL
    SELECT 'launch a product', 'запустить продукт', '/lɔnʧ ə ˈprɑdəkt/', 'The company will launch a new product next month.' UNION ALL
    SELECT 'make a loss', 'нести убытки', '/meɪk ə lɔs/', 'The store made a loss in its first year of operation.' UNION ALL
    SELECT 'make a profit', 'получать прибыль', '/meɪk ə ˈprɑfət/', 'We hope to make a profit by the end of the quarter.' UNION ALL
    SELECT 'set up a business', 'основать бизнес', '/sɛt ʌp ə ˈbɪznəs/', 'It''s challenging to set up a business without experience.' UNION ALL
    SELECT 'take over a company', 'поглотить (захватить) компанию', '/teɪk ˈoʊvər ə ˈkʌmpəni/', 'The large corporation wants to take over our company.' UNION ALL
    SELECT 'wages', 'зарплата', '/ˈweɪʤɪz/', 'The workers demanded higher wages and better conditions.' UNION ALL
    SELECT 'warehouse', 'склад', '/ˈwɛrhaʊs/', 'We need a larger warehouse to store all the inventory.' UNION ALL
    SELECT 'be approved', 'быть одобренным', '/bi əˈpruvd/', 'The project must be approved by management before we start.' UNION ALL
    SELECT 'change mind', 'передумать', '/ʧeɪnʤ maɪnd/', 'I was going to buy the car, but I changed my mind.' UNION ALL
    SELECT 'come to nothing', 'ни к чему не привести', '/kʌm tu ˈnʌθɪŋ/', 'All our careful planning came to nothing when the event was cancelled.' UNION ALL
    SELECT 'date', 'свидание', '/deɪt/', 'They went on their first date last weekend.' UNION ALL
    SELECT 'destination', 'место назначения', '/ˌdɛstəˈneɪʃən/', 'Paris is our final destination on this trip.' UNION ALL
    SELECT 'get rid of', 'избавиться от', '/ɡɛt rɪd əv/', 'I need to get rid of these old clothes.' UNION ALL
    SELECT 'go ahead', 'продолжать', '/ɡoʊ əˈhɛd/', 'The project has been approved, so we can go ahead.' UNION ALL
    SELECT 'graduate', 'выпускаться из учебного заведения', '/ˈɡræʤuət/', 'She will graduate from university next spring.' UNION ALL
    SELECT 'offer', 'предлагать', '/ˈɔfər/', 'The company offered me a great job position.' UNION ALL
    SELECT 'possession', 'имущество, личные вещи', '/pəˈzɛʃən/', 'My most valuable possession is my grandmother''s ring.' UNION ALL
    SELECT 'quit', 'уволиться, бросать', '/kwɪt/', 'He decided to quit his job and travel the world.' UNION ALL
    SELECT 'receive permission', 'получить разрешение', '/rəˈsiv pərˈmɪʃən/', 'We need to receive permission before starting construction.' UNION ALL
    SELECT 'sort out', 'разобраться, решить проблему', '/sɔrt aʊt/', 'Let''s sort out this misunderstanding before it gets worse.' UNION ALL
    SELECT 'struggle', 'испытывать трудности с', '/ˈstrʌɡəl/', 'Many students struggle with advanced mathematics.' UNION ALL
    SELECT 'advise', 'советовать', '/ədˈvaɪz/', 'I would advise you to save money for emergencies.' UNION ALL
    SELECT 'affect', 'влиять', '/əˈfɛkt/', 'The weather can affect our travel plans significantly.' UNION ALL
    SELECT 'cover', 'покрывать, охватывать', '/ˈkʌvər/', 'Insurance should cover any medical expenses.' UNION ALL
    SELECT 'effect', 'эффект, воздействие', '/ɪˈfɛkt/', 'The new policy had a positive effect on employee morale.' UNION ALL
    SELECT 'encourage', 'поощрять', '/ɪnˈkɜrɪʤ/', 'Teachers should encourage students to ask questions.' UNION ALL
    SELECT 'explore', 'исследовать', '/ɪkˈsplɔr/', 'We should explore all options before making a decision.' UNION ALL
    SELECT 'feedback', 'обратная связь', '/ˈfidbæk/', 'Please give me feedback on my presentation.' UNION ALL
    SELECT 'individual attention', 'индивидуальное внимание', '/ˌɪndəˈvɪʤuəl əˈtɛnʃən/', 'Students benefit from individual attention from teachers.' UNION ALL
    SELECT 'maintain discipline', 'поддерживать дисциплину', '/meɪnˈteɪn ˈdɪsəplən/', 'It''s important to maintain discipline in the classroom.' UNION ALL
    SELECT 'perform', 'выполнять, выступать', '/pərˈfɔrm/', 'The students will perform in the school play tonight.' UNION ALL
    SELECT 'pressure', 'давление, давление', '/ˈprɛʃər/', 'There''s a lot of pressure to succeed in this company.' UNION ALL
    SELECT 'put someone off', 'оттолкнуть кого-то', '/pʊt ˈsʌmwʌn ɔf/', 'The rude service put me off that restaurant.' UNION ALL
    SELECT 'raise standards', 'повышать стандарты', '/reɪz ˈstændərdz/', 'We need to raise standards in our customer service.' UNION ALL
    SELECT 'recommend', 'рекомендовать', '/ˌrɛkəˈmɛnd/', 'I highly recommend this book to all mystery lovers.' UNION ALL
    SELECT 'succeed', 'преуспеть, успех', '/səkˈsid/', 'With hard work, you will succeed in your career.' UNION ALL
    SELECT 'suit', 'подходить, костюм', '/sut/', 'This job seems to suit your skills and interests.' UNION ALL
    SELECT 'Adapt', 'Адаптировать', '/əˈdæpt/', 'Animals must adapt to survive in changing environments.' UNION ALL
    SELECT 'advance', 'преимущество', '/ədˈvæns/', 'Technology gives us an advance in communication.' UNION ALL
    SELECT 'be concerned about', 'Быть заинтересованным в', '/bi kənˈsɜrnd əˈbaʊt/', 'I''m concerned about the environmental impact of this project.' UNION ALL
    SELECT 'benefit', 'Плюсы, бонусы', '/ˈbɛnəfɪt/', 'One benefit of this job is the flexible schedule.' UNION ALL
    SELECT 'ceremony', 'церемония', '/ˈsɛrəmoʊni/', 'The graduation ceremony will be held in the main hall.' UNION ALL
    SELECT 'Change', 'менять', '/ʧeɪnʤ/', 'Sometimes you need to change your approach to solve a problem.' UNION ALL
    SELECT 'change my mind', 'Изменить мнение', '/ʧeɪnʤ maɪ maɪnd/', 'After hearing your arguments, I changed my mind.' UNION ALL
    SELECT 'close down', 'Закрываться, прекращать деятельность', '/kloʊz daʊn/', 'The small bookstore had to close down due to competition.' UNION ALL
    SELECT 'consider', 'Считать, рассматривать', '/kənˈsɪdər/', 'We should consider all options before deciding.' UNION ALL
    SELECT 'convenient', 'удобный', '/kənˈvinjənt/', 'The hotel''s location is very convenient for tourists.' UNION ALL
    SELECT 'Depressing', 'депрессивный', '/dɪˈprɛsɪŋ/', 'The rainy weather was making everyone feel depressing.' UNION ALL
    SELECT 'destination', 'направление', '/ˌdɛstəˈneɪʃən/', 'Our destination for the summer vacation is Italy.' UNION ALL
    SELECT 'develop an idea', 'Развивать идею', '/dɪˈvɛləp ən aɪˈdiə/', 'We need to develop this idea into a complete business plan.' UNION ALL
    SELECT 'encourage', 'Мотивировать, приободрять', '/ɪnˈkɜrɪʤ/', 'Good teachers encourage students to think critically.' UNION ALL
    SELECT 'expand', 'расшириться', '/ɪkˈspænd/', 'The company plans to expand into Asian markets.' UNION ALL
    SELECT 'Fail to', 'Не суметь', '/feɪl tu/', 'I failed to complete the project on time.' UNION ALL
    SELECT 'focus on', 'Сконцентрироваться на', '/ˈfoʊkəs ɔn/', 'We need to focus on our main goals this quarter.' UNION ALL
    SELECT 'grow into', 'Дорости до, вырасти в', '/ɡroʊ ˈɪntu/', 'The small startup grew into a major corporation.' UNION ALL
    SELECT 'have influence on', 'Иметь влияние на', '/hæv ˈɪnfluəns ɔn/', 'Parents have significant influence on their children''s development.' UNION ALL
    SELECT 'I half agree', 'Частично (наполовину) согласен', '/aɪ hæf əˈɡri/', 'I half agree with your proposal, but I have some concerns.' UNION ALL
    SELECT 'improve security', 'Улучшить охрану/безопасность', '/ɪmˈpruv sɪˈkjʊrəti/', 'The airport needs to improve security measures.' UNION ALL
    SELECT 'instead', 'вместо', '/ɪnˈstɛd/', 'Let''s have tea instead of coffee this morning.' UNION ALL
    SELECT 'it is worth', 'Это того стоит', '/ɪt ɪz wɜrθ/', 'The long journey was difficult, but it was worth it.' UNION ALL
    SELECT 'It''s been a while', 'Очень давно', '/ɪts bɪn ə waɪl/', 'It''s been a while since we last saw each other.' UNION ALL
    SELECT 'lack of', 'недостаток', '/læk əv/', 'The project failed due to lack of funding.' UNION ALL
    SELECT 'launch', 'Запускать, начинать', '/lɔnʧ/', 'The company will launch its new advertising campaign next week.' UNION ALL
    SELECT 'No way!', 'бесполезно, ничего не выйдет; ни в коем случае', '/noʊ weɪ/', 'No way! I''m not going to agree to those terms.' UNION ALL
    SELECT 'open-minded', 'Открытый, с широким кругозором', '/ˈoʊpənˈmaɪndɪd/', 'She''s very open-minded and willing to consider new ideas.' UNION ALL
    SELECT 'permission', 'разрешение', '/pərˈmɪʃən/', 'You need permission to access this building after hours.' UNION ALL
    SELECT 'promote', 'способствовать', '/prəˈmoʊt/', 'Exercise promotes good health and well-being.' UNION ALL
    SELECT 'purchase', 'покупка, покупать', '/ˈpɜrʧəs/', 'I made a large purchase at the electronics store.' UNION ALL
    SELECT 'reduce taxes', 'Снизить налоги', '/rɪˈdus ˈtæksɪz/', 'The government plans to reduce taxes for small businesses.' UNION ALL
    SELECT 'replace', 'заменить', '/rɪˈpleɪs/', 'We need to replace the old equipment with new models.' UNION ALL
    SELECT 'set up', 'основать', '/sɛt ʌp/', 'They set up their own consulting business last year.' UNION ALL
    SELECT 'stressed', 'напряжённый', '/strɛst/', 'I feel stressed about the upcoming exams.' UNION ALL
    SELECT 'student loan', 'Кредит на обучение', '/ˈstudənt loʊn/', 'Many graduates are paying off their student loans.' UNION ALL
    SELECT 'take over', 'Взять на себя, перенять', '/teɪk ˈoʊvər/', 'The assistant will take over my duties while I''m away.' UNION ALL
    SELECT 'Taxes', 'налоги', '/ˈtæksɪz/', 'We need to file our taxes before the deadline.' UNION ALL
    SELECT 'to hold event', 'Проводить мероприятие', '/tu hoʊld ɪˈvɛnt/', 'The university will hold an event for new students.' UNION ALL
    SELECT 'Turn into', 'Превращать в', '/tɜrn ˈɪntu/', 'The old factory was turned into luxury apartments.' UNION ALL
    SELECT 'Turn up', 'появиться', '/tɜrn ʌp/', 'He finally turned up at the party after we''d been waiting for hours.' UNION ALL
    SELECT 'What do you fancy doing?', 'Что ты хочешь делать?', '/wʌt du ju ˈfænsi ˈduɪŋ/', 'What do you fancy doing this weekend?' UNION ALL
    SELECT 'You might be right', 'Возможно, ты прав', '/ju maɪt bi raɪt/', 'You might be right about changing our strategy.' UNION ALL
    SELECT 'A fair point', 'Справедливое замечание', '/ə fɛr pɔɪnt/', 'That''s a fair point - I hadn''t considered that aspect.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);


-- Seed_B1Plus_Unit6_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'B1+'
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
    SELECT 'a fan of something' AS english_word, 'фанат чего-то' AS russian_translation, '/ə fæn əv ˈsʌmθɪŋ/' AS transcription, 'I''m a big fan of science fiction movies.' AS example_sentence UNION ALL
    SELECT 'a fan of someone', 'фанат кого-то', '/ə fæn əv ˈsʌmwʌn/', 'She''s been a fan of that singer since high school.' UNION ALL
    SELECT 'be in tears', 'быть в слезах', '/bi ɪn tɪrz/', 'The movie was so sad that everyone was in tears.' UNION ALL
    SELECT 'blockbuster', 'блокбастер', '/ˈblɑkˌbʌstər/', 'The new superhero film is expected to be a blockbuster.' UNION ALL
    SELECT 'character', 'персонаж', '/ˈkærɪktər/', 'The main character in the story is very complex.' UNION ALL
    SELECT 'complex', 'сложный', '/kəmˈplɛks/', 'The plot was too complex for me to follow.' UNION ALL
    SELECT 'confusing', 'запутанный', '/kənˈfjuzɪŋ/', 'The timeline in the movie was confusing.' UNION ALL
    SELECT 'dialogue', 'диалог', '/ˈdaɪəˌlɔɡ/', 'The dialogue between the characters was very natural.' UNION ALL
    SELECT 'dreadful', 'ужасный', '/ˈdrɛdfəl/', 'The acting in that play was absolutely dreadful.' UNION ALL
    SELECT 'dull', 'скучный', '/dʌl/', 'I found the documentary rather dull and uninteresting.' UNION ALL
    SELECT 'ending', 'концовка', '/ˈɛndɪŋ/', 'The movie had a surprising twist ending.' UNION ALL
    SELECT 'enjoyable', 'приятный', '/ɪnˈdʒɔɪəbəl/', 'We had an enjoyable evening at the theater.' UNION ALL
    SELECT 'episode', 'эпизод', '/ˈɛpəˌsoʊd/', 'Last night''s episode of the series was incredible.' UNION ALL
    SELECT 'filming', 'съёмка', '/ˈfɪlmɪŋ/', 'The filming of the movie took six months.' UNION ALL
    SELECT 'hilarious', 'уморительный', '/hɪˈlɛriəs/', 'The comedy show was absolutely hilarious.' UNION ALL
    SELECT 'kill off', 'убить (персонажа)', '/kɪl ɔf/', 'The writers decided to kill off the main character.' UNION ALL
    SELECT 'make someone laugh', 'рассмешить кого-то', '/meɪk ˈsʌmwʌn læf/', 'Good comedians know how to make people laugh.' UNION ALL
    SELECT 'ordinary', 'обычный', '/ˈɔrdənˌɛri/', 'The story starts with an ordinary day in an ordinary town.' UNION ALL
    SELECT 'predictable', 'предсказуемый', '/prɪˈdɪktəbəl/', 'The plot was so predictable I knew the ending halfway through.' UNION ALL
    SELECT 'ridiculous', 'смехотворный', '/rɪˈdɪkjələs/', 'The situation in the comedy was completely ridiculous.' UNION ALL
    SELECT 'romantic', 'романтический', '/roʊˈmæntɪk/', 'They went to see a romantic comedy for their date.' UNION ALL
    SELECT 'scene', 'сцена', '/sin/', 'The final scene of the movie was very emotional.' UNION ALL
    SELECT 'series', 'сериал', '/ˈsɪriz/', 'This TV series has been running for five seasons.' UNION ALL
    SELECT 'shocking', 'шокирующий', '/ˈʃɑkɪŋ/', 'The documentary contained some shocking revelations.' UNION ALL
    SELECT 'special effects', 'спецэффекты', '/ˈspɛʃəl ɪˈfɛkts/', 'The special effects in the movie were amazing.' UNION ALL
    SELECT 'switch over', 'переключить', '/swɪʧ ˈoʊvər/', 'Let''s switch over to the news channel.' UNION ALL
    SELECT 'tense', 'напряжённый', '/tɛns/', 'The atmosphere in the thriller was very tense.' UNION ALL
    SELECT 'useless', 'бесполезный', '/ˈjusləs/', 'The information in that documentary was completely useless.' UNION ALL
    SELECT 'violent', 'жестокий', '/ˈvaɪələnt/', 'The movie was too violent for young children.' UNION ALL
    SELECT 'vote off', 'исключить голосованием', '/voʊt ɔf/', 'The judges decided to vote off the weakest contestant.' UNION ALL
    SELECT 'assess the damage', 'оценить убытки', '/əˈsɛs ðə ˈdæmɪʤ/', 'The insurance company will assess the damage to the car.' UNION ALL
    SELECT 'assess your fitness', 'оценить свою физическую форму', '/əˈsɛs jɔr ˈfɪtnəs/', 'The trainer will assess your fitness before creating a program.' UNION ALL
    SELECT 'assess your strengths and weaknesses', 'оценить свои сильные и слабые стороны', '/əˈsɛs jɔr strɛŋθs ænd ˈwiknəsɪz/', 'It''s important to assess your strengths and weaknesses in a job interview.' UNION ALL
    SELECT 'convenient', 'удобный', '/kənˈvinjənt/', 'The repair service offers convenient appointment times.' UNION ALL
    SELECT 'deliver a package', 'доставить посылку', '/dɪˈlɪvər ə ˈpækɪʤ/', 'The courier will deliver the package tomorrow morning.' UNION ALL
    SELECT 'deliver a pizza', 'доставить пиццу', '/dɪˈlɪvər ə ˈpitsə/', 'They promise to deliver pizza within 30 minutes.' UNION ALL
    SELECT 'do repairs', 'сделать ремонт', '/du rɪˈpɛrz/', 'We need to do repairs on the roof before winter.' UNION ALL
    SELECT 'do your hair', 'сделать причёску', '/du jɔr hɛr/', 'She went to the salon to do her hair for the wedding.' UNION ALL
    SELECT 'do your nails', 'делать маникюр', '/du jɔr neɪlz/', 'I''m going to do my nails before the party.' UNION ALL
    SELECT 'efficient', 'эффективный', '/ɪˈfɪʃənt/', 'The new system is much more efficient than the old one.' UNION ALL
    SELECT 'fix a broken light', 'Починить сломанный свет', '/fɪks ə ˈbroʊkən laɪt/', 'The electrician came to fix the broken light in the kitchen.' UNION ALL
    SELECT 'fix a pipe', 'починить трубу', '/fɪks ə paɪp/', 'We need a plumber to fix the leaking pipe.' UNION ALL
    SELECT 'fix the gears on my car', 'починить коробку передач на автомобиле', '/fɪks ðə ɡɪrz ɔn maɪ kɑr/', 'The mechanic will fix the gears on my car tomorrow.' UNION ALL
    SELECT 'leave a lot of mess', 'оставить сильный беспорядок', '/liv ə lɑt əv mɛs/', 'The construction workers left a lot of mess behind.' UNION ALL
    SELECT 'look at the injury', 'осмотреть рану/травму', '/lʊk æt ðə ˈɪnʤəri/', 'The doctor needs to look at the injury on your arm.' UNION ALL
    SELECT 'look at the problem', 'Посмотреть на проблему', '/lʊk æt ðə ˈprɑbləm/', 'Let''s look at the problem from a different angle.' UNION ALL
    SELECT 'make a copy', 'сделать копию', '/meɪk ə ˈkɑpi/', 'Can you make a copy of this document for me?' UNION ALL
    SELECT 'make a mistake', 'Сделать ошибку', '/meɪk ə mɪˈsteɪk/', 'It''s normal to make a mistake when learning something new.' UNION ALL
    SELECT 'make a photo album', 'сделать фото альбом', '/meɪk ə ˈfoʊtoʊ ˈælbəm/', 'I want to make a photo album of our vacation.' UNION ALL
    SELECT 'mess', 'беспорядок', '/mɛs/', 'The children made a mess in the living room.' UNION ALL
    SELECT 'reasonable price', 'адекватная/разумная цена', '/ˈrizənəbəl praɪs/', 'They offer good quality at a reasonable price.' UNION ALL
    SELECT 'reliable', 'надежный', '/rɪˈlaɪəbəl/', 'We need a reliable service provider for this project.' UNION ALL
    SELECT 'remove a mark on the jacket', 'удалять пятна на куртке', '/rɪˈmuv ə mɑrk ɔn ðə ˈʤækɪt/', 'The dry cleaner can remove the mark on your jacket.' UNION ALL
    SELECT 'remove a tooth', 'удалить зуб', '/rɪˈmuv ə tuθ/', 'The dentist had to remove a tooth that was badly decayed.' UNION ALL
    SELECT 'remove a wall', 'Снести стену', '/rɪˈmuv ə wɔl/', 'They decided to remove a wall to create an open-plan living area.' UNION ALL
    SELECT 'replace a flat tyre', 'заменить спущенную шину', '/rɪˈpleɪs ə flæt ˈtaɪər/', 'I need to replace the flat tyre on my bicycle.' UNION ALL
    SELECT 'replace my passport', 'заменить паспорт', '/rɪˈpleɪs maɪ ˈpæspɔrt/', 'I have to replace my passport before it expires.' UNION ALL
    SELECT 'replace the screen on my mobile', 'заменить экран мобильного телефона', '/rɪˈpleɪs ðə skrin ɔn maɪ ˈmoʊbəl/', 'It cost $200 to replace the screen on my mobile phone.' UNION ALL
    SELECT 'record temperature', 'записывать температуру', '/ˈrɛkərd ˈtɛmprəʧər/', 'The nurse will record your temperature every four hours.' UNION ALL
    SELECT 'profits drop', 'Прибыль упала', '/ˈprɑfəts drɑp/', 'The company''s profits dropped by 15% this quarter.' UNION ALL
    SELECT 'go on strike', 'объявлять забастовку', '/ɡoʊ ɔn straɪk/', 'The workers decided to go on strike for better wages.' UNION ALL
    SELECT 'breakthrough', 'прорыв, достижение', '/ˈbreɪkˌθru/', 'Scientists have made a major breakthrough in cancer research.' UNION ALL
    SELECT 'treatment', 'лечение', '/ˈtritmənt/', 'The new treatment has shown promising results.' UNION ALL
    SELECT 'hit', 'бить', '/hɪt/', 'The boxer managed to hit his opponent with a powerful punch.' UNION ALL
    SELECT 'injury', 'травма', '/ˈɪnʤəri/', 'The football player suffered a serious injury during the match.' UNION ALL
    SELECT 'guilty of', 'виноватый, виновный в чем-либо', '/ˈɡɪlti əv/', 'He was found guilty of stealing from the company.' UNION ALL
    SELECT 'sentence', 'приговор', '/ˈsɛntəns/', 'The judge will announce the sentence next week.' UNION ALL
    SELECT 'get rid of', 'избавится от', '/ɡɛt rɪd əv/', 'We need to get rid of these old files to make space.' UNION ALL
    SELECT 'opinion poll', 'голосование, опрос общества', '/əˈpɪnjən poʊl/', 'The latest opinion poll shows the government is losing support.' UNION ALL
    SELECT 'keep out of', 'избегать', '/kip aʊt əv/', 'You should keep out of trouble if you want to succeed.' UNION ALL
    SELECT 'quit', 'уволиться', '/kwɪt/', 'She decided to quit her job and start her own business.' UNION ALL
    SELECT 'I''m really sorry, but', 'Мне очень жаль, но', '/aɪm ˈrɪəli ˈsɑri bʌt/', 'I''m really sorry, but I can''t make it to your party.' UNION ALL
    SELECT 'I''m terrible sorry, but', 'Мне ужасно жаль, но', '/aɪm ˈtɛrəbəl ˈsɑri bʌt/', 'I''m terribly sorry, but I broke your favorite mug.' UNION ALL
    SELECT 'I am really sorry, but you missed your plane.', 'Мне очень жаль, но вы пропустили ваш вылет/самолёт.', '/aɪ æm ˈrɪəli ˈsɑri bʌt ju mɪst jɔr pleɪn/', 'I am really sorry, but you missed your plane and the next one is tomorrow.' UNION ALL
    SELECT 'I''m afraid not.', 'Боюсь, что нет.', '/aɪm əˈfreɪd nɑt/', 'Can you help me move this weekend? I''m afraid not, I''ll be away.' UNION ALL
    SELECT 'I''m afraid not, I can''t satisfy your request', 'Боюсь, что не могу удовлетворить вашу просьбу', '/aɪm əˈfreɪd nɑt aɪ kænt ˈsætɪsfaɪ jɔr rɪˈkwɛst/', 'I''m afraid not, I can''t satisfy your request for an extension.' UNION ALL
    SELECT 'I can only apologize.', 'Я могу только извиниться', '/aɪ kæn ˈoʊnli əˈpɑləˌʤaɪz/', 'For the inconvenience caused, I can only apologize.' UNION ALL
    SELECT 'Honestly, I really can''t get out of it', 'Честно говоря, я действительно не могу с этим справиться', '/ˈɑnɪstli aɪ ˈrɪəli kænt ɡɛt aʊt əv ɪt/', 'Honestly, I really can''t get out of this commitment.' UNION ALL
    SELECT 'Thanks for being so understanding.', 'Спасибо за понимание', '/θæŋks fɔr ˈbiɪŋ soʊ ˌʌndərˈstændɪŋ/', 'Thanks for being so understanding about the change of plans.' UNION ALL
    SELECT 'I would if I could, but I''m afraid it''s impossible.', 'Я бы это сделал, если бы мог, но, боюсь, это невозможно.', '/aɪ wʊd ɪf aɪ kʊd bʌt aɪm əˈfreɪd ɪts ɪmˈpɑsəbəl/', 'I would if I could, but I''m afraid it''s impossible to complete this by Friday.' UNION ALL
    SELECT 'I would if I could lend you my phone but I''m affraid it''s impossible, I''m waiting a call.', 'Если бы могла, я бы одолжила тебе телефон, но, боюсь, это невозможно, так как я жду звонок.', '/aɪ wʊd ɪf aɪ kʊd lɛnd ju maɪ foʊn bʌt aɪm əˈfreɪd ɪts ɪmˈpɑsəbəl aɪm ˈweɪtɪŋ ə kɔl/', 'I would if I could lend you my phone but I''m afraid it''s impossible, I''m waiting for an important call.' UNION ALL
    SELECT 'Let me assure you that it will not happen again.', 'Позвольте мне заверить вас, что это больше не повторится', '/lɛt mi əˈʃʊr ju ðæt ɪt wɪl nɑt ˈhæpən əˈɡɛn/', 'Let me assure you that it will not happen again - we''ve implemented new procedures.' UNION ALL
    SELECT 'I''ll do it tomorrow, I promise.', 'Я сделаю это завтра, обещаю', '/aɪl du ɪt təˈmɑroʊ aɪ ˈprɑməs/', 'I''ll do it tomorrow, I promise - I just have too much work today.' UNION ALL
    SELECT 'There really is nothing we can do about it.', 'Мы действительно ничего не можем с этим поделать.', '/ðɛr ˈrɪəli ɪz ˈnʌθɪŋ wi kæn du əˈbaʊt ɪt/', 'There really is nothing we can do about the weather affecting our plans.' UNION ALL
    SELECT 'I don''t like it any more than you do, but there''s nothing we can do about it.', 'Мне это нравится не больше, чем тебе, но мы ничего не можем с этим поделать.', '/aɪ doʊnt laɪk ɪt ˈɛni mɔr ðæn ju du bʌt ðɛrz ˈnʌθɪŋ wi kæn du əˈbaʊt ɪt/', 'I don''t like the decision any more than you do, but there''s nothing we can do about it.' UNION ALL
    SELECT 'These things happen.', 'Такое случается', '/ðiz θɪŋz ˈhæpən/', 'Don''t worry about spilling the wine - these things happen.' UNION ALL
    SELECT 'It is what it is.', 'что есть, то есть', '/ɪt ɪz wʌt ɪt ɪz/', 'We can''t change the situation, so it is what it is.' UNION ALL
    SELECT 'Don''t worry about it.', 'не переживай об этом', '/doʊnt ˈwɜri əˈbaʊt ɪt/', 'Don''t worry about it - everyone makes mistakes sometimes.' UNION ALL
    SELECT 'At least you phoned', 'По крайней мере, ты позвонил', '/æt list ju foʊnd/', 'You''re late, but at least you phoned to let me know.' UNION ALL
    SELECT 'At least you''re here now', 'По крайней мере, теперь ты здесь.', '/æt list jɔr hɪr naʊ/', 'You missed the beginning, but at least you''re here now.' UNION ALL
    SELECT 'I''ll make it a priority.', 'Я сделаю это приоритетом.', '/aɪl meɪk ɪt ə praɪˈɔrəti/', 'I''ll make it a priority to finish your request first thing tomorrow.' UNION ALL
    SELECT 'I''ll make it up to you.', 'Я сейчас все поправлю', '/aɪl meɪk ɪt ʌp tu ju/', 'I know I disappointed you, and I''ll make it up to you.' UNION ALL
    SELECT 'Don''t be silly. I''m sure...', 'Не глупи. Я уверен...', '/doʊnt bi ˈsɪli aɪm ʃʊr/', 'Don''t be silly. I''m sure they didn''t mean to exclude you.' UNION ALL
    SELECT 'I''ll give you the money for it.', 'Я дам тебе за это деньги.', '/aɪl ɡɪv ju ðə ˈmʌni fɔr ɪt/', 'I''ll give you the money for the broken vase tomorrow.' UNION ALL
    SELECT 'I really can''t get out of this complex situation.', 'Я действительно не могу выбраться из этой сложной ситуации.', '/aɪ ˈrɪəli kænt ɡɛt aʊt əv ðɪs kəmˈplɛks ˌsɪʧuˈeɪʃən/', 'I really can''t get out of this complex situation at work.' UNION ALL
    SELECT 'Well, I can only apologize for his rude behaviour.', 'Ну, я могу только извиниться за его грубое поведение.', '/wɛl aɪ kæn ˈoʊnli əˈpɑləˌʤaɪz fɔr hɪz rud bɪˈheɪvjər/', 'Well, I can only apologize for his rude behaviour - it was unacceptable.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);


-- Seed_B1Plus_Unit7_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'B1+'
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
    SELECT 'ache' AS english_word, 'боль, болеть' AS russian_translation, '/eɪk/' AS transcription, 'I have a headache that won''t go away.' AS example_sentence UNION ALL
    SELECT 'allergic reaction', 'аллергическая реакция', '/əˈlɜrdʒɪk riˈækʃən/', 'She had an allergic reaction to the new medication.' UNION ALL
    SELECT 'badly bruised', 'сильно ушибленный', '/ˈbædli bruzd/', 'His arm was badly bruised after the fall.' UNION ALL
    SELECT 'bags under your eyes', 'мешки под глазами', '/bæɡz ˈʌndər jɔr aɪz/', 'You have bags under your eyes - you should get more sleep.' UNION ALL
    SELECT 'bruise', 'синяк, ушиб', '/bruz/', 'I got a bruise on my leg when I bumped into the table.' UNION ALL
    SELECT 'have a high temperature', 'иметь высокую температуру', '/hæv ə haɪ ˈtɛmprəʧər/', 'The child has a high temperature and needs to see a doctor.' UNION ALL
    SELECT 'have a sore throat', 'болит горло', '/hæv ə sɔr θroʊt/', 'I can''t speak loudly because I have a sore throat.' UNION ALL
    SELECT 'have an appointment', 'иметь договорённость о встрече', '/hæv ən əˈpɔɪntmənt/', 'I have an appointment with the dentist at 3 PM.' UNION ALL
    SELECT 'have an injection', 'поставить укол', '/hæv ən ɪnˈʤɛkʃən/', 'You''ll need to have an injection for the vaccination.' UNION ALL
    SELECT 'have an X-ray', 'сделать рентген', '/hæv ən ˈɛksreɪ/', 'The doctor wants me to have an X-ray of my chest.' UNION ALL
    SELECT 'have stitches', 'наложить швы', '/hæv ˈstɪʧɪz/', 'The cut was so deep that I had to have stitches.' UNION ALL
    SELECT 'have treatment', 'проходить лечение', '/hæv ˈtritmənt/', 'She has to have treatment for her back pain twice a week.' UNION ALL
    SELECT 'injure', 'ранить, ушибить', '/ˈɪnʤər/', 'Be careful not to injure yourself while exercising.' UNION ALL
    SELECT 'keep getting a pain', 'постоянная боль', '/kip ˈɡɛtɪŋ ə peɪn/', 'I keep getting a pain in my shoulder when I lift heavy objects.' UNION ALL
    SELECT 'my neck feels stiff', 'моя шея затекла', '/maɪ nɛk filz stɪf/', 'My neck feels stiff after sleeping in an awkward position.' UNION ALL
    SELECT 'nasty cut', 'глубокий порез', '/ˈnæsti kʌt/', 'He got a nasty cut on his hand while cooking.' UNION ALL
    SELECT 'out of breath', 'запыхавшийся, задыхающийся', '/aʊt əv brɛθ/', 'After running up the stairs, I was completely out of breath.' UNION ALL
    SELECT 'pale', 'бледный', '/peɪl/', 'You look pale - are you feeling okay?' UNION ALL
    SELECT 'Pepper does not agree with me', 'Мне не идёт перец.', '/ˈpɛpər dʌz nɑt əˈɡri wɪð mi/', 'I can''t eat spicy food because pepper does not agree with me.' UNION ALL
    SELECT 'sore throat', 'больное горло', '/sɔr θroʊt/', 'Drink some tea with honey for your sore throat.' UNION ALL
    SELECT 'stiff', 'жесткий', '/stɪf/', 'My muscles feel stiff after yesterday''s workout.' UNION ALL
    SELECT 'strain a muscle', 'растянуть мышцу', '/streɪn ə ˈmʌsəl/', 'I think I strained a muscle in my back at the gym.' UNION ALL
    SELECT 'White wine doesn''t agree with me.', 'Белое вино мне не по душе.', '/waɪt waɪn ˈdʌzənt əˈɡri wɪð mi/', 'I prefer red wine because white wine doesn''t agree with me.' UNION ALL
    SELECT 'a generous person', 'щедрый человек', '/ə ˈʤɛnərəs ˈpɜrsən/', 'My grandmother was always a generous person who helped everyone.' UNION ALL
    SELECT 'annual salary', 'годовая зарплата', '/ˈænjuəl ˈsæləri/', 'His annual salary increased after the promotion.' UNION ALL
    SELECT 'average', 'средний, среднестатистический', '/ˈævərɪʤ/', 'The average temperature in July is 25 degrees Celsius.' UNION ALL
    SELECT 'cashless society', 'безналичное общество', '/ˈkæʃləs səˈsaɪəti/', 'We''re moving towards a cashless society with digital payments.' UNION ALL
    SELECT 'charity', 'благотворительность', '/ˈʧærəti/', 'They donated a large sum of money to charity.' UNION ALL
    SELECT 'debts', 'долги', '/dɛts/', 'Many students graduate with significant student loan debts.' UNION ALL
    SELECT 'earnings', 'заработки', '/ˈɜrnɪŋz/', 'Her monthly earnings have doubled since she changed jobs.' UNION ALL
    SELECT 'I bet', 'Готов поспорить', '/aɪ bɛt/', 'I bet it will rain this afternoon.' UNION ALL
    SELECT 'I doubt', 'я сомневаюсь', '/aɪ daʊt/', 'I doubt they''ll arrive on time with this traffic.' UNION ALL
    SELECT 'I wonder', 'мне интересно, хотел бы я знать', '/aɪ ˈwʌndər/', 'I wonder what time the meeting will end.' UNION ALL
    SELECT 'income tax', 'подоходный налог', '/ˈɪnˌkʌm tæks/', 'We need to file our income tax returns by April 15th.' UNION ALL
    SELECT 'rate', 'соотношение (пропорция)', '/reɪt/', 'The unemployment rate has decreased this quarter.' UNION ALL
    SELECT 'staff', 'сотрудники, персонал', '/stæf/', 'The hotel staff were very helpful during our stay.' UNION ALL
    SELECT 'the entire world', 'весь мир', '/ði ɪnˈtaɪər wɜrld/', 'The internet has connected the entire world.' UNION ALL
    SELECT 'the value', 'ценность', '/ðə ˈvælju/', 'The value of this antique has increased over time.' UNION ALL
    SELECT 'to afford', 'позволить себе', '/tu əˈfɔrd/', 'I can''t afford to buy a new car right now.' UNION ALL
    SELECT 'to be in debt', 'быть в долгах', '/tu bi ɪn dɛt/', 'Many people are in debt due to credit card spending.' UNION ALL
    SELECT 'to be wealthy', 'быть богатым', '/tu bi ˈwɛlθi/', 'He became wealthy through smart investments.' UNION ALL
    SELECT 'to owe', 'быть должным, быть обязанным', '/tu oʊ/', 'I owe my sister $50 that I borrowed last week.' UNION ALL
    SELECT 'brake', 'тормозить', '/breɪk/', 'You need to brake gently when driving on icy roads.' UNION ALL
    SELECT 'breakdown', 'поломка', '/ˈbreɪkdaʊn/', 'We had a breakdown on the highway and had to call for help.' UNION ALL
    SELECT 'crash', 'разбить, разрушить', '/kræʃ/', 'The car crashed into the tree during the storm.' UNION ALL
    SELECT 'engine', 'мотор, двигатель', '/ˈɛnʤən/', 'The car''s engine needs to be serviced regularly.' UNION ALL
    SELECT 'fail your driving test', 'провалить экзамен по вождению', '/feɪl jɔr ˈdraɪvɪŋ tɛst/', 'She was disappointed to fail her driving test for the second time.' UNION ALL
    SELECT 'fine', 'штраф', '/faɪn/', 'I received a fine for parking in a no-parking zone.' UNION ALL
    SELECT 'flat tyre', 'спущенная шина', '/flæt ˈtaɪər/', 'We had to stop because we got a flat tyre.' UNION ALL
    SELECT 'footpath', 'пешеходная дорожка', '/ˈfʊtpæθ/', 'The footpath through the park is perfect for walking.' UNION ALL
    SELECT 'helmet', 'шлем, каска', '/ˈhɛlmət/', 'Always wear a helmet when riding a bicycle.' UNION ALL
    SELECT 'in second gear', 'вторая передача', '/ɪn ˈsɛkənd ɡɪr/', 'Drive in second gear when going up steep hills.' UNION ALL
    SELECT 'lorry driver', 'водитель грузовика', '/ˈlɔri ˈdraɪvər/', 'The lorry driver delivered the goods on time.' UNION ALL
    SELECT 'lose control', 'потерять контроль', '/luz kənˈtroʊl/', 'The driver lost control of the vehicle on the slippery road.' UNION ALL
    SELECT 'park', 'парковаться', '/pɑrk/', 'It''s difficult to park in the city center during rush hour.' UNION ALL
    SELECT 'petrol station', 'бензозаправка', '/ˈpɛtrəl ˈsteɪʃən/', 'We need to stop at the next petrol station for fuel.' UNION ALL
    SELECT 'Points', 'баллы', '/pɔɪnts/', 'I earned enough points to get a free flight.' UNION ALL
    SELECT 'pull out', 'вытаскивать, вынимать; отъезжать, выезжать', '/pʊl aʊt/', 'Always check your mirrors before you pull out into traffic.' UNION ALL
    SELECT 'Could you (maybe check with someone else)?', 'Не могли бы вы (возможно ли спросить у кого-то ещё)?', '/kʊd ju (ˈmeɪbi ʧɛk wɪð ˈsʌmwʌn ɛls)/', 'Could you maybe check with someone else about the availability?' UNION ALL
    SELECT 'Couldn''t you (just go in with her)?', 'Не могли бы вы  (просто зайти за ней)?', '/ˈkʊdənt ju (ʤʌst ɡoʊ ɪn wɪð hɜr)/', 'Couldn''t you just go in with her to make sure she''s okay?' UNION ALL
    SELECT 'I can''t thank you enough.', 'Не знаю, как вас отблагодарить!', '/aɪ kænt θæŋk ju ɪˈnʌf/', 'I can''t thank you enough for all your help with the project.' UNION ALL
    SELECT 'I shouldn''t really do that.', 'Мне реально не следует этого делать.', '/aɪ ˈʃʊdənt ˈrɪəli du ðæt/', 'I shouldn''t really do that without my manager''s approval.' UNION ALL
    SELECT 'I suppose I could (print new tickets).', 'Я полагаю я мог бы (напечатать новые билеты)', '/aɪ səˈpoʊz aɪ kʊd (prɪnt nu ˈtɪkəts)/', 'I suppose I could print new tickets if the system allows it.' UNION ALL
    SELECT 'I suppose we could (print new tickets).', 'Я полагаю мы могли бы (напечатать новые билеты)', '/aɪ səˈpoʊz wi kʊd (prɪnt nu ˈtɪkəts)/', 'I suppose we could print new tickets as an exception this time.' UNION ALL
    SELECT 'I''d be really grateful if you could (do that).', 'Я был бы  очень благодарен, если бы вы смогли (сделать это).', '/aɪd bi ˈrɪəli ˈɡreɪtfəl ɪf ju kʊd (du ðæt)/', 'I''d be really grateful if you could help me with this problem.' UNION ALL
    SELECT 'I''d really appreciate it.', 'Я был бы очень благодарен.', '/aɪd ˈrɪəli əˈpriʃiˌeɪt ɪt/', 'If you could send me the documents today, I''d really appreciate it.' UNION ALL
    SELECT 'Is there (really) nothing you can do?', 'Неужели вы реально ничего не можете сделать?', '/ɪz ðɛr (ˈrɪəli) ˈnʌθɪŋ ju kæn du/', 'Is there really nothing you can do to help us get on this flight?' UNION ALL
    SELECT 'Is there any way you could (possibly check)?', 'Есть ли способ (возможно проверить)?', '/ɪz ðɛr ˈɛni weɪ ju kʊd (ˈpɑsəbli ʧɛk)/', 'Is there any way you could possibly check if there are any cancellations?' UNION ALL
    SELECT 'Let me have a look.', 'Дайте мне взглянуть.', '/lɛt mi hæv ə lʊk/', 'Let me have a look at the system to see what I can do.' UNION ALL
    SELECT 'Let me see what I can do.', 'Я посмотрю, что я смогу сделать.', '/lɛt mi si wʌt aɪ kæn du/', 'Let me see what I can do to resolve this situation for you.' UNION ALL
    SELECT 'Let me speak to my manager.', 'Разрешите мне поговорить з менеджером.', '/lɛt mi spik tu maɪ ˈmænɪʤər/', 'Let me speak to my manager about making an exception.' UNION ALL
    SELECT 'Strictly speaking, I need (to give her a new ticket).', 'Строго говоря, мне нужно (дать ей новый билет).', '/ˈstrɪktli ˈspikɪŋ aɪ nid (tu ɡɪv hɜr ə nu ˈtɪkət)/', 'Strictly speaking, I need to follow the company policy.' UNION ALL
    SELECT 'That''s great.', 'Это здорово!', '/ðæts ɡreɪt/', 'That''s great news about your promotion!' UNION ALL
    SELECT 'We''re not supposed to (exchange them without a receipt).', 'Мы не должны (обменивать их без чека)', '/wir nɑt səˈpoʊzd tu (ɪksˈʧeɪnʤ ðɛm wɪˈθaʊt ə rɪˈsit)/', 'We''re not supposed to exchange items without a receipt according to store policy.' UNION ALL
    SELECT 'You''d be doing me a huge favour.', 'Вы бы оказали мне огромную услугу.', '/jud bi ˈduɪŋ mi ə hjuʤ ˈfeɪvər/', 'If you could cover my shift, you''d be doing me a huge favour.' UNION ALL
    SELECT 'You''d be really helping me out.', 'Вы бы очень помогли мне.', '/jud bi ˈrɪəli ˈhɛlpɪŋ mi aʊt/', 'If you could lend me your notes, you''d be really helping me out.' UNION ALL
    SELECT 'You''d be really helping us out.', 'Вы бы очень помогли нам.', '/jud bi ˈrɪəli ˈhɛlpɪŋ ʌs aʊt/', 'If you could volunteer this weekend, you''d be really helping us out.' UNION ALL
    SELECT 'You''ve been really helpful.', 'Вы очень помогли', '/juv bɪn ˈrɪəli ˈhɛlpfəl/', 'Thank you for your assistance - you''ve been really helpful.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);


-- Seed_B1Plus_Unit8_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'B1+'
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
    SELECT 'cause' AS english_word, 'вызывать, быть причиной' AS russian_translation, '/kɔz/' AS transcription, 'Smoking can cause serious health problems.' AS example_sentence UNION ALL
    SELECT 'check out', 'перепроверить', '/ʧɛk aʊt/', 'Can you check out these numbers before the meeting?' UNION ALL
    SELECT 'climate change', 'изменения климата', '/ˈklaɪmət ʧeɪnʤ/', 'Climate change is affecting weather patterns worldwide.' UNION ALL
    SELECT 'consume', 'потреблять', '/kənˈsum/', 'We should consume less plastic to protect the environment.' UNION ALL
    SELECT 'develop', 'развивать', '/dɪˈvɛləp/', 'The company plans to develop new eco-friendly products.' UNION ALL
    SELECT 'die out', 'вымирать', '/daɪ aʊt/', 'Many animal species are in danger of dying out.' UNION ALL
    SELECT 'drought', 'засуха', '/draʊt/', 'The drought has severely affected farmers in the region.' UNION ALL
    SELECT 'experience', 'пробовать', '/ɪkˈspɪriəns/', 'I''d like to experience living in another country.' UNION ALL
    SELECT 'fall out', 'ссориться', '/fɔl aʊt/', 'They fell out over money and haven''t spoken since.' UNION ALL
    SELECT 'famine', 'Голод (стихийное бедствие)', '/ˈfæmən/', 'International aid helped prevent famine in the region.' UNION ALL
    SELECT 'flood', 'наводнение', '/flʌd/', 'The heavy rain caused a flood in the city center.' UNION ALL
    SELECT 'hang out', 'тусоваться', '/hæŋ aʊt/', 'We usually hang out at the coffee shop after work.' UNION ALL
    SELECT 'hurricane', 'ураган', '/ˈhɜrəˌkeɪn/', 'The hurricane damaged many homes along the coast.' UNION ALL
    SELECT 'miss out', 'пропускать', '/mɪs aʊt/', 'Don''t miss out on this great opportunity!' UNION ALL
    SELECT 'natural resources', 'Природные ресурсы', '/ˈnæʧərəl ˈrisɔrsɪz/', 'We need to protect our natural resources for future generations.' UNION ALL
    SELECT 'overpopulation', 'перенаселение', '/ˌoʊvərˌpɑpjəˈleɪʃən/', 'Overpopulation is a major challenge in many cities.' UNION ALL
    SELECT 'plastic waste', 'Пластиковые отходы', '/ˈplæstɪk weɪst/', 'Plastic waste in the ocean is harming marine life.' UNION ALL
    SELECT 'pollution', 'загрязнение', '/pəˈluʃən/', 'Air pollution has become a serious problem in big cities.' UNION ALL
    SELECT 'prevent', 'предотвратить', '/prɪˈvɛnt/', 'We can prevent many diseases with proper vaccination.' UNION ALL
    SELECT 'produce', 'Производить, делать', '/prəˈdus/', 'The factory produces electronic components.' UNION ALL
    SELECT 'recycle', 'перерабатывать', '/riˈsaɪkəl/', 'Please remember to recycle paper and plastic.' UNION ALL
    SELECT 'reproduce', 'Размножаться, производить', '/ˌriprəˈdus/', 'These animals reproduce very quickly in warm weather.' UNION ALL
    SELECT 'rising sea levels', 'Подъём уровня моря', '/ˈraɪzɪŋ si ˈlɛvəlz/', 'Rising sea levels threaten coastal communities.' UNION ALL
    SELECT 'run out', 'закончиться', '/rʌn aʊt/', 'We''re running out of time to complete the project.' UNION ALL
    SELECT 'solve', 'решать', '/sɑlv/', 'Engineers are working to solve the technical problem.' UNION ALL
    SELECT 'sort out', 'Разбирать, сортировать', '/sɔrt aʊt/', 'I need to sort out my clothes before the move.' UNION ALL
    SELECT 'speak out', 'высказаться', '/spik aʊt/', 'It''s important to speak out against injustice.' UNION ALL
    SELECT 'storm', 'гроза, буря, ураган', '/stɔrm/', 'The storm knocked down trees and power lines.' UNION ALL
    SELECT 'toxic gases', 'Токсичные газы', '/ˈtɑksɪk ˈɡæsɪz/', 'Factories must reduce their emission of toxic gases.' UNION ALL
    SELECT 'volcanic eruption', 'Извержение вулкана', '/vɑlˈkænɪk ɪˈrʌpʃən/', 'The volcanic eruption forced thousands to evacuate.' UNION ALL
    SELECT 'waste', 'отходы', '/weɪst/', 'Food waste is a major environmental concern.' UNION ALL
    SELECT 'work out', 'Заниматься спортом, выработать', '/wɜrk aʊt/', 'I work out at the gym three times a week.' UNION ALL
    SELECT 'bright kid', 'Разумный ребёнок', '/braɪt kɪd/', 'She''s a bright kid who excels in mathematics.' UNION ALL
    SELECT 'close friends', 'близкие друзья', '/kloʊs frɛndz/', 'We''ve been close friends since elementary school.' UNION ALL
    SELECT 'come from similar backgrounds', 'иметь одинаковое происхождение', '/kʌm frəm ˈsɪmələr ˈbækˌɡraʊndz/', 'They come from similar backgrounds and share many values.' UNION ALL
    SELECT 'cute', 'милый, симпатичный, привлекательный', '/kjut/', 'The puppy was so cute that everyone wanted to pet it.' UNION ALL
    SELECT 'get to know sb', 'Познакомиться с кем-то', '/ɡɛt tu noʊ ˈsʌmbədi/', 'It takes time to get to know someone properly.' UNION ALL
    SELECT 'go back a long way', 'Знать друг друга с давних времён', '/ɡoʊ bæk ə lɔŋ weɪ/', 'We go back a long way - we were childhood friends.' UNION ALL
    SELECT 'go separate ways', 'Пойти разными дорогами', '/ɡoʊ ˈsɛpərɪt weɪz/', 'After university, we went our separate ways.' UNION ALL
    SELECT 'lack of confidence', 'Нехватка уверенности', '/læk əv ˈkɑnfədəns/', 'His lack of confidence sometimes holds him back.' UNION ALL
    SELECT 'lose touch', 'Потерять связь', '/luz tʌʧ/', 'We lost touch after she moved to another country.' UNION ALL
    SELECT 'nasty', 'неприятный, обидный, противный', '/ˈnæsti/', 'He made a nasty comment about her appearance.' UNION ALL
    SELECT 'nephew/niece', 'Племянник/племянница', '/ˈnɛfju/ /nis/', 'My nephew is coming to visit us this weekend.' UNION ALL
    SELECT 'patience, patient', 'Терпение, терпеливый', '/ˈpeɪʃəns/, /ˈpeɪʃənt/', 'Teaching requires a lot of patience.' UNION ALL
    SELECT 'racist', 'расистский, расист', '/ˈreɪsɪst/', 'Racist behavior is completely unacceptable.' UNION ALL
    SELECT 'reliable', 'надёжный', '/rɪˈlaɪəbəl/', 'She''s a reliable employee who always meets deadlines.' UNION ALL
    SELECT 'see eye to eye', 'сходиться во взглядах', '/si aɪ tu aɪ/', 'We don''t always see eye to eye on politics.' UNION ALL
    SELECT 'stay calm', 'Оставаться спокойным', '/steɪ kɑm/', 'It''s important to stay calm in emergency situations.' UNION ALL
    SELECT 'strict', 'строгий, суровый', '/strɪkt/', 'My parents were strict about homework and bedtime.' UNION ALL
    SELECT 'sweet', 'милый', '/swit/', 'That was a sweet gesture - bringing flowers.' UNION ALL
    SELECT 'whatever', 'любой, какой бы ни', '/wətˈɛvər/', 'You can choose whatever color you prefer.' UNION ALL
    SELECT 'whenever', 'Когда угодно', '/wɛnˈɛvər/', 'You can call me whenever you need help.' UNION ALL
    SELECT 'wherever', 'Где угодно', '/wɛrˈɛvər/', 'I''ll follow you wherever you go.' UNION ALL
    SELECT 'whoever', 'Кто бы ни был', '/huˈɛvər/', 'Whoever wins the competition will get a prize.' UNION ALL
    SELECT 'Willing', 'готовый', '/ˈwɪlɪŋ/', 'I''m willing to help you with your project.' UNION ALL
    SELECT 'accident', 'несчастный случай', '/ˈæksədənt/', 'He had a car accident on his way to work.' UNION ALL
    SELECT 'anniversary', 'юбилей, годовщина', '/ˌænəˈvɜrsəri/', 'They celebrated their 25th wedding anniversary.' UNION ALL
    SELECT 'announce', 'Объявлять, сообщать', '/əˈnaʊns/', 'The company will announce its new product next week.' UNION ALL
    SELECT 'Be adopted', 'Быть усыновлённым', '/bi əˈdɑptɪd/', 'She was adopted when she was just a baby.' UNION ALL
    SELECT 'divorced', 'Разведённый', '/dɪˈvɔrst/', 'My parents got divorced when I was ten years old.' UNION ALL
    SELECT 'do a degree', 'Получать степень', '/du ə dɪˈɡri/', 'I want to do a degree in computer science.' UNION ALL
    SELECT 'engage, engagement', 'Обручиться, обручение', '/ɪnˈɡeɪʤ/, /ɪnˈɡeɪʤmənt/', 'They announced their engagement at the family dinner.' UNION ALL
    SELECT 'Financial flexibility', 'Финансовая свобода', '/faɪˈnænʃəl ˌflɛksəˈbɪləti/', 'Having financial flexibility allows you to make career changes.' UNION ALL
    SELECT 'find ...annoying', 'находить (что-то) раздражающим', '/faɪnd əˈnɔɪɪŋ/', 'I find loud chewing really annoying.' UNION ALL
    SELECT 'Get angry at', 'злиться на', '/ɡɛt ˈæŋɡri æt/', 'Don''t get angry at me - it wasn''t my fault!' UNION ALL
    SELECT 'get married', 'Выйти замуж, пожениться', '/ɡɛt ˈmærid/', 'They plan to get married next summer.' UNION ALL
    SELECT 'get used to', 'Привыкнуть к', '/ɡɛt just tu/', 'It took me a while to get used to the new schedule.' UNION ALL
    SELECT 'graduate', 'Выпускаться, закончить учёбу', '/ˈɡræʤuˌeɪt/', 'She will graduate from medical school next year.' UNION ALL
    SELECT 'hold a ceremony', 'проводить церемонию', '/hoʊld ə ˈsɛrəˌmoʊni/', 'The university will hold a graduation ceremony in June.' UNION ALL
    SELECT 'in a relationship', 'В отношениях', '/ɪn ə rɪˈleɪʃənʃɪp/', 'They''ve been in a relationship for two years.' UNION ALL
    SELECT 'leave home', 'выходить из дома', '/liv hoʊm/', 'Most young people leave home when they go to university.' UNION ALL
    SELECT 'life-changing', 'Меняющий жизнь', '/ˈlaɪfˌʧeɪnʤɪŋ/', 'Winning the lottery was a life-changing event.' UNION ALL
    SELECT 'live life to the fullest', 'Жить полной жизнью', '/lɪv laɪf tu ðə ˈfʊləst/', 'After his recovery, he decided to live life to the fullest.' UNION ALL
    SELECT 'live together', 'Жить вместе', '/lɪv təˈɡɛðər/', 'Many couples live together before getting married.' UNION ALL
    SELECT 'lose, lost, lost', 'терять', '/luz, lɔst, lɔst/', 'I always lose my keys when I''m in a hurry.' UNION ALL
    SELECT 'mortgage', 'Ипотека, заём', '/ˈmɔrɡɪʤ/', 'They took out a mortgage to buy their first house.' UNION ALL
    SELECT 'move', 'переезжать', '/muv/', 'We''re going to move to a bigger apartment next month.' UNION ALL
    SELECT 'partner', 'партнёр, напарник, участник', '/ˈpɑrtnər/', 'My business partner and I started the company together.' UNION ALL
    SELECT 'pass away', 'Умереть (отойти в вечность)', '/pæs əˈweɪ/', 'Her grandmother passed away last year.' UNION ALL
    SELECT 'pay off', 'расплатиться', '/peɪ ɔf/', 'It took them 20 years to pay off their mortgage.' UNION ALL
    SELECT 'perspective, outlook', 'Перспектива, взгляд на', '/pərˈspɛktɪv/, /ˈaʊtˌlʊk/', 'Traveling gives you a different perspective on life.' UNION ALL
    SELECT 'Propose', 'предлагать', '/prəˈpoʊz/', 'He plans to propose to his girlfriend on their vacation.' UNION ALL
    SELECT 'retire', 'Выйти на пенсию', '/rɪˈtaɪər/', 'My father will retire next year after 40 years of work.' UNION ALL
    SELECT 'separated', 'разлученный', '/ˈsɛpəˌreɪtɪd/', 'They''ve been separated for six months but not divorced.' UNION ALL
    SELECT 'take a year off', 'Взять перерыв на год', '/teɪk ə jɪr ɔf/', 'I want to take a year off to travel around the world.' UNION ALL
    SELECT 'take things for granted', 'Принимать как должное', '/teɪk θɪŋz fɔr ˈɡræntɪd/', 'Don''t take your health for granted - take care of yourself.' UNION ALL
    SELECT 'to be born', 'бути рождённым', '/tu bi bɔrn/', 'I was born in a small town in the countryside.' UNION ALL
    SELECT 'to be pregnant', 'Быть беременной', '/tu bi ˈprɛɡnənt/', 'She''s pregnant with their first child.' UNION ALL
    SELECT 'to give birth', 'родить', '/tu ɡɪv bɜrθ/', 'She gave birth to a healthy baby boy yesterday.' UNION ALL
    SELECT 'to have a baby', 'Родить ребёнка', '/tu hæv ə ˈbeɪbi/', 'They''re excited to have a baby next spring.' UNION ALL
    SELECT 'turn (+age)', 'исполняться', '/tɜrn/', 'I''ll turn 30 next month.' UNION ALL
    SELECT 'unconditional love', 'Безусловная любовь', '/ˌʌnkənˈdɪʃənəl lʌv/', 'Parents often have unconditional love for their children.' UNION ALL
    SELECT 'We made up', 'Мы помирились', '/wi meɪd ʌp/', 'After our argument, we made up and are friends again.' UNION ALL
    SELECT 'without a doubt', 'без сомнения', '/wɪˈθaʊt ə daʊt/', 'She is without a doubt the best candidate for the job.' UNION ALL
    SELECT 'backdrop', 'задний фон, тыл', '/ˈbækdrɑp/', 'The mountains provided a beautiful backdrop for the wedding.' UNION ALL
    SELECT 'be through to', 'Быть соединенным (по телефону)', '/bi θru tu/', 'You''re through to the customer service department.' UNION ALL
    SELECT 'catastrophe', 'катастрофа', '/kəˈtæstrəfi/', 'The earthquake was a catastrophe for the region.' UNION ALL
    SELECT 'cut a dress', 'Раскроить платье', '/kʌt ə drɛs/', 'She learned how to cut a dress pattern in sewing class.' UNION ALL
    SELECT 'debit card', 'дебетовая карта, зарплатная карта', '/ˈdɛbɪt kɑrd/', 'I paid with my debit card at the supermarket.' UNION ALL
    SELECT 'descent', 'спуск, снижение', '/dɪˈsɛnt/', 'The airplane began its descent towards the airport.' UNION ALL
    SELECT 'dial', 'набрать номер', '/ˈdaɪəl/', 'Please dial 9 to get an outside line.' UNION ALL
    SELECT 'dreadful', 'пугающий', '/ˈdrɛdfəl/', 'The weather was dreadful during our entire vacation.' UNION ALL
    SELECT 'enroll', ' Записаться, зарегистрироваться', '/ɪnˈroʊl/', 'You need to enroll in the course before the deadline.' UNION ALL
    SELECT 'estate', 'недвижимость', '/ɪˈsteɪt/', 'They own a large estate in the countryside.' UNION ALL
    SELECT 'estate agent', 'риелтор', '/ɪˈsteɪt ˈeɪʤənt/', 'The estate agent showed us several apartments.' UNION ALL
    SELECT 'extension number', 'Внутренний номер, дополнительный номер', '/ɪkˈstɛnʃən ˈnʌmbər/', 'If you know the extension number, please dial it now.' UNION ALL
    SELECT 'grand piano', 'фортепиано', '/ɡrænd piˈænoʊ/', 'There was a beautiful grand piano in the concert hall.' UNION ALL
    SELECT 'heating', 'отопление', '/ˈhitɪŋ/', 'We need to turn on the heating - it''s getting cold.' UNION ALL
    SELECT 'How can I help you?', 'Чем я могу вам помочь?', '/haʊ kæn aɪ hɛlp ju/', 'Good morning! How can I help you today?' UNION ALL
    SELECT 'I have a problem with... and I wondered if you could ...', 'У меня проблема с ... и я хотел бы спросить,  не могли бы вы ...', '/aɪ hæv ə ˈprɑbləm wɪð ænd aɪ ˈwʌndərd ɪf ju kʊd/', 'I have a problem with my order and I wondered if you could help me.' UNION ALL
    SELECT 'I wanted to know if ....', 'Я хотел знать, если ...', '/aɪ ˈwɑntɪd tu noʊ ɪf/', 'I wanted to know if you have any available appointments.' UNION ALL
    SELECT 'I was ringing to (see if it was still available).', 'Я позвонила, чтобы узнать, доступно ли это ещё.', '/aɪ wəz ˈrɪŋɪŋ tu (si ɪf ɪt wəz stɪl əˈveɪləbəl)/', 'I was ringing to see if the apartment was still available.' UNION ALL
    SELECT 'I''d like to (know/order/get)...', 'Я хотел бы знать, заказать, получить', '/aɪd laɪk tu (noʊ/ˈɔrdər/ɡɛt)/', 'I''d like to order a pizza for delivery, please.' UNION ALL
    SELECT 'If you know the extension number you require, please dial now.', 'Если вы знаете внутренний номер, нужный вам, пожалуйста, наберите сейчас', '/ɪf ju noʊ ði ɪkˈstɛnʃən ˈnʌmbər ju rɪˈkwaɪr pliz ˈdaɪəl naʊ/', 'If you know the extension number you require, please dial now.' UNION ALL
    SELECT 'I''m interested in (classes).', 'Мне интересно/Я заинтересован в (занятиях).', '/aɪm ˈɪntrəstɪd ɪn (ˈklæsɪz)/', 'I''m interested in signing up for Spanish classes.' UNION ALL
    SELECT 'I''m ringing about (our heating).', 'Я звоню насчёт (нашего отопления).', '/aɪm ˈrɪŋɪŋ əˈbaʊt (aʊr ˈhitɪŋ)/', 'I''m ringing about our heating - it''s not working properly.' UNION ALL
    SELECT 'Let me put you through to [department name].', 'Разрешите соединить вас с (отделом .....).', '/lɛt mi pʊt ju θru tu/', 'Let me put you through to the technical support department.' UNION ALL
    SELECT 'Let me put you through to my colleague.', 'Разрешите соединить вас с моей коллегой.', '/lɛt mi pʊt ju θru tu maɪ kəˈliɡ/', 'Let me put you through to my colleague who handles these matters.' UNION ALL
    SELECT 'let out a flat', 'сдавать квартиру', '/lɛt aʊt ə flæt/', 'They decided to let out their flat while traveling.' UNION ALL
    SELECT 'otherwise', 'Иначе, по-другому', '/ˈʌðərwaɪz/', 'We need to finish this today, otherwise we''ll miss the deadline.' UNION ALL
    SELECT 'overlook the sea', 'иметь вид на море', '/ˌoʊvərˈlʊk ðə si/', 'Our hotel room overlooks the sea with a beautiful view.' UNION ALL
    SELECT 'Please hold the line (while I put you through).', 'Пожалуйста, проверьте на линии (пока я вас соединю)', '/pliz hoʊld ðə laɪn (waɪl aɪ pʊt ju θru)/', 'Please hold the line while I put you through to the manager.' UNION ALL
    SELECT 'plumber', 'сантехник', '/ˈplʌmər/', 'We need to call a plumber to fix the leaking pipe.' UNION ALL
    SELECT 'put through to', 'Соедините (по телефону)', '/pʊt θru tu/', 'Can you put me through to the accounts department?' UNION ALL
    SELECT 'radiator', 'батарея', '/ˈreɪdiˌeɪtər/', 'The radiator in the living room isn''t heating properly.' UNION ALL
    SELECT 'reach the voicemail', 'дозвониться до голосовой почты', '/riʧ ðə ˈvɔɪsmeɪl/', 'I tried calling but only reached the voicemail.' UNION ALL
    SELECT 'rearrange the delivery', 'перенести доставку', '/ˌriəˈreɪnʤ ðə dɪˈlɪvəri/', 'I need to rearrange the delivery for next week.' UNION ALL
    SELECT 'require', 'требовать', '/rɪˈkwaɪər/', 'This job requires at least three years of experience.' UNION ALL
    SELECT 'sew, sewed, sewn', 'шить', '/soʊ, soʊd, soʊn/', 'She learned to sew her own clothes in high school.' UNION ALL
    SELECT 'slide', 'горка, съезжать с горки', '/slaɪd/', 'Children love playing on the slide at the playground.' UNION ALL
    SELECT 'switch off', 'переключить', '/swɪʧ ɔf/', 'Don''t forget to switch off the lights when you leave.' UNION ALL
    SELECT 'Thank you for calling [company name].', 'Спасибо за звонок', '/θæŋk ju fɔr ˈkɔlɪŋ/', 'Thank you for calling ABC Company, how can I help you?' UNION ALL
    SELECT 'What can I help you with today?', 'Чем я могу вам помочь сегодня?', '/wʌt kæn aɪ hɛlp ju wɪð təˈdeɪ/', 'Good morning! What can I help you with today?' UNION ALL
    SELECT 'What can we do for you?', 'А что мы можем для вас сделать?', '/wʌt kæn wi du fɔr ju/', 'Welcome to our store! What can we do for you today?' UNION ALL
    SELECT 'what sort of', 'Какой вид ...?', '/wʌt sɔrt əv/', 'What sort of music do you like listening to?' UNION ALL
    SELECT 'work properly', 'Работать как надо', '/wɜrk ˈprɑpərli/', 'The computer isn''t working properly - it keeps freezing.' UNION ALL
    SELECT 'You''re through to [name/department name].', 'Вы дозвонились до отдела ...', '/jɔr θru tu/', 'You''re through to the customer service department.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B1Plus_Unit9_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'B1+'
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
    SELECT 'ability' AS english_word, 'способность' AS russian_translation, '/əˈbɪləti/' AS transcription, 'She has the ability to learn languages quickly.' AS example_sentence UNION ALL
    SELECT 'able', 'способный', '/ˈeɪbəl/', 'With practice, you''ll be able to master this skill.' UNION ALL
    SELECT 'anxiety', 'тревога', '/æŋˈzaɪəti/', 'Many people experience anxiety before important exams.' UNION ALL
    SELECT 'anxious', 'тревожный', '/ˈæŋkʃəs/', 'I feel anxious about the upcoming presentation.' UNION ALL
    SELECT 'cause', 'причина, вызывать', '/kɔz/', 'Stress can cause various health problems.' UNION ALL
    SELECT 'charitable', 'благотворительный', '/ˈʧærətəbəl/', 'They made a charitable donation to the local hospital.' UNION ALL
    SELECT 'charity', 'благотворительность', '/ˈʧærəti/', 'The charity helps homeless people in our city.' UNION ALL
    SELECT 'communal', 'общинный', '/kəˈmjunəl/', 'The apartment building has a communal garden for all residents.' UNION ALL
    SELECT 'community', 'сообщество', '/kəˈmjunəti/', 'Our local community organizes regular clean-up events.' UNION ALL
    SELECT 'creative', 'творческий', '/kriˈeɪtɪv/', 'Children should be encouraged to develop creative thinking.' UNION ALL
    SELECT 'creativity', 'творчество', '/ˌkrieɪˈtɪvəti/', 'Art classes help stimulate creativity in students.' UNION ALL
    SELECT 'discrimination', 'дискриминация', '/dɪˌskrɪməˈneɪʃən/', 'Laws protect people from discrimination in the workplace.' UNION ALL
    SELECT 'equal', 'равный', '/ˈikwəl/', 'All employees should have equal opportunities for promotion.' UNION ALL
    SELECT 'equality', 'равенство', '/ɪˈkwɑləti/', 'Gender equality is an important goal in modern society.' UNION ALL
    SELECT 'face', 'лицо, сталкиваться', '/feɪs/', 'We must face the challenges ahead with courage.' UNION ALL
    SELECT 'fact of life', 'факт жизни', '/fækt əv laɪf/', 'Dealing with disappointment is a fact of life.' UNION ALL
    SELECT 'generosity', 'щедрость', '/ˌʤɛnəˈrɑsəti/', 'Her generosity towards those in need is remarkable.' UNION ALL
    SELECT 'generous', 'щедрый', '/ˈʤɛnərəs/', 'He''s always generous with his time and advice.' UNION ALL
    SELECT 'green space', 'зелёная зона', '/ɡrin speɪs/', 'Cities need more green spaces for residents to enjoy.' UNION ALL
    SELECT 'have faith in', 'верить в', '/hæv feɪθ ɪn/', 'I have faith in your ability to succeed.' UNION ALL
    SELECT 'national', 'национальный', '/ˈnæʃənəl/', 'The national museum has an impressive collection.' UNION ALL
    SELECT 'nationality', 'национальность', '/ˌnæʃəˈnæləti/', 'What nationality are your grandparents?' UNION ALL
    SELECT 'normal', 'нормальный', '/ˈnɔrməl/', 'It''s normal to feel nervous before a job interview.' UNION ALL
    SELECT 'normality', 'нормальность', '/nɔrˈmæləti/', 'After the crisis, people longed for a return to normality.' UNION ALL
    SELECT 'pressure', 'давление', '/ˈprɛʃər/', 'There''s a lot of pressure to perform well in this job.' UNION ALL
    SELECT 'probability', 'вероятность', '/ˌprɑbəˈbɪləti/', 'There''s a high probability of rain this afternoon.' UNION ALL
    SELECT 'probable', 'вероятный', '/ˈprɑbəbəl/', 'It''s probable that the meeting will be postponed.' UNION ALL
    SELECT 'purpose in life', 'цель в жизни', '/ˈpɜrpəs ɪn laɪf/', 'Everyone needs to find their purpose in life.' UNION ALL
    SELECT 'strong community', 'сильное сообщество', '/strɔŋ kəˈmjunəti/', 'A strong community supports its members in difficult times.' UNION ALL
    SELECT 'tolerance', 'терпимость', '/ˈtɑlərəns/', 'We should teach children tolerance and respect for others.' UNION ALL
    SELECT 'trust', 'доверие, доверять', '/trʌst/', 'Trust is essential in any relationship.' UNION ALL
    SELECT 'violence', 'насилие', '/ˈvaɪələns/', 'Violence is never an acceptable way to solve problems.' UNION ALL
    SELECT 'wages', 'заработная плата', '/ˈweɪʤɪz/', 'Workers demanded higher wages and better conditions.' UNION ALL
    SELECT 'work part-time', 'работать неполный рабочий день', '/wɜrk ˈpɑrtˌtaɪm/', 'Many students work part-time while studying at university.' UNION ALL
    SELECT 'a fact of life', 'Жизненный факт', '/ə fækt əv laɪf/', 'Paying taxes is a fact of life for most adults.' UNION ALL
    SELECT 'access', 'доступ, иметь доступ', '/ˈæksɛs/', 'All students have access to the library resources.' UNION ALL
    SELECT 'all walks of life', 'Различные круги/слои общества', '/ɔl wɔks əv laɪf/', 'The festival attracts people from all walks of life.' UNION ALL
    SELECT 'Austrian', 'Австриец, австрийский', '/ˈɔstriən/', 'Mozart was an Austrian composer.' UNION ALL
    SELECT 'beg', 'Просить, умолять', '/bɛɡ/', 'The children would beg their parents for ice cream.' UNION ALL
    SELECT 'chaos', 'хаос', '/ˈkeɪɑs/', 'The sudden cancellation caused chaos at the airport.' UNION ALL
    SELECT 'conservatoire', 'консерватория', '/kənˈsɜrvətwɑr/', 'She studies violin at the national conservatoire.' UNION ALL
    SELECT 'conservatory', 'консерватория/оранжерея, теплица', '/kənˈsɜrvəˌtɔri/', 'The music conservatory produces excellent musicians.' UNION ALL
    SELECT 'embassy', 'посольство', '/ˈɛmbəsi/', 'You need to contact the embassy for visa information.' UNION ALL
    SELECT 'ambassador', 'посол', '/æmˈbæsədər/', 'The ambassador represented his country at the international conference.' UNION ALL
    SELECT 'en route', 'По дороге, на пути', '/ɑn ˈrut/', 'We''re en route to the airport and should arrive soon.' UNION ALL
    SELECT 'fair', 'справедливый', '/fɛr/', 'Everyone deserves a fair chance to succeed.' UNION ALL
    SELECT 'fight for', 'бороться за', '/faɪt fɔr/', 'They continue to fight for equal rights.' UNION ALL
    SELECT 'fund', 'Финансировать, спонсировать, фонд', '/fʌnd/', 'The government will fund the new research project.' UNION ALL
    SELECT 'get rid of sth', 'Избавиться от чего-то', '/ɡɛt rɪd əv ˈsʌmθɪŋ/', 'I need to get rid of these old clothes.' UNION ALL
    SELECT 'healthcare', 'охрана здоровья/медицинское обслуживание', '/ˈhɛlθkɛr/', 'Access to quality healthcare is a basic human right.' UNION ALL
    SELECT 'historian', 'историк', '/hɪˈstɔriən/', 'The historian wrote several books about ancient civilizations.' UNION ALL
    SELECT 'icon', 'Икона, значок, ярлык', '/ˈaɪkɑn/', 'She became a fashion icon in the 1960s.' UNION ALL
    SELECT 'impact on', 'Влияние на, влиять на', '/ˈɪmpækt ɔn/', 'Social media has a huge impact on modern communication.' UNION ALL
    SELECT 'later in life', 'Позднее в жизни', '/ˈleɪtər ɪn laɪf/', 'Many people change careers later in life.' UNION ALL
    SELECT 'life expectancy', 'Продолжительность жизни', '/laɪf ɪkˈspɛktənsi/', 'Life expectancy has increased significantly in recent decades.' UNION ALL
    SELECT 'life''s too short', 'Жизнь слишком коротка', '/laɪfs tu ʃɔrt/', 'Life''s too short to worry about small things.' UNION ALL
    SELECT 'majority', 'Большинство, большая часть', '/məˈʤɔrəti/', 'The majority of students passed the exam.' UNION ALL
    SELECT 'make a difference', 'быть отличительной чертой; проводить различие; создавать отличие, изменить ситуацию, уладить разногласия', '/meɪk ə ˈdɪfərəns/', 'Volunteering can make a difference in your community.' UNION ALL
    SELECT 'middle class', 'Средний класс', '/ˈmɪdəl klæs/', 'The middle class has been growing in many developing countries.' UNION ALL
    SELECT 'mindset', 'Образ мыслей', '/ˈmaɪndsɛt/', 'A positive mindset can help you overcome challenges.' UNION ALL
    SELECT 'opening hours', 'Часы работы', '/ˈoʊpənɪŋ ˈaʊərz/', 'The store''s opening hours are from 9 AM to 6 PM.' UNION ALL
    SELECT 'overthrow', 'Переворот, свержение', '/ˌoʊvərˈθroʊ/', 'The revolution aimed to overthrow the corrupt government.' UNION ALL
    SELECT 'own', 'Владеть, собственный', '/oʊn/', 'They hope to own their own home one day.' UNION ALL
    SELECT 'poverty', 'бедность, убогость, недостача (чего-то)', '/ˈpɑvərti/', 'Many organizations work to reduce poverty worldwide.' UNION ALL
    SELECT 'profit', 'Выгода, польза, прибыль', '/ˈprɑfət/', 'The company reported record profits this quarter.' UNION ALL
    SELECT 'provided by', 'Обеспеченный кем-то', '/prəˈvaɪdəd baɪ/', 'Lunch is provided by the company for all employees.' UNION ALL
    SELECT 'quality of life', 'Качество/уровень жизни', '/ˈkwɑləti əv laɪf/', 'Good healthcare improves the quality of life.' UNION ALL
    SELECT 'raise a problem', 'Поднять/обозначить вопрос/проблему', '/reɪz ə ˈprɑbləm/', 'I need to raise a problem with the new software.' UNION ALL
    SELECT 'ruled by', 'Управляемый кем-то, чем-то', '/ruld baɪ/', 'The country was ruled by a monarchy for centuries.' UNION ALL
    SELECT 'run', 'управлять', '/rʌn/', 'She runs a successful business in the city center.' UNION ALL
    SELECT 'see life', 'Увидеть жизнь', '/si laɪf/', 'Traveling helps you see life from different perspectives.' UNION ALL
    SELECT 'state-of-the-art', 'Сверх современный, достигнутый', '/ˈsteɪt əv ði ɑrt/', 'The hospital has state-of-the-art medical equipment.' UNION ALL
    SELECT 'sufficient', 'достаточный', '/səˈfɪʃənt/', 'We have sufficient evidence to support our claim.' UNION ALL
    SELECT 'insufficient', 'недостаточный', '/ˌɪnsəˈfɪʃənt/', 'There was insufficient time to complete the project.' UNION ALL
    SELECT 'that''s life', 'Это/такова жизнь', '/ðæts laɪf/', 'Sometimes things don''t go as planned - that''s life.' UNION ALL
    SELECT 'the time of your life', 'Чудесное время', '/ðə taɪm əv jɔr laɪf/', 'We had the time of our lives on our vacation in Hawaii.' UNION ALL
    SELECT 'to evoke feelings/ memories', 'Вызвать чувства/воспоминания', '/tu ɪˈvoʊk ˈfilɪŋz/ /ˈmɛməriz/', 'The old photograph evoked memories of my childhood.' UNION ALL
    SELECT 'to have high/low blood pressure', 'Иметь высокое/низкое кровяное давление', '/tu hæv haɪ/loʊ blʌd ˈprɛʃər/', 'My doctor said I have high blood pressure.' UNION ALL
    SELECT 'to suffer from high/low blood pressure', 'Страдать от высокого/низкого кровяного давления', '/tu ˈsʌfər frəm haɪ/loʊ blʌd ˈprɛʃər/', 'Many older people suffer from high blood pressure.' UNION ALL
    SELECT 'utopia', 'утомия', '/juˈtoʊpiə/', 'The novel describes a perfect utopia where everyone is happy.' UNION ALL
    SELECT 'vote in elections', 'голосовать на выборах', '/voʊt ɪn ɪˈlɛkʃənz/', 'It''s important to vote in elections to have your voice heard.' UNION ALL
    SELECT 'wage war', 'Вести войну', '/weɪʤ wɔr/', 'The country had to wage war to defend its borders.' UNION ALL
    SELECT 'a black belt', 'чёрный пояс', '/ə blæk bɛlt/', 'After years of training, he earned a black belt in karate.' UNION ALL
    SELECT 'a fair contest', 'честная борьба', '/ə fɛr ˈkɑntɛst/', 'Both teams agreed it was a fair contest.' UNION ALL
    SELECT 'be in the lead', 'лидировать (возглавлять что-либо)', '/bi ɪn ðə lid/', 'Our team is in the lead by five points.' UNION ALL
    SELECT 'break a record time', 'побить рекордное время', '/breɪk ə ˈrɛkərd taɪm/', 'The athlete broke the record time for the 100-meter dash.' UNION ALL
    SELECT 'come last', 'прийти последним', '/kʌm læst/', 'Unfortunately, our team came last in the competition.' UNION ALL
    SELECT 'drown', 'тонуть', '/draʊn/', 'It''s important to teach children how to swim so they don''t drown.' UNION ALL
    SELECT 'failure', 'провал, неудача', '/ˈfeɪljər/', 'Don''t be afraid of failure - it''s part of learning.' UNION ALL
    SELECT 'fall over', 'споткнуться, упасть', '/fɔl ˈoʊvər/', 'Be careful not to fall over on the slippery floor.' UNION ALL
    SELECT 'get beaten', 'быть побитым, побеждённым', '/ɡɛt ˈbitən/', 'Our team got beaten in the final match.' UNION ALL
    SELECT 'get to the quarter-finals', 'пробиться в четвертьфинал', '/ɡɛt tu ðə ˈkwɔrtərˌfaɪnəlz/', 'The underdog team managed to get to the quarter-finals.' UNION ALL
    SELECT 'knock down', 'сбить с ног', '/nɑk daʊn/', 'The boxer managed to knock down his opponent.' UNION ALL
    SELECT 'miss a penalty', 'пропустить пенальти', '/mɪs ə ˈpɛnəlti/', 'The striker missed a penalty in the last minute.' UNION ALL
    SELECT 'represent a country', 'представлять страну', '/ˌrɛprɪˈzɛnt ə ˈkʌntri/', 'Athletes work hard to represent their country in the Olympics.' UNION ALL
    SELECT 'send off', 'удалять (с поля/площадки)', '/sɛnd ɔf/', 'The referee had to send off two players for fighting.' UNION ALL
    SELECT 'slope', 'склон, наклон', '/sloʊp/', 'The ski slope was too steep for beginners.' UNION ALL
    SELECT 'success', 'успех, удача', '/səkˈsɛs/', 'Hard work is often the key to success.' UNION ALL
    SELECT 'the favourite', 'фаворит, любимчик', '/ðə ˈfeɪvərɪt/', 'The Brazilian team was the favourite to win the tournament.' UNION ALL
    SELECT 'train', 'тренировать (-ся)', '/treɪn/', 'Athletes train for many hours every day.' UNION ALL
    SELECT 'Anyway, sorry to interrupt. You were saying?', 'В любом случае, извините, что перебиваю.', '/ˈɛniweɪ ˈsɑri tu ˌɪntəˈrʌpt ju wɜr ˈseɪɪŋ/', 'Anyway, sorry to interrupt. You were saying about your vacation plans?' UNION ALL
    SELECT 'Can I just add something?', 'Могу я просто кое-что добавить?', '/kæn aɪ ʤʌst æd ˈsʌmθɪŋ/', 'Can I just add something to what you said about the project?' UNION ALL
    SELECT 'Can I just ask something there?', 'Могу я просто кое-что спросить?', '/kæn aɪ ʤʌst æsk ˈsʌmθɪŋ ðɛr/', 'Can I just ask something there about the budget?' UNION ALL
    SELECT 'Can I just say something there?', 'Что ещё я могу здесь сказать', '/kæn aɪ ʤʌst seɪ ˈsʌmθɪŋ ðɛr/', 'Can I just say something there about the timeline?' UNION ALL
    SELECT 'Could I just say something here if I may?', 'Что я могу ещё сказать здесь/об этом (более вежливый вариант)', '/kʊd aɪ ʤʌst seɪ ˈsʌmθɪŋ hɪr ɪf aɪ meɪ/', 'Could I just say something here if I may? I have a different perspective.' UNION ALL
    SELECT 'Could I just stop you there for a moment if I may?', 'Могу ли я остановить вас в этом месте, если возможно/можно?', '/kʊd aɪ ʤʌst stɑp ju ðɛr fɔr ə ˈmoʊmənt ɪf aɪ meɪ/', 'Could I just stop you there for a moment if I may? I need to clarify something.' UNION ALL
    SELECT 'Do you mind if I come in here?', 'Вы не против, если я зайду?', '/du ju maɪnd ɪf aɪ kʌm ɪn hɪr/', 'Do you mind if I come in here? I have some relevant information.' UNION ALL
    SELECT 'I didn''t quite follow that last part.', 'Я не совсем понял последнюю/оставшуюся часть.', '/aɪ ˈdɪdənt kwaɪt ˈfɑloʊ ðæt læst pɑrt/', 'I didn''t quite follow that last part. Could you explain it again?' UNION ALL
    SELECT 'I''m really sorry to bother you, but ...', 'Извините (очень извиняюсь), что беспокою, но...', '/aɪm ˈrɪəli ˈsɑri tu ˈbɑðər ju bʌt/', 'I''m really sorry to bother you, but I need your help with this document.' UNION ALL
    SELECT 'I''m really sorry to interrupt you, but ...', 'Извините, что перебиваю вас, но...', '/aɪm ˈrɪəli ˈsɑri tu ˌɪntəˈrʌpt ju bʌt/', 'I''m really sorry to interrupt you, but we''re running out of time.' UNION ALL
    SELECT 'No worries. So anyway, to get back to what I was saying', 'Не страшно.  Хорошо, возвращаясь к тому, о чем я говорил...', '/noʊ ˈwɜriz soʊ ˈɛniweɪ tu ɡɛt bæk tu wʌt aɪ wəz ˈseɪɪŋ/', 'No worries. So anyway, to get back to what I was saying about the marketing strategy...' UNION ALL
    SELECT 'Sorry about that. Please go on.', 'Извините за это. Продолжайте, пожалуйста.', '/ˈsɑri əˈbaʊt ðæt pliz ɡoʊ ɔn/', 'Sorry about that interruption. Please go on with your presentation.' UNION ALL
    SELECT 'Sorry, but could you just go over that again?', 'Извините, не могли бы вы ещё раз это повторить?', '/ˈsɑri bʌt kʊd ju ʤʌst ɡoʊ ˈoʊvər ðæt əˈɡɛn/', 'Sorry, but could you just go over that again? I didn''t catch all the details.' UNION ALL
    SELECT 'Thanks for letting me know.', 'Спасибо, что предупредили/дали знать.', '/θæŋks fɔr ˈlɛtɪŋ mi noʊ/', 'Thanks for letting me know about the meeting cancellation.' UNION ALL
    SELECT 'Thanks for pointing that out.', 'Спасибо, что обратили на это внимание.', '/θæŋks fɔr ˈpɔɪntɪŋ ðæt aʊt/', 'Thanks for pointing that out - I hadn''t noticed the error.' UNION ALL
    SELECT 'That''s a fair point (I guess).', 'Справедливая мысль/точка зрения (я считаю).', '/ðæts ə fɛr pɔɪnt (aɪ ɡɛs)/', 'That''s a fair point - I hadn''t considered that perspective.' UNION ALL
    SELECT 'Would you mind repeating it?', 'Не могли бы/Не против ли вы повторить это ещё раз?', '/wʊd ju maɪnd rɪˈpitɪŋ ɪt/', 'Would you mind repeating it? The connection isn''t very good.' UNION ALL
    SELECT 'Yes, so as I was saying...', 'Да, как я говорил...', '/jɛs soʊ æz aɪ wəz ˈseɪɪŋ/', 'Yes, so as I was saying, we need to reconsider our approach.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B1Plus_Unit10_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'B1+'
        AND u.display_order = 10
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
    SELECT 'activist' AS english_word, 'активист, сторонник активных мер' AS russian_translation, '/ˈæktɪvɪst/' AS transcription, 'She became an environmental activist after learning about climate change.' AS example_sentence UNION ALL
    SELECT 'architect', 'архитектор', '/ˈɑrkəˌtɛkt/', 'The architect designed a modern building with sustainable features.' UNION ALL
    SELECT 'artist', 'художник', '/ˈɑrtɪst/', 'The young artist sold her first painting for $5,000.' UNION ALL
    SELECT 'assign', 'назначать', '/əˈsaɪn/', 'The teacher will assign homework every Friday.' UNION ALL
    SELECT 'athlete', 'спортсмен', '/ˈæθlit/', 'The Olympic athlete trained for years to compete at the highest level.' UNION ALL
    SELECT 'bring up', 'воспитывать, растить', '/brɪŋ ʌp/', 'It''s challenging to bring up children in today''s world.' UNION ALL
    SELECT 'chemist', 'химик', '/ˈkɛmɪst/', 'The chemist discovered a new compound in the laboratory.' UNION ALL
    SELECT 'compete', 'соревноваться', '/kəmˈpit/', 'Athletes from all over the world compete in the Olympics.' UNION ALL
    SELECT 'defend people at court', 'защищать людей в суде', '/dɪˈfɛnd ˈpipəl æt kɔrt/', 'The lawyer''s job is to defend people at court and ensure they get fair treatment.' UNION ALL
    SELECT 'design buildings', 'проектировать здания', '/dɪˈzaɪn ˈbɪldɪŋz/', 'She studied for years to learn how to design buildings safely and creatively.' UNION ALL
    SELECT 'discover new places', 'открывать новые места', '/dɪˈskʌvər nu ˈpleɪsɪz/', 'Explorers used to risk their lives to discover new places around the world.' UNION ALL
    SELECT 'encourage', 'поощрять, поддерживать', '/ɪnˈkɜrɪʤ/', 'Good teachers encourage their students to ask questions.' UNION ALL
    SELECT 'explorer', 'исследователь', '/ɪkˈsplɔrər/', 'The famous explorer mapped unknown territories in Africa.' UNION ALL
    SELECT 'fair enough', 'справедливо', '/fɛr ɪˈnʌf/', 'You want to leave early? Fair enough, but finish your work first.' UNION ALL
    SELECT 'fight for the rights of workers', 'бороться за права рабочих', '/faɪt fɔr ðə raɪts ʌv ˈwɜrkərz/', 'The union continues to fight for the rights of workers in the factory.' UNION ALL
    SELECT 'fight for women''s rights', 'бороться за права женщин', '/faɪt fɔr ˈwɪmɪnz raɪts/', 'She dedicated her life to fighting for women''s rights and equality.' UNION ALL
    SELECT 'law', 'закон', '/lɔ/', 'The new law will take effect next month.' UNION ALL
    SELECT 'lawyer', 'юрист', '/ˈlɔjər/', 'We need to consult a lawyer before signing this contract.' UNION ALL
    SELECT 'lead the army to victory', 'вести армию к победе', '/lid ði ˈɑrmi tu ˈvɪktəri/', 'The general managed to lead the army to victory against all odds.' UNION ALL
    SELECT 'military leader', 'военачальник', '/ˈmɪləˌtɛri ˈlidər/', 'The military leader developed a brilliant strategy for the battle.' UNION ALL
    SELECT 'painter', 'художник, маляр', '/ˈpeɪntər/', 'The painter created beautiful landscapes that captured the beauty of nature.' UNION ALL
    SELECT 'physicist', 'физик', '/ˈfɪzəsɪst/', 'The physicist won the Nobel Prize for her groundbreaking research.' UNION ALL
    SELECT 'point out', 'указывать, показывать', '/pɔɪnt aʊt/', 'Let me point out the main features of this new software.' UNION ALL
    SELECT 'principle', 'закон', '/ˈprɪnsəpəl/', 'The company operates on the principle of fair trade and ethical practices.' UNION ALL
    SELECT 'Pushkin is still widely read', 'Пушкин всё ещё популярен среди читателей', '/ˈpʊʃkɪn ɪz stɪl ˈwaɪdli rɛd/', 'Pushkin is still widely read in Russia and around the world.' UNION ALL
    SELECT 'put by money', 'откладывать (деньги на будущее)', '/pʊt baɪ ˈmʌni/', 'It''s wise to put by money for unexpected expenses.' UNION ALL
    SELECT 'struggle', 'бороться, прилагать усилия', '/ˈstrʌɡəl/', 'Many people struggle to balance work and family life.' UNION ALL
    SELECT 'trade union worker', 'профсоюзный работник', '/treɪd ˈjunjən ˈwɜrkər/', 'The trade union worker negotiated better conditions for the employees.' UNION ALL
    SELECT 'win a medal', 'выиграть медаль', '/wɪn ə ˈmɛdəl/', 'She worked hard to win a medal in the swimming competition.' UNION ALL
    SELECT 'work of art', 'произведение искусства', '/wɜrk ʌv ɑrt/', 'This sculpture is truly a magnificent work of art.' UNION ALL
    SELECT 'achieve', 'достигать', '/əˈʧiv/', 'With hard work and dedication, you can achieve your goals.' UNION ALL
    SELECT 'admission', 'признание', '/ædˈmɪʃən/', 'His admission of guilt surprised everyone in the courtroom.' UNION ALL
    SELECT 'admit', 'признавать', '/ædˈmɪt/', 'I have to admit that I was wrong about the situation.' UNION ALL
    SELECT 'attract', 'привлекать', '/əˈtrækt/', 'The beautiful gardens attract many tourists to the palace.' UNION ALL
    SELECT 'correct', 'правильный, исправлять', '/kəˈrɛkt/', 'Please correct me if I''m wrong about the details.' UNION ALL
    SELECT 'correction', 'исправление', '/kəˈrɛkʃən/', 'The teacher made a correction to my essay before I submitted it.' UNION ALL
    SELECT 'deadline', 'крайний срок', '/ˈdɛdlaɪn/', 'We need to finish this project before the deadline on Friday.' UNION ALL
    SELECT 'delay', 'задержка, задерживать', '/dɪˈleɪ/', 'The flight delay caused us to miss our connecting flight.' UNION ALL
    SELECT 'disagreement', 'разногласие', '/ˌdɪsəˈɡrimənt/', 'There was a disagreement among team members about the best approach.' UNION ALL
    SELECT 'evidence', 'доказательство', '/ˈɛvədəns/', 'The police collected evidence at the crime scene.' UNION ALL
    SELECT 'explode', 'взрывать', '/ɪkˈsploʊd/', 'The old building was scheduled to explode for demolition.' UNION ALL
    SELECT 'explosion', 'взрыв', '/ɪkˈsploʊʒən/', 'The explosion could be heard from miles away.' UNION ALL
    SELECT 'extend', 'продлевать', '/ɪkˈstɛnd/', 'We decided to extend our vacation by another week.' UNION ALL
    SELECT 'force', 'сила, заставлять', '/fɔrs/', 'You can''t force someone to change their opinion.' UNION ALL
    SELECT 'gain', 'получать, приобретать', '/ɡeɪn/', 'Students gain valuable knowledge through hands-on experience.' UNION ALL
    SELECT 'grade', 'оценка, оценивать', '/ɡreɪd/', 'I need to grade these papers before the weekend.' UNION ALL
    SELECT 'higher standard', 'более высокий стандарт', '/ˈhaɪər ˈstændərd/', 'This university maintains a higher standard of education than most others.' UNION ALL
    SELECT 'manage', 'управлять', '/ˈmænɪʤ/', 'She knows how to manage a team effectively and efficiently.' UNION ALL
    SELECT 'oppose', 'противостоять', '/əˈpoʊz/', 'Many citizens oppose the new construction project in the park.' UNION ALL
    SELECT 'opposition', 'оппозиция', '/ˌɑpəˈzɪʃən/', 'The government faced strong opposition to the new policy.' UNION ALL
    SELECT 'persuade', 'убеждать', '/pərˈsweɪd/', 'I tried to persuade him to join us for dinner.' UNION ALL
    SELECT 'present', 'представлять', '/ˈprɛzənt/', 'She will present her research findings at the conference.' UNION ALL
    SELECT 'qualification', 'квалификация', '/ˌkwɑləfɪˈkeɪʃən/', 'You need the proper qualification to work in this field.' UNION ALL
    SELECT 'qualify', 'квалифицировать', '/ˈkwɑləˌfaɪ/', 'This experience will qualify you for a better position.' UNION ALL
    SELECT 'react', 'реагировать', '/riˈækt/', 'How did she react when you told her the news?' UNION ALL
    SELECT 'reaction', 'реакция', '/riˈækʃən/', 'His reaction to the surprise party was priceless.' UNION ALL
    SELECT 'responsible', 'ответственный', '/rɪˈspɑnsəbəl/', 'Parents are responsible for their children''s safety.' UNION ALL
    SELECT 'rush', 'спешка, спешить', '/rʌʃ/', 'There''s no need to rush - we have plenty of time.' UNION ALL
    SELECT 'volunteer', 'волонтёр, доброволец', '/ˌvɑlənˈtɪr/', 'She works as a volunteer at the local animal shelter.' UNION ALL
    SELECT 'a black eye', 'синяк под глазом', '/ə blæk aɪ/', 'He got a black eye during the basketball game.' UNION ALL
    SELECT 'a real bargain', 'выгодная покупка', '/ə ril ˈbɑrɡən/', 'This laptop was a real bargain at only $300.' UNION ALL
    SELECT 'a white-collar job', 'офисная работа', '/ə ˈwaɪtˌkɑlər ʤɑb/', 'After graduation, he got a white-collar job at a large corporation.' UNION ALL
    SELECT 'battery life', 'заряд батареи', '/ˈbætəri laɪf/', 'The new smartphone has excellent battery life.' UNION ALL
    SELECT 'be completely out of the blue', 'взяться ниоткуда', '/bi kəmˈplitli aʊt ʌv ðə blu/', 'His resignation came completely out of the blue.' UNION ALL
    SELECT 'be in the black', 'быть в плюсе, быть в прибыли', '/bi ɪn ðə blæk/', 'After a difficult year, the company is finally in the black.' UNION ALL
    SELECT 'be in the red', 'быть в долгах', '/bi ɪn ðə rɛd/', 'The business has been in the red for the past six months.' UNION ALL
    SELECT 'beautifully designed', 'красиво оформленный', '/ˈbjutəfəli dɪˈzaɪnd/', 'The new museum is beautifully designed and very modern.' UNION ALL
    SELECT 'black and blue', 'весь в синяках', '/blæk ænd blu/', 'After the accident, his arm was black and blue with bruises.' UNION ALL
    SELECT 'come at a reasonable price', 'стоить адекватно', '/kʌm æt ə ˈrizənəbəl praɪs/', 'Good quality furniture doesn''t have to come at a reasonable price.' UNION ALL
    SELECT 'complicated instructions', 'сложные инструкции', '/ˈkɑmpləkeɪtɪd ɪnˈstrʌkʃənz/', 'The complicated instructions made it hard to assemble the furniture.' UNION ALL
    SELECT 'decent quality', 'достойное качество', '/ˈdisənt ˈkwɑləti/', 'For the price, these shoes offer decent quality.' UNION ALL
    SELECT 'feature', 'особенность, черта', '/ˈfiʧər/', 'The camera''s best feature is its night vision capability.' UNION ALL
    SELECT 'feel a bit blue', 'в подавленном настроении', '/fil ə bɪt blu/', 'I always feel a bit blue when the summer ends.' UNION ALL
    SELECT 'give sth the green light', 'одобрить что-то', '/ɡɪv ˈsʌmθɪŋ ðə ɡrin laɪt/', 'The board gave the green light to the new project.' UNION ALL
    SELECT 'golden opportunity', 'блестящая возможность', '/ˈɡoʊldən ˌɑpərˈtunəti/', 'Studying abroad is a golden opportunity to learn about new cultures.' UNION ALL
    SELECT 'have enough room for', 'иметь достаточно места для', '/hæv ɪˈnʌf rum fɔr/', 'This apartment has enough room for a family of four.' UNION ALL
    SELECT 'last long', 'служить долго (о вещи)', '/læst lɔŋ/', 'Well-made furniture should last long and withstand daily use.' UNION ALL
    SELECT 'leather', 'кожа', '/ˈlɛðər/', 'The jacket is made of genuine leather and should last for years.' UNION ALL
    SELECT 'not black and white', 'не все так просто', '/nɑt blæk ænd waɪt/', 'The ethical issues in this case are not black and white.' UNION ALL
    SELECT 'set up the system', 'установить систему', '/sɛt ʌp ðə ˈsɪstəm/', 'It took me hours to set up the new computer system.' UNION ALL
    SELECT 'stylish design', 'стильный дизайн', '/ˈstaɪlɪʃ dɪˈzaɪn/', 'The car''s stylish design makes it very popular with young buyers.' UNION ALL
    SELECT 'the green belt', 'полоса зелёных насаждений', '/ðə ɡrin bɛlt/', 'The city is planning to expand the green belt around the urban area.' UNION ALL
    SELECT 'tough', 'прочный', '/tʌf/', 'These hiking boots are tough enough for mountain terrain.' UNION ALL
    SELECT 'turn on automatically', 'включаться автоматически', '/tɜrn ɔn ˌɔtəˈmætɪkli/', 'The security lights turn on automatically when it gets dark.' UNION ALL
    SELECT 'value for money', 'адекватное соотношение цены и качества', '/ˈvælju fɔr ˈmʌni/', 'This restaurant offers excellent value for money with its generous portions.' UNION ALL
    SELECT 'Are you sure you don''t want me to (give you a clue)?', 'Вы уверены, что не хотите, чтобы я дал вам подсказку?', '/ɑr ju ʃʊr ju doʊnt wɑnt mi tu/', 'Are you sure you don''t want me to give you a clue for the puzzle?' UNION ALL
    SELECT 'Can I give you a hand with (your suitcase)?', 'Могу я помочь вам (с чемоданом)?', '/kæn aɪ ɡɪv ju ə hænd wɪð/', 'Can I give you a hand with your heavy suitcase?' UNION ALL
    SELECT 'Do you want me to (help you with that)?', 'Хочешь, чтобы я тебе помог с этим?', '/du ju wɑnt mi tu/', 'Do you want me to help you with that difficult task?' UNION ALL
    SELECT 'Don''t worry. I''m OK.', 'Не волнуйтесь. Я в порядке.', '/doʊnt ˈwɜri aɪm oʊˈkeɪ/', 'Don''t worry. I''m OK, just a little tired.' UNION ALL
    SELECT 'Feel free to (help yourself from the fridge).', 'Не стесняйтесь (угощайтесь едой из холодильника)', '/fil fri tu/', 'Feel free to help yourself from the fridge if you''re hungry.' UNION ALL
    SELECT 'I''d be happy to (take you), if you like.', 'Я бы с радостью отвёз вас, если вы не против.', '/aɪd bi ˈhæpi tu ɪf ju laɪk/', 'I''d be happy to take you to the airport, if you like.' UNION ALL
    SELECT 'I''d rather (try and do it myself).', 'Я лучше (попробую и сделаю это сам).', '/aɪd ˈræðər/', 'I''d rather try and do it myself first, but thank you for offering.' UNION ALL
    SELECT 'I''ll (make a list of the action points).', 'Я сделаю список/план действий.', '/aɪl/', 'I''ll make a list of the action points from our meeting.' UNION ALL
    SELECT 'I''m fine. Thanks.', 'Все хорошо. Спасибо.', '/aɪm faɪn θæŋks/', 'I''m fine. Thanks for asking about my day.' UNION ALL
    SELECT 'It''s OK. I can manage.', 'Все хорошо. Я справлюсь. Спасибо.', '/ɪts oʊˈkeɪ aɪ kæn ˈmænɪʤ/', 'It''s OK. I can manage carrying these boxes by myself.' UNION ALL
    SELECT 'It''s OK. There''s no need - really.', 'Все хорошо. Не нужно (в этом нет необходимости) - правда.', '/ɪts oʊˈkeɪ ðɛrz noʊ nid ˈrɪəli/', 'It''s OK. There''s no need to drive me home - really, I can take the bus.' UNION ALL
    SELECT 'Let me (get you a fruit juice).', 'Давайте/Разрешите (принесу вам фруктовый сок)?', '/lɛt mi/', 'Let me get you a fruit juice while you wait.' UNION ALL
    SELECT 'Need any help?', 'Нужна помощь?', '/nid ˈɛni hɛlp/', 'You look busy with those packages - need any help?' UNION ALL
    SELECT 'Shall I (take your coat)?', 'Могу я (взять твоё пальто)?', '/ʃæl aɪ/', 'Shall I take your coat and hang it up for you?' UNION ALL
    SELECT 'Thanks for the offer, but I''m fine.', 'Спасибо за предложение, но я в порядке.', '/θæŋks fɔr ði ˈɔfər bʌt aɪm faɪn/', 'Thanks for the offer, but I''m fine and don''t need assistance.' UNION ALL
    SELECT 'That''d be lovely/great.', 'Это было бы чудесно/супер.', '/ˈðætəd bi ˈlʌvli/', 'You''ll cook dinner? That''d be lovely - thank you!' UNION ALL
    SELECT 'That''s very kind, but (I had something to eat on the plane).', 'Очень мило с твоей стороны, но (я поел в самолёте).', '/ðæts ˈvɛri kaɪnd bʌt/', 'That''s very kind, but I had something to eat on the plane already.' UNION ALL
    SELECT 'Would you like me to (give you a lift)?', 'Хочешь, чтобы я тебя подвёз?', '/wʊd ju laɪk mi tu/', 'Would you like me to give you a lift to the train station?' UNION ALL
    SELECT 'Would you mind?', 'А вы не против?', '/wʊd ju maɪnd/', 'Would you mind if I opened the window? It''s getting warm in here.' UNION ALL
    SELECT 'Yes. Please.', 'Да, пожалуйста.', '/jɛs pliz/', 'Could you pass the salt? Yes. Please.' UNION ALL
    SELECT 'You''re welcome to ...', 'Добро пожаловать ...', '/jʊr ˈwɛlkəm tu/', 'You''re welcome to use our swimming pool while you''re staying here.' UNION ALL
    SELECT 'You can ...', 'Вы можете...', '/ju kæn/', 'You can call me anytime if you have questions.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);