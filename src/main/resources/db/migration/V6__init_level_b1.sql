-- V5__Seed_B1_units.sql
INSERT INTO units (level_id, name, description, display_order) VALUES
    ((SELECT id FROM levels WHERE name = 'B1'), 'Unit 1 - Personal Qualities & Communication', 'Личные качества и общение', 1),
    ((SELECT id FROM levels WHERE name = 'B1'), 'Unit 2 - Arts & Entertainment', 'Искусство и развлечения', 2),
    ((SELECT id FROM levels WHERE name = 'B1'), 'Unit 3 - Water Sports & Nature', 'Водные виды спорта и природа', 3),
    ((SELECT id FROM levels WHERE name = 'B1'), 'Unit 4 - Work & Employment', 'Работа и трудоустройство', 4),
    ((SELECT id FROM levels WHERE name = 'B1'), 'Unit 5 - Health & Nutrition', 'Здоровье и питание', 5);

-- Seed_B1_Unit1_words.sql
WITH unit_data AS (
    SELECT
        u.id AS unit_id
    FROM
        units u
    JOIN
        levels l ON u.level_id = l.id
    WHERE
        l.name = 'B1'
        AND u.display_order = 1  -- Unit 1 - Personal Qualities & Communication
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
    SELECT 'amuse' AS english_word, 'развлекать' AS russian_translation, '/əˈmjuːz/' AS transcription, 'Clowns amuse children at birthday parties.' AS example_sentence UNION ALL
    SELECT 'anger', 'гнев, злость', '/ˈæŋ.ɡər/', 'He couldn''t hide his anger when he saw the mess.' UNION ALL
    SELECT 'behavior', 'поведение', '/bɪˈheɪ.vjər/', 'Good behavior is important in school.' UNION ALL
    SELECT 'bravery', 'храбрость, смелость', '/ˈbreɪ.vər.i/', 'The firefighter showed great bravery during the rescue.' UNION ALL
    SELECT 'check out', 'проверять', '/ˈtʃek aʊt/', 'Check out this new café - it''s amazing!' UNION ALL
    SELECT 'cheerful', 'жизнерадостный', '/ˈtʃɪə.fəl/', 'She has a cheerful personality that brightens everyone''s day.' UNION ALL
    SELECT 'closely', 'близко, вплотную', '/ˈkləʊs.li/', 'Watch closely how I do this trick.' UNION ALL
    SELECT 'courteous', 'вежливый, учтивый', '/ˈkɜː.ti.əs/', 'The staff was courteous and helpful.' UNION ALL
    SELECT 'curious', 'любознательный', '/ˈkjʊə.ri.əs/', 'Children are naturally curious about the world.' UNION ALL
    SELECT 'depth', 'глубина', '/depθ/', 'The depth of his knowledge surprised everyone.' UNION ALL
    SELECT 'dress', 'платье', '/dres/', 'She wore a beautiful dress to the party.' UNION ALL
    SELECT 'feature', 'характерная черта', '/ˈfiː.tʃər/', 'Patience is her best feature.' UNION ALL
    SELECT 'feed', 'кормить', '/fiːd/', 'I need to feed my cat before we leave.' UNION ALL
    SELECT 'field', 'поле, область', '/fiːld/', 'He works in the field of medicine.' UNION ALL
    SELECT 'globalization', 'глобализация', '/ˌɡləʊ.bəl.aɪˈzeɪ.ʃən/', 'Globalization has changed how we do business.' UNION ALL
    SELECT 'goods', 'товары, вещи', '/ɡʊdz/', 'The store sells various household goods.' UNION ALL
    SELECT 'happiness', 'счастье, радость', '/ˈhæp.i.nəs/', 'Money doesn''t always bring happiness.' UNION ALL
    SELECT 'henna', 'хна', '/ˈhen.ə/', 'She decorated her hands with henna for the wedding.' UNION ALL
    SELECT 'hospitable', 'гостеприимный', '/hɒˈspɪt.ə.bəl/', 'Russian people are known for being hospitable.' UNION ALL
    SELECT 'identity', 'индивидуальность', '/aɪˈden.tɪ.ti/', 'Your passport proves your identity.' UNION ALL
    SELECT 'impression', 'впечатление', '/ɪmˈpreʃ.ən/', 'What was your first impression of Moscow?' UNION ALL
    SELECT 'individual', 'индивидуальный', '/ˌɪn.dɪˈvɪdʒ.u.əl/', 'Each student receives individual attention.' UNION ALL
    SELECT 'influence', 'влияние, воздействие', '/ˈɪn.flu.əns/', 'Parents have great influence on their children.' UNION ALL
    SELECT 'in-thing', 'быть модным', '/ˈɪn θɪŋ/', 'Wearing vintage clothes is the in-thing now.' UNION ALL
    SELECT 'jersey', 'трикотажная ткань', '/ˈdʒɜː.zi/', 'This sweater is made of soft jersey.' UNION ALL
    SELECT 'knowledge', 'знание, эрудиция', '/ˈnɒl.ɪdʒ/', 'She has extensive knowledge of art history.' UNION ALL
    SELECT 'landscape', 'ландшафт, пейзаж', '/ˈlænd.skeɪp/', 'The landscape changed as we drove north.' UNION ALL
    SELECT 'market', 'рынок', '/ˈmɑː.kɪt/', 'We buy fresh vegetables at the local market.' UNION ALL
    SELECT 'mutton', 'баранина, баран, овца', '/ˈmʌt.ən/', 'Mutton is popular in many Asian cuisines.' UNION ALL
    SELECT 'particular', 'конкретный', '/pəˈtɪk.jə.lər/', 'Is there any particular book you want?' UNION ALL
    SELECT 'pleasure', 'удовольствие', '/ˈpleʒ.ər/', 'It''s a pleasure to meet you.' UNION ALL
    SELECT 'positive', 'положительный', '/ˈpɒz.ə.tɪv/', 'Try to maintain a positive attitude.' UNION ALL
    SELECT 'power', 'сила, власть', '/paʊər/', 'The president has significant power.' UNION ALL
    SELECT 'pride', 'гордость, гордыня', '/praɪd/', 'She takes pride in her work.' UNION ALL
    SELECT 'punctual', 'пунктуальный', '/ˈpʌŋk.tʃu.əl/', 'Being punctual is important for business meetings.' UNION ALL
    SELECT 'remote', 'отдаленный', '/rɪˈməʊt/', 'They live in a remote village.' UNION ALL
    SELECT 'shepherd', 'пастух', '/ˈʃep.əd/', 'The shepherd watched over his sheep.' UNION ALL
    SELECT 'stay in touch', 'поддерживать связь', '/ˌsteɪ ɪn ˈtʌtʃ/', 'Let''s stay in touch after graduation.' UNION ALL
    SELECT 'symbol', 'символ, обозначение', '/ˈsɪm.bəl/', 'The dove is a symbol of peace.' UNION ALL
    SELECT 'values', 'ценности (моральные)', '/ˈvæl.juːz/', 'Family values are important to them.' UNION ALL
    SELECT 'view', 'вид, взгляд', '/vjuː/', 'The hotel room has a beautiful view of the sea.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B1_Unit2_words.sql
WITH unit_data AS (
    SELECT u.id AS unit_id
    FROM units u
    JOIN levels l ON u.level_id = l.id
    WHERE l.name = 'B1' AND u.display_order = 2
)
INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT ud.unit_id, data.english_word, data.russian_translation, data.transcription, data.example_sentence
FROM unit_data ud
CROSS JOIN (
    SELECT 'aching' AS english_word, 'больной, болящий' AS russian_translation, '/ˈeɪ.kɪŋ/' AS transcription, 'My legs are aching after the long hike.' AS example_sentence UNION ALL
    SELECT 'act', 'играть на сцене', '/ækt/', 'She acts in local theater productions.' UNION ALL
    SELECT 'although', 'хотя', '/ɔːlˈðəʊ/', 'Although it was raining, we went for a walk.' UNION ALL
    SELECT 'amateur', 'любитель', '/ˈæm.ə.tər/', 'He''s an amateur photographer but takes great pictures.' UNION ALL
    SELECT 'ancient', 'древний, старинный', '/ˈeɪn.ʃənt/', 'We visited ancient ruins in Greece.' UNION ALL
    SELECT 'appeal', 'обращаться', '/əˈpiːl/', 'The charity appeals for donations every Christmas.' UNION ALL
    SELECT 'audience', 'публика', '/ˈɔː.di.əns/', 'The audience applauded loudly after the performance.' UNION ALL
    SELECT 'ballet', 'балет', '/ˈbæl.eɪ/', 'The Nutcracker is my favorite ballet.' UNION ALL
    SELECT 'beat', 'бить, колотить', '/biːt/', 'You can hear the drums beat from far away.' UNION ALL
    SELECT 'beg', 'просить, умолять', '/beɡ/', 'The dog begs for food at the table.' UNION ALL
    SELECT 'boundary', 'граница, предел', '/ˈbaʊn.dər.i/', 'The river forms a natural boundary between the two countries.' UNION ALL
    SELECT 'bunch', 'связка, пучок', '/bʌntʃ/', 'She brought a bunch of flowers to the party.' UNION ALL
    SELECT 'catchy', 'запоминающийся', '/ˈkætʃ.i/', 'That song has a very catchy melody.' UNION ALL
    SELECT 'cheer up', 'подбадривать', '/ˈtʃɪər ʌp/', 'I tried to cheer up my friend after her bad day.' UNION ALL
    SELECT 'choir', 'хор', '/ˈkwaɪər/', 'The church choir sings every Sunday.' UNION ALL
    SELECT 'choreographer', 'балетмейстер', '/ˌkɒr.iˈɒɡ.rə.fər/', 'The choreographer created beautiful dance movements.' UNION ALL
    SELECT 'clown', 'клоун', '/klaʊn/', 'The clown made funny faces to entertain children.' UNION ALL
    SELECT 'comedian', 'комик', '/kəˈmiː.di.ən/', 'The comedian told hilarious jokes all evening.' UNION ALL
    SELECT 'concert', 'концерт', '/ˈkɒn.sət/', 'We have tickets for the rock concert tonight.' UNION ALL
    SELECT 'conductor', 'дирижёр', '/kənˈdʌk.tər/', 'The conductor led the orchestra with great passion.' UNION ALL
    SELECT 'consequently', 'следовательно', '/ˈkɒn.sɪ.kwənt.li/', 'He didn''t study and consequently failed the exam.' UNION ALL
    SELECT 'costume', 'карнавальный костюм', '/ˈkɒs.tjuːm/', 'She wore a pirate costume to the party.' UNION ALL
    SELECT 'despite', 'несмотря на', '/dɪˈspaɪt/', 'Despite the cold weather, we went swimming.' UNION ALL
    SELECT 'director', 'режиссёр', '/daɪˈrek.tər/', 'The director explained his vision for the film.' UNION ALL
    SELECT 'donation', 'пожертвование', '/dəʊˈneɪ.ʃən/', 'They made a generous donation to the hospital.' UNION ALL
    SELECT 'download', 'скачивать', '/ˌdaʊnˈləʊd/', 'I need to download the new software update.' UNION ALL
    SELECT 'drain', 'осушать', '/dreɪn/', 'Don''t forget to drain the pasta before adding sauce.' UNION ALL
    SELECT 'drama', 'драма, трагедия', '/ˈdrɑː.mə/', 'Shakespeare wrote many famous dramas.' UNION ALL
    SELECT 'dull', 'скучный', '/dʌl/', 'The lecture was so dull that I fell asleep.' UNION ALL
    SELECT 'entertainer', 'эстрадный артист', '/ˌen.təˈteɪ.nər/', 'The entertainer performed magic tricks for the children.' UNION ALL
    SELECT 'entertaining', 'развлекательный', '/ˌen.təˈteɪ.nɪŋ/', 'The show was very entertaining and made us laugh.' UNION ALL
    SELECT 'fancy', 'нравиться', '/ˈfæn.si/', 'Do you fancy going to the cinema tonight?' UNION ALL
    SELECT 'fascinating', 'очаровательный', '/ˈfæs.ɪ.neɪ.tɪŋ/', 'The documentary about space was fascinating.' UNION ALL
    SELECT 'feel like', 'быть склонным, хотеть', '/ˈfiːl laɪk/', 'I feel like eating pizza for dinner.' UNION ALL
    SELECT 'fresh', 'свежий', '/freʃ/', 'The bakery sells fresh bread every morning.' UNION ALL
    SELECT 'illustrate', 'иллюстрировать', '/ˈɪl.ə.streɪt/', 'The book is illustrated with beautiful drawings.' UNION ALL
    SELECT 'injury', 'травма, повреждение', '/ˈɪn.dʒər.i/', 'The football player suffered a serious injury.' UNION ALL
    SELECT 'joke', 'шутить, шутка', '/dʒəʊk/', 'He told a funny joke that made everyone laugh.' UNION ALL
    SELECT 'license', 'разрешение, лицензия', '/ˈlaɪ.səns/', 'You need a license to drive a car.' UNION ALL
    SELECT 'lively', 'оживлённый', '/ˈlaɪv.li/', 'The city center is always lively on weekends.' UNION ALL
    SELECT 'magician', 'фокусник, волшебник', '/məˈdʒɪʃ.ən/', 'The magician pulled a rabbit out of his hat.' UNION ALL
    SELECT 'makeup', 'макияж', '/ˈmeɪk.ʌp/', 'She applied makeup before the photo shoot.' UNION ALL
    SELECT 'marathon', 'марафон', '/ˈmær.ə.θɒn/', 'He trained for months before running the marathon.' UNION ALL
    SELECT 'marvelous', 'изумительный', '/ˈmɑː.vəl.əs/', 'We had a marvelous time at the beach.' UNION ALL
    SELECT 'mind', 'возражать', '/maɪnd/', 'Do you mind if I open the window?' UNION ALL
    SELECT 'mood', 'настроение', '/muːd/', 'She''s in a bad mood today.' UNION ALL
    SELECT 'musical', 'мюзикл', '/ˈmjuː.zɪ.kəl/', 'The school is performing a musical this year.' UNION ALL
    SELECT 'musician', 'музыкант', '/mjuːˈzɪʃ.ən/', 'The musician played the violin beautifully.' UNION ALL
    SELECT 'nevertheless', 'тем нем не менее', '/ˌnev.ə.ðəˈles/', 'It was raining; nevertheless, we went hiking.' UNION ALL
    SELECT 'on the other hand', 'с другой стороны', '/ɒn ði ˈʌð.ə hænd/', 'The job pays well; on the other hand, the hours are long.' UNION ALL
    SELECT 'opera', 'опера', '/ˈɒp.ər.ə/', 'We saw La Traviata at the opera house.' UNION ALL
    SELECT 'orchestra', 'оркестр', '/ˈɔː.kɪ.strə/', 'The orchestra performed Beethoven''s symphony.' UNION ALL
    SELECT 'pain', 'боль, страдание', '/peɪn/', 'She felt a sharp pain in her back.' UNION ALL
    SELECT 'pavement', 'тротуар', '/ˈpeɪv.mənt/', 'Don''t walk on the road - use the pavement.' UNION ALL
    SELECT 'pioneer', 'первопроходец', '/ˌpaɪəˈnɪər/', 'Marie Curie was a pioneer in radioactivity research.' UNION ALL
    SELECT 'play', 'пьеса', '/pleɪ/', 'The school is performing a Shakespeare play.' UNION ALL
    SELECT 'release', 'выпускать', '/rɪˈliːs/', 'The band will release their new album next month.' UNION ALL
    SELECT 'repetitive', 'повторяющийся', '/rɪˈpet.ə.tɪv/', 'Factory work can be very repetitive.' UNION ALL
    SELECT 'resident', 'постоянный житель', '/ˈrez.ɪ.dənt/', 'City residents often complain about traffic.' UNION ALL
    SELECT 'reward', 'награда', '/rɪˈwɔːd/', 'The police offered a reward for information.' UNION ALL
    SELECT 'selfie', 'селфи', '/ˈsel.fi/', 'Tourists were taking selfies in front of the monument.' UNION ALL
    SELECT 'show', 'показывать, шоу', '/ʃəʊ/', 'The gallery will show new paintings next week.' UNION ALL
    SELECT 'sight', 'достопримечательность', '/saɪt/', 'The Eiffel Tower is a famous Paris sight.' UNION ALL
    SELECT 'spectacular', 'зрелищный', '/spekˈtæk.jə.lər/', 'The fireworks display was spectacular.' UNION ALL
    SELECT 'speech', 'речь, выступление', '/spiːtʃ/', 'The president gave a speech about the economy.' UNION ALL
    SELECT 'standard', 'стандарт, стандартный', '/ˈstæn.dəd/', 'This hotel offers standard and deluxe rooms.' UNION ALL
    SELECT 'statue', 'статуя, памятник', '/ˈstætʃ.uː/', 'There''s a statue of the city founder in the square.' UNION ALL
    SELECT 'streaming', 'потоковый', '/ˈstriː.mɪŋ/', 'I prefer streaming music rather than buying CDs.' UNION ALL
    SELECT 'stressed out', 'нервный, напряженный', '/ˌstrest ˈaʊt/', 'She''s been stressed out about her exams.' UNION ALL
    SELECT 'terrible', 'ужасный', '/ˈter.ə.bəl/', 'We had terrible weather during our vacation.' UNION ALL
    SELECT 'terrific', 'потрясающий', '/təˈrɪf.ɪk/', 'You look terrific in that dress!' UNION ALL
    SELECT 'thrilling', 'захватывающий', '/ˈθrɪl.ɪŋ/', 'The roller coaster ride was thrilling.' UNION ALL
    SELECT 'tuneless', 'немелодичный', '/ˈtjuːn.ləs/', 'He was singing in a loud, tuneless voice.' UNION ALL
    SELECT 'unforgettable', 'незабываемый', '/ˌʌn.fəˈɡet.ə.bəl/', 'Our trip to Italy was unforgettable.' UNION ALL
    SELECT 'unity', 'единство', '/ˈjuː.nə.ti/', 'The crisis brought a sense of unity to the community.' UNION ALL
    SELECT 'verse', 'стих', '/vɜːs/', 'She recited a verse from her favorite poem.' UNION ALL
    SELECT 'warrior', 'воин, боец', '/ˈwɒr.i.ər/', 'Ancient warriors used swords and shields.' UNION ALL
    SELECT 'wide', 'широкий', '/waɪd/', 'The river is too wide to swim across.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B1_Unit3_words.sql
WITH unit_data AS (
    SELECT u.id AS unit_id
    FROM units u
    JOIN levels l ON u.level_id = l.id
    WHERE l.name = 'B1' AND u.display_order = 3
)
INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT ud.unit_id, data.english_word, data.russian_translation, data.transcription, data.example_sentence
FROM unit_data ud
CROSS JOIN (
    SELECT 'aspect' AS english_word, 'сторона, аспект' AS russian_translation, '/ˈæs.pekt/' AS transcription, 'We need to consider every aspect of the problem.' AS example_sentence UNION ALL
    SELECT 'awesome', 'потрясающий', '/ˈɔː.səm/', 'The view from the mountain was awesome.' UNION ALL
    SELECT 'bank', 'берег реки', '/bæŋk/', 'We had a picnic on the river bank.' UNION ALL
    SELECT 'bay', 'залив, бухта', '/beɪ/', 'The ship anchored in the quiet bay.' UNION ALL
    SELECT 'bodysurf', 'бодисёрфинг', '/ˈbɒd.i.sɜːf/', 'He loves to bodysurf in the big waves.' UNION ALL
    SELECT 'boiling', 'кипящий', '/ˈbɔɪ.lɪŋ/', 'Be careful - the water is boiling hot.' UNION ALL
    SELECT 'cargo', 'груз', '/ˈkɑː.ɡəʊ/', 'The ship was carrying cargo of bananas.' UNION ALL
    SELECT 'clutch', 'схватить, зажать', '/klʌtʃ/', 'She clutched her bag tightly in the crowd.' UNION ALL
    SELECT 'collapse', 'рухнуть, развалиться', '/kəˈlæps/', 'The old building collapsed during the storm.' UNION ALL
    SELECT 'concept', 'понятие, идея', '/ˈkɒn.sept/', 'The concept of time differs across cultures.' UNION ALL
    SELECT 'crawl', 'ползать', '/krɔːl/', 'Babies crawl before they learn to walk.' UNION ALL
    SELECT 'debris', 'обломки', '/ˈdeb.riː/', 'Workers cleared the debris after the accident.' UNION ALL
    SELECT 'diving', 'дайвинг', '/ˈdaɪ.vɪŋ/', 'We went diving to see the coral reef.' UNION ALL
    SELECT 'do the dishes', 'мыть посуду', '/ˌduː ðə ˈdɪʃ.ɪz/', 'I''ll cook if you do the dishes afterwards.' UNION ALL
    SELECT 'exhausted', 'изнурённый', '/ɪɡˈzɔː.stɪd/', 'After the marathon, I was completely exhausted.' UNION ALL
    SELECT 'fault', 'вина, ошибка', '/fɒlt/', 'It wasn''t your fault - it was an accident.' UNION ALL
    SELECT 'free-flowing', 'свободнотекущий', '/ˌfriː ˈfləʊ.ɪŋ/', 'The river is free-flowing through this valley.' UNION ALL
    SELECT 'grab', 'хватать, схватить', '/ɡræb/', 'He grabbed my arm to stop me falling.' UNION ALL
    SELECT 'iceberg', 'айсберг', '/ˈaɪs.bɜːɡ/', 'Most of an iceberg is underwater.' UNION ALL
    SELECT 'jet-skiing', 'водный мотоцикл', '/ˈdʒet ˌskiː.ɪŋ/', 'Jet-skiing is popular at this beach.' UNION ALL
    SELECT 'kayaking', 'каякинг', '/ˈkaɪ.æk.ɪŋ/', 'We went kayaking down the peaceful river.' UNION ALL
    SELECT 'lid', 'крышка', '/lɪd/', 'Put the lid back on the jar tightly.' UNION ALL
    SELECT 'light', 'светлый, лёгкий', '/laɪt/', 'She packed a light jacket for the evening.' UNION ALL
    SELECT 'memorable', 'запоминающийся', '/ˈmem.ər.ə.bəl/', 'Our trip to Paris was truly memorable.' UNION ALL
    SELECT 'missing', 'пропавший', '/ˈmɪs.ɪŋ/', 'My keys are missing - have you seen them?' UNION ALL
    SELECT 'odd', 'странный', '/ɒd/', 'That''s an odd color for a car.' UNION ALL
    SELECT 'packed', 'битком набитый', '/pækt/', 'The train was packed with commuters.' UNION ALL
    SELECT 'passionate', 'страстный', '/ˈpæʃ.ən.ət/', 'She''s passionate about animal rights.' UNION ALL
    SELECT 'perspective', 'перспектива', '/pəˈspek.tɪv/', 'The photo shows an interesting perspective.' UNION ALL
    SELECT 'pour', 'лить, наливать', '/pɔːr/', 'She poured tea for all the guests.' UNION ALL
    SELECT 'pursue', 'преследовать', '/pəˈsjuː/', 'The police pursued the stolen car.' UNION ALL
    SELECT 'race', 'гонка', '/reɪs/', 'He came first in the 100-meter race.' UNION ALL
    SELECT 'rafting', 'рафтинг', '/ˈrɑːf.tɪŋ/', 'White-water rafting is an exciting sport.' UNION ALL
    SELECT 'rapids', 'пороги реки', '/ˈræp.ɪdz/', 'The river has dangerous rapids in this section.' UNION ALL
    SELECT 'remains', 'остатки, останки', '/rɪˈmeɪnz/', 'Archaeologists found ancient Roman remains.' UNION ALL
    SELECT 'rowing', 'гребля', '/ˈrəʊ.ɪŋ/', 'Rowing is good exercise for your arms.' UNION ALL
    SELECT 'sea snake', 'морская змея', '/ˈsiː ˌsneɪk/', 'Sea snakes are highly venomous.' UNION ALL
    SELECT 'seabed', 'морское дно', '/ˈsiː.bed/', 'They explored the mysterious seabed.' UNION ALL
    SELECT 'showcase', 'демонстрировать, витрина', '/ˈʃəʊ.keɪs/', 'The museum showcases local artists'' work.' UNION ALL
    SELECT 'sink', 'раковина, тонуть', '/sɪŋk/', 'Wash your hands in the bathroom sink.' UNION ALL
    SELECT 'snorkeling', 'подводное плавание с трубкой', '/ˈsnɔː.kəl.ɪŋ/', 'We saw colorful fish while snorkeling.' UNION ALL
    SELECT 'sore', 'воспаленный', '/sɔːr/', 'My throat is sore from shouting.' UNION ALL
    SELECT 'sponsor', 'спонсор', '/ˈspɒn.sər/', 'The event needs a corporate sponsor.' UNION ALL
    SELECT 'stare', 'уставиться', '/steər/', 'It''s rude to stare at people.' UNION ALL
    SELECT 'stream', 'ручей', '/striːm/', 'A small stream runs through the forest.' UNION ALL
    SELECT 'submarine', 'подводная лодка', '/ˌsʌb.məˈriːn/', 'The submarine can dive very deep.' UNION ALL
    SELECT 'swallow', 'глотать', '/ˈswɒl.əʊ/', 'It hurts when I swallow food.' UNION ALL
    SELECT 'tank', 'бак (танк)', '/tæŋk/', 'The fish tank needs cleaning.' UNION ALL
    SELECT 'thrill', 'волнение, трепет', '/θrɪl/', 'Roller coasters give me a real thrill.' UNION ALL
    SELECT 'wander', 'бродить', '/ˈwɒn.dər/', 'We like to wander through old bookshops.' UNION ALL
    SELECT 'waterfall', 'водопад', '/ˈwɔː.tə.fɔːl/', 'The waterfall is spectacular after rain.' UNION ALL
    SELECT 'water-skiing', 'водные лыжи', '/ˈwɔː.tə ˌskiː.ɪŋ/', 'Water-skiing requires good balance.' UNION ALL
    SELECT 'white-water', 'вспененная вода', '/ˌwaɪt ˈwɔː.tər/', 'The raft bounced through white-water rapids.' UNION ALL
    SELECT 'windsurfing', 'виндсёрфинг', '/ˈwɪnd.sɜː.fɪŋ/', 'Windsurfing is popular on windy days.' UNION ALL
    SELECT 'wreck', 'крушение', '/rek/', 'Divers explored the ancient shipwreck.' UNION ALL
    SELECT 'yacht', 'яхта', '/jɒt/', 'The billionaire owns a luxury yacht.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B1_Unit4_words.sql
WITH unit_data AS (
    SELECT u.id AS unit_id
    FROM units u
    JOIN levels l ON u.level_id = l.id
    WHERE l.name = 'B1' AND u.display_order = 4
)
INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT ud.unit_id, data.english_word, data.russian_translation, data.transcription, data.example_sentence
FROM unit_data ud
CROSS JOIN (
    SELECT 'apply' AS english_word, 'применять' AS russian_translation, '/əˈplaɪ/' AS transcription, 'You should apply sunscreen before going outside.' AS example_sentence UNION ALL
    SELECT 'apprentice', 'ученик, подмастерье', '/əˈpren.tɪs/', 'He started as an apprentice carpenter.' UNION ALL
    SELECT 'available', 'доступный', '/əˈveɪ.lə.bəl/', 'Is the manager available to meet today?' UNION ALL
    SELECT 'badly paid', 'плохо оплачиваемый', '/ˌbæd.li ˈpeɪd/', 'Nursing is important but often badly paid.' UNION ALL
    SELECT 'benefit', 'выгода, польза', '/ˈben.ɪ.fɪt/', 'Regular exercise has many health benefits.' UNION ALL
    SELECT 'bonus', 'бонус, премия', '/ˈbəʊ.nəs/', 'Employees received a Christmas bonus.' UNION ALL
    SELECT 'cellphone', 'мобильный телефон', '/ˈsel.fəʊn/', 'My cellphone battery is almost dead.' UNION ALL
    SELECT 'challenging', 'стимулирующий', '/ˈtʃæl.ɪn.dʒɪŋ/', 'She enjoys challenging work projects.' UNION ALL
    SELECT 'clock on', 'отмечать приход на работу', '/ˌklɒk ˈɒn/', 'Workers must clock on by 8:30 am.' UNION ALL
    SELECT 'conscientious', 'добросовестный', '/ˌkɒn.ʃiˈen.ʃəs/', 'He''s a conscientious student who always does his homework.' UNION ALL
    SELECT 'creative', 'творческий', '/kriˈeɪ.tɪv/', 'Advertising requires creative thinking.' UNION ALL
    SELECT 'database', 'база данных', '/ˈdeɪ.tə.beɪs/', 'Our customer database needs updating.' UNION ALL
    SELECT 'degree', 'степень (научная)', '/dɪˈɡriː/', 'She earned a degree in biology.' UNION ALL
    SELECT 'dirty', 'грязный', '/ˈdɜː.ti/', 'My hands are dirty from gardening.' UNION ALL
    SELECT 'discount', 'скидка', '/ˈdɪs.kaʊnt/', 'Students get a 10% discount here.' UNION ALL
    SELECT 'driverless', 'беспилотный', '/ˈdraɪ.və.ləs/', 'Driverless cars may become common soon.' UNION ALL
    SELECT 'elderly', 'престарелый', '/ˈel.də.li/', 'The elderly man needed help crossing the road.' UNION ALL
    SELECT 'energetic', 'энергичный', '/ˌen.əˈdʒet.ɪk/', 'Our new teacher is very energetic.' UNION ALL
    SELECT 'entrance exam', 'вступительный экзамен', '/ˈen.trəns ɪɡˌzæm/', 'I need to pass the entrance exam for university.' UNION ALL
    SELECT 'ethnic', 'национальный', '/ˈeθ.nɪk/', 'The city has many ethnic restaurants.' UNION ALL
    SELECT 'expedition', 'экспедиция', '/ˌek.spəˈdɪʃ.ən/', 'The scientific expedition lasted six months.' UNION ALL
    SELECT 'flextime', 'гибкий график', '/ˈfleks.taɪm/', 'Our company offers flextime for parents.' UNION ALL
    SELECT 'fold', 'загибать, складывать', '/fəʊld/', 'Fold the paper in half carefully.' UNION ALL
    SELECT 'graduate', 'выпускник', '/ˈɡrædʒ.u.ət/', 'University graduates often find good jobs.' UNION ALL
    SELECT 'hard-working', 'трудолюбивый', '/ˌhɑːd ˈwɜː.kɪŋ/', 'She''s the most hard-working employee we have.' UNION ALL
    SELECT 'healthcare', 'здравоохранение', '/ˈhelθ.keər/', 'Healthcare costs keep rising.' UNION ALL
    SELECT 'idyllic', 'идиллический', '/ɪˈdɪl.ɪk/', 'We found an idyllic spot for a picnic.' UNION ALL
    SELECT 'income', 'доход, прибыль', '/ˈɪn.kʌm/', 'Their combined income allows a comfortable life.' UNION ALL
    SELECT 'influx', 'приток, наплыв', '/ˈɪn.flʌks/', 'There''s been an influx of tourists this summer.' UNION ALL
    SELECT 'lament', 'оплакивать', '/ləˈment/', 'The poem laments the loss of youth.' UNION ALL
    SELECT 'lifestyle', 'образ жизни', '/ˈlaɪf.staɪl/', 'A healthy lifestyle includes exercise.' UNION ALL
    SELECT 'likely', 'вероятный', '/ˈlaɪ.kli/', 'It''s likely to rain this afternoon.' UNION ALL
    SELECT 'long hours', 'сверхурочная работа', '/ˌlɒŋ ˈaʊəz/', 'Doctors often work long hours.' UNION ALL
    SELECT 'methodical', 'методичный', '/məˈθɒd.ɪ.kəl/', 'Her methodical approach ensures accuracy.' UNION ALL
    SELECT 'migrate', 'мигрировать', '/maɪˈɡreɪt/', 'Many birds migrate south for winter.' UNION ALL
    SELECT 'overtime', 'сверхурочное время', '/ˈəʊ.və.taɪm/', 'I earned extra money working overtime.' UNION ALL
    SELECT 'paid holiday', 'оплачиваемый отпуск', '/ˌpeɪd ˈhɒl.ə.deɪ/', 'All employees get four weeks paid holiday.' UNION ALL
    SELECT 'part-time', 'частичная занятость', '/ˌpɑːt ˈtaɪm/', 'She works part-time while studying.' UNION ALL
    SELECT 'pay rise', 'повышение зарплаты', '/ˈpeɪ ˌraɪz/', 'Workers are demanding a pay rise.' UNION ALL
    SELECT 'pension', 'пенсия, пособие', '/ˈpen.ʃən/', 'He''ll receive his pension at age 65.' UNION ALL
    SELECT 'prepaid phonecard', 'предоплаченная карта', '/ˌpriː.peɪd ˈfəʊn.kɑːd/', 'I bought a prepaid phonecard for international calls.' UNION ALL
    SELECT 'promotion', 'повышение', '/prəˈməʊ.ʃən/', 'After five years, she got a promotion.' UNION ALL
    SELECT 'reapply', 'применять повторно', '/ˌriː.əˈplaɪ/', 'You must reapply sunscreen every two hours.' UNION ALL
    SELECT 'redo', 'переделать', '/ˌriːˈduː/', 'I had to redo the entire project.' UNION ALL
    SELECT 'referee', 'судья', '/ˌref.əˈriː/', 'The referee stopped the boxing match.' UNION ALL
    SELECT 'reread', 'перечитывать', '/ˌriːˈriːd/', 'I often reread my favorite books.' UNION ALL
    SELECT 'responsible', 'ответственный', '/rɪˈspɒn.sə.bəl/', 'She''s responsible for the sales department.' UNION ALL
    SELECT 'retake', 'пересдавать', '/ˌriːˈteɪk/', 'He needs to retake his driving test.' UNION ALL
    SELECT 'retrain', 'переучивать', '/ˌriːˈtreɪn/', 'Workers were retrained for new technology.' UNION ALL
    SELECT 'rewrite', 'переписывать', '/ˌriːˈraɪt/', 'The author rewrote the final chapter.' UNION ALL
    SELECT 'salary', 'зарплата', '/ˈsæl.ər.i/', 'Her monthly salary is quite good.' UNION ALL
    SELECT 'self-confident', 'самоуверенный', '/ˌself ˈkɒn.fɪ.dənt/', 'Successful speakers appear self-confident.' UNION ALL
    SELECT 'settle', 'поселяться', '/ˈset.əl/', 'They plan to settle in Canada.' UNION ALL
    SELECT 'span', 'охватывать, диапазон', '/spæn/', 'The bridge spans the entire river.' UNION ALL
    SELECT 'step', 'шаг, шагать', '/step/', 'Watch your step on the icy pavement.' UNION ALL
    SELECT 'stressful', 'напряжённый', '/ˈstres.fəl/', 'Her job is interesting but stressful.' UNION ALL
    SELECT 'substantial', 'существенный', '/səbˈstæn.ʃəl/', 'We made substantial progress today.' UNION ALL
    SELECT 'summit', 'встреча на высшем уровне', '/ˈsʌm.ɪt/', 'World leaders attended the economic summit.' UNION ALL
    SELECT 'typing', 'печатние на машинке', '/ˈtaɪ.pɪŋ/', 'Fast typing is useful for office work.' UNION ALL
    SELECT 'urban', 'городской', '/ˈɜː.bən/', 'Urban areas are usually more crowded.' UNION ALL
    SELECT 'wage', 'зарплата (рабочих)', '/weɪdʒ/', 'The minimum wage increased this year.' UNION ALL
    SELECT 'wealth', 'благосостояние', '/welθ/', 'His family has considerable wealth.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);

-- Seed_B1_Unit5_words.sql
WITH unit_data AS (
    SELECT u.id AS unit_id
    FROM units u
    JOIN levels l ON u.level_id = l.id
    WHERE l.name = 'B1' AND u.display_order = 5
)
INSERT INTO words (unit_id, english_word, russian_translation, transcription, example_sentence)
SELECT ud.unit_id, data.english_word, data.russian_translation, data.transcription, data.example_sentence
FROM unit_data ud
CROSS JOIN (
    SELECT 'alertness' AS english_word, 'бдительность' AS russian_translation, '/əˈlɜːt.nəs/' AS transcription, 'Driving requires constant alertness.' AS example_sentence UNION ALL
    SELECT 'annually', 'ежегодно', '/ˈæn.ju.ə.li/', 'The festival is held annually in July.' UNION ALL
    SELECT 'asthma', 'астма', '/ˈæs.mə/', 'Pollution can trigger asthma attacks.' UNION ALL
    SELECT 'avoid', 'избегать', '/əˈvɔɪd/', 'Try to avoid eating too much sugar.' UNION ALL
    SELECT 'ban', 'запрет, запрещать', '/bæn/', 'Some countries ban smoking in public places.' UNION ALL
    SELECT 'beneficial', 'выгодный', '/ˌben.ɪˈfɪʃ.əl/', 'Fresh air is beneficial for your health.' UNION ALL
    SELECT 'bill', 'счёт (напр. в ресторане)', '/bɪl/', 'Could we have the bill please?' UNION ALL
    SELECT 'blood pressure', 'кровяное давление', '/ˈblʌd ˌpreʃ.ər/', 'My doctor checks my blood pressure regularly.' UNION ALL
    SELECT 'breathe in', 'вдыхать', '/ˌbriːð ˈɪn/', 'Breathe in deeply through your nose.' UNION ALL
    SELECT 'chew', 'жевать', '/tʃuː/', 'Chew your food properly before swallowing.' UNION ALL
    SELECT 'course', 'блюдо', '/kɔːs/', 'The main course was roast chicken.' UNION ALL
    SELECT 'crowd', 'толпа, толпиться', '/kraʊd/', 'A crowd gathered to watch the street performers.' UNION ALL
    SELECT 'crust', 'корка (хлеба)', '/krʌst/', 'I prefer bread with a crispy crust.' UNION ALL
    SELECT 'cut down on', 'сократить потребление', '/ˌkʌt ˈdaʊn ɒn/', 'I''m trying to cut down on coffee.' UNION ALL
    SELECT 'cut out', 'исключить', '/ˌkʌt ˈaʊt/', 'The doctor said I should cut out dairy products.' UNION ALL
    SELECT 'cute', 'милый, симпатичный', '/kjuːt/', 'That puppy is so cute!' UNION ALL
    SELECT 'dessert', 'десерт, сладкое', '/dɪˈzɜːt/', 'Chocolate cake is my favorite dessert.' UNION ALL
    SELECT 'disease', 'заболевание', '/dɪˈziːz/', 'Vaccines prevent many serious diseases.' UNION ALL
    SELECT 'fatty', 'жирный (о еде)', '/ˈfæt.i/', 'Avoid fatty foods before exercising.' UNION ALL
    SELECT 'ferment', 'брожение, бродить', '/fəˈment/', 'Grapes ferment to make wine.' UNION ALL
    SELECT 'fist', 'кулак', '/fɪst/', 'He clenched his fist in anger.' UNION ALL
    SELECT 'fool', 'дурак, дурачить', '/fuːl/', 'Don''t fool yourself - you need to study.' UNION ALL
    SELECT 'fritter', 'фриттер(жареное тесто с начинкой)', '/ˈfrɪt.ər/', 'Corn fritters are delicious with maple syrup.' UNION ALL
    SELECT 'give up', 'перестать что-тo делать', '/ˌɡɪv ˈʌp/', 'I gave up smoking five years ago.' UNION ALL
    SELECT 'guide', 'вести, направлять', '/ɡaɪd/', 'The teacher guided students through the experiment.' UNION ALL
    SELECT 'habit-forming', 'вызывающий привыкание', '/ˈhæb.ɪt ˌfɔː.mɪŋ/', 'Some painkillers can be habit-forming.' UNION ALL
    SELECT 'handful', 'горсть', '/ˈhænd.fʊl/', 'Add a handful of nuts to the salad.' UNION ALL
    SELECT 'harmful', 'вредный', '/ˈhɑːm.fəl/', 'UV rays can be harmful to your skin.' UNION ALL
    SELECT 'inedible', 'несъедобный', '/ɪnˈed.ə.bəl/', 'Some berries look tasty but are inedible.' UNION ALL
    SELECT 'ingredient', 'ингредиент', '/ɪnˈɡriː.di.ənt/', 'Flour is the main ingredient in bread.' UNION ALL
    SELECT 'junk food', 'вредная еда', '/ˈdʒʌŋk ˌfuːd/', 'Junk food is tempting but unhealthy.' UNION ALL
    SELECT 'license', 'разрешение, лицензия', '/ˈlaɪ.səns/', 'You need a license to drive a car.' UNION ALL
    SELECT 'major', 'главный, основной', '/ˈmeɪ.dʒər/', 'The major cause of obesity is overeating.' UNION ALL
    SELECT 'manuscript', 'рукопись', '/ˈmæn.jə.skrɪpt/', 'The author sent her manuscript to publishers.' UNION ALL
    SELECT 'millennium', 'тысячелетие', '/mɪˈlen.i.əm/', 'We celebrated the new millennium in 2000.' UNION ALL
    SELECT 'neuroscientist', 'невролог', '/ˌnjʊə.rəʊˈsaɪ.ən.tɪst/', 'The neuroscientist studies brain functions.' UNION ALL
    SELECT 'obesity', 'ожирение', '/əʊˈbiː.sə.ti/', 'Childhood obesity is a growing problem.' UNION ALL
    SELECT 'overweight', 'избыточный вес', '/ˌəʊ.vəˈweɪt/', 'Being overweight increases health risks.' UNION ALL
    SELECT 'palm', 'ладонь', '/pɑːm/', 'She held the coin in her palm.' UNION ALL
    SELECT 'poison', 'яд, отравлять', '/ˈpɔɪ.zən/', 'Some mushrooms contain deadly poison.' UNION ALL
    SELECT 'portion', 'порция', '/ˈpɔː.ʃən/', 'Restaurants often serve large portions.' UNION ALL
    SELECT 'profit', 'прибыль, доход', '/ˈprɒf.ɪt/', 'The company made record profits this year.' UNION ALL
    SELECT 'regulation', 'устав, правило', '/ˌreɡ.jəˈleɪ.ʃən/', 'Food packaging must follow strict regulations.' UNION ALL
    SELECT 'relieve', 'облегчать', '/rɪˈliːv/', 'This medicine will relieve your headache.' UNION ALL
    SELECT 'rival', 'соперник, конкурент', '/ˈraɪ.vəl/', 'Coca-Cola and Pepsi are longtime rivals.' UNION ALL
    SELECT 'savory', 'пикантный, пряный', '/ˈseɪ.vər.i/', 'I prefer savory snacks to sweet ones.' UNION ALL
    SELECT 'scrap', 'клочок', '/skræp/', 'She wrote the number on a scrap of paper.' UNION ALL
    SELECT 'sell-by date', 'срок годности', '/ˈsel.baɪ ˌdeɪt/', 'Always check the sell-by date on food.' UNION ALL
    SELECT 'shift work', 'посменная работа', '/ˈʃɪft ˌwɜːk/', 'Nurses often do difficult shift work.' UNION ALL
    SELECT 'sick', 'больной, нездоровый', '/sɪk/', 'I feel sick after eating that seafood.' UNION ALL
    SELECT 'soak', 'намокание, набухание', '/səʊk/', 'Soak the beans overnight before cooking.' UNION ALL
    SELECT 'sparkling', 'газированный', '/ˈspɑː.klɪŋ/', 'I''ll have sparkling water with lemon.' UNION ALL
    SELECT 'spiral', 'спираль, спиральный', '/ˈspaɪə.rəl/', 'The staircase had an elegant spiral design.' UNION ALL
    SELECT 'squash', 'тыква, кабачок', '/skwɒʃ/', 'Butternut squash makes delicious soup.' UNION ALL
    SELECT 'starter', 'закуска', '/ˈstɑː.tər/', 'We shared a starter before our main courses.' UNION ALL
    SELECT 'status', 'статус, положение', '/ˈsteɪ.təs/', 'His new job gives him higher social status.' UNION ALL
    SELECT 'suitable', 'подходящий', '/ˈsuː.tə.bəl/', 'This movie isn''t suitable for children.' UNION ALL
    SELECT 'sweet potato', 'батат, сладкий картофель', '/ˌswiːt pəˈteɪ.təʊ/', 'Roasted sweet potatoes are delicious.' UNION ALL
    SELECT 'take up', 'начать что-либо делать', '/ˌteɪk ˈʌp/', 'I''ve decided to take up gardening.' UNION ALL
    SELECT 'tip', 'чаевые', '/tɪp/', 'We left a generous tip for the waiter.' UNION ALL
    SELECT 'unsold', 'нераспроданный', '/ʌnˈsəʊld/', 'The unsold merchandise was discounted.' UNION ALL
    SELECT 'unwanted', 'ненужный', '/ʌnˈwɒn.tɪd/', 'We donated unwanted clothes to charity.' UNION ALL
    SELECT 'willpower', 'сила воли', '/ˈwɪlˌpaʊ.ər/', 'Losing weight requires strong willpower.'
) AS data
WHERE EXISTS (SELECT 1 FROM unit_data);