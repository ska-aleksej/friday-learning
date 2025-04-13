-- V7__Seed_B2_units.sql
INSERT INTO units (level_id, name, description, display_order) VALUES
    ((SELECT id FROM levels WHERE name = 'B2'), 'Unit 1 - Relationships & Personality', 'Отношения и личностные качества', 1),
    ((SELECT id FROM levels WHERE name = 'B2'), 'Unit 2 - Adventures & Challenges', 'Приключения и вызовы', 2),
    ((SELECT id FROM levels WHERE name = 'B2'), 'Unit 3 - Technology & Environment', 'Технологии и окружающая среда', 3),
    ((SELECT id FROM levels WHERE name = 'B2'), 'Unit 4 - Arts & Society', 'Искусство и общество', 4),
    ((SELECT id FROM levels WHERE name = 'B2'), 'Unit 5 - Urban Development & Lifestyle', 'Городское развитие и образ жизни', 5),
    ((SELECT id FROM levels WHERE name = 'B2'), 'Unit 6 - Travel & Experiences', 'Путешествия и впечатления', 6),
    ((SELECT id FROM levels WHERE name = 'B2'), 'Unit 7 - Food & Culture', 'Еда и культура', 7),
    ((SELECT id FROM levels WHERE name = 'B2'), 'Unit 8 - Career & Ambitions', 'Карьера и амбиции', 8),
    ((SELECT id FROM levels WHERE name = 'B2'), 'Unit 9 - Commerce & Shopping', 'Коммерция и покупки', 9),
    ((SELECT id FROM levels WHERE name = 'B2'), 'Unit 10 - Personal Growth', 'Личностный рост', 10),
    ((SELECT id FROM levels WHERE name = 'B2'), 'Unit 11 - Education & Learning', 'Образование и обучение', 11),
    ((SELECT id FROM levels WHERE name = 'B2'), 'Unit 12 - Economics & Social Trends', 'Экономика и социальные тенденции', 12);

-- Seed_B2_Unit1_words.sql
WITH unit_data AS (
    SELECT u.id AS unit_id
    FROM units u
    JOIN levels l ON u.level_id = l.id
    WHERE l.name = 'B2' AND u.display_order = 1
)
INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT ud.unit_id, data.english_word, data.russian_translation, data.transcription, data.example_sentence
FROM unit_data ud
CROSS JOIN (
    SELECT 'associate' AS english_word, 'ассоциировать' AS russian_translation, '/əˈsəʊ.si.eɪt/' AS transcription, 'People often associate Paris with romance.' AS example_sentence UNION ALL
    SELECT 'bond', 'узы, связь', '/bɒnd/', 'There''s a strong bond between the siblings.' UNION ALL
    SELECT 'brother-in-law', 'зять, шурин', '/ˈbrʌð.ər.ɪn.lɔː/', 'My brother-in-law is coming for dinner tonight.' UNION ALL
    SELECT 'burden', 'ноша, тяжесть, груз', '/ˈbɜː.dən/', 'She didn''t want to be a burden to her family.' UNION ALL
    SELECT 'candy', 'конфеты (любого сорта)', '/ˈkæn.di/', 'The children were given candy as a treat.' UNION ALL
    SELECT 'characteristic', 'характерная черта', '/ˌkær.ək.təˈrɪs.tɪk/', 'Kindness is her most noticeable characteristic.' UNION ALL
    SELECT 'common sense', 'здравый смысл', '/ˌkɒm.ən ˈsens/', 'Use your common sense when crossing the road.' UNION ALL
    SELECT 'considerate', 'тактичный, деликатный', '/kənˈsɪd.ər.ət/', 'It was considerate of you to call first.' UNION ALL
    SELECT 'definite', 'точный, конкретный', '/ˈdef.ɪ.nət/', 'We need a definite answer by tomorrow.' UNION ALL
    SELECT 'dependable', 'надёжный', '/dɪˈpen.də.bəl/', 'She''s the most dependable person I know.' UNION ALL
    SELECT 'devastation', 'разруха, разгром', '/ˌdev.əˈsteɪ.ʃən/', 'The hurricane left complete devastation.' UNION ALL
    SELECT 'dubious distinction', 'печальная слава', '/ˌdjuː.bi.əs dɪˈstɪŋk.ʃən/', 'He holds the dubious distinction of being the worst performer.' UNION ALL
    SELECT 'dutiful', 'исполнительный', '/ˈdjuː.tɪ.fəl/', 'He was a dutiful son who cared for his parents.' UNION ALL
    SELECT 'energetic', 'энергичный', '/ˌen.əˈdʒet.ɪk/', 'The energetic puppy ran around all day.' UNION ALL
    SELECT 'faith', 'вера', '/feɪθ/', 'She has great faith in her team''s abilities.' UNION ALL
    SELECT 'faithful', 'верный, истинный', '/ˈfeɪθ.fəl/', 'The dog remained faithful to its owner.' UNION ALL
    SELECT 'fiancée', 'невеста', '/fiˈɒn.seɪ/', 'He introduced his fiancée at the party.' UNION ALL
    SELECT 'fingers crossed', 'скрестив пальцы', '/ˌfɪŋ.ɡəz ˈkrɒst/', 'I''m keeping my fingers crossed for good weather.' UNION ALL
    SELECT 'flatmate', 'сосед по квартире', '/ˈflæt.meɪt/', 'My flatmate and I share the kitchen.' UNION ALL
    SELECT 'free spirit', 'свободный духом', '/ˌfriː ˈspɪr.ɪt/', 'She''s always been a free spirit who travels the world.' UNION ALL
    SELECT 'freelance', 'внештатный (сотрудник)', '/ˈfriː.lɑːns/', 'He works as a freelance graphic designer.' UNION ALL
    SELECT 'good mate', 'хороший друг', '/ˌɡʊd ˈmeɪt/', 'John''s been a good mate since school days.' UNION ALL
    SELECT 'gutsy', 'бесстрашный', '/ˈɡʌt.si/', 'It was a gutsy decision to start her own business.' UNION ALL
    SELECT 'hug', 'обнимать', '/hʌɡ/', 'She gave me a warm hug when I arrived.' UNION ALL
    SELECT 'ideology', 'идеология', '/ˌaɪ.diˈɒl.ə.dʒi/', 'Their political ideology differs from ours.' UNION ALL
    SELECT 'infrastructure', 'инфраструктура', '/ˈɪn.frəˌstrʌk.tʃər/', 'The country needs to improve its infrastructure.' UNION ALL
    SELECT 'inherit', 'унаследовать', '/ɪnˈher.ɪt/', 'She inherited her grandmother''s jewelry.' UNION ALL
    SELECT 'laid-back', 'непринуждённый', '/ˌleɪd ˈbæk/', 'He has a laid-back attitude towards life.' UNION ALL
    SELECT 'make sense', 'иметь смысл', '/ˌmeɪk ˈsens/', 'Your explanation doesn''t make sense to me.' UNION ALL
    SELECT 'material benefit', 'материальные блага', '/məˌtɪə.ri.əl ˈben.ɪ.fɪt/', 'The job offers excellent material benefits.' UNION ALL
    SELECT 'melting pot', '«плавильный котёл»', '/ˈmel.tɪŋ ˌpɒt/', 'New York is a true melting pot of cultures.' UNION ALL
    SELECT 'moving', 'трогательный', '/ˈmuː.vɪŋ/', 'The film''s ending was very moving.' UNION ALL
    SELECT 'mutual', 'взаимный, обоюдный', '/ˈmjuː.tʃu.əl/', 'We have mutual friends in common.' UNION ALL
    SELECT 'nursing home', 'дом престарелых', '/ˈnɜː.sɪŋ ˌhəʊm/', 'Her grandmother lives in a nursing home.' UNION ALL
    SELECT 'odd', 'странный, непонятный', '/ɒd/', 'That''s an odd color for a car.' UNION ALL
    SELECT 'outgoing', 'общительный', '/ˌaʊtˈɡəʊ.ɪŋ/', 'His outgoing personality makes him popular.' UNION ALL
    SELECT 'overtake', 'догонять, навёрстывать', '/ˌəʊ.vəˈteɪk/', 'The car overtook us on the highway.' UNION ALL
    SELECT 'passing acquaintance', 'мимолётное знакомство', '/ˌpɑː.sɪŋ əˈkweɪn.təns/', 'We''re not close, just passing acquaintances.' UNION ALL
    SELECT 'plantation', 'плантация', '/plɑːnˈteɪ.ʃən/', 'The old sugar plantation is now a museum.' UNION ALL
    SELECT 'process', 'процесс', '/ˈprəʊ.ses/', 'Learning a language is a gradual process.' UNION ALL
    SELECT 'rebellious', 'бунтарский, буйный', '/rɪˈbel.i.əs/', 'He was rebellious as a teenager.' UNION ALL
    SELECT 'renovation', 'реконструкция', '/ˌren.əˈveɪ.ʃən/', 'The house needs complete renovation.' UNION ALL
    SELECT 'rush', 'торопиться', '/rʌʃ/', 'Don''t rush - we have plenty of time.' UNION ALL
    SELECT 'sanctuary', 'заповедник, заказник', '/ˈsæŋk.tʃu.ər.i/', 'The bird sanctuary protects rare species.' UNION ALL
    SELECT 'sense of belonging', 'чувство принадлежности', '/ˌsens əv bɪˈlɒŋ.ɪŋ/', 'The club gives me a sense of belonging.' UNION ALL
    SELECT 'sense of direction', 'целенаправленность', '/ˌsens əv daɪˈrek.ʃən/', 'She has a clear sense of direction in life.' UNION ALL
    SELECT 'sense of duty', 'чувство долга', '/ˌsens əv ˈdjuː.ti/', 'He acted out of a strong sense of duty.' UNION ALL
    SELECT 'slang', 'сленг', '/slæŋ/', 'Teenagers often use slang that adults don''t understand.' UNION ALL
    SELECT 'sociable', 'общительный', '/ˈsəʊ.ʃə.bəl/', 'She''s very sociable and makes friends easily.' UNION ALL
    SELECT 'stand by', 'поддерживать', '/ˌstænd ˈbaɪ/', 'I''ll stand by you no matter what happens.' UNION ALL
    SELECT 'stepmother', 'мачеха, приёмная мать', '/ˈstepˌmʌð.ər/', 'His stepmother has been very kind to him.' UNION ALL
    SELECT 'striking', 'выдающийся', '/ˈstraɪ.kɪŋ/', 'She has striking blue eyes.' UNION ALL
    SELECT 'support network', 'сеть поддержки', '/səˈpɔːt ˌnet.wɜːk/', 'A good support network helps during tough times.' UNION ALL
    SELECT 'supportive', 'поддерживающий', '/səˈpɔː.tɪv/', 'My parents have always been supportive.' UNION ALL
    SELECT 'tanned', 'загорелый', '/tænd/', 'She returned from vacation looking tanned.' UNION ALL
    SELECT 'trace', 'прослеживать', '/treɪs/', 'We traced our family history back to 1700.' UNION ALL
    SELECT 'turn to', 'обратиться к кому-то', '/ˌtɜːn ˈtuː/', 'When in trouble, I turn to my best friend.' UNION ALL
    SELECT 'unreliable', 'ненадёжный', '/ˌʌn.rɪˈlaɪ.ə.bəl/', 'The old car has become unreliable.' UNION ALL
    SELECT 'get on well with', 'хорошо с кем-то ладить', '/ˌɡet ɒn ˈwel wɪð/', 'I get on well with my colleagues.' UNION ALL
    SELECT 'go round to', 'навестить кого-то', '/ˌɡəʊ ˈraʊnd tuː/', 'Let''s go round to John''s place tonight.' UNION ALL
    SELECT 'hang out with', 'тусоваться с кем-то', '/ˌhæŋ ˈaʊt wɪð/', 'She likes hanging out with her school friends.' UNION ALL
    SELECT 'keep up with', 'не отставать от', '/ˌkiːp ˈʌp wɪð/', 'It''s hard to keep up with technology changes.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B2_Unit2_words.sql
WITH unit_data AS (
    SELECT u.id AS unit_id
    FROM units u
    JOIN levels l ON u.level_id = l.id
    WHERE l.name = 'B2' AND u.display_order = 2
)
INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT ud.unit_id, data.english_word, data.russian_translation, data.transcription, data.example_sentence
FROM unit_data ud
CROSS JOIN (
    SELECT 'acceptable' AS english_word, 'приемлемый' AS russian_translation, '/əkˈsep.tə.bəl/' AS transcription, 'This solution is acceptable to all parties.' AS example_sentence UNION ALL
    SELECT 'adaptation', 'адаптация', '/ˌæd.əpˈteɪ.ʃən/', 'The film is an adaptation of a famous novel.' UNION ALL
    SELECT 'animal trap', 'ловушка животных', '/ˈæn.ɪ.məl ˌtræp/', 'Animal traps are illegal in this area.' UNION ALL
    SELECT 'approach', 'подход', '/əˈprəʊtʃ/', 'We need a new approach to this problem.' UNION ALL
    SELECT 'awesome', 'потрясный, потрясно', '/ˈɔː.səm/', 'The view from the mountain was awesome.' UNION ALL
    SELECT 'awkward', 'неуклюжий', '/ˈɔː.kwəd/', 'He felt awkward at the formal dinner.' UNION ALL
    SELECT 'background', 'биографические данные', '/ˈbæk.ɡraʊnd/', 'The job application asks for your background.' UNION ALL
    SELECT 'bad temper', 'плохой характер', '/ˌbæd ˈtem.pər/', 'His bad temper scared the children.' UNION ALL
    SELECT 'baking hot', 'горячая выпечка', '/ˌbeɪ.kɪŋ ˈhɒt/', 'The desert was baking hot at noon.' UNION ALL
    SELECT 'bank', 'вал, насыпь, дамба', '/bæŋk/', 'We sat on the grassy bank by the river.' UNION ALL
    SELECT 'bend', 'сгибать', '/bend/', 'Be careful not to bend your passport.' UNION ALL
    SELECT 'bonnet', 'капот', '/ˈbɒn.ɪt/', 'The mechanic opened the car''s bonnet.' UNION ALL
    SELECT 'bounce back', 'отскочить назад', '/ˌbaʊns ˈbæk/', 'She bounced back quickly after her illness.' UNION ALL
    SELECT 'box office', 'билетная касса', '/ˈbɒks ˌɒf.ɪs/', 'The film broke box office records.' UNION ALL
    SELECT 'budget', 'бюджет', '/ˈbʌdʒ.ɪt/', 'We need to stick to our travel budget.' UNION ALL
    SELECT 'bummer', 'разочарование', '/ˈbʌm.ər/', 'Missing the flight was a real bummer.' UNION ALL
    SELECT 'bump', 'бугорок', '/bʌmp/', 'There''s a bump on the road ahead.' UNION ALL
    SELECT 'bumpy', 'тряский (о дороге)', '/ˈbʌm.pi/', 'The country roads were very bumpy.' UNION ALL
    SELECT 'burst into flames', 'загореться', '/ˌbɜːst ˌɪn.tə ˈfleɪmz/', 'The car burst into flames after the crash.' UNION ALL
    SELECT 'capture', 'отражать', '/ˈkæp.tʃər/', 'The photo captures the city''s energy.' UNION ALL
    SELECT 'cast', 'актёрский состав', '/kɑːst/', 'The film has an impressive cast.' UNION ALL
    SELECT 'catch', 'уловить суть', '/kætʃ/', 'I didn''t quite catch what you said.' UNION ALL
    SELECT 'cautiously', 'осторожно', '/ˈkɔː.ʃəs.li/', 'She approached the dog cautiously.' UNION ALL
    SELECT 'claim', 'утверждать', '/kleɪm/', 'He claims to have seen a UFO.' UNION ALL
    SELECT 'clamp', 'закрепиться', '/klæmp/', 'The wheels clamped to the rail.' UNION ALL
    SELECT 'cliff', 'утёс, обрыв', '/klɪf/', 'The cliff dropped sharply to the sea.' UNION ALL
    SELECT 'collapse', 'крах, обвал', '/kəˈlæps/', 'The building collapsed in the earthquake.' UNION ALL
    SELECT 'combine', 'объединять', '/kəmˈbaɪn/', 'We need to combine our resources.' UNION ALL
    SELECT 'context', 'контекст', '/ˈkɒn.tekst/', 'You need to see this in its historical context.' UNION ALL
    SELECT 'copper mine', 'медная шахта', '/ˈkɒp.ə ˌmaɪn/', 'The old copper mine is now a museum.' UNION ALL
    SELECT 'cover', 'преодолеть', '/ˈkʌv.ər/', 'We covered 50 miles in one day.' UNION ALL
    SELECT 'cry', 'крик, вопль, мольба', '/kraɪ/', 'She let out a cry of surprise.' UNION ALL
    SELECT 'data', 'данные', '/ˈdeɪ.tə/', 'We''re analyzing the survey data.' UNION ALL
    SELECT 'delight', 'восторг,восхищение', '/dɪˈlaɪt/', 'The children squealed with delight.' UNION ALL
    SELECT 'devoted', 'посвященный', '/dɪˈvəʊ.tɪd/', 'She''s devoted to her work.' UNION ALL
    SELECT 'edition', 'издание', '/ɪˈdɪʃ.ən/', 'This is the latest edition of the textbook.' UNION ALL
    SELECT 'emerge', 'появиться', '/ɪˈmɜːdʒ/', 'The sun emerged from behind the clouds.' UNION ALL
    SELECT 'enchanting', 'обворожительный', '/ɪnˈtʃɑːn.tɪŋ/', 'The garden looked enchanting at dusk.' UNION ALL
    SELECT 'encouragingly', 'ободряюще', '/ɪnˈkʌr.ɪ.dʒɪŋ.li/', 'She smiled encouragingly at me.' UNION ALL
    SELECT 'engage', 'привлекать', '/ɪnˈɡeɪdʒ/', 'The teacher tried to engage all students.' UNION ALL
    SELECT 'ensure', 'гарантировать', '/ɪnˈʃɔːr/', 'This app ensures your privacy.' UNION ALL
    SELECT 'evil', 'зло, бедствие, злой', '/ˈiː.vəl/', 'The story has a classic evil villain.' UNION ALL
    SELECT 'express', 'выражать', '/ɪkˈspres/', 'Children need to express their feelings.' UNION ALL
    SELECT 'extreme', 'крайний,предельний', '/ɪkˈstriːm/', 'The expedition faced extreme conditions.' UNION ALL
    SELECT 'faint', 'обморок, слабый', '/feɪnt/', 'She felt faint after standing too long.' UNION ALL
    SELECT 'fairy tale', 'сказка', '/ˈfeə.ri ˌteɪl/', 'Cinderella is a famous fairy tale.' UNION ALL
    SELECT 'faraway', 'далекий,дальний', '/ˌfɑː.rəˈweɪ/', 'He had a faraway look in his eyes.' UNION ALL
    SELECT 'fascinate', 'очаровывать', '/ˈfæs.ɪ.neɪt/', 'Ancient history fascinates me.' UNION ALL
    SELECT 'fatten', 'откармливать', '/ˈfæt.ən/', 'Farmers fatten pigs before slaughter.' UNION ALL
    SELECT 'folk tale', 'народная сказка', '/ˈfəʊk ˌteɪl/', 'Grandma told us an old folk tale.' UNION ALL
    SELECT 'folklore', 'фольклор', '/ˈfəʊk.lɔːr/', 'She studies Russian folklore.' UNION ALL
    SELECT 'get caught on', 'попасться на', '/ˌɡet ˈkɔːt ɒn/', 'The sleeve got caught on a nail.' UNION ALL
    SELECT 'get stuck', 'застрять', '/ˌɡet ˈstʌk/', 'We got stuck in traffic for hours.' UNION ALL
    SELECT 'go ahead', 'идти вперёд', '/ˌɡəʊ əˈhed/', 'Go ahead and start without me.' UNION ALL
    SELECT 'hiking', 'поход', '/ˈhaɪ.kɪŋ/', 'We went hiking in the mountains.' UNION ALL
    SELECT 'icon', 'идол, кумир', '/ˈaɪ.kɒn/', 'She''s a fashion icon for many women.' UNION ALL
    SELECT 'imaginary', 'придуманный', '/ɪˈmædʒ.ɪ.nər.i/', 'The child has an imaginary friend.' UNION ALL
    SELECT 'in good time', ' заблаговременно', '/ɪn ˌɡʊd ˈtaɪm/', 'We arrived in good time for the show.' UNION ALL
    SELECT 'infographic', 'инфографика', '/ˈɪn.fəʊˌɡræf.ɪk/', 'The article included a helpful infographic.' UNION ALL
    SELECT 'insert', 'вставлять, вставка', '/ɪnˈsɜːt/', 'Insert the key and turn it.' UNION ALL
    SELECT 'inspired', 'вдохновлённый', '/ɪnˈspaɪəd/', 'The speech left me feeling inspired.' UNION ALL
    SELECT 'intense', 'напряжённый', '/ɪnˈtens/', 'The training was physically intense.' UNION ALL
    SELECT 'keep a diary', 'вести дневник', '/ˌkiːp ə ˈdaɪə.ri/', 'She''s kept a diary since childhood.' UNION ALL
    SELECT 'keep an eye on', 'следить за', '/ˌkiːp ən ˈaɪ ɒn/', 'Can you keep an eye on my bag?' UNION ALL
    SELECT 'keep records', 'вести учёт', '/ˌkiːp ˈrek.ɔːdz/', 'Businesses must keep financial records.' UNION ALL
    SELECT 'keep track of', 'отслеживать', '/ˌkiːp ˈtræk əv/', 'It''s hard to keep track of all my passwords.' UNION ALL
    SELECT 'keep you', 'держать вас', '/ˌkiːp ˈjuː/', 'This information will keep you informed.' UNION ALL
    SELECT 'keep your chin up', 'выше нос', '/ˌkiːp jɔːr ˈtʃɪn ʌp/', 'Keep your chin up - things will improve!' UNION ALL
    SELECT 'launch', 'запуск, запускать', '/lɔːntʃ/', 'The company will launch a new product.' UNION ALL
    SELECT 'leap to one''s feet', 'вскочить на ноги', '/ˌliːp tə wʌnz ˈfiːt/', 'He leapt to his feet when she entered.' UNION ALL
    SELECT 'life jacket', 'спасательный жилет', '/ˈlaɪf ˌdʒæk.ɪt/', 'Wear your life jacket on the boat.' UNION ALL
    SELECT 'manual', 'инструкция', '/ˈmæn.ju.əl/', 'Read the manual before assembling.' UNION ALL
    SELECT 'marshal', 'начальник полицейского участка', '/ˈmɑː.ʃəl/', 'The marshal organized the security.' UNION ALL
    SELECT 'migrant crisis', 'миграционный кризис', '/ˌmaɪ.ɡrənt ˈkraɪ.sɪs/', 'Europe faced a migrant crisis in 2015.' UNION ALL
    SELECT 'moan', 'стонать', '/məʊn/', 'He moaned about the cold weather.' UNION ALL
    SELECT 'monstrous', 'чудовищный', '/ˈmɒn.strəs/', 'The crime was absolutely monstrous.' UNION ALL
    SELECT 'mumble', 'бормотать', '/ˈmʌm.bəl/', 'He mumbled an apology and left.' UNION ALL
    SELECT 'mutter', 'бормотание', '/ˈmʌt.ər/', 'She muttered something under her breath.' UNION ALL
    SELECT 'native', 'родной', '/ˈneɪ.tɪv/', 'English is her native language.' UNION ALL
    SELECT 'obey', 'подчиняться', '/əˈbeɪ/', 'Soldiers must obey orders.' UNION ALL
    SELECT 'odd', 'странный', '/ɒd/', 'That''s an odd thing to say.' UNION ALL
    SELECT 'off-route', 'отклонение от маршрута', '/ˌɒf ˈruːt/', 'The plane went off-route due to storms.' UNION ALL
    SELECT 'oral', 'устный', '/ˈɔː.rəl/', 'We have an oral exam tomorrow.' UNION ALL
    SELECT 'panic', 'паника', '/ˈpæn.ɪk/', 'Don''t panic - we''ll solve this problem.' UNION ALL
    SELECT 'peak', 'вершина', '/piːk/', 'We reached the mountain peak at noon.' UNION ALL
    SELECT 'peel off', 'отслаиваться', '/ˌpiːl ˈɒf/', 'The wallpaper started to peel off.' UNION ALL
    SELECT 'phenomenon', 'явление', '/fəˈnɒm.ɪ.nən/', 'The northern lights are a natural phenomenon.' UNION ALL
    SELECT 'pick one''s way', 'выбирать дорогу', '/ˌpɪk wʌnz ˈweɪ/', 'We picked our way carefully through the rocks.' UNION ALL
    SELECT 'pits', 'ямы', '/pɪts/', 'The road was full of pits after the storm.' UNION ALL
    SELECT 'plastic surgery', 'пластическая хирургия', '/ˌplæs.tɪk ˈsɜː.dʒər.i/', 'She considered plastic surgery.' UNION ALL
    SELECT 'plot', 'сюжет', '/plɒt/', 'The novel has a complex plot.' UNION ALL
    SELECT 'plunge', 'погружение', '/plʌndʒ/', 'The diver took a plunge into the water.' UNION ALL
    SELECT 'put to sleep', 'усыпить', '/ˌpʊt tə ˈsliːp/', 'The vet had to put the injured dog to sleep.' UNION ALL
    SELECT 'rags to riches', 'из грязи в князи', '/ˌræɡz tə ˈrɪtʃ.ɪz/', 'His life was a true rags to riches story.' UNION ALL
    SELECT 'reboot', 'перезагрузить', '/ˌriːˈbuːt/', 'Try to reboot your computer.' UNION ALL
    SELECT 'refugee', 'беженец', '/ˌref.juˈdʒiː/', 'The camp provides shelter for refugees.' UNION ALL
    SELECT 'regain', 'восстановить', '/rɪˈɡeɪn/', 'She slowly regained her strength.' UNION ALL
    SELECT 'register', 'регистрировать', '/ˈredʒ.ɪ.stər/', 'You must register to vote.' UNION ALL
    SELECT 'relief', 'облегчение', '/rɪˈliːf/', 'It was such a relief to hear the good news.' UNION ALL
    SELECT 'reshape', 'перекраивать', '/ˌriːˈʃeɪp/', 'The war reshaped the country''s borders.' UNION ALL
    SELECT 'ridge', 'хребет', '/rɪdʒ/', 'We hiked along the mountain ridge.' UNION ALL
    SELECT 'risk', 'рисковать, риск', '/rɪsk/', 'Don''t risk your health by smoking.' UNION ALL
    SELECT 'set off', 'отправляться в путь', '/ˌset ˈɒf/', 'We set off at dawn for our trip.' UNION ALL
    SELECT 'setting', 'настройка', '/ˈset.ɪŋ/', 'Check the temperature settings.' UNION ALL
    SELECT 'sigh', 'вздох, вздыхать', '/saɪ/', 'She gave a sigh of disappointment.' UNION ALL
    SELECT 'social networking', 'соц.сети', '/ˌsəʊ.ʃəl ˈnet.wɜː.kɪŋ/', 'Teenagers spend hours on social networking.' UNION ALL
    SELECT 'spirit', 'дух', '/ˈspɪr.ɪt/', 'The team showed great team spirit.' UNION ALL
    SELECT 'steep', 'обрывистый', '/stiːp/', 'The path became too steep to climb.' UNION ALL
    SELECT 'storyline', 'сюжетная линия', '/ˈstɔː.ri.laɪn/', 'The film has an exciting storyline.' UNION ALL
    SELECT 'straighten', 'выпрямлять', '/ˈstreɪ.tən/', 'Straighten your back when sitting.' UNION ALL
    SELECT 'stranded', 'скрученный', '/ˈstræn.dɪd/', 'We were stranded when our car broke down.' UNION ALL
    SELECT 'striking', 'поразительный', '/ˈstraɪ.kɪŋ/', 'The contrast between them was striking.' UNION ALL
    SELECT 'struggle', 'борьба,бороться', '/ˈstrʌɡ.əl/', 'She struggled with the heavy package.' UNION ALL
    SELECT 'stunning', 'ошеломляющий', '/ˈstʌn.ɪŋ/', 'The view from the top was stunning.' UNION ALL
    SELECT 'summit', 'вершина горы', '/ˈsʌm.ɪt/', 'World leaders met at the economic summit.' UNION ALL
    SELECT 'sympathize', 'сочувствовать', '/ˈsɪm.pə.θaɪz/', 'I sympathize with your situation.' UNION ALL
    SELECT 'take off', 'преуспевать', '/ˌteɪk ˈɒf/', 'Her singing career really took off.' UNION ALL
    SELECT 'take up', 'занимать', '/ˌteɪk ˈʌp/', 'Golf takes up too much time.' UNION ALL
    SELECT 'theme park', 'тематический парк', '/ˈθiːm ˌpɑːk/', 'We''re going to a theme park tomorrow.' UNION ALL
    SELECT 'thorn bush', 'колючий кустарник', '/ˈθɔːn ˌbʊʃ/', 'My arm got scratched by a thorn bush.' UNION ALL
    SELECT 'tough', 'жёсткий', '/tʌf/', 'It was a tough decision to make.' UNION ALL
    SELECT 'transfer', 'перемещать', '/trænsˈfɜːr/', 'Transfer the files to the new computer.' UNION ALL
    SELECT 'trapped', 'пойманный', '/træpt/', 'The miners were trapped underground.' UNION ALL
    SELECT 'treacherous', 'предательский', '/ˈtretʃ.ər.əs/', 'The mountain roads are treacherous in winter.' UNION ALL
    SELECT 'trip', 'поездка', '/trɪp/', 'We''re planning a trip to Italy.' UNION ALL
    SELECT 'under one''s breath', 'на одном дыхании', '/ˌʌn.də wʌnz ˈbreθ/', 'He swore under his breath.' UNION ALL
    SELECT 'untouched', 'нетронутый', '/ʌnˈtʌtʃt/', 'The ancient ruins remained untouched.' UNION ALL
    SELECT 'upload', 'загружать', '/ˈʌp.ləʊd/', 'Upload your photos to the cloud.' UNION ALL
    SELECT 'varied', 'разнообразный', '/ˈveə.rid/', 'The menu offers a varied selection.' UNION ALL
    SELECT 'vertical', 'вертикальный', '/ˈvɜː.tɪ.kəl/', 'The cliff was almost vertical.' UNION ALL
    SELECT 'visual', 'наглядный', '/ˈvɪʒ.u.əl/', 'The presentation included visual aids.' UNION ALL
    SELECT 'walk back', 'вернуться', '/ˌwɔːk ˈbæk/', 'Let''s walk back the same way we came.' UNION ALL
    SELECT 'wise', 'мудрый', '/waɪz/', 'My grandfather gave me wise advice.' UNION ALL
    SELECT 'worn', 'потрёпанный', '/wɔːn/', 'The book looked old and worn.' UNION ALL
    SELECT 'youthful', 'молодой', '/ˈjuːθ.fəl/', 'She has a youthful appearance.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B2_Unit3_words.sql
WITH unit_data AS (
    SELECT u.id AS unit_id
    FROM units u
    JOIN levels l ON u.level_id = l.id
    WHERE l.name = 'B2' AND u.display_order = 3
)
INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT ud.unit_id, data.english_word, data.russian_translation, data.transcription, data.example_sentence
FROM unit_data ud
CROSS JOIN (
    SELECT 'adjust' AS english_word, 'настраивать' AS russian_translation, '/əˈdʒʌst/' AS transcription, 'It takes time to adjust to a new climate.' AS example_sentence UNION ALL
    SELECT 'affordable', 'доступный (по цене)', '/əˈfɔː.də.bəl/', 'The hotel offers affordable accommodation.' UNION ALL
    SELECT 'appropriate', 'соответственный', '/əˈprəʊ.pri.ət/', 'Jeans aren''t appropriate for the interview.' UNION ALL
    SELECT 'basin', 'таз, чаща', '/ˈbeɪ.sən/', 'Wash your hands in the basin.' UNION ALL
    SELECT 'bond', 'скреплять, связывать', '/bɒnd/', 'Shared experiences bond people together.' UNION ALL
    SELECT 'brick', 'кирпич', '/brɪk/', 'The house is built of red brick.' UNION ALL
    SELECT 'cardboard', 'картон', '/ˈkɑːd.bɔːd/', 'The package came in a cardboard box.' UNION ALL
    SELECT 'cartridge', 'картридж', '/ˈkɑː.trɪdʒ/', 'The printer needs a new ink cartridge.' UNION ALL
    SELECT 'charger', 'зарядка', '/ˈtʃɑː.dʒər/', 'I forgot my phone charger at home.' UNION ALL
    SELECT 'code', 'код', '/kəʊd/', 'Enter the security code to continue.' UNION ALL
    SELECT 'concrete', 'бетон', '/ˈkɒŋ.kriːt/', 'The sidewalk is made of concrete.' UNION ALL
    SELECT 'congestion', 'пробка на дороге', '/kənˈdʒes.tʃən/', 'Traffic congestion is bad during rush hour.' UNION ALL
    SELECT 'customized', 'персонализированные', '/ˈkʌs.tə.maɪzd/', 'We offer customized solutions for clients.' UNION ALL
    SELECT 'cutting-edge', 'самый современный', '/ˌkʌt.ɪŋ ˈedʒ/', 'The lab uses cutting-edge technology.' UNION ALL
    SELECT 'eco-friendly', 'экологичный', '/ˌiː.kəʊ ˈfrend.li/', 'We try to use eco-friendly products.' UNION ALL
    SELECT 'economical', 'экономический', '/ˌiː.kəˈnɒm.ɪ.kəl/', 'This car is very economical on fuel.' UNION ALL
    SELECT 'emit', 'излучать', '/iˈmɪt/', 'The device emits a high-pitched sound.' UNION ALL
    SELECT 'empower', 'позволять, предоставить', '/ɪmˈpaʊər/', 'Education empowers people to improve their lives.' UNION ALL
    SELECT 'epidemic', 'эпидемия', '/ˌep.ɪˈdem.ɪk/', 'The flu epidemic spread quickly.' UNION ALL
    SELECT 'era', 'эра, эпоха', '/ˈɪə.rə/', 'We live in the digital era.' UNION ALL
    SELECT 'famine', 'голод', '/ˈfæm.ɪn/', 'The drought caused widespread famine.' UNION ALL
    SELECT 'flex', 'сгибать', '/fleks/', 'Flex your knees when lifting heavy objects.' UNION ALL
    SELECT 'flicker', 'мерцание, вспышка', '/ˈflɪk.ər/', 'The candlelight flickered in the breeze.' UNION ALL
    SELECT 'global warming', 'глобальное потепление', '/ˌɡləʊ.bəl ˈwɔː.mɪŋ/', 'Global warming affects polar ice caps.' UNION ALL
    SELECT 'handy', 'удобный', '/ˈhæn.di/', 'Keep your passport handy during travel.' UNION ALL
    SELECT 'highlight', 'подчёркивать', '/ˈhaɪ.laɪt/', 'The report highlights key issues.' UNION ALL
    SELECT 'hook', 'крюк', '/hʊk/', 'Hang your coat on the hook.' UNION ALL
    SELECT 'hungry', 'голодный', '/ˈhʌŋ.ɡri/', 'I''m hungry after the long hike.' UNION ALL
    SELECT 'labour-saving', 'трудосберегающие', '/ˈleɪ.bəˌseɪ.vɪŋ/', 'Labour-saving devices help in the kitchen.' UNION ALL
    SELECT 'layer', 'слой', '/ˈleɪ.ər/', 'Apply a thin layer of paint.' UNION ALL
    SELECT 'manual', 'инструкция, руководство', '/ˈmæn.ju.əl/', 'Read the manual before assembly.' UNION ALL
    SELECT 'mass-produce', 'массово производить', '/ˌmæs.prəˈdjuːs/', 'The factory mass-produces car parts.' UNION ALL
    SELECT 'my pleasure', 'всегда пожалуйста', '/maɪ ˈpleʒ.ər/', '"Thanks for your help." "My pleasure!"' UNION ALL
    SELECT 'nanotechnology', 'нанотехнология', '/ˌnæn.əʊ.tekˈnɒl.ə.dʒi/', 'Nanotechnology has medical applications.' UNION ALL
    SELECT 'neat', 'отличный, изящный', '/niːt/', 'He came up with a neat solution.' UNION ALL
    SELECT 'only a matter of time', 'это вопрос времени', '/ˌəʊn.li ə ˈmæt.ər əv taɪm/', 'It''s only a matter of time before they succeed.' UNION ALL
    SELECT 'override', 'отменять', '/ˌəʊ.vəˈraɪd/', 'The manager can override the decision.' UNION ALL
    SELECT 'peak', 'разгар чего-либо', '/piːk/', 'Call during peak hours for faster service.' UNION ALL
    SELECT 'pesticide', 'пестициды', '/ˈpes.tɪ.saɪd/', 'Organic farms avoid pesticides.' UNION ALL
    SELECT 'pop over', 'заскочить, заглянуть', '/ˌpɒp ˈəʊ.vər/', 'Pop over for tea sometime.' UNION ALL
    SELECT 'prototype', 'модель, макет', '/ˈprəʊ.tə.taɪp/', 'They developed a working prototype.' UNION ALL
    SELECT 'purchase', 'покупка', '/ˈpɜː.tʃəs/', 'Keep your purchase receipts.' UNION ALL
    SELECT 'range', 'предел', '/reɪndʒ/', 'The product falls within this price range.' UNION ALL
    SELECT 'recycled', 'перерабатываемый', '/ˌriːˈsaɪ.kəld/', 'This paper is made from recycled materials.' UNION ALL
    SELECT 'refund', 'возврат денег', '/ˈriː.fʌnd/', 'They gave me a full refund.' UNION ALL
    SELECT 'replacement', 'замена, замещение', '/rɪˈpleɪs.mənt/', 'We need a replacement for the broken part.' UNION ALL
    SELECT 'run on', 'работать на чем-то', '/ˌrʌn ˈɒn/', 'This device runs on solar power.' UNION ALL
    SELECT 'set', 'застывать', '/set/', 'Wait for the glue to set completely.' UNION ALL
    SELECT 'sewing machine', 'швейная машина', '/ˈsəʊ.ɪŋ məˌʃiːn/', 'My grandmother uses an old sewing machine.' UNION ALL
    SELECT 'shell', 'очищать(от скорлупы)', '/ʃel/', 'Shell the peas before cooking.' UNION ALL
    SELECT 'signal', 'синал', '/ˈsɪɡ.nəl/', 'The phone has no signal here.' UNION ALL
    SELECT 'sophisticated', 'утонченный', '/səˈfɪs.tɪ.keɪ.tɪd/', 'It''s a sophisticated piece of equipment.' UNION ALL
    SELECT 'starve', 'голодать', '/stɑːv/', 'No one should starve in today''s world.' UNION ALL
    SELECT 'storage', 'хранилище', '/ˈstɔː.rɪdʒ/', 'We need more storage space.' UNION ALL
    SELECT 'time-consuming', 'требующий много времени', '/ˈtaɪm.kənˌsjuː.mɪŋ/', 'This is a time-consuming process.' UNION ALL
    SELECT 'tip', 'совет', '/tɪp/', 'Here''s a useful tip for travelers.' UNION ALL
    SELECT 'turn down', 'уменьшать(громкость)', '/ˌtɜːn ˈdaʊn/', 'Turn down the music, please.' UNION ALL
    SELECT 'underserved', 'обездоленный', '/ˌʌn.dəˈsɜːvd/', 'This program helps underserved communities.' UNION ALL
    SELECT 'undo', 'расстёгивать', '/ʌnˈduː/', 'Undo your seatbelt after landing.' UNION ALL
    SELECT 'upgrade', 'обновлять', '/ˈʌp.ɡreɪd/', 'We need to upgrade our software.' UNION ALL
    SELECT 'water purifier', 'водоочиститель', '/ˈwɔː.tə ˌpjʊə.rɪ.faɪ.ər/', 'The water purifier removes contaminants.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B2_Unit4_words.sql
WITH unit_data AS (
    SELECT u.id AS unit_id
    FROM units u
    JOIN levels l ON u.level_id = l.id
    WHERE l.name = 'B2' AND u.display_order = 4
)
INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT ud.unit_id, data.english_word, data.russian_translation, data.transcription, data.example_sentence
FROM unit_data ud
CROSS JOIN (
    SELECT 'acrobat' AS english_word, 'акробат' AS russian_translation, '/ˈæk.rə.bæt/' AS transcription, 'The circus acrobat performed amazing stunts.' AS example_sentence UNION ALL
    SELECT 'anonymous', 'анонимный', '/əˈnɒn.ɪ.məs/', 'The donation was made by an anonymous benefactor.' UNION ALL
    SELECT 'arty', 'художественный', '/ˈɑː.ti/', 'She has a very arty apartment.' UNION ALL
    SELECT 'attention', 'внимание', '/əˈten.ʃən/', 'The speaker demanded full attention.' UNION ALL
    SELECT 'auction', 'аукцион', '/ˈɔːk.ʃən/', 'The painting sold for millions at auction.' UNION ALL
    SELECT 'bear', 'выносить, терпеть', '/beər/', 'I can''t bear loud noises early in the morning.' UNION ALL
    SELECT 'blank', 'пустой', '/blæŋk/', 'His face was completely blank.' UNION ALL
    SELECT 'busker', 'уличный музыкант', '/ˈbʌs.kər/', 'The busker played violin in the subway.' UNION ALL
    SELECT 'buzzing', 'жужжание', '/ˈbʌz.ɪŋ/', 'The room was buzzing with excitement.' UNION ALL
    SELECT 'campaign', 'кампания', '/kæmˈpeɪn/', 'The advertising campaign was very successful.' UNION ALL
    SELECT 'carnival', 'карнавал', '/ˈkɑː.nɪ.vəl/', 'Rio''s carnival is world-famous.' UNION ALL
    SELECT 'commit', 'совершать', '/kəˈmɪt/', 'He committed himself to the project.' UNION ALL
    SELECT 'conquest', 'завоевание', '/ˈkɒŋ.kwest/', 'The Roman conquest changed Britain forever.' UNION ALL
    SELECT 'consideration', 'размышление', '/kənˌsɪd.əˈreɪ.ʃən/', 'After careful consideration, I declined.' UNION ALL
    SELECT 'convex', 'выпуклый', '/ˈkɒn.veks/', 'The mirror had a convex surface.' UNION ALL
    SELECT 'cosmopolitan', 'многонациональный', '/ˌkɒz.məˈpɒl.ɪ.tən/', 'New York is a cosmopolitan city.' UNION ALL
    SELECT 'demolish', 'сносить, разрушать', '/dɪˈmɒl.ɪʃ/', 'They demolished the old building.' UNION ALL
    SELECT 'drastic', 'решительный', '/ˈdræs.tɪk/', 'Drastic measures were necessary.' UNION ALL
    SELECT 'effort', 'усилие, старание', '/ˈef.ət/', 'It took great effort to finish on time.' UNION ALL
    SELECT 'elusive', 'неуловимый', '/iˈluː.sɪv/', 'The truth proved elusive.' UNION ALL
    SELECT 'epitomize', 'олицетворять', '/ɪˈpɪt.ə.maɪz/', 'She epitomizes professionalism.' UNION ALL
    SELECT 'expose', 'разоблачать', '/ɪkˈspəʊz/', 'The journalist exposed the corruption.' UNION ALL
    SELECT 'fine arts', 'изобразительное искусство', '/ˌfaɪn ˈɑːts/', 'She studied fine arts in Paris.' UNION ALL
    SELECT 'fortune', 'состояние', '/ˈfɔː.tʃuːn/', 'He made his fortune in real estate.' UNION ALL
    SELECT 'fulfil', 'реализовывать', '/fʊlˈfɪl/', 'This job fulfills my ambitions.' UNION ALL
    SELECT 'gig', 'выступление, концерт', '/ɡɪɡ/', 'The band has a gig tonight.' UNION ALL
    SELECT 'goosebumps', 'мурашки по коже', '/ˈɡuːs.bʌmps/', 'The scary story gave me goosebumps.' UNION ALL
    SELECT 'ideal', 'оптимальный, идеальный', '/aɪˈdɪəl/', 'This spot is ideal for picnics.' UNION ALL
    SELECT 'injustice', 'несправедливость', '/ɪnˈdʒʌs.tɪs/', 'They fought against social injustice.' UNION ALL
    SELECT 'intellectual', 'умственный', '/ˌɪn.təlˈek.tʃu.əl/', 'Chess is an intellectual game.' UNION ALL
    SELECT 'key', 'главный, основной', '/kiː/', 'Communication is key in relationships.' UNION ALL
    SELECT 'launch', 'начать, запустить', '/lɔːntʃ/', 'They launched a new product line.' UNION ALL
    SELECT 'lullaby', 'колыбельная', '/ˈlʌl.ə.baɪ/', 'She sang a lullaby to the baby.' UNION ALL
    SELECT 'muddy', 'грязный', '/ˈmʌd.i/', 'The path was muddy after the rain.' UNION ALL
    SELECT 'mural', 'фреска', '/ˈmjʊə.rəl/', 'The school wall has a beautiful mural.' UNION ALL
    SELECT 'non-participation', 'отказ от участия', '/ˌnɒn pɑːˌtɪs.ɪˈpeɪ.ʃən/', 'His non-participation was disappointing.' UNION ALL
    SELECT 'out of place', 'неуместный', '/ˌaʊt əv ˈpleɪs/', 'His comment felt out of place.' UNION ALL
    SELECT 'participate', 'участвовать', '/pɑːˈtɪs.ɪ.peɪt/', 'Everyone can participate in the discussion.' UNION ALL
    SELECT 'pattern', 'узор, образец', '/ˈpæt.ən/', 'The fabric has a floral pattern.' UNION ALL
    SELECT 'phone booth', 'телефонная будка', '/ˈfəʊn ˌbuːθ/', 'Phone booths are becoming rare.' UNION ALL
    SELECT 'protest', 'протест, митинг', '/ˈprəʊ.test/', 'The protest remained peaceful.' UNION ALL
    SELECT 'put on', 'ставить (сценку)', '/ˌpʊt ˈɒn/', 'The school put on a play.' UNION ALL
    SELECT 'regulate', 'регулировать', '/ˈreɡ.jə.leɪt/', 'Laws regulate business practices.' UNION ALL
    SELECT 'scene', 'сцена', '/siːn/', 'The crime scene was cordoned off.' UNION ALL
    SELECT 'slave labour', 'рабский труд', '/ˌsleɪv ˈleɪ.bər/', 'Many products involve slave labour.' UNION ALL
    SELECT 'soothe', 'умиротворять', '/suːð/', 'The music soothed her nerves.' UNION ALL
    SELECT 'spellbound', 'очарованный', '/ˈspel.baʊnd/', 'The audience was spellbound.' UNION ALL
    SELECT 'spray-paint', 'красить баллончиком', '/ˈspreɪ.peɪnt/', 'Artists spray-painted the wall.' UNION ALL
    SELECT 'spy', 'шпион', '/spaɪ/', 'The spy was caught with secret documents.' UNION ALL
    SELECT 'stand out', 'выделяться', '/ˌstænd ˈaʊt/', 'Her talent makes her stand out.' UNION ALL
    SELECT 'stimulate', 'стимулировать', '/ˈstɪm.jə.leɪt/', 'Coffee stimulates the brain.' UNION ALL
    SELECT 'tear off', 'срывать', '/ˌteər ˈɒf/', 'He tore off the price tag.' UNION ALL
    SELECT 'the arts', 'искусство', '/ði ˈɑːts/', 'She has always loved the arts.' UNION ALL
    SELECT 'tint', 'оттенок', '/tɪnt/', 'The glasses have a blue tint.' UNION ALL
    SELECT 'tunnel', 'тоннель', '/ˈtʌn.əl/', 'The train entered the tunnel.' UNION ALL
    SELECT 'ultimately', 'в конечном итоге', '/ˈʌl.tɪ.mət.li/', 'Ultimately, the decision is yours.' UNION ALL
    SELECT 'unpredictable', 'непредсказуемый', '/ˌʌn.prɪˈdɪk.tə.bəl/', 'The weather here is unpredictable.' UNION ALL
    SELECT 'venue', 'место', '/ˈven.juː/', 'The concert venue was packed.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B2_Unit5_words.sql
WITH unit_data AS (
    SELECT u.id AS unit_id
    FROM units u
    JOIN levels l ON u.level_id = l.id
    WHERE l.name = 'B2' AND u.display_order = 5
)
INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT ud.unit_id, data.english_word, data.russian_translation, data.transcription, data.example_sentence
FROM unit_data ud
CROSS JOIN (
    SELECT 'adaptable' AS english_word, 'приспосабливаемый' AS russian_translation, '/əˈdæp.tə.bəl/' AS transcription, 'She''s very adaptable to new situations.' AS example_sentence UNION ALL
    SELECT 'adolescence', 'молодость', '/ˌæd.əˈles.əns/', 'He went through many changes during adolescence.' UNION ALL
    SELECT 'ambitious', 'амбициозный', '/æmˈbɪʃ.əs/', 'She has ambitious plans for her career.' UNION ALL
    SELECT 'as a result', 'в результате', '/əz ə rɪˈzʌlt/', 'He studied hard and, as a result, passed the exam.' UNION ALL
    SELECT 'balance', 'баланс, равновесие', '/ˈbæl.əns/', 'It''s important to maintain a work-life balance.' UNION ALL
    SELECT 'barrier', 'преграда', '/ˈbær.i.ər/', 'Language can be a barrier to communication.' UNION ALL
    SELECT 'block', 'жилищный массив', '/blɒk/', 'They live in that new apartment block.' UNION ALL
    SELECT 'boost', 'повышать, улучшать', '/buːst/', 'The coffee gave me an energy boost.' UNION ALL
    SELECT 'competitive', 'конкурентоспособный', '/kəmˈpet.ɪ.tɪv/', 'He''s very competitive in sports.' UNION ALL
    SELECT 'concentrated', 'сосредоточенный', '/ˈkɒn.sən.treɪ.tɪd/', 'She gave the problem her concentrated attention.' UNION ALL
    SELECT 'consortium', 'консорциум', '/kənˈsɔː.ti.əm/', 'Several companies formed a consortium for the project.' UNION ALL
    SELECT 'converge', 'сойтись, сблизиться', '/kənˈvɜːdʒ/', 'The roads converge at the city center.' UNION ALL
    SELECT 'cultivate', 'выращивать', '/ˈkʌl.tɪ.veɪt/', 'Farmers cultivate crops in these fields.' UNION ALL
    SELECT 'dangle', 'свисать, висеть', '/ˈdæŋ.ɡəl/', 'The keys dangled from his belt.' UNION ALL
    SELECT 'decent', 'порядочный, пристойный', '/ˈdiː.sənt/', 'He''s a decent man who always helps others.' UNION ALL
    SELECT 'demonstrator', 'манифестант', '/ˈdem.ən.streɪ.tər/', 'Demonstrators gathered in the square.' UNION ALL
    SELECT 'disturbance', 'нарушение', '/dɪˈstɜː.bəns/', 'The noise caused a disturbance in the neighborhood.' UNION ALL
    SELECT 'diversity', 'разнообразие', '/daɪˈvɜː.sə.ti/', 'The city is known for its cultural diversity.' UNION ALL
    SELECT 'drawback', 'недостаток', '/ˈdrɔː.bæk/', 'The main drawback is the high cost.' UNION ALL
    SELECT 'drug dealing', 'наркоторговля', '/ˈdrʌɡ ˌdiː.lɪŋ/', 'Drug dealing is a serious crime.' UNION ALL
    SELECT 'emergence', 'появление, возникновение', '/ɪˈmɜː.dʒəns/', 'The emergence of new technologies changed everything.' UNION ALL
    SELECT 'enhance', 'усилять', '/ɪnˈhɑːns/', 'Good lighting can enhance a room''s appearance.' UNION ALL
    SELECT 'exaggeration', 'преувеличение', '/ɪɡˌzædʒ.əˈreɪ.ʃən/', 'His story was full of exaggeration.' UNION ALL
    SELECT 'exotic', 'экзотический', '/ɪɡˈzɒt.ɪk/', 'She loves wearing exotic jewelry.' UNION ALL
    SELECT 'factor', 'фактор, причина', '/ˈfæk.tər/', 'Time was the deciding factor.' UNION ALL
    SELECT 'fall apart', 'развалиться (на части)', '/ˌfɔːl əˈpɑːt/', 'The old book fell apart in my hands.' UNION ALL
    SELECT 'fall behind', 'отставать, не сделать вовремя', '/ˌfɔːl bɪˈhaɪnd/', 'Don''t fall behind with your payments.' UNION ALL
    SELECT 'fall for', 'влюбляться', '/ˌfɔːl ˈfɔːr/', 'He fell for her the moment they met.' UNION ALL
    SELECT 'fall out', 'ссориться', '/ˌfɔːl ˈaʊt/', 'They fell out over money issues.' UNION ALL
    SELECT 'fall through', 'потерпеть неудачу', '/ˌfɔːl ˈθruː/', 'Our plans fell through at the last minute.' UNION ALL
    SELECT 'fertile', 'плодородный', '/ˈfɜː.taɪl/', 'The valley has fertile soil.' UNION ALL
    SELECT 'from scratch', '(начинать) с чистого листа', '/frəm ˈskrætʃ/', 'She built the business from scratch.' UNION ALL
    SELECT 'frustrating', 'разочаровывающий', '/frʌˈstreɪ.tɪŋ/', 'It''s frustrating when computers don''t work.' UNION ALL
    SELECT 'fund', 'капитал, средства', '/fʌnd/', 'They raised funds for the new school.' UNION ALL
    SELECT 'green', 'экологичный', '/ɡriːn/', 'We need more green energy solutions.' UNION ALL
    SELECT 'hectic', 'безумный (день)', '/ˈhek.tɪk/', 'I''ve had a hectic day at work.' UNION ALL
    SELECT 'heritage', 'наследие', '/ˈher.ɪ.tɪdʒ/', 'The castle is part of our national heritage.' UNION ALL
    SELECT 'high-rise', 'высотный', '/ˈhaɪ.raɪz/', 'High-rise buildings dominate the city skyline.' UNION ALL
    SELECT 'impact', 'влияние', '/ˈɪm.pækt/', 'The new law will have a major impact.' UNION ALL
    SELECT 'in addition', 'к тому же', '/ɪn əˈdɪʃ.ən/', 'In addition to English, she speaks French.' UNION ALL
    SELECT 'infancy', 'младенчество', '/ˈɪn.fən.si/', 'The technology is still in its infancy.' UNION ALL
    SELECT 'intersection', 'пересечение', '/ˈɪn.tə.sek.ʃən/', 'Turn left at the next intersection.' UNION ALL
    SELECT 'knock down', 'разрушать (постройки)', '/ˌnɒk ˈdaʊn/', 'They plan to knock down the old factory.' UNION ALL
    SELECT 'knowledgeable', 'осведомленный', '/ˈnɒl.ɪ.dʒə.bəl/', 'Our guide was very knowledgeable.' UNION ALL
    SELECT 'leisure', 'досуг', '/ˈleʒ.ər/', 'How do you spend your leisure time?' UNION ALL
    SELECT 'literate', 'грамотный', '/ˈlɪt.ər.ət/', 'A literate population is essential for development.' UNION ALL
    SELECT 'mall', 'торговый центр', '/mɔːl/', 'Let''s meet at the food court in the mall.' UNION ALL
    SELECT 'metropolis', 'мегаполис', '/məˈtrɒp.əl.ɪs/', 'Tokyo is a bustling metropolis.' UNION ALL
    SELECT 'modernize', 'модернизировать', '/ˈmɒd.ən.aɪz/', 'The company needs to modernize its equipment.' UNION ALL
    SELECT 'novelty', 'новшество', '/ˈnɒv.əl.ti/', 'The novelty of the gadget soon wore off.' UNION ALL
    SELECT 'obstruct', 'препятствовать', '/əbˈstrʌkt/', 'Don''t obstruct the emergency exit.' UNION ALL
    SELECT 'on the other hand', 'с другой стороны', '/ɒn ði ˈʌð.ə hænd/', 'It''s expensive, but on the other hand, the quality is excellent.' UNION ALL
    SELECT 'outweigh', 'превалировать', '/ˌaʊtˈweɪ/', 'The benefits outweigh the costs.' UNION ALL
    SELECT 'peaceful', 'миролюбивый', '/ˈpiːs.fəl/', 'She has a very peaceful nature.' UNION ALL
    SELECT 'pearl diver', 'ловец жемчуга', '/ˈpɜːl ˌdaɪ.vər/', 'Pearl divers work in dangerous conditions.' UNION ALL
    SELECT 'pedestrian', 'пешеход', '/pəˈdes.tri.ən/', 'Pedestrians should use the crosswalk.' UNION ALL
    SELECT 'peer', 'равный', '/pɪər/', 'Children are influenced by their peers.' UNION ALL
    SELECT 'plant', 'завод', '/plɑːnt/', 'He works at the car plant.' UNION ALL
    SELECT 'quality of life', 'качество жизни', '/ˌkwɒl.ə.ti əv ˈlaɪf/', 'Good healthcare improves quality of life.' UNION ALL
    SELECT 'ramp', 'пандус', '/ræmp/', 'The building has wheelchair ramps.' UNION ALL
    SELECT 'redevelop', 'перепланировка', '/ˌriː.dɪˈvel.əp/', 'The city plans to redevelop the waterfront.' UNION ALL
    SELECT 'reform', 'реформа', '/rɪˈfɔːm/', 'The education system needs reform.' UNION ALL
    SELECT 'remarkable', 'замечательный', '/rɪˈmɑː.kə.bəl/', 'She made a remarkable recovery.' UNION ALL
    SELECT 'renewable', 'возобновляемый', '/rɪˈnjuː.ə.bəl/', 'Wind power is a renewable energy source.' UNION ALL
    SELECT 'reservoir', 'водохранилище', '/ˈrez.ə.vwɑːr/', 'The reservoir supplies water to the city.' UNION ALL
    SELECT 'resettle', 'переселять', '/ˌriːˈset.əl/', 'Refugees were resettled in safer areas.' UNION ALL
    SELECT 'residential', 'жилой', '/ˌrez.ɪˈden.ʃəl/', 'This is a quiet residential neighborhood.' UNION ALL
    SELECT 'scale', 'масштаб', '/skeɪl/', 'The project was organized on a large scale.' UNION ALL
    SELECT 'seek', 'искать', '/siːk/', 'They seek new opportunities abroad.' UNION ALL
    SELECT 'setback', 'неудача', '/ˈset.bæk/', 'The team suffered a major setback.' UNION ALL
    SELECT 'shoreline', 'береговая линия', '/ˈʃɔː.laɪn/', 'The shoreline eroded after the storm.' UNION ALL
    SELECT 'soar', 'парить', '/sɔːr/', 'Eagles soar high above the mountains.' UNION ALL
    SELECT 'spoil', 'портить', '/spɔɪl/', 'Don''t spoil your appetite with snacks.' UNION ALL
    SELECT 'spur of the moment', 'спонтанно', '/ˌspɜːr əv ðə ˈməʊ.mənt/', 'It was a spur of the moment decision.' UNION ALL
    SELECT 'stair rail', 'лестничные перила', '/ˈsteər ˌreɪl/', 'Hold the stair rail for safety.' UNION ALL
    SELECT 'stereotypical', 'стереотипный', '/ˌster.i.əˈtɪp.ɪ.kəl/', 'That''s a stereotypical view of tourists.' UNION ALL
    SELECT 'strait', 'пролив', '/streɪt/', 'The ship sailed through the narrow strait.' UNION ALL
    SELECT 'strike', 'забастовка', '/straɪk/', 'Workers went on strike for better pay.' UNION ALL
    SELECT 'suspicion', 'подозрение', '/səˈspɪʃ.ən/', 'His behavior aroused suspicion.' UNION ALL
    SELECT 'thrive', 'процветать', '/θraɪv/', 'Some plants thrive in shade.' UNION ALL
    SELECT 'toddler', 'ребенок, начинающий ходить', '/ˈtɒd.lər/', 'The toddler took her first steps.' UNION ALL
    SELECT 'tolerant', 'толерантный, терпимый', '/ˈtɒl.ər.ənt/', 'We should be more tolerant of different views.' UNION ALL
    SELECT 'tranquil', 'спокойный, тихий', '/ˈtræŋ.kwɪl/', 'It''s a tranquil spot by the lake.' UNION ALL
    SELECT 'unleash', 'высвободить, дать свободу', '/ʌnˈliːʃ/', 'The storm unleashed its fury.' UNION ALL
    SELECT 'vital', 'жизненный', '/ˈvaɪ.təl/', 'Water is vital for survival.' UNION ALL
    SELECT 'wealthy', 'богатый, богачи', '/ˈwel.θi/', 'The wealthy businessman donated to charity.' UNION ALL
    SELECT 'well-off', 'состоятельный, зажиточный', '/ˌwel ˈɒf/', 'They''re quite well-off but not extravagant.' UNION ALL
    SELECT 'willingness', 'готовность', '/ˈwɪl.ɪŋ.nəs/', 'Her willingness to help is appreciated.' UNION ALL
    SELECT 'wonder', 'чудо, изумляться', '/ˈwʌn.dər/', 'The Grand Canyon is a natural wonder.' UNION ALL
    SELECT 'zone', 'зона, район', '/zəʊn/', 'This is a no-parking zone.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B2_Unit6_words.sql
WITH unit_data AS (
    SELECT u.id AS unit_id
    FROM units u
    JOIN levels l ON u.level_id = l.id
    WHERE l.name = 'B2' AND u.display_order = 6
)
INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT ud.unit_id, data.english_word, data.russian_translation, data.transcription, data.example_sentence
FROM unit_data ud
CROSS JOIN (
    SELECT 'airline' AS english_word, 'авиакомпания' AS russian_translation, '/ˈeə.laɪn/' AS transcription, 'Which airline are you flying with?' AS example_sentence UNION ALL
    SELECT 'alternatively', 'альтернативно', '/ɒlˈtɜː.nə.tɪv.li/', 'Alternatively, we could take the train.' UNION ALL
    SELECT 'anything goes', 'что-то пойдёт', '/ˌen.i.θɪŋ ˈɡəʊz/', 'At this party, anything goes!' UNION ALL
    SELECT 'badly-behaved', 'непослушный', '/ˌbæd.li bɪˈheɪvd/', 'The badly-behaved child disrupted the class.' UNION ALL
    SELECT 'balcony', 'балкон', '/ˈbæl.kə.ni/', 'We had breakfast on the hotel balcony.' UNION ALL
    SELECT 'barbecue', 'барбекю', '/ˈbɑː.bɪ.kjuː/', 'Let''s have a barbecue this weekend.' UNION ALL
    SELECT 'blame', 'винить', '/bleɪm/', 'Don''t blame me for your mistakes.' UNION ALL
    SELECT 'blank', 'помутнённый', '/blæŋk/', 'He gave me a blank look of confusion.' UNION ALL
    SELECT 'boarding pass', 'посадочный талон', '/ˈbɔː.dɪŋ ˌpɑːs/', 'Don''t forget your boarding pass at security.' UNION ALL
    SELECT 'bush walk', 'пешая прогулка', '/ˈbʊʃ ˌwɔːk/', 'We went on a bush walk through the national park.' UNION ALL
    SELECT 'cable car', 'фуникулёр', '/ˈkeɪ.bəl ˌkɑːr/', 'The cable car takes you to the mountain top.' UNION ALL
    SELECT 'catch', 'застать кого-то', '/kætʃ/', 'I caught him reading my diary.' UNION ALL
    SELECT 'change your mind', 'передумать', '/ˌtʃeɪndʒ jɔːr ˈmaɪnd/', 'I was going to leave but then I changed my mind.' UNION ALL
    SELECT 'chef', 'шеф-повар', '/ʃef/', 'The chef prepared a special meal for us.' UNION ALL
    SELECT 'chest of drawers', 'комод', '/ˌtʃest əv ˈdrɔːz/', 'I keep my socks in the top drawer of the chest of drawers.' UNION ALL
    SELECT 'claustrophobic', 'клаустрофобия', '/ˌklɒs.trəˈfəʊ.bɪk/', 'The small elevator felt claustrophobic.' UNION ALL
    SELECT 'compensation', 'выплата', '/ˌkɒm.penˈseɪ.ʃən/', 'He received compensation for his injuries.' UNION ALL
    SELECT 'corridor', 'коридор, проход', '/ˈkɒr.ɪ.dɔːr/', 'Her office is down the corridor on the left.' UNION ALL
    SELECT 'couch', 'большой диван', '/kaʊtʃ/', 'We relaxed on the couch watching TV.' UNION ALL
    SELECT 'crop', 'культура (зерно)', '/krɒp/', 'Wheat is an important crop in this region.' UNION ALL
    SELECT 'damp', 'влажный, сырой', '/dæmp/', 'The towels are still damp from the wash.' UNION ALL
    SELECT 'day off', 'выходной день', '/ˌdeɪ ˈɒf/', 'I''m taking a day off work tomorrow.' UNION ALL
    SELECT 'delay', 'задержка, отсрочка', '/dɪˈleɪ/', 'Our flight had a three-hour delay.' UNION ALL
    SELECT 'disabled', 'инвалид, нетрудоспособный', '/dɪˈseɪ.bəld/', 'The building has access for disabled visitors.' UNION ALL
    SELECT 'dissatisfaction', 'неудовлетворение', '/ˌdɪs.sæt.ɪsˈfæk.ʃən/', 'There''s growing dissatisfaction with the service.' UNION ALL
    SELECT 'downside', 'недостаток, минус', '/ˈdaʊn.saɪd/', 'The downside of living here is the noise.' UNION ALL
    SELECT 'dramatic', 'поразительный', '/drəˈmæt.ɪk/', 'The landscape has dramatic cliffs and valleys.' UNION ALL
    SELECT 'feel free', 'свободный (в действии)', '/ˌfiːl ˈfriː/', 'Feel free to ask any questions.' UNION ALL
    SELECT 'figure out', 'выяснять, понимать', '/ˌfɪɡ.ər ˈaʊt/', 'I can''t figure out how this works.' UNION ALL
    SELECT 'fill out', 'заполнять', '/ˌfɪl ˈaʊt/', 'Please fill out this application form.' UNION ALL
    SELECT 'former', 'предыдущий', '/ˈfɔː.mər/', 'My former boss was very strict.' UNION ALL
    SELECT 'gap year', 'академический год', '/ˈɡæp jɪər/', 'She''s taking a gap year to travel.' UNION ALL
    SELECT 'ghost town', 'город-призрак', '/ˈɡəʊst ˌtaʊn/', 'The gold rush left behind several ghost towns.' UNION ALL
    SELECT 'gold rush', 'золотая лихорадка', '/ˈɡəʊld ˌrʌʃ/', 'The 19th century saw several gold rushes.' UNION ALL
    SELECT 'have a lot on your mind', 'много чего крутится в голове', '/hæv ə ˌlɒt ɒn jɔːr ˈmaɪnd/', 'You seem distracted - do you have a lot on your mind?' UNION ALL
    SELECT 'hiking', 'поход', '/ˈhaɪ.kɪŋ/', 'We went hiking in the mountains last weekend.' UNION ALL
    SELECT 'hospitality', 'гостеприимство', '/ˌhɒs.pɪˈtæl.ə.ti/', 'Thank you for your wonderful hospitality.' UNION ALL
    SELECT 'host', 'хозяин', '/həʊst/', 'Our host showed us around the city.' UNION ALL
    SELECT 'impression', 'впечатление', '/ɪmˈpreʃ.ən/', 'What was your first impression of Paris?' UNION ALL
    SELECT 'in two mind', 'сомневаться', '/ɪn ˈtuː maɪnd/', 'I''m in two minds about accepting the job.' UNION ALL
    SELECT 'itinerary', 'путеводитель', '/aɪˈtɪn.ər.ər.i/', 'Our travel itinerary includes three cities.' UNION ALL
    SELECT 'lotion', 'лосьон', '/ˈləʊ.ʃən/', 'Apply sunscreen lotion before going out.' UNION ALL
    SELECT 'makeover', 'переделка', '/ˈmeɪk.əʊ.vər/', 'The house got a complete makeover.' UNION ALL
    SELECT 'mattress', 'матрас', '/ˈmæt.rəs/', 'We need a new mattress for the guest bed.' UNION ALL
    SELECT 'mind you', 'заметь', '/ˈmaɪnd juː/', 'Mind you, I did warn him about the risks.' UNION ALL
    SELECT 'monastery', 'монастырь', '/ˈmɒn.ə.stri/', 'The ancient monastery is now a museum.' UNION ALL
    SELECT 'peasant', 'крестьянин', '/ˈpez.ənt/', 'The peasants worked the land for generations.' UNION ALL
    SELECT 'period', 'срок, эпоха, период', '/ˈpɪə.ri.əd/', 'The Victorian period saw many changes.' UNION ALL
    SELECT 'pick up', 'подбирать, забирать (на машине)', '/ˌpɪk ˈʌp/', 'I''ll pick you up at the station at six.' UNION ALL
    SELECT 'porch', 'крыльцо, веранда', '/pɔːtʃ/', 'We sat on the porch watching the sunset.' UNION ALL
    SELECT 'primitive', 'примитивный, первобытный', '/ˈprɪm.ɪ.tɪv/', 'The tools were very primitive by today''s standards.' UNION ALL
    SELECT 'prospector', 'goldотоискатель', '/ˈprɒs.pek.tər/', 'Prospectors searched for gold in the rivers.' UNION ALL
    SELECT 'put off', 'вызывать отвращение', '/ˌpʊt ˈɒf/', 'The smell put me off my food.' UNION ALL
    SELECT 'put your mind to something', 'направить свою энергию в', '/ˌpʊt jɔːr ˈmaɪnd tə ˌsʌm.θɪŋ/', 'You can achieve anything if you put your mind to it.' UNION ALL
    SELECT 'rafting', 'рафтинг (спуск на плотах)', '/ˈrɑːf.tɪŋ/', 'White-water rafting is an exciting sport.' UNION ALL
    SELECT 'restore', 'возродить, восстановить', '/rɪˈstɔːr/', 'They restored the old painting beautifully.' UNION ALL
    SELECT 'rewarding', 'полезный', '/rɪˈwɔː.dɪŋ/', 'Teaching can be very rewarding.' UNION ALL
    SELECT 'Segway', 'гироскутер с велосипедным рулём на штанге-держателе', '/ˈseɡ.weɪ/', 'We took a Segway tour of the city.' UNION ALL
    SELECT 'self-catering', 'самообслуживание', '/ˌself ˈkeɪ.tər.ɪŋ/', 'We booked a self-catering apartment.' UNION ALL
    SELECT 'shot', 'кадр, снимок', '/ʃɒt/', 'That''s a great shot of the mountains.' UNION ALL
    SELECT 'shutters', 'жалюзи', '/ˈʃʌt.əz/', 'Close the shutters to keep out the sun.' UNION ALL
    SELECT 'site', 'место (происшествия)', '/saɪt/', 'This is the site of the ancient battle.' UNION ALL
    SELECT 'snorkeling', 'ныряние с трубкой', '/ˈsnɔː.kəl.ɪŋ/', 'We went snorkeling in the coral reef.' UNION ALL
    SELECT 'soap opera', 'мыльная опера', '/ˈsəʊp ˌɒp.ər.ə/', 'My grandmother watches that soap opera every day.' UNION ALL
    SELECT 'stick to', 'придерживаться чего-либо', '/ˌstɪk ˈtuː/', 'If you stick to your diet, you''ll lose weight.' UNION ALL
    SELECT 'thrill', 'глубокое волнение', '/θrɪl/', 'It gave me a thrill to meet my hero.' UNION ALL
    SELECT 'tough', 'трудный, непростой', '/tʌf/', 'It was a tough decision to make.' UNION ALL
    SELECT 'trail', 'тропинка', '/treɪl/', 'Follow the trail through the woods.' UNION ALL
    SELECT 'upcoming', 'предстоящий', '/ˈʌpˌkʌm.ɪŋ/', 'The upcoming festival should be fun.' UNION ALL
    SELECT 'vaccination', 'вакцинация', '/ˌvæk.sɪˈneɪ.ʃən/', 'Make sure your vaccinations are up to date.' UNION ALL
    SELECT 'valid', 'действующий', '/ˈvæl.ɪd/', 'Your passport must be valid for six months.' UNION ALL
    SELECT 'vaulted', 'куполообразный', '/ˈvɔːl.tɪd/', 'The church has beautiful vaulted ceilings.' UNION ALL
    SELECT 'weird', 'чудаковатый', '/wɪəd/', 'He has some weird habits.' UNION ALL
    SELECT 'wildlife reserve', 'заповедник', '/ˈwaɪld.laɪf rɪˌzɜːv/', 'We saw elephants at the wildlife reserve.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B2_Unit7_words.sql
WITH unit_data AS (
    SELECT u.id AS unit_id
    FROM units u
    JOIN levels l ON u.level_id = l.id
    WHERE l.name = 'B2' AND u.display_order = 7
)
INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT ud.unit_id, data.english_word, data.russian_translation, data.transcription, data.example_sentence
FROM unit_data ud
CROSS JOIN (
    SELECT 'account' AS english_word, 'доклад, сообщение' AS russian_translation, '/əˈkaʊnt/' AS transcription, 'He gave a detailed account of the incident.' AS example_sentence UNION ALL
    SELECT 'all the same', 'без разницы', '/ˌɔːl ðə ˈseɪm/', 'You can stay or go - it''s all the same to me.' UNION ALL
    SELECT 'attentive', 'внимательный', '/əˈten.tɪv/', 'The waiter was very attentive throughout our meal.' UNION ALL
    SELECT 'backpack', 'сумка, рюкзак', '/ˈbæk.pæk/', 'She packed her backpack for the hiking trip.' UNION ALL
    SELECT 'bacon', 'бекон', '/ˈbeɪ.kən/', 'I love crispy bacon with my eggs.' UNION ALL
    SELECT 'bring up', 'воспитывать', '/ˌbrɪŋ ˈʌp/', 'She was brought up by her grandparents.' UNION ALL
    SELECT 'cereal', 'каша', '/ˈsɪə.ri.əl/', 'I have cereal with milk for breakfast.' UNION ALL
    SELECT 'charity shop', 'благотворительный магазин', '/ˈtʃær.ə.ti ˌʃɒp/', 'We donated our old clothes to the charity shop.' UNION ALL
    SELECT 'chew', 'жевать', '/tʃuː/', 'Chew your food properly before swallowing.' UNION ALL
    SELECT 'dairy', 'молочный', '/ˈdeə.ri/', 'Dairy products are good sources of calcium.' UNION ALL
    SELECT 'disobey', 'неподчинение', '/ˌdɪs.əˈbeɪ/', 'Children sometimes disobey their parents.' UNION ALL
    SELECT 'doll''s house', 'кукольный дом', '/ˈdɒlz ˌhaʊs/', 'My daughter spends hours playing with her doll''s house.' UNION ALL
    SELECT 'fizzy drink', 'газировка', '/ˌfɪz.i ˈdrɪŋk/', 'Too many fizzy drinks are bad for your teeth.' UNION ALL
    SELECT 'grain', 'зерно', '/ɡreɪn/', 'The farmer harvested the grain in autumn.' UNION ALL
    SELECT 'heart condition', 'сердечная недостаточность', '/ˈhɑːt kənˌdɪʃ.ən/', 'He takes medication for his heart condition.' UNION ALL
    SELECT 'indigenous', 'коренной, местный', '/ɪnˈdɪdʒ.ɪ.nəs/', 'The indigenous people have lived here for centuries.' UNION ALL
    SELECT 'intrigued', 'заинтригованный', '/ɪnˈtriːɡd/', 'I was intrigued by the mysterious package.' UNION ALL
    SELECT 'ketchup', 'кетчуп', '/ˈketʃ.əp/', 'Do you want ketchup with your fries?' UNION ALL
    SELECT 'lamb', 'ягненок', '/læm/', 'Roast lamb is traditional for Easter.' UNION ALL
    SELECT 'mask', 'маска', '/mɑːsk/', 'Wear a mask in crowded places.' UNION ALL
    SELECT 'munch', 'чавкать', '/mʌntʃ/', 'He was munching on an apple loudly.' UNION ALL
    SELECT 'niche market', 'специализированный рынок', '/ˈniːʃ ˌmɑː.kɪt/', 'They found success in a niche market.' UNION ALL
    SELECT 'anecdotal', 'непроверенный, неофициальный', '/ˌæn.ɪkˈdəʊ.təl/', 'The evidence is only anecdotal at this stage.' UNION ALL
    SELECT 'casually', 'повседневно', '/ˈkæʒ.u.ə.li/', 'He was dressed casually in jeans and a T-shirt.' UNION ALL
    SELECT 'symbolize', 'символизировать', '/ˈsɪm.bəl.aɪz/', 'The dove symbolizes peace.' UNION ALL
    SELECT 'talk over', 'говорить одновременно', '/ˌtɔːk ˈəʊ.vər/', 'They kept talking over each other during the meeting.' UNION ALL
    SELECT 'unique', 'уникальный', '/juˈniːk/', 'Each snowflake is unique.' UNION ALL
    SELECT 'variation', 'вариация, различие', '/ˌveə.riˈeɪ.ʃən/', 'There are many regional variations of this dish.' UNION ALL
    SELECT 'difference of opinion', 'разногласия', '/ˌdɪf.ər.əns əv əˈpɪn.jən/', 'We had a difference of opinion about the best approach.' UNION ALL
    SELECT 'veil', 'фата', '/veɪl/', 'The bride wore a beautiful lace veil.' UNION ALL
    SELECT 'bride', 'невеста', '/braɪd/', 'The bride looked stunning in her wedding dress.' UNION ALL
    SELECT 'climax', 'разгар, кульминация', '/ˈklaɪ.mæks/', 'The movie''s climax was very exciting.' UNION ALL
    SELECT 'engagement', 'помолвка', '/ɪnˈɡeɪdʒ.mənt/', 'They announced their engagement last month.' UNION ALL
    SELECT 'fold', 'складывать', '/fəʊld/', 'Fold the paper in half carefully.' UNION ALL
    SELECT 'insignificant', 'незначительный', '/ˌɪn.sɪɡˈnɪf.ɪ.kənt/', 'The amount was too insignificant to matter.' UNION ALL
    SELECT 'advocate', 'адвокат', '/ˈæd.və.kət/', 'She works as a children''s rights advocate.' UNION ALL
    SELECT 'lean', 'наклоняться', '/liːn/', 'Don''t lean out of the window - it''s dangerous!' UNION ALL
    SELECT 'brim', 'переполнять', '/brɪm/', 'Her eyes brimmed with tears.' UNION ALL
    SELECT 'cocktail', 'коктейль', '/ˈkɒk.teɪl/', 'We ordered cocktails at the bar.' UNION ALL
    SELECT 'make no difference', 'никакой разницы, не иметь никакого значения', '/ˌmeɪk nəʊ ˈdɪf.ər.əns/', 'It makes no difference to me which restaurant we choose.' UNION ALL
    SELECT 'fiancée', 'невеста', '/fiˈɒn.seɪ/', 'He introduced us to his fiancée.' UNION ALL
    SELECT 'dessert', 'десерт', '/dɪˈzɜːt/', 'What''s for dessert tonight?' UNION ALL
    SELECT 'garnish', 'гарнир, украшение', '/ˈɡɑː.nɪʃ/', 'The chef used parsley to garnish the dish.' UNION ALL
    SELECT 'revolting', 'отвратительный', '/rɪˈvəʊl.tɪŋ/', 'The smell from the garbage was revolting.' UNION ALL
    SELECT 'snob', 'сноб', '/snɒb/', 'He''s such a snob about wine.' UNION ALL
    SELECT 'sound', 'надежный прочный', '/saʊnd/', 'The bridge is structurally sound.' UNION ALL
    SELECT 'stir fry', 'жарить на раскаленном масле', '/ˈstɜː ˌfraɪ/', 'I''ll make a quick stir fry for dinner.' UNION ALL
    SELECT 'big deal', 'большое дело', '/ˌbɪɡ ˈdiːl/', 'Don''t make such a big deal about it.' UNION ALL
    SELECT 'province', 'провинция, область', '/ˈprɒv.ɪns/', 'He comes from a northern province.' UNION ALL
    SELECT 'processed food', 'переработанные продукты питания', '/ˌprəʊ.sest ˈfuːd/', 'Try to avoid too much processed food.' UNION ALL
    SELECT 'proficient', 'опытный', '/prəˈfɪʃ.ənt/', 'She''s proficient in three languages.' UNION ALL
    SELECT 'protein', 'протеин', '/ˈprəʊ.tiːn/', 'Athletes need plenty of protein.' UNION ALL
    SELECT 'range', 'простираться', '/reɪndʒ/', 'Prices range from $20 to $100.' UNION ALL
    SELECT 'rebel', 'бунтовать', '/rɪˈbel/', 'Teenagers often rebel against authority.' UNION ALL
    SELECT 'respectful', 'уважительный', '/rɪˈspekt.fəl/', 'Be respectful to your elders.' UNION ALL
    SELECT 'reward', 'награждать', '/rɪˈwɔːd/', 'Good behavior should be rewarded.' UNION ALL
    SELECT 'rush hour', 'час-пик', '/ˈrʌʃ ˌaʊər/', 'Avoid driving during rush hour.' UNION ALL
    SELECT 'shame', 'стыдиться', '/ʃeɪm/', 'There''s no shame in asking for help.' UNION ALL
    SELECT 'shelf', 'полка', '/ʃelf/', 'Put the books back on the shelf.' UNION ALL
    SELECT 'sneeze', 'чихать', '/sniːz/', 'Cover your mouth when you sneeze.' UNION ALL
    SELECT 'soft', 'мягкий', '/sɒft/', 'The baby''s skin is so soft.' UNION ALL
    SELECT 'stare', 'пялиться', '/steər/', 'It''s rude to stare at people.' UNION ALL
    SELECT 'strict', 'строгий', '/strɪkt/', 'My parents were very strict when I was young.' UNION ALL
    SELECT 'sugary', 'сладкий', '/ˈʃʊɡ.ər.i/', 'Try to avoid sugary snacks.' UNION ALL
    SELECT 'tell off', 'отчитывать', '/ˌtel ˈɒf/', 'The teacher told him off for being late.' UNION ALL
    SELECT 'nutrient', 'питательное вещество', '/ˈnjuː.tri.ənt/', 'Fruits contain many essential nutrients.' UNION ALL
    SELECT 'vitamin', 'витамин', '/ˈvɪt.ə.mɪn/', 'Oranges are rich in vitamin C.' UNION ALL
    SELECT 'minimal', 'минимальный', '/ˈmɪn.ɪ.məl/', 'The design uses minimal decoration.' UNION ALL
    SELECT 'groom', 'жених', '/ɡruːm/', 'The groom looked nervous before the ceremony.' UNION ALL
    SELECT 'gourmet', 'гурман, изысканный', '/ˈɡɔː.meɪ/', 'This restaurant serves gourmet food.' UNION ALL
    SELECT 'norm', 'правило, норма', '/nɔːm/', 'Working from home has become the norm.' UNION ALL
    SELECT 'hen do', 'девичник', '/ˈhen ˌduː/', 'Her friends organized a hen do before the wedding.' UNION ALL
    SELECT 'pause', 'пауза', '/pɔːz/', 'There was a brief pause in the conversation.' UNION ALL
    SELECT 'mark', 'отмечать', '/mɑːk/', 'Mark the important dates on your calendar.' UNION ALL
    SELECT 'perceive', 'воспринимать', '/pəˈsiːv/', 'How do you perceive this situation?' UNION ALL
    SELECT 'parade', 'парад', '/pəˈreɪd/', 'We watched the Thanksgiving Day parade.' UNION ALL
    SELECT 'respond', 'ответить, реагировать', '/rɪˈspɒnd/', 'How did she respond to the news?' UNION ALL
    SELECT 'sing a different tune', 'запеть иначе, заговорить по-другому', '/ˌsɪŋ ə ˌdɪf.ər.ənt ˈtjuːn/', 'He criticized the plan at first, but now he''s singing a different tune.' UNION ALL
    SELECT 'prosperity', 'благополучие, процветание', '/prɒsˈper.ə.ti/', 'The country enjoyed years of prosperity.' UNION ALL
    SELECT 'smartly', 'умно', '/ˈsmɑːt.li/', 'He was smartly dressed for the interview.' UNION ALL
    SELECT 'reception', 'репетиция', '/rɪˈsep.ʃən/', 'The wedding reception was held in a beautiful garden.' UNION ALL
    SELECT 'supposed', 'предполагаемый, воображаемый', '/səˈpəʊzd/', 'This is the supposed location of the treasure.' UNION ALL
    SELECT 'stag do', 'мальчишник', '/ˈstæɡ ˌduː/', 'They went paintballing for his stag do.' UNION ALL
    SELECT 'lollipop', 'леденец', '/ˈlɒl.i.pɒp/', 'The child happily licked her lollipop.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B2_Unit8_words.sql
WITH unit_data AS (
    SELECT u.id AS unit_id
    FROM units u
    JOIN levels l ON u.level_id = l.id
    WHERE l.name = 'B2' AND u.display_order = 8
)
INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT ud.unit_id, data.english_word, data.russian_translation, data.transcription, data.example_sentence
FROM unit_data ud
CROSS JOIN (
    SELECT 'ambition' AS english_word, 'амбиция, цель' AS russian_translation, '/æmˈbɪʃ.ən/' AS transcription, 'Her ambition is to become CEO one day.' AS example_sentence UNION ALL
    SELECT 'chalk', 'мел', '/tʃɔːk/', 'The teacher wrote on the board with chalk.' UNION ALL
    SELECT 'expectation', 'ожидание', '/ˌek.spekˈteɪ.ʃən/', 'The movie didn''t live up to my expectations.' UNION ALL
    SELECT 'goal', 'цель', '/ɡəʊl/', 'My goal is to run a marathon this year.' UNION ALL
    SELECT 'live up to', 'оправдывать (ожидания)', '/ˌlɪv ˈʌp tuː/', 'The product lives up to its promises.' UNION ALL
    SELECT 'overall', 'общий', '/ˌəʊ.vərˈɔːl/', 'The overall impression was positive.' UNION ALL
    SELECT 'tap', 'кран, рычаг', '/tæp/', 'Don''t leave the tap running.' UNION ALL
    SELECT 'target', 'цель', '/ˈtɑː.ɡɪt/', 'We''re on target to finish by Friday.' UNION ALL
    SELECT 'bound for', 'направляющиеся в', '/ˈbaʊnd fɔːr/', 'This train is bound for London.' UNION ALL
    SELECT 'deserve', 'заслуживать', '/dɪˈzɜːv/', 'You deserve a break after all that work.' UNION ALL
    SELECT 'flexible', 'гибкий', '/ˈflek.sə.bəl/', 'We need a more flexible approach.' UNION ALL
    SELECT 'legal firm', 'юридическая фирма', '/ˈliː.ɡəl ˌfɜːm/', 'She works at a prestigious legal firm.' UNION ALL
    SELECT 'numerous', 'многочисленный', '/ˈnjuː.mə.rəs/', 'We''ve received numerous complaints.' UNION ALL
    SELECT 'policy', 'политика', '/ˈpɒl.ə.si/', 'The company has a strict no-smoking policy.' UNION ALL
    SELECT 'recognition', 'признание', '/ˌrek.əɡˈnɪʃ.ən/', 'She received recognition for her hard work.' UNION ALL
    SELECT 'successful', 'успешный', '/səkˈses.fəl/', 'The campaign was highly successful.' UNION ALL
    SELECT 'accountant', 'бухгалтер', '/əˈkaʊn.tənt/', 'Our accountant handles all the finances.' UNION ALL
    SELECT 'airmiles', 'авиа-мили', '/ˈeə.maɪlz/', 'I collect airmiles when I travel.' UNION ALL
    SELECT 'alarmed', 'встревоженный', '/əˈlɑːmd/', 'We were alarmed by the loud noise.' UNION ALL
    SELECT 'axe', 'топор', '/æks/', 'He chopped wood with an axe.' UNION ALL
    SELECT 'back-breaking', 'непосильный', '/ˈbækˌbreɪ.kɪŋ/', 'Farming is back-breaking work.' UNION ALL
    SELECT 'bleak', 'мрачный', '/bliːk/', 'The future looks bleak for the company.' UNION ALL
    SELECT 'delight', 'восторг', '/dɪˈlaɪt/', 'The children squealed with delight.' UNION ALL
    SELECT 'desperate', 'отчаянный', '/ˈdes.pər.ət/', 'He was desperate for help.' UNION ALL
    SELECT 'greed', 'жадность', '/ɡriːd/', 'Greed led to the company''s downfall.' UNION ALL
    SELECT 'habitat', 'среда обитания', '/ˈhæb.ɪ.tæt/', 'Pollution is destroying natural habitats.' UNION ALL
    SELECT 'majestic', 'величественный', '/məˈdʒes.tɪk/', 'The mountains looked majestic at sunrise.' UNION ALL
    SELECT 'medicinal', 'лекарственный', '/məˈdɪs.ɪ.nəl/', 'This plant has medicinal properties.' UNION ALL
    SELECT 'small-scale', 'мелкомасштабный', '/ˌsmɔːl ˈskeɪl/', 'It''s only a small-scale operation.' UNION ALL
    SELECT 'timber', 'пиломатериал, брус', '/ˈtɪm.bər/', 'The house is built with solid timber.' UNION ALL
    SELECT 'faintest', 'малейший', '/ˈfeɪn.tɪst/', 'I haven''t the faintest idea what you mean.' UNION ALL
    SELECT 'guidance', 'руководство', '/ˈɡaɪ.dəns/', 'Thank you for your guidance on this matter.' UNION ALL
    SELECT 'inspirational', 'вдохновляющий', '/ˌɪn.spɪˈreɪ.ʃən.əl/', 'Her speech was truly inspirational.' UNION ALL
    SELECT 'master', 'хозяин, господин', '/ˈmɑː.stər/', 'He''s a master of his craft.' UNION ALL
    SELECT 'miserable', 'несчастный', '/ˈmɪz.ər.ə.bəl/', 'Why do you look so miserable today?' UNION ALL
    SELECT 'no object', 'не проблема, не вопрос', '/ˌnəʊ ˈɒb.dʒɪkt/', 'Money is no object when it comes to her education.' UNION ALL
    SELECT 'retch', 'тошнить', '/retʃ/', 'The smell made me retch.' UNION ALL
    SELECT 'vocational', 'профессиональный', '/vəʊˈkeɪ.ʃən.əl/', 'He''s taking a vocational course in plumbing.' UNION ALL
    SELECT 'vomit', 'тошнить, вырвать', '/ˈvɒm.ɪt/', 'The patient might vomit after the medication.' UNION ALL
    SELECT 'socket', 'розетка', '/ˈsɒk.ɪt/', 'Plug the lamp into the wall socket.' UNION ALL
    SELECT 'waterproof', 'водонепроницаемый', '/ˈwɔː.tə.pruːf/', 'This watch is waterproof to 50 meters.' UNION ALL
    SELECT 'windproof', 'ветрозащитный', '/ˈwɪnd.pruːf/', 'The jacket is windproof and warm.' UNION ALL
    SELECT 'wide-eyed', 'наивный, широко открыв глаза', '/ˌwaɪd ˈaɪd/', 'The tourists looked around wide-eyed.' UNION ALL
    SELECT 'flashing', 'проблесковый', '/ˈflæʃ.ɪŋ/', 'The police car had flashing lights.' UNION ALL
    SELECT 'go one better', 'сделать что-то лучше, переплюнуть всех', '/ˌɡəʊ wʌn ˈbet.ər/', 'Whatever I do, he always tries to go one better.' UNION ALL
    SELECT 'laundry', 'стирка', '/ˈlɔːn.dri/', 'I need to do my laundry today.' UNION ALL
    SELECT 'nosy', 'шумно', '/ˈnəʊ.zi/', 'Our neighbors are too nosy about our business.' UNION ALL
    SELECT 'overheated', 'перегретый', '/ˌəʊ.vəˈhiː.tɪd/', 'The engine became overheated on the long drive.' UNION ALL
    SELECT 'spicy', 'острый', '/ˈspaɪ.si/', 'I love spicy Indian food.' UNION ALL
    SELECT 'takeaway', 'вывод, что-то навынос', '/ˈteɪk.ə.weɪ/', 'Let''s get a Chinese takeaway tonight.' UNION ALL
    SELECT 'whisper', 'шептать', '/ˈwɪs.pər/', 'They whispered so as not to wake the baby.' UNION ALL
    SELECT 'contradiction', 'противоречие', '/ˌkɒn.trəˈdɪk.ʃən/', 'His statement was in direct contradiction to hers.' UNION ALL
    SELECT 'desire', 'желание', '/dɪˈzaɪər/', 'She had a strong desire to travel.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B2_Unit9_words.sql
WITH unit_data AS (
    SELECT u.id AS unit_id
    FROM units u
    JOIN levels l ON u.level_id = l.id
    WHERE l.name = 'B2' AND u.display_order = 9
)
INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT ud.unit_id, data.english_word, data.russian_translation, data.transcription, data.example_sentence
FROM unit_data ud
CROSS JOIN (
    SELECT 'accuse' AS english_word, 'обвинять, винить' AS russian_translation, '/əˈkjuːz/' AS transcription, 'She accused him of stealing her wallet.' AS example_sentence UNION ALL
    SELECT 'honesty', 'честность', '/ˈɒn.ə.sti/', 'Honesty is the best policy in relationships.' UNION ALL
    SELECT 'fake', 'поддельный', '/feɪk/', 'The museum discovered the painting was fake.' UNION ALL
    SELECT 'aerosol', 'аэрозоль', '/ˈeə.rə.sɒl/', 'Aerosol sprays can harm the ozone layer.' UNION ALL
    SELECT 'life expectancy', 'продолжительность жизни', '/ˈlaɪf ɪkˌspek.tən.si/', 'Life expectancy in Japan is among the highest.' UNION ALL
    SELECT 'genuine', 'подлинный', '/ˈdʒen.ju.ɪn/', 'Her smile seemed genuine and warm.' UNION ALL
    SELECT 'astonishing', 'удивительный', '/əˈstɒn.ɪ.ʃɪŋ/', 'The magician''s tricks were astonishing.' UNION ALL
    SELECT 'ruthless', 'безжалостный', '/ˈruːθ.ləs/', 'The dictator was known for his ruthless tactics.' UNION ALL
    SELECT 'gossip', 'сплетня', '/ˈɡɒs.ɪp/', 'Office gossip can be harmful to morale.' UNION ALL
    SELECT 'beg', 'просить, умолять', '/beɡ/', 'The dog begged for scraps at the table.' UNION ALL
    SELECT 'splash', 'брызнуть, плеснуть', '/splæʃ/', 'Kids love to splash in puddles after rain.' UNION ALL
    SELECT 'proper', 'правильный', '/ˈprɒp.ər/', 'Please use the proper form for your application.' UNION ALL
    SELECT 'blanket', 'одеяло', '/ˈblæŋ.kɪt/', 'She wrapped the blanket around her shoulders.' UNION ALL
    SELECT 'lottery', 'лотерея', '/ˈlɒt.ər.i/', 'He won a small fortune in the national lottery.' UNION ALL
    SELECT 'coordinate', 'скоординировать', '/kəʊˈɔː.dɪ.neɪt/', 'We need to coordinate our schedules.' UNION ALL
    SELECT 'charming', 'очаровательный', '/ˈtʃɑː.mɪŋ/', 'The small village was charming and peaceful.' UNION ALL
    SELECT 'ozone layer', 'озоновый слой', '/ˈəʊ.zəʊn ˌleɪ.ər/', 'CFCs damage the ozone layer.' UNION ALL
    SELECT 'dip', 'окунуться', '/dɪp/', 'Let''s dip our feet in the lake.' UNION ALL
    SELECT 'claim', 'утверждать, претендовать', '/kleɪm/', 'He claims to have seen a UFO last night.' UNION ALL
    SELECT 'transformation', 'трансформация', '/ˌtræns.fəˈmeɪ.ʃən/', 'The company underwent a major transformation.' UNION ALL
    SELECT 'convince', 'убеждать', '/kənˈvɪns/', 'I tried to convince her to change her mind.' UNION ALL
    SELECT 'riot shield', 'полицейский щит', '/ˈraɪ.ət ˌʃiːld/', 'Police officers carried riot shields during the protest.' UNION ALL
    SELECT 'flipper', 'плавник, ласты', '/ˈflɪp.ər/', 'Sea turtles use their flippers to swim.' UNION ALL
    SELECT 'cure', 'лекарство', '/kjʊər/', 'Scientists are searching for a cure for cancer.' UNION ALL
    SELECT 'sledge', 'кататься на санках', '/sledʒ/', 'We went sledging down the snowy hill.' UNION ALL
    SELECT 'immune', 'иммунный', '/ɪˈmjuːn/', 'Vaccines help make us immune to diseases.' UNION ALL
    SELECT 'dedication', 'посвящение', '/ˌded.ɪˈkeɪ.ʃən/', 'Her dedication to her work is impressive.' UNION ALL
    SELECT 'misbehave', 'плохо себя вести', '/ˌmɪs.bɪˈheɪv/', 'The children misbehaved during the ceremony.' UNION ALL
    SELECT 'overwhelm', 'подавить, сокрушать', '/ˌəʊ.vəˈwelm/', 'The workload began to overwhelm him.' UNION ALL
    SELECT 'deny', 'отрицать', '/dɪˈnaɪ/', 'The politician denied all allegations.' UNION ALL
    SELECT 'engaging', 'помолвлен', '/ɪnˈɡeɪ.dʒɪŋ/', 'The couple got engaging last Christmas.' UNION ALL
    SELECT 'pack', 'стая, упаковка', '/pæk/', 'Wolves hunt in packs for better success.' UNION ALL
    SELECT 'discipline', 'дисциплинировать', '/ˈdɪs.ə.plɪn/', 'Parents need to discipline their children.' UNION ALL
    SELECT 'slow down', 'притормозить', '/ˌsləʊ ˈdaʊn/', 'The doctor told him to slow down at work.' UNION ALL
    SELECT 'erase', 'стирать', '/ɪˈreɪz/', 'Use this to erase pencil marks.' UNION ALL
    SELECT 'missing', 'пропавший, отсутствующий', '/ˈmɪs.ɪŋ/', 'My keys are missing - have you seen them?' UNION ALL
    SELECT 'wing flap', 'закрылок', '/ˈwɪŋ ˌflæp/', 'The plane''s wing flaps extended for landing.' UNION ALL
    SELECT 'hardship', 'трудность', '/ˈhɑːd.ʃɪp/', 'Many families face financial hardship.' UNION ALL
    SELECT 'bad publicity', 'дурная слава, плохая репутация', '/ˌbæd ˈpʌb.lɪ.sə.ti/', 'The scandal caused bad publicity for the company.' UNION ALL
    SELECT 'word goes round', 'распространять, разлетаться (слухи)', '/ˌwɜːd ɡəʊz ˈraʊnd/', 'Word went round quickly about the layoffs.' UNION ALL
    SELECT 'invade someone''s privacy', 'вторгаться в чью-то личную жизнь', '/ɪnˌveɪd ˌsʌm.wʌnz ˈprɪv.ə.si/', 'Paparazzi often invade celebrities'' privacy.' UNION ALL
    SELECT 'mat', 'половик, коврик', '/mæt/', 'Wipe your feet on the mat before entering.' UNION ALL
    SELECT 'betray', 'предательство', '/bɪˈtreɪ/', 'He felt betrayed by his closest friend.' UNION ALL
    SELECT 'only child', 'единственный ребенок', '/ˌəʊn.li ˈtʃaɪld/', 'As an only child, she got lots of attention.' UNION ALL
    SELECT 'entitled', 'озаглавленный', '/ɪnˈtaɪ.təld/', 'The document was entitled "Project Proposal".' UNION ALL
    SELECT 'refugee', 'беженец', '/ˌref.juˈdʒiː/', 'The refugee camp provided temporary shelter.' UNION ALL
    SELECT 'fabric', 'ткань', '/ˈfæb.rɪk/', 'This fabric is soft and comfortable.' UNION ALL
    SELECT 'settle', 'остепениться', '/ˈset.əl/', 'After traveling for years, he decided to settle down.' UNION ALL
    SELECT 'clear your name', 'очистить свое имя', '/ˌklɪər jɔːr ˈneɪm/', 'He fought to clear his name after the false accusation.' UNION ALL
    SELECT 'swear', 'клясться', '/sweər/', 'I swear I''ll never do it again.' UNION ALL
    SELECT 'furnish', 'предоставить', '/ˈfɜː.nɪʃ/', 'The hotel furnished all necessary amenities.' UNION ALL
    SELECT 'telephoto lens', 'телеобъектив', '/ˈtel.iˌfəʊ.təʊ ˌlenz/', 'Wildlife photographers use telephoto lenses.' UNION ALL
    SELECT 'fail', 'провалиться, подвести', '/feɪl/', 'I failed my driving test the first time.' UNION ALL
    SELECT 'threaten', 'угрожать', '/ˈθret.ən/', 'He threatened to call the police.' UNION ALL
    SELECT 'give your word', 'дать слово', '/ˌɡɪv jɔːr ˈwɜːd/', 'He gave his word that he''d be on time.' UNION ALL
    SELECT 'unethical', 'неэтично', '/ʌnˈeθ.ɪ.kəl/', 'The experiment was considered unethical.' UNION ALL
    SELECT 'let down', 'подвести', '/ˌlet ˈdaʊn/', 'Don''t let me down - I''m counting on you.' UNION ALL
    SELECT 'urge', 'настаивать, призывать', '/ɜːdʒ/', 'I urge you to reconsider your decision.' UNION ALL
    SELECT 'miraculously', 'чудесным образом', '/mɪˈræk.jə.ləs.li/', 'Miraculously, no one was hurt in the crash.' UNION ALL
    SELECT 'victim', 'жертва', '/ˈvɪk.tɪm/', 'The victim identified the attacker.' UNION ALL
    SELECT 'rumor', 'сплетня', '/ˈruː.mər/', 'Rumors about their breakup spread quickly.' UNION ALL
    SELECT 'warn', 'предупреждать', '/wɔːn/', 'I warned you not to touch the hot stove.' UNION ALL
    SELECT 'runway', 'подиум, взлетная полоса', '/ˈrʌn.weɪ/', 'The model walked confidently down the runway.' UNION ALL
    SELECT 'weathered', 'потрепанный', '/ˈweð.əd/', 'The weathered statue showed its age.' UNION ALL
    SELECT 'take someone''s word for it', 'верить кому-то на слово', '/ˌteɪk ˌsʌm.wʌnz ˈwɜːd fɔːr ɪt/', 'I''ll take your word for it this time.' UNION ALL
    SELECT 'shelter', 'убежище', '/ˈʃel.tər/', 'They sought shelter from the storm.' UNION ALL
    SELECT 'put off', 'откладывать', '/ˌpʊt ˈɒf/', 'Don''t put off until tomorrow what you can do today.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B2_Unit10_words.sql
WITH unit_data AS (
    SELECT u.id AS unit_id
    FROM units u
    JOIN levels l ON u.level_id = l.id
    WHERE l.name = 'B2' AND u.display_order = 10
)
INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT ud.unit_id, data.english_word, data.russian_translation, data.transcription, data.example_sentence
FROM unit_data ud
CROSS JOIN (
    SELECT 'altitude' AS english_word, 'высота' AS russian_translation, '/ˈæl.tɪ.tʃuːd/' AS transcription, 'The plane reached cruising altitude.' AS example_sentence UNION ALL
    SELECT 'self-conscious', 'застенчивый', '/ˌself ˈkɒn.ʃəs/', 'He felt self-conscious about his accent.' UNION ALL
    SELECT 'overjoyed', 'вне себя от радости', '/ˌəʊ.vəˈdʒɔɪd/', 'She was overjoyed at the news.' UNION ALL
    SELECT 'background', 'фон, задний план', '/ˈbæk.ɡraʊnd/', 'Check the applicant''s work background.' UNION ALL
    SELECT 'sensitive', 'чувствительный', '/ˈsen.sɪ.tɪv/', 'She''s very sensitive to criticism.' UNION ALL
    SELECT 'trek', 'путешествовать', '/trek/', 'We trekked through the jungle for days.' UNION ALL
    SELECT 'bathe', 'купаться', '/beɪð/', 'The elephants were bathing in the river.' UNION ALL
    SELECT 'short-sighted', 'недальновидный', '/ˌʃɔːt ˈsaɪ.tɪd/', 'The decision was short-sighted and foolish.' UNION ALL
    SELECT 'capability', 'потенциал, возможность, способность', '/ˌkeɪ.pəˈbɪl.ə.ti/', 'The new software has impressive capabilities.' UNION ALL
    SELECT 'celebrity', 'знаменитость', '/səˈleb.rə.ti/', 'The restaurant is popular with celebrities.' UNION ALL
    SELECT 'self-control', 'самоконтроль', '/ˌself kənˈtrəʊl/', 'It takes self-control to resist temptation.' UNION ALL
    SELECT 'rival', 'соперник', '/ˈraɪ.vəl/', 'The two companies are fierce rivals.' UNION ALL
    SELECT 'click', 'нажимать', '/klɪk/', 'Click the icon to open the program.' UNION ALL
    SELECT 'cooking utensil', 'посуда для готовки', '/ˈkʊk.ɪŋ juːˌten.sɪl/', 'The kitchen was stocked with cooking utensils.' UNION ALL
    SELECT 'rug', 'коврик', '/rʌɡ/', 'There''s a Persian rug in the living room.' UNION ALL
    SELECT 'deaf', 'глухой', '/def/', 'The school has programs for deaf children.' UNION ALL
    SELECT 'creative', 'креативный', '/kriˈeɪ.tɪv/', 'She has a very creative approach to problem-solving.' UNION ALL
    SELECT 'seize', 'мерять', '/siːz/', 'The army seized control of the capital.' UNION ALL
    SELECT 'distinguish', 'отличать', '/dɪˈstɪŋ.ɡwɪʃ/', 'Can you distinguish between these two colors?' UNION ALL
    SELECT 'curious', 'любопытный', '/ˈkjʊə.ri.əs/', 'Children are naturally curious about the world.' UNION ALL
    SELECT 'successor', 'преемник', '/səkˈses.ər/', 'The CEO named his successor before retiring.' UNION ALL
    SELECT 'experimental', 'экспериментальный', '/ɪkˌsper.ɪˈmen.təl/', 'The treatment is still in the experimental stage.' UNION ALL
    SELECT 'self-help', 'самопомощь', '/ˌself ˈhelp/', 'She reads a lot of self-help books.' UNION ALL
    SELECT 'throne', 'трон', '/θrəʊn/', 'The king sat on his golden throne.' UNION ALL
    SELECT 'eyesight', 'зрение', '/ˈaɪ.saɪt/', 'His eyesight began to deteriorate with age.' UNION ALL
    SELECT 'easy-going', 'беззаботный (легкий на подъем)', '/ˌiː.zi ˈɡəʊ.ɪŋ/', 'He''s very easy-going about most things.' UNION ALL
    SELECT 'civil war', 'гражданская война', '/ˌsɪv.əl ˈwɔːr/', 'The country was torn apart by civil war.' UNION ALL
    SELECT 'fence', 'забор', '/fens/', 'They built a wooden fence around the garden.' UNION ALL
    SELECT 'flood', 'потоп', '/flʌd/', 'Heavy rains caused severe flooding.' UNION ALL
    SELECT 'accommodate', 'разместить', '/əˈkɒm.ə.deɪt/', 'The hotel can accommodate up to 300 guests.' UNION ALL
    SELECT 'fully-sighted', 'в полную величину', '/ˌfʊl.i ˈsaɪ.tɪd/', 'The exhibition is accessible to fully-sighted visitors.' UNION ALL
    SELECT 'independent-minded', 'независимое мнение', '/ˌɪn.dɪˌpen.dənt ˈmaɪn.dɪd/', 'She''s very independent-minded in her views.' UNION ALL
    SELECT 'debris', 'мусор, осколок', '/ˈdeb.riː/', 'Workers cleared debris from the construction site.' UNION ALL
    SELECT 'hard of hearing', 'проблемы со слухом', '/ˌhɑːd əv ˈhɪə.rɪŋ/', 'Special devices help those hard of hearing.' UNION ALL
    SELECT 'paperwork', 'бумажная работа', '/ˈpeɪ.pə.wɜːk/', 'I spent the morning doing paperwork.' UNION ALL
    SELECT 'controversy', 'спор, разногласие', '/ˈkɒn.trə.vɜː.si/', 'The new law caused considerable controversy.' UNION ALL
    SELECT 'helmet', 'шлем', '/ˈhel.mɪt/', 'Always wear a helmet when cycling.' UNION ALL
    SELECT 'self-interest', 'эгоизм, корысть', '/ˌself ˈɪn.trəst/', 'He acted out of pure self-interest.' UNION ALL
    SELECT 'module', 'курс, блок', '/ˈmɒdʒ.uːl/', 'The course consists of six modules.' UNION ALL
    SELECT 'hire', 'нанимать', '/haɪər/', 'We need to hire more staff for the summer.' UNION ALL
    SELECT 'self-made', 'самодельный, обязанный всем самому себе', '/ˌself ˈmeɪd/', 'He''s a self-made millionaire.' UNION ALL
    SELECT 'elegant', 'элегантный, изящный', '/ˈel.ɪ.ɡənt/', 'She wore an elegant black dress.' UNION ALL
    SELECT 'interference', 'вмешательство', '/ˌɪn.təˈfɪə.rəns/', 'The government denied any interference.' UNION ALL
    SELECT 'unmistakably', 'безошибочно, явно', '/ˌʌn.mɪˈsteɪ.kə.bli/', 'The voice was unmistakably his.' UNION ALL
    SELECT 'grief', 'горе, скорбь', '/ɡriːf/', 'She was overcome with grief at the news.' UNION ALL
    SELECT 'keen', 'острый (слух, зрение)', '/kiːn/', 'Eagles have keen eyesight.' UNION ALL
    SELECT 'passionate', 'страстный', '/ˈpæʃ.ən.ət/', 'She''s passionate about animal rights.' UNION ALL
    SELECT 'infuriate', 'бесить', '/ɪnˈfjʊə.ri.eɪt/', 'His arrogant attitude infuriated me.' UNION ALL
    SELECT 'log', 'бревно', '/lɒɡ/', 'They sat on a fallen log to rest.' UNION ALL
    SELECT 'welcome', 'приветствовать', '/ˈwel.kəm/', 'We welcome all suggestions for improvement.' UNION ALL
    SELECT 'mankind', 'человечество', '/mænˈkaɪnd/', 'The discovery benefited all mankind.' UNION ALL
    SELECT 'bright', 'умный', '/braɪt/', 'She''s one of the brightest students in class.' UNION ALL
    SELECT 'mystery', 'загадка', '/ˈmɪs.tər.i/', 'The disappearance remains a mystery.' UNION ALL
    SELECT 'commit', 'совершать', '/kəˈmɪt/', 'He committed himself to the project.' UNION ALL
    SELECT 'nickname', 'прозвище', '/ˈnɪk.neɪm/', 'His nickname at school was "Red".' UNION ALL
    SELECT 'persuasive', 'убедительный', '/pəˈsweɪ.sɪv/', 'She gave a persuasive argument.' UNION ALL
    SELECT 'numb', 'оцепенелый', '/nʌm/', 'My fingers went numb in the cold.' UNION ALL
    SELECT 'spreadsheet', 'электронная таблица', '/ˈspred.ʃiːt/', 'I keep my accounts in a spreadsheet.' UNION ALL
    SELECT 'pass down', 'передавать', '/ˌpɑːs ˈdaʊn/', 'Traditions are passed down through generations.' UNION ALL
    SELECT 'assume', 'предположить, взять на себя', '/əˈsjuːm/', 'Let''s assume for a moment that you''re right.' UNION ALL
    SELECT 'passion', 'страсть', '/ˈpæʃ.ən/', 'Music has always been his passion.' UNION ALL
    SELECT 'concept', 'концепция', '/ˈkɒn.sept/', 'The concept behind the product is simple.' UNION ALL
    SELECT 'suited', 'подходящий', '/ˈsuː.tɪd/', 'This job is well suited to her skills.' UNION ALL
    SELECT 'potential', 'потенциальный', '/pəˈten.ʃəl/', 'The young athlete shows great potential.' UNION ALL
    SELECT 'monument', 'памятник', '/ˈmɒn.jə.mənt/', 'They erected a monument to the war heroes.' UNION ALL
    SELECT 'qualification', 'квалификация', '/ˌkwɒl.ɪ.fɪˈkeɪ.ʃən/', 'You''ll need proper qualifications for this job.' UNION ALL
    SELECT 'quality', 'качество', '/ˈkwɒl.ə.ti/', 'We insist on high quality standards.' UNION ALL
    SELECT 'relegate', 'отодвигать', '/ˈrel.ɪ.ɡeɪt/', 'The team was relegated to a lower division.' UNION ALL
    SELECT 'reflection', 'отражение', '/rɪˈflek.ʃən/', 'She saw her reflection in the mirror.' UNION ALL
    SELECT 'consultancy', 'консультация', '/kənˈsʌl.tən.si/', 'He works for a financial consultancy firm.' UNION ALL
    SELECT 'trade', 'торговля', '/treɪd/', 'International trade has increased.' UNION ALL
    SELECT 'revenge', 'месть', '/rɪˈvendʒ/', 'He swore revenge against his enemies.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B2_Unit11_words.sql
WITH unit_data AS (
    SELECT u.id AS unit_id
    FROM units u
    JOIN levels l ON u.level_id = l.id
    WHERE l.name = 'B2' AND u.display_order = 11
)
INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT ud.unit_id, data.english_word, data.russian_translation, data.transcription, data.example_sentence
FROM unit_data ud
CROSS JOIN (
    SELECT 'acquire' AS english_word, 'покупать' AS russian_translation, '/əˈkwaɪər/' AS transcription, 'The company plans to acquire several smaller competitors.' AS example_sentence UNION ALL
    SELECT 'by heart', 'наизусть', '/baɪ ˈhɑːt/', 'She learned the poem by heart for the recitation contest.' UNION ALL
    SELECT 'conscious', 'сознательный', '/ˈkɒn.ʃəs/', 'He made a conscious effort to improve his pronunciation.' UNION ALL
    SELECT 'cram', 'вызубрить', '/kræm/', 'Students often cram the night before exams.' UNION ALL
    SELECT 'democratic', 'демократический', '/ˌdem.əˈkræt.ɪk/', 'The decision was made through democratic voting.' UNION ALL
    SELECT 'drop out', 'бросить/уйти', '/ˌdrɒp ˈaʊt/', 'He had to drop out of university due to financial problems.' UNION ALL
    SELECT 'ensure', 'обеспечивать', '/ɪnˈʃɔːr/', 'The teacher ensures all students understand the material.' UNION ALL
    SELECT 'exam', 'экзамен', '/ɪɡˈzæm/', 'The final exam will cover all material from this semester.' UNION ALL
    SELECT 'get', 'понять', '/ɡet/', 'I don''t get this math problem - can you explain it again?' UNION ALL
    SELECT 'grateful', 'благодарный', '/ˈɡreɪt.fəl/', 'I''m grateful for all the help you''ve given me.' UNION ALL
    SELECT 'hands-on', 'непосредственный', '/ˌhændz ˈɒn/', 'The course provides hands-on experience with the equipment.' UNION ALL
    SELECT 'in time', 'вовремя', '/ɪn ˈtaɪm/', 'We arrived just in time for the show.' UNION ALL
    SELECT 'interactive', 'интерактивный', '/ˌɪn.tərˈæk.tɪv/', 'The museum has many interactive exhibits for children.' UNION ALL
    SELECT 'mark', 'отметка', '/mɑːk/', 'She received high marks on all her tests.' UNION ALL
    SELECT 'pick up', 'брать', '/ˌpɪk ˈʌp/', 'Children pick up languages very quickly.' UNION ALL
    SELECT 'recall', 'помнить', '/rɪˈkɔːl/', 'I can''t recall where I put my keys.' UNION ALL
    SELECT 'regular', 'обычный', '/ˈreɡ.jə.lər/', 'He''s a regular customer at this café.' UNION ALL
    SELECT 'revise', 'повторять', '/rɪˈvaɪz/', 'You should revise your notes before the test.' UNION ALL
    SELECT 'selective', 'выборочный', '/sɪˈlek.tɪv/', 'The university is very selective in its admissions.' UNION ALL
    SELECT 'speak up', 'высказываться', '/ˌspiːk ˈʌp/', 'Don''t be afraid to speak up if you have questions.' UNION ALL
    SELECT 'take in', 'принимать', '/ˌteɪk ˈɪn/', 'The shelter takes in homeless animals.' UNION ALL
    SELECT 'learn to walk before you can run', 'всему свое время', '/ˌlɜːn tə ˈwɔːk bɪˌfɔːr ju kən ˈrʌn/', 'Start with basic exercises - you need to learn to walk before you can run.' UNION ALL
    SELECT 'urgent', 'срочный', '/ˈɜː.dʒənt/', 'This is an urgent matter that needs immediate attention.' UNION ALL
    SELECT 'walnut', 'грецкий орех', '/ˈwɔːl.nʌt/', 'The cake contains chopped walnuts.' UNION ALL
    SELECT 'unaware', 'не зная', '/ˌʌn.əˈweər/', 'He was unaware of the changes to the schedule.' UNION ALL
    SELECT 'hold back', 'сдерживать', '/ˌhəʊld ˈbæk/', 'Don''t hold back your opinions during the discussion.' UNION ALL
    SELECT 'previous', 'предыдущий', '/ˈpriː.vi.əs/', 'Refer to the previous chapter for background information.' UNION ALL
    SELECT 'chant', 'скандировать', '/tʃɑːnt/', 'The protesters chanted slogans during the demonstration.' UNION ALL
    SELECT 'deforestation', 'вырубка лесов', '/diːˌfɒr.ɪˈsteɪ.ʃən/', 'Deforestation is a major environmental concern.' UNION ALL
    SELECT 'heal', 'исцелять', '/hiːl/', 'Time will help heal your emotional wounds.' UNION ALL
    SELECT 'learn your lesson', 'усвоить урок', '/ˌlɜːn jɔːr ˈles.ən/', 'I won''t make that mistake again - I''ve learned my lesson.' UNION ALL
    SELECT 'beak', 'клюв', '/biːk/', 'The bird used its beak to crack open the nut.' UNION ALL
    SELECT 'live with it', 'жить с этим', '/ˌlɪv wɪð ˈɪt/', 'The noise is annoying, but we''ll have to live with it.' UNION ALL
    SELECT 'isolated', 'изолированный', '/ˈaɪ.sə.leɪ.tɪd/', 'The research station is completely isolated in winter.' UNION ALL
    SELECT 'mispronounce', 'неправильно произносить', '/ˌmɪs.prəˈnaʊns/', 'Many learners mispronounce this word at first.' UNION ALL
    SELECT 'multiply', 'умножить', '/ˈmʌl.tɪ.plaɪ/', 'Children learn to multiply in third grade.' UNION ALL
    SELECT 'ripe', 'зрелый', '/raɪp/', 'Wait until the bananas are ripe before eating them.' UNION ALL
    SELECT 'hesitation', 'сомнения', '/ˌhez.ɪˈteɪ.ʃən/', 'She agreed without any hesitation.' UNION ALL
    SELECT 'reserve', 'запас', '/rɪˈzɜːv/', 'We keep a reserve of bottled water for emergencies.' UNION ALL
    SELECT 'asylum', 'убежище', '/əˈsaɪ.ləm/', 'The journalist sought asylum in another country.' UNION ALL
    SELECT 'learn from your mistakes', 'учиться на ошибках', '/ˌlɜːn frəm jɔːr mɪˈsteɪks/', 'Successful people learn from their mistakes.' UNION ALL
    SELECT 'dialect', 'диалект', '/ˈdaɪ.ə.lekt/', 'The region has its own distinctive dialect.' UNION ALL
    SELECT 'the tricks of the trade', 'профессиональные тонкости', '/ðə ˌtrɪks əv ðə ˈtreɪd/', 'After years in the business, she knows all the tricks of the trade.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B2_Unit12_words.sql
WITH unit_data AS (
    SELECT u.id AS unit_id
    FROM units u
    JOIN levels l ON u.level_id = l.id
    WHERE l.name = 'B2' AND u.display_order = 12
)
INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT ud.unit_id, data.english_word, data.russian_translation, data.transcription, data.example_sentence
FROM unit_data ud
CROSS JOIN (
    SELECT 'alteration' AS english_word, 'изменение' AS russian_translation, '/ˌɒl.tərˈeɪ.ʃən/' AS transcription, 'The dress needed several alterations before it fit perfectly.' AS example_sentence UNION ALL
    SELECT 'buying power', 'покупательская способность', '/ˈbaɪ.ɪŋ ˌpaʊər/', 'Inflation reduces the buying power of consumers.' UNION ALL
    SELECT 'buzz', 'гул', '/bʌz/', 'There was a buzz of excitement before the concert.' UNION ALL
    SELECT 'catchy', 'броский', '/ˈkætʃ.i/', 'The commercial had a catchy jingle that everyone remembered.' UNION ALL
    SELECT 'child-minding', 'уход за детьми', '/ˈtʃaɪld.maɪn.dɪŋ/', 'She runs a child-minding service from her home.' UNION ALL
    SELECT 'consistently', 'последовательно', '/kənˈsɪs.tənt.li/', 'The team has performed consistently well all season.' UNION ALL
    SELECT 'dream', 'мечтать', '/driːm/', 'As a child, she dreamed of becoming an astronaut.' UNION ALL
    SELECT 'handyman', 'мастер на все руки', '/ˈhæn.di.mæn/', 'Our handyman can fix anything around the house.' UNION ALL
    SELECT 'haves and have nots', 'имущие-неимущие', '/ˌhævz ənd ˈhæv nɒts/', 'The city shows a clear divide between the haves and have nots.' UNION ALL
    SELECT 'income gap', 'разница в доходах', '/ˈɪn.kʌm ˌɡæp/', 'The income gap between rich and poor continues to widen.' UNION ALL
    SELECT 'install', 'скачивать', '/ɪnˈstɔːl/', 'It takes just a few minutes to install the software.' UNION ALL
    SELECT 'kitchen cabinet', 'кухонный шкаф', '/ˈkɪtʃ.ən ˌkæb.ɪ.nət/', 'We keep our dishes in the kitchen cabinet.' UNION ALL
    SELECT 'nanny', 'няня', '/ˈnæn.i/', 'Their nanny takes care of the children during the day.' UNION ALL
    SELECT 'owe', 'быть должником', '/əʊ/', 'I owe my brother fifty dollars.' UNION ALL
    SELECT 'pension fund', 'пенсионный фонд', '/ˈpen.ʃən ˌfʌnd/', 'The company contributes to employee pension funds.' UNION ALL
    SELECT 'personal shopper', 'персональный консультант', '/ˌpɜː.sən.əl ˈʃɒp.ər/', 'The department store offers personal shopper services.' UNION ALL
    SELECT 'personal trainer', 'персональный тренер', '/ˌpɜː.sən.əl ˈtreɪ.nər/', 'She works with a personal trainer three times a week.' UNION ALL
    SELECT 'reserves', 'резерв, запас', '/rɪˈzɜːvz/', 'The country has substantial oil reserves.' UNION ALL
    SELECT 'standard of living', 'стандарты жизни', '/ˌstæn.dəd əv ˈlɪv.ɪŋ/', 'The standard of living has improved in recent years.' UNION ALL
    SELECT 'subsidized', 'субсидии', '/ˈsʌb.sɪ.daɪzd/', 'The government provides subsidized housing for low-income families.' UNION ALL
    SELECT 'take things to extremes', 'доводить до крайностей', '/ˌteɪk θɪŋz tu ɪkˈstriːmz/', 'He always takes things to extremes in his training.' UNION ALL
    SELECT 'van', 'фургон', '/væn/', 'We rented a van to move our furniture.' UNION ALL
    SELECT 'loyal', 'преданный', '/ˈlɔɪ.əl/', 'Dogs are known for being loyal companions.' UNION ALL
    SELECT 'massive', 'огромный', '/ˈmæs.ɪv/', 'They undertook a massive construction project.' UNION ALL
    SELECT 'harvest', 'урожай', '/ˈhɑː.vɪst/', 'Farmers are preparing for the autumn harvest.' UNION ALL
    SELECT 'flip side', 'обратная сторона', '/ˈflɪp ˌsaɪd/', 'The flip side of success is often hard work.' UNION ALL
    SELECT 'greenhouse', 'парник', '/ˈɡriːn.haʊs/', 'We grow tomatoes in our greenhouse.' UNION ALL
    SELECT 'viral', 'вирусный', '/ˈvaɪ.rəl/', 'The video went viral within hours.' UNION ALL
    SELECT 'recession', 'спад', '/rɪˈseʃ.ən/', 'Many businesses struggled during the economic recession.' UNION ALL
    SELECT 'regular', 'регулярность', '/ˈreɡ.jə.lər/', 'Exercise should become a regular part of your routine.' UNION ALL
    SELECT 'commitment', 'приверженность', '/kəˈmɪt.mənt/', 'The job requires a serious commitment.' UNION ALL
    SELECT 'passing fashion', 'всегда в моде', '/ˌpɑː.sɪŋ ˈfæʃ.ən/', 'Some trends are just passing fashions.' UNION ALL
    SELECT 'pick up on', 'улавливать', '/ˌpɪk ˈʌp ɒn/', 'Good teachers quickly pick up on students'' difficulties.' UNION ALL
    SELECT 'follow-up', 'наблюдение, наставление', '/ˈfɒl.əʊ.ʌp/', 'The doctor scheduled a follow-up appointment.' UNION ALL
    SELECT 'get-out clause', 'лазейка', '/ˈɡet.aʊt ˌklɔːz/', 'The contract included a get-out clause.' UNION ALL
    SELECT 'in someone''s shoes', 'быть на чужом месте', '/ɪn ˈsʌm.wʌnz ˌʃuːz/', 'Try to imagine yourself in someone''s shoes before judging.' UNION ALL
    SELECT 'set up', 'создать, учредить', '/ˌset ˈʌp/', 'They set up a new business together.' UNION ALL
    SELECT 'retail area', 'торговая площадка', '/ˈriː.teɪl ˌeə.ri.ə/', 'The new shopping mall has a large retail area.' UNION ALL
    SELECT 'sticker', 'стикер', '/ˈstɪk.ər/', 'Kids love collecting colorful stickers.' UNION ALL
    SELECT 'innovative', 'инновационный', '/ˈɪn.ə.və.tɪv/', 'The company is known for its innovative products.' UNION ALL
    SELECT 'lease', 'аренда, лизинг', '/liːs/', 'We signed a two-year lease on the apartment.' UNION ALL
    SELECT 'trend', 'тренд', '/trend/', 'Sustainable fashion is becoming a major trend.' UNION ALL
    SELECT 'plugged-in', 'подключенный, молодой', '/ˌplʌɡd ˈɪn/', 'The plugged-in generation is always online.' UNION ALL
    SELECT 'truck', 'грузовик', '/trʌk/', 'The delivery truck arrived early in the morning.' UNION ALL
    SELECT 'posture', 'осанка', '/ˈpɒs.tʃər/', 'Good posture is important for back health.' UNION ALL
    SELECT 'herb', 'трава, растение', '/hɜːb/', 'Fresh herbs add great flavor to dishes.' UNION ALL
    SELECT 'shipping container', 'грузовой контейнер', '/ˈʃɪp.ɪŋ kənˌteɪ.nər/', 'The port was full of shipping containers.' UNION ALL
    SELECT 'soil', 'почва', '/sɔɪl/', 'This soil is perfect for growing vegetables.' UNION ALL
    SELECT 'inventory', 'список, запас', '/ˈɪn.vən.tər.i/', 'The store takes inventory every month.' UNION ALL
    SELECT 'pebble', 'галька', '/ˈpeb.əl/', 'The beach was covered with smooth pebbles.' UNION ALL
    SELECT 'quality over quantity', 'качество, а не количество', '/ˌkwɒl.ə.ti ˈəʊ.vər ˈkwɒn.tə.ti/', 'When buying tools, choose quality over quantity.' UNION ALL
    SELECT 'consolidate', 'укрепить', '/kənˈsɒl.ɪ.deɪt/', 'The company wants to consolidate its market position.' UNION ALL
    SELECT 'valid', 'действующий, обоснованный', '/ˈvæl.ɪd/', 'Your passport must be valid for six more months.' UNION ALL
    SELECT 'human nature', 'человеческая природа', '/ˌhjuː.mən ˈneɪ.tʃər/', 'Curiosity is part of human nature.' UNION ALL
    SELECT 'ladder', 'лестница', '/ˈlæd.ər/', 'He climbed the ladder to clean the gutters.' UNION ALL
    SELECT 'fraction', 'часть', '/ˈfræk.ʃən/', 'Only a fraction of the applicants were accepted.' UNION ALL
    SELECT 'fuel', 'топливо', '/ˈfjuː.əl/', 'The plane needed to refuel before continuing.' UNION ALL
    SELECT 'work ethic', 'трудовая этика', '/ˈwɜːk ˌeθ.ɪk/', 'Her strong work ethic impressed the managers.' UNION ALL
    SELECT 'upmarket', 'престижный', '/ˌʌpˈmɑː.kɪt/', 'They opened an upmarket restaurant downtown.' UNION ALL
    SELECT 'initially', 'изначально', '/ɪˈnɪʃ.əl.i/', 'Initially, we planned to stay for just a week.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);