-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 22 2020 г., 09:12
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `insta`
--

-- --------------------------------------------------------

--
-- Структура таблицы `carusel`
--

CREATE TABLE `carusel` (
  `postId` int NOT NULL,
  `caruselId` int NOT NULL COMMENT 'Id основного поста',
  `instagramId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Внутренний ID Instagtam',
  `nickId` int NOT NULL COMMENT 'NickId из локальной таблицы Instagram',
  `createdTime` int NOT NULL COMMENT 'Время создания поста',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Тип поста',
  `imageUrl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'URL картинки',
  `videoUrl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'URL Video'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `carusel`
--

INSERT INTO `carusel` (`postId`, `caruselId`, `instagramId`, `nickId`, `createdTime`, `type`, `imageUrl`, `videoUrl`) VALUES
(1, 6, '2432911609354903722', 1, 0, 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/123339094_2675255679453306_741545427216504717_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=106&_nc_ohc=4_ZP57l_uYsAX-q_hgk&tp=1&oh=796b480fd07cb2e96cd72c548c1fd2fd&oe=5FE113A8', ''),
(2, 6, '2432911609346519620', 1, 0, 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/123144803_1052444971872256_7568296865055202098_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=104&_nc_ohc=vk7dYK9tHt4AX_evQJs&tp=1&oh=fe19ab26d27a95f94eb79f95bf130946&oe=5FE1E008', ''),
(3, 6, '2432911609380159398', 1, 0, 'image', 'https://scontent-arn2-2.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/123145003_478701623105345_248968098948021129_n.jpg?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=105&_nc_ohc=YuKWaAIh-KEAX_In8zr&tp=1&oh=cf72b917b20d4bb9341e5a06ee0f17fe&oe=5FE08896', ''),
(4, 6, '2432911609371682706', 1, 0, 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/123132923_393760951655982_6065927442657317521_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=106&_nc_ohc=89e_8g-nw4sAX9SaCGL&tp=1&oh=5748dfff3648be6c599804469b4ba82c&oe=5FE0B7F6', ''),
(5, 14, '2317881088902871349', 2, 0, 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/101066876_528427554709455_5130057594285768782_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=103&_nc_ohc=Z46Fvgm4y0UAX9DyCRs&tp=1&oh=6f07e5517bbf138cd8e55d0797cbe381&oe=5FDFDD8C', ''),
(6, 14, '2317881088885945141', 2, 0, 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/100953540_1842242109243562_8830887146732595897_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=110&_nc_ohc=2wbQSaUpwfYAX9r__V-&tp=1&oh=8e9a7aed81ea6382769a710e8772d809&oe=5FDFD83D', ''),
(7, 23, '2446418289230616755', 3, 0, 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/126332028_289387302406535_868506353758835710_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=111&_nc_ohc=l-EyTJeF5qIAX8yzMVS&tp=1&oh=356d99e8ee0acff9e71b4b115b6d4f4f&oe=5FDFDA2D', ''),
(8, 23, '2446418289197135013', 3, 0, 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/126063080_591115525000957_5953115335708170902_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=101&_nc_ohc=VlLxh9zgFr8AX_30I-T&tp=1&oh=641440192d4ec6adc3b4d79039bb144e&oe=5FDFB1CF', ''),
(9, 23, '2446418289213868224', 3, 0, 'image', 'https://scontent-arn2-2.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/125934035_414975659526473_961545426865004759_n.jpg?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=105&_nc_ohc=aSIH3liM7IgAX_gpAl3&tp=1&oh=17f7ca2dcedb75937db639453dd9a38a&oe=5FE1602E', ''),
(10, 23, '2446418289205552053', 3, 0, 'image', 'https://scontent-arn2-2.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/126058500_367065201226128_234374257162482127_n.jpg?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=100&_nc_ohc=QHT2tHHTjucAX8-dW1_&tp=1&oh=067a4d35702d0722eec84ab05a97a92a&oe=5FE1A463', ''),
(11, 23, '2446418289348151413', 3, 0, 'image', 'https://scontent-arn2-2.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/126224978_435302090796072_3872758947233589251_n.jpg?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=100&_nc_ohc=M57Jx5lPN3IAX_1twZO&tp=1&oh=6df62867eb691c0e1b1668e9addace76&oe=5FDF9DA3', ''),
(12, 23, '2446418289180348748', 3, 0, 'image', 'https://scontent-arn2-2.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/126449292_708687923399652_4264290552502491980_n.jpg?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=100&_nc_ohc=2Q_X_iB7h1kAX9ZE5lz&tp=1&oh=a04389a06f2a2be82c63243d2f940bb3&oe=5FE00B37', ''),
(13, 23, '2446418289163615749', 3, 0, 'image', 'https://scontent-arn2-2.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/126104812_133409874889280_8210300390972252949_n.jpg?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=108&_nc_ohc=cvuczKlNKIgAX9SzIwM&tp=1&oh=5eaa633e783e02b227007cd177394fa1&oe=5FE03885', ''),
(14, 28, '2445732128074201669', 3, 0, 'image', 'https://scontent-arn2-2.cdninstagram.com/v/t51.2885-15/e35/p1080x1080/125943117_211969813607261_5217479924810071489_n.jpg?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=105&_nc_ohc=bFpn9j79sxEAX9VVFx2&tp=1&oh=4364da82a07bbdb5f9d06669ea30811b&oe=5FE0B01F', ''),
(15, 28, '2445732128057423626', 3, 0, 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/p1080x1080/125910694_364481171506117_6947524531116754887_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=101&_nc_ohc=l7EJaC0d74sAX8LAENH&tp=1&oh=382a94df3e725e6adea0db9db605106a&oe=5FE0C9F7', ''),
(16, 28, '2445731905364965122', 3, 0, 'video', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/125807819_287514932598263_4123257779810097854_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=111&_nc_ohc=OvERHE-v4P8AX8lDHIs&tp=1&oh=f5eb16c7f976483dad74a1ebdf8697e1&oe=5FBA316B', 'https://scontent-arn2-1.cdninstagram.com/v/t50.2886-16/10000000_695329421362425_1846522489289518038_n.mp4?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=109&_nc_ohc=KGCAjmkh2GUAX-U9ZAj&oe=5FBA086B&oh=94c37ea7a196289db5f3b0b64fcf9871'),
(17, 28, '2445731905171999186', 3, 0, 'video', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/125804656_383366183005938_8218618312187026042_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=106&_nc_ohc=RZ8pgSXvZhgAX-D9ool&tp=1&oh=8a300b3184ffcd2678a153360cb12cc5&oe=5FBA8EAC', 'https://scontent-arn2-2.cdninstagram.com/v/t50.2886-16/125902113_379536249963236_2534378335962063251_n.mp4?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=108&_nc_ohc=kvq3x5mIP_EAX81uRED&oe=5FBA2644&oh=fd254ca9ab4d47e16aeeb9b3c184db88');

-- --------------------------------------------------------

--
-- Структура таблицы `instagram`
--

CREATE TABLE `instagram` (
  `id` int NOT NULL,
  `instagramId` int NOT NULL COMMENT 'instagramId',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Nick',
  `fullName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Полное имя',
  `avatarUrl` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Ссылка на аватар',
  `biography` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Биография',
  `followsCount` int DEFAULT NULL COMMENT 'Подписок',
  `followedByCount` int DEFAULT NULL COMMENT 'Подписчиков',
  `mediaCount` int DEFAULT NULL COMMENT 'Количество публикаций'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `instagram`
--

INSERT INTO `instagram` (`id`, `instagramId`, `name`, `fullName`, `avatarUrl`, `biography`, `followsCount`, `followedByCount`, `mediaCount`) VALUES
(1, 495352590, 'nikita_barasuayo_kupreykin', 'ПРОФЕССИОНАЛЬНЫЙ ТАНЦОР', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-19/s320x320/105491770_630946537516288_5318788723195388874_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_ohc=cgCg5_U0BCIAX83nkM4&tp=1&oh=e7d7ae32940d7bbdad135aec76151284&oe=5FE3BA8B', '🇨🇺 Танцор Афро Кубинского Фольклора\n🔸Premier преподаватель в @galladance \n⬇️Записаться на урок танцев', 2181, 2547, 449),
(2, 209221666, 'mitkrivich', 'dMITry KRIVoshCHekov', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-19/s320x320/91488978_210579463555294_4917692954979598336_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_ohc=scBKwFOuCREAX_cwOCc&tp=1&oh=434137588658ed6988b7ef0c6127e882&oe=5FE25BE3', '@skatingsystem страница программы Skating System', 739, 616, 153),
(3, 2040695685, 'marmelfoto', 'Melnikova Marina', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-19/s320x320/75214647_3188765667805214_456156072642609152_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_ohc=Csngtc1VpikAX_pV4wG&tp=1&oh=35397ac0648581141941a9a735f09360&oe=5FE4255A', 'Dancesport photographer 📸💃🏻🕺🏼 Персональная фотосъёмка на турнирах +79175219294', 696, 25701, 5258),
(4, 1691650746, 'championat_com', 'Championat.com / Чемпионат', NULL, NULL, NULL, NULL, 6416);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8mb4_bin NOT NULL,
  `apply_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1605869813),
('m130524_201442_init', 1605869819),
('m190124_110200_add_verification_token_column_to_user_table', 1605869819);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `postId` int NOT NULL,
  `instagramId` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT 'Внутренний ID Instagtam',
  `nickId` int NOT NULL COMMENT 'NickId из локальной таблицы Instagram',
  `createdTime` int NOT NULL COMMENT 'Время создания post',
  `linkUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Ссылка на post',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Тип поста',
  `imageUrl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'URL картинки',
  `videoUrl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'URL Video',
  `locationName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Локация',
  `caption` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Текст Сообщения',
  `likesCount` int DEFAULT NULL COMMENT 'Количество лайков',
  `commentsCount` int DEFAULT NULL COMMENT 'Количество комментариев'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`postId`, `instagramId`, `nickId`, `createdTime`, `linkUrl`, `type`, `imageUrl`, `videoUrl`, `locationName`, `caption`, `likesCount`, `commentsCount`) VALUES
(1, '2446439768184486072', 1, 1605858368, 'https://www.instagram.com/p/CHzgAHjBni4', 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/126220750_147742627130353_4465520035061648735_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=101&_nc_ohc=yOiAL9jW50gAX_aLuRG&tp=1&oh=7c3a98f4105cc9d03eef890f558dec88&oe=5FE41A8F', '', 'Moscow, Russia', 'Больше, чем уверен, что мы с вами танцевали, даже не догадываясь о существовании друг друга. Найдёте меня на фото? Девять лет назад, переехав в Москву, я устроился работать официантом в ресторан «Мачо Гриль», который находился под пушкинским кинотеатром, там сейчас «Чайхана намбрван». Кто был там и помнит это место, ставьте «+» в коментах. Это место было американским «Паладиумом», там всегда проходили большие вечеринки сальсы и бачаты, был большой танцпол, и даже проходили милонги, карибская музыка не переставала играть, а по пятницам играл оркестр, были крутые кубинские танцевальные шоу и шоу бразильской самбы. Весь танцевальный бомонд стекался в это место, танцоры бального и социального танца существовали на одном танцполе, вы можете в это поверить? А такое было, как вчерашний день помню. Видимо, Мать судьба знала, куда меня привести на работу. Я был тем самым официантом, который всегда танцевал с гостями, состояние моей души - душа выскакивала из трусов, и я пускался в пляс. Я чувствовал себя в своей стихии, ну что поделать, нутро танцора не вынешь и не поменяешь на просто нутро официанта. За все когда-то нужно платить, и после рабочей смены я всегда оставлял пару лишних сотен штрафа за свои проделки. Тогда я только мечтал научиться танцевать кубинские танцы и даже не подозревал, что увлекусь аргентинским танго. В моей голове даже не было мысли, что мои танцевальные пути уже предопределены и уже можно сказать начались, в «Мачо Гриле» я познакомился с Йоанди, отдыхающие земляки-танцоры из Новосиба рассказали мне про gallaDance, а с Аннелис мы просто пересекались взглядом, когда шоу балет, где она танцевала, готовился к пятничным выступлениям, и даже, обслуживал Виктора Да Сильву, не зная, что это Виктор Да Сильва😊\n.\n.\n#dance #worldofdance #dancelife #танцы #социальныетанцы #тывтанцах #танцывмоскве #Afro #afroculture #afrodances #socialdances #афро #сальса #сальсавмоскве #salsa #galladance #cuba #juzz #doncelifestyle #lindyhop #instagramfordancers #instadance #dancetime #salsatime #salsacommunity #dancelove #cubanstyle #salsadancing #bam', 65, 3),
(2, '2440874015857413695', 1, 1605195123, 'https://www.instagram.com/p/CHfufwwqY4_', 'video', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/125109073_684092102242911_3303709279497147514_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=103&_nc_ohc=Tw0Mtbam_m4AX_5CpIU&tp=1&oh=8c5fc1c34830eb9526599526269d9220&oe=5FBB4B26', 'https://scontent-arn2-1.cdninstagram.com/v/t50.16885-16/10000000_400877394628893_4622004607556298474_n.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6InZ0c192b2RfdXJsZ2VuLjgyNC5pZ3R2LmRlZmF1bHQiLCJxZV9ncm91cHMiOiJbXCJpZ193ZWJfZGVsaXZlcnlfdnRzX290ZlwiXSJ9&_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=109&_nc_ohc=kYJ2DSkU98YAX9u5Luk&vs=17872730285046390_3397871266&_nc_vs=HBksFQAYJEdJQ1dtQUFka2JTS21Hd0JBT3FtbkxfenFDUkFidlZCQUFBRhUAAsgBABUAGCRHS2hNYVFmNERmcU9fNmNEQUlSc0lybFpNNmMtYnZWQkFBQUYVAgLIAQAoABgAGwGIB3VzZV9vaWwBMRUAACbszbyV5sm%2FPxUCKAJDMywXQGd1T987ZFoYEmRhc2hfYmFzZWxpbmVfMV92MREAdewHAA%3D%3D&_nc_rid=792f767472&oe=5FBB6763&oh=1e4de36dea2fe565ec114163d24ecd69', '', 'Итак, ты на площадке, на тебя все смотрят, пошевели мизинцем какой нибудь ноги в башмаке, и осознай, что ты тоже на площадке, понимаю, в такие моменты ты подсознательно начинаешь думать, выключил ли ты дома утюг. Начинай выполнять самую главную фигуру, под названием «Не думать», особенно если ты собрался исполнять парный танец, и особенно, если ты партнерша, все, деваться не куда, помни, на тебя все смотрят. Постепенно ты начнёшь чувствовать бит музыки - это то же самое, когда играют Белые розы, и твоё бедро бессознательно начинает пританцовывать само, главное не сопротивляйся, если ты рационал, быстро хватай чье то шампанское со столика, и пей залпом. Дело сделано, «ты в танцах в команде Мигеля», сейчас или никогда, пускайся в пляс, как на русской свадьбе, обязательно думай, что ты оторвёшься на полную, свадьбы бывают редко, особенно в наше время, и корпоратив тоже не скоро. Избавься от предрассудков, ведь в душе мы все танцоры.😊 \nНа видео Solo Jazz\n.\n.\n#dance #worldofdance #dancelife #танцы #социальныетанцы #тывтанцах #танцывмоскве #Afro #afroculture #afrodances #socialdances #афро #сальса #сальсавмоскве #salsa #galladance #cuba #juzz #doncelifestyle #lindyhop #instagramfordancers #instadance #dancetime #salsatime #salsacommunity #dancelove #cubanstyle #bam', 125, 7),
(3, '2437985359171530102', 1, 1604850524, 'https://www.instagram.com/p/CHVdsRlBa12', 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/124011718_1118957718543712_3132515568927293013_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=104&_nc_ohc=nwUb7wDuc48AX9zmq-s&tp=1&oh=2b57f75ec08a384610efc74007813915&oe=5FE3E1CD', '', 'Москва, Кремль', 'Я - Папа! Безгранично счастлив🤪😃😃😃😃 Дорогая моя @mrs._vik , СПАСИБО🙏🏿😘😘😘😘 Люблю😘😘😘😘❤️\n.\n.\n#молодойпапа', 337, 102),
(4, '2434760982806454257', 1, 1604466598, 'https://www.instagram.com/p/CHKAjbFKN_x', 'video', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/123328176_385578989464398_3722923258760279146_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=106&_nc_ohc=XEwCr0GyHV0AX82dtSA&tp=1&oh=b1045fc9047bb472b3f99138dda7691e&oe=5FBB59CB', 'https://scontent-arn2-2.cdninstagram.com/v/t50.2886-16/122930954_465309197775312_9153775684618231312_n.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6InZ0c192b2RfdXJsZ2VuLjcyMC5mZWVkLmRlZmF1bHQiLCJxZV9ncm91cHMiOiJbXCJpZ193ZWJfZGVsaXZlcnlfdnRzX290ZlwiXSJ9&_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=100&_nc_ohc=h78kyVvIaWgAX_JmsAn&vs=17861604350176929_525754050&_nc_vs=HBksFQAYJEdBckhVd2ZRc1hFOU1xY0JBQkFlUjROOHZnaC1ia1lMQUFBRhUAAsgBABUAGCRHR1ZJWFFjNjFaUWo1NGtEQU5Sc0NuQ1VfTGN4YmtZTEFBQUYVAgLIAQAoABgAGwGIB3VzZV9vaWwBMBUAACbC8bi0mMK6PxUCKAJDMywXQEURBiTdLxsYEmRhc2hfYmFzZWxpbmVfMV92MREAdeoHAA%3D%3D&_nc_rid=792f72a63c&oe=5FBB7529&oh=b4268043c53f148d8c41f1d697d3aa72', 'THE MOSCOW CITY', 'Почему мне не нужны всякие регалии, кубки и звания, и я вообще не стремлюсь их получить? К сожалению или к счастью, танец меняется, эволюционирует с течением времени или разных обстоятельств жизни. Появляются новые тренды в уже существующих стилях. На Кубе, как и в большинстве стран, люди перестали изучать свои национальные танцы, новые поколения уже не знают, что такое кубинский сон или болеро, старики уходят, забирая с собой огромные пласты знаний и культурных традиций, а в институты приходят молодые, которые уже дают совсем другое, в корне меняя танец. Но, кубинские улицы и районы продолжают жить, а значит продолжает жить фольклор. Он пульсирует в недрах Кубы, как сердцебиение, подчеркивая весь колорит жизни ещё со времён колонизаторов, давая людям надежду и веру. Для меня самая большая награда в жизни - это то, что я могу быть в самых недрах и истоках кубинского фольклора, прикасаясь и впитывая все, что говорят мне мои учителя, носители и хранители кубинского жанра, которые несут свои знания через поколения \nИменно поэтому, я Байлядор - уличный танцор, который с гордостью несет через время то, что начинает уходить в прошлое. \nЯ верю, что в каждом из нас живет чайка по имени Джонатан Ливингстон. «Чтобы летать куда хочешь, нужно прежде всего понять, что ты уже прилетел...»\n\nТанец народов Йоруба, посвященный Богине Морей Емайя. В Африке эта народность живет в Нигерии и регионах Бенина.\n\nЭто видео посвящается всем женщинам, моей Бабушке Светлане Зиновьевне, моей супруге @mrs._vik, моей Мадрине @annelysperezcastillo , моей кровной Маме @oksana_kupreykina , и моей кубинской Маме @jennygalata , профессору кубинской культуры\n.\n.\n#dance #worldofdance #dancelife #танцы #социальныетанцы #тывтанцах #танцывмоскве #Afro #afroculture #afrodances #socialdances #афро #сальса #сальсавмоскве #salsa #galladance #cuba #juzz #doncelifestyle #lindyhop #instagramfordancers #instadance #dancetime #salsatime #salsacommunity #dancelove #cubanstyle #salsadancing #bam', 262, 25),
(5, '2434181521304390762', 1, 1604397149, 'https://www.instagram.com/p/CHH8zJgKwxq', 'video', 'https://scontent-arn2-2.cdninstagram.com/v/t51.2885-15/e35/123398516_398109911598389_1245387964108972068_n.jpg?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=105&_nc_ohc=q5ezPGPQft4AX9D-n51&tp=1&oh=ff2c8201de76d5cf8cbee61359ccb12e&oe=5FBB205F', 'https://scontent-arn2-1.cdninstagram.com/v/t50.2886-16/123085151_657533198295150_6461786082251935932_n.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6InZ0c192b2RfdXJsZ2VuLjcyMC5mZWVkLmRlZmF1bHQiLCJxZV9ncm91cHMiOiJbXCJpZ193ZWJfZGVsaXZlcnlfdnRzX290ZlwiXSJ9&_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=106&_nc_ohc=wxD1WSlKziwAX_F6E3i&vs=17904058258577483_2676379156&_nc_vs=HBksFQAYJEdGOGhWZ2R1WUxiZ0JWWUNBTHlRTUs4MDRLeFpia1lMQUFBRhUAAsgBABUAGCRHRkdHWFFlVW1icUhvOXdEQU5vT090aGNWMFoyYmtZTEFBQUYVAgLIAQAoABgAGwGIB3VzZV9vaWwBMBUAACaWqsjMrOnNPxUCKAJDMywXQEDd0vGp%2B%2BcYEmRhc2hfYmFzZWxpbmVfMV92MREAdeoHAA%3D%3D&_nc_rid=792f7db37f&oe=5FBB397B&oh=5b49c207de8e581dc0f0511986acfc3e', 'THE MOSCOW CITY', 'А вы скучаете по морю? 🌊 Кубинская румба гуагуанко🇨🇺☀️\nМы с @yasmanysotollanes скучаем😉\n#papicasadancer\n.\n.\n#dance #worldofdance #dancelife #танцы #социальныетанцы #тывтанцах #танцывмоскве #Afro #afroculture #afrodances #socialdances #афро #сальса #сальсавмоскве #salsa #galladance #cuba #juzz #doncelifestyle #lindyhop #instagramfordancers #instadance #dancetime #salsatime #salsacommunity #dancelove #cubanstyle #salsadancing #bam', 405, 16),
(6, '2432911612601193989', 1, 1604245686, 'https://www.instagram.com/p/CHDcDi3BFYF', 'sidecar', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/123339094_2675255679453306_741545427216504717_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=106&_nc_ohc=4_ZP57l_uYsAX-q_hgk&tp=1&oh=796b480fd07cb2e96cd72c548c1fd2fd&oe=5FE113A8', '', 'Красная Площадь Москва', 'Шоколадку пришлось купить новую, а бумажка настоящая😊\nИсторию читай в карусели\n#творидобро', 81, 4),
(7, '2431496836291970244', 1, 1604077167, 'https://www.instagram.com/p/CG-aX1vq0TE', 'video', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/123033749_1013564009159375_2392052727667411750_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=111&_nc_ohc=zuC_Is5ZvtgAX_J2LPP&tp=1&oh=4f9c44eb77d77d43b3c68f2e4539649c&oe=5FBB2097', 'https://scontent-arn2-1.cdninstagram.com/v/t50.2886-16/122973356_718302105791222_188271294905592043_n.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6InZ0c192b2RfdXJsZ2VuLjY0MC5mZWVkLmRlZmF1bHQiLCJxZV9ncm91cHMiOiJbXCJpZ193ZWJfZGVsaXZlcnlfdnRzX290ZlwiXSJ9&_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=102&_nc_ohc=88039zw2DjUAX-7ebUt&vs=18080897770222104_785633134&_nc_vs=HBksFQAYJEdLeHNWQWYyYXR1OVNvMENBT3NvUU1hXzM1d0Nia1lMQUFBRhUAAsgBABUAGCRHRm8yVndjS3AzeUo0WHNBQUVseVZaMzRlUko4YmtZTEFBQUYVAgLIAQAoABgAGwGIB3VzZV9vaWwBMBUAACawysSL4J6eQBUCKAJDMywXQE4AAAAAAAAYEmRhc2hfYmFzZWxpbmVfMV92MREAdeoHAA%3D%3D&_nc_rid=792f7db7c3&oe=5FBB5176&oh=a475614c921c7b442dcb481798b48b05', 'THE MOSCOW CITY', 'Тренируюсь. В чем мой секрет? Все просто. Еще в детстве вставал перед зеркалом и самостоятельно отрабатывал танцевальные движения. Так же и сейчас - стою и работаю, только зал поменялся. На видео танец  народов Арара из африканского региона Дагомей в западной Африке. Танец посвящён Богу исцеления болезней Асоуано. Эти народы, так же, как и многие африканские народы, оказались на Кубе из за рабства.\n.\n.\n#dance #worldofdance #dancelife #танцы #социальныетанцы #тывтанцах #танцывмоскве #Afro #afroculture #afrodances #socialdances #афро #сальса #сальсавмоскве #salsa #galladance #cuba #juzz #doncelifestyle #lindyhop #instagramfordancers #instadance #dancetime #salsatime #salsacommunity #dancelove #cubanstyle #salsadancing #bam', 163, 6),
(8, '2430420713510014383', 1, 1603948748, 'https://www.instagram.com/p/CG6lsMThA2v', 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/122768637_186472313015377_7838613787707488243_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=101&_nc_ohc=zbdXBN1TNSUAX8MLI79&tp=1&oh=001c05ad01e2c96b591ca9c44351e0ba&oe=5FE33603', '', 'THE MOSCOW CITY', 'Как вы относитесь к фразе «правила для того, чтобы их нарушать»?😊\n.\n.\n#dance #worldofdance #dancelife #танцы #социальныетанцы #тывтанцах #танцывмоскве #Afro #afroculture #afrodances #socialdances #афро #сальса #сальсавмоскве #salsa #galladance #cuba #juzz #doncelifestyle #lindyhop #instagramfordancers #instadance #dancetime #salsatime #salsacommunity #dancelove #cubanstyle #salsadancing #bam', 123, 1),
(9, '2429862313254864746', 1, 1603882489, 'https://www.instagram.com/p/CG4muZiqkdq', 'video', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/122773763_353382722562655_1869599430353208967_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=107&_nc_ohc=67MU28MJx78AX_FRzPn&tp=1&oh=06110f35a5a823606f857f500815c919&oe=5FBB4C97', 'https://scontent-arn2-1.cdninstagram.com/v/t50.2886-16/122812122_742104346395463_8730252678690371323_n.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6InZ0c192b2RfdXJsZ2VuLjcyMC5mZWVkLmRlZmF1bHQiLCJxZV9ncm91cHMiOiJbXCJpZ193ZWJfZGVsaXZlcnlfdnRzX290ZlwiXSJ9&_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=107&_nc_ohc=SV910zzM5h4AX9ohOyI&vs=17851984376340493_1844568847&_nc_vs=HBksFQAYJEdOcjJVUWRIQS1TaDhLSUNBUHYydlhDT0ZpaDVia1lMQUFBRhUAAsgBABUAGCRHQ1FoVWdjS3ptT05OTGNBQVB0enBzS0RnQmxnYmtZTEFBQUYVAgLIAQAoABgAGwGIB3VzZV9vaWwBMBUAACaajL%2Fkn5K2PxUCKAJDMywXQEZMzMzMzM0YEmRhc2hfYmFzZWxpbmVfMV92MREAdeoHAA%3D%3D&_nc_rid=792f7399db&oe=5FBAE6BD&oh=72df6e9aa1641b101fd4f1faafebdac8', 'THE MOSCOW CITY', 'Из России с любовью🇨🇺 🌞 🇷🇺 ❤️\nМузыка: @brendanavarreteofficial \n.\n.\n#dance #worldofdance #dancelife #танцы #социальныетанцы #тывтанцах #танцывмоскве #Afro #afroculture #afrodances #socialdances #афро #сальса #сальсавмоскве #salsa #galladance #cuba #afrocuba #doncelifestyle #dancerofinstagram #instagramfordancers #instadance #afrocubano #salsatime #salsacommunity #dancelove #cubanstyle #salsadancing #rumba', 324, 13),
(10, '2428224723401529858', 1, 1603687071, 'https://www.instagram.com/p/CGyyYVJK1oC', 'video', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/122592447_121596279513751_8791083981615793947_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=107&_nc_ohc=b8YPCiH5xmwAX8cfsYc&tp=1&oh=264d28343524c091775fc9aaac138c6b&oe=5FBB72C0', 'https://scontent-arn2-1.cdninstagram.com/v/t50.2886-16/122898858_354736962417474_6975570108661005480_n.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6InZ0c192b2RfdXJsZ2VuLjcyMC5mZWVkLmRlZmF1bHQiLCJxZV9ncm91cHMiOiJbXCJpZ193ZWJfZGVsaXZlcnlfdnRzX290ZlwiXSJ9&_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=106&_nc_ohc=hvF2HI1J0u0AX__pxgJ&vs=17926445557445728_4250794346&_nc_vs=HBksFQAYJEdLcEpVd2RDTTZLaW9VSUJBS2g4a2tBT05NNWdia1lMQUFBRhUAAsgBABUAGCRHQmtOVUFja0ducEZYZ1FEQUJNQm12b1pnaHhSYmtZTEFBQUYVAgLIAQAoABgAGwGIB3VzZV9vaWwBMBUAACbAkuy3uoDYPxUCKAJDMywXQEeVP3ztkWgYEmRhc2hfYmFzZWxpbmVfMV92MREAdeoHAA%3D%3D&_nc_rid=792f7d3355&oe=5FBAE554&oh=78bf7b35b9ec92e7bd67d2a3124b26ea', 'THE MOSCOW CITY', 'Шёл третий час чаепития с @yasmanysotollanes ... Кубинская Rumba Columbia \n#papicasadancer\n.\n.\n#dance #worldofdance #dancelife #танцы #социальныетанцы #тывтанцах #танцывмоскве #Afro #afroculture #afrodances #socialdances #афро #сальса #сальсавмоскве #salsa #galladance #cuba #juzz #doncelifestyle #lindyhop #instagramfordancers #instadance #dancetime #salsatime #salsacommunity #dancelove #cubanstyle #salsadancing #bam', 164, 6),
(11, '2417371512297158160', 2, 1602393162, 'https://www.instagram.com/p/CGMOpUonvYQ', 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/121067288_3263046603749716_9216270253709857168_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=104&_nc_ohc=xvCQixr-42oAX-51VDo&tp=1&oh=65437892beb3261c73decb78939a7f46&oe=5FE1E985', '', '', '10 октября 2020 года, после тяжёлой болезни, на 39 году, ушёл из жизни Генеральный директор ООО \"ИТ Ассистент Сибирь\", Исполнительный директор Федерации танцевального спорта Новосибирской области, Председатель Регистрационно - Счетной Комиссии ФТСАРР категории WDSF Мульцын Константин Александрович. \nТалантливый, руководитель, выдающийся организатор, профессионал своего дела.\nНевыносимо тяжёлая, невосполнимая потеря.\n\nВсероссийская федерация танцевального спорта и акробатического рок-н-ролла, танцевальная общественность России, Федерация танцевального спорта Новосибирской области выражают искренние соболезнования родным и близким, коллегам, друзьям Константина Александровича. \n\nСветлая память! \n\nУважаемые Коллеги! Информация о возможности прощания будет доведена позже. Для поддержки семьи в это сложное время, номер карты Сбербанка 4276  4400 1397 2002,  супруги Константина Александровича  Александры Юрьевны.\n\nСкорбим....', 42, 20),
(12, '2401530296749942543', 2, 1600504748, 'https://www.instagram.com/p/CFT8xS_HmcP', 'video', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/119685127_106149521243691_6133350174857716978_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=103&_nc_ohc=kjyV8kgJTv0AX-BIGGI&tp=1&oh=f69c4fc80d46822e622834376552d953&oe=5FBB6E33', 'https://scontent-arn2-1.cdninstagram.com/v/t50.2886-16/119626755_116886946671550_5007054762657646296_n.mp4?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=110&_nc_ohc=iQgyunP16UMAX-aw6Br&oe=5FBB70F0&oh=26f2dc1018cc309a8f41e147c0fed297', '', '#мдссказань2020', 73, 0),
(13, '2374793405808282021', 2, 1597317456, 'https://www.instagram.com/p/CD09gU4JIml', 'image', 'https://scontent-arn2-2.cdninstagram.com/v/t51.2885-15/e35/117592503_1194710880864728_697940321022505509_n.jpg?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=108&_nc_ohc=EEfi0iGksEwAX-byrsi&tp=1&oh=e4f14d726d426111ca801cb84cfa277b&oe=5FE0E767', '', 'Танцевальный центр \"Атмосфера\"', 'Запустили канал Skating System 6 в YouTube. Будем выкладывать видео-инструкции, описания новых фишек программы и прочий интересный контент.\nПервый видос уже лежит - описание продвинутого режима экспорта/импорта регистрации в Excel. Благодаря этому режиму можно, в том числе, проводить преобразования регистрации силами Excel (кто умеет в VBA) или совместимыми с Excel способами, а также вести регистраци в режиме оффлайн силами организатора при необходимости. Этот функционал уже доступен в сегодняшнем обновлении Skating System 6.\n\nСсылка в описании профиля\nПодписываемся, ставим лайки. \n\nТакже не забываем, что идет второй этап летних скидок, можно успеть приобрести любой пакет лицензий со скидкой 30% (или даже больше, если есть бонусы за онлайн или неиспользованные месяцы Skating System 5).\n#software #dancesport #wdsf #competition #wdc #breaking', 25, 0),
(14, '2317881092484652519', 2, 1590532980, 'https://www.instagram.com/p/CAqxJKtJF3n', 'sidecar', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/101066876_528427554709455_5130057594285768782_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=103&_nc_ohc=YDsrR6I3T-IAX8CaUF8&tp=1&oh=8ecbf201b2cca3880a1c6f9bf25b7a6f&oe=5FE3D20C', '', '', 'Сходили в музей на прогулке. Плюсы самоизоляции. Картины прямо на домах #картины #музей', 54, 1),
(15, '2279279586961530739', 2, 1585931321, 'https://www.instagram.com/p/B-hoLVMpB9z', 'image', 'https://scontent-arn2-2.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/91492318_121069179517176_6838104415297997093_n.jpg?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=100&_nc_ohc=9Zl0jZK6OU8AX89jDdx&tp=1&oh=0a4e5c447ed1b7d60e338a81c12480a5&oe=5FE367C9', '', '', '#skatingsystem #dancesport #scruteneer #software #breaking\nУважаемые друзья!!! Открыт отдельный аккаунт для программы Skating System и других рабочих  моих проектов @skatingsystem. Вся информация о программе, вопросы ответы, анонсы будут теперь там. Подписывайтесь кому интересно. В данный момент опубликован анонс демо-версии программы. В ближайшее время будут анонсы результатов работы в режиме самоизоляции. Готовимся к новому сезону.', 29, 0),
(16, '2256585357768641191', 2, 1583225959, 'https://www.instagram.com/p/B9RAG1PJcqn', 'image', 'https://scontent-arn2-2.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/88244787_621305978691576_3482566476058296275_n.jpg?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=100&_nc_ohc=oZpKPegFfy8AX-iIQEG&tp=1&oh=38daa71611a3c9988d0c5fd048b7864b&oe=5FE2B8F2', '', '', 'Дорогая, любимая  @oksana_krivoshchekova  поздравляем тебя с днем рождения.  Здоровья, счастья, реализации всех творческих планов.  Оставайся всегда такой же энергичной и жизнерадостной.', 61, 6),
(17, '2251873011707590666', 2, 1582664203, 'https://www.instagram.com/p/B9AQpK-HrgK', 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/87301729_185342386083652_1981990694704052955_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=104&_nc_ohc=FooW207PR1sAX-_GQ8w&tp=1&oh=e10b7fcfb20d1b55886b4a72ae865418&oe=5FE306C7', '', '', '@polina_krivoshchekova. Полина, поздравляю Тебя с днем рождения. Не верится что тебе уже 16 лет. Время летит вперед. Будь счастлива, успешна во всем. Я тебя люблю. Привет из Сибири.', 78, 9),
(18, '2249934766576818569', 2, 1582433146, 'https://www.instagram.com/p/B85X7_hnNmJ', 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/84473823_211242876726786_2194658568147808183_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=106&_nc_ohc=X2W7bqJ-4F8AX8QTamn&tp=1&oh=48f3046c9e824416298b4b7e38a1d168&oe=5FE0F035', '', '', 'Праздничная вечеринка в Новосибирске на родине дома. Бодро и музыка хорошая :) @fdsarr_breaking_official #др45лет', 49, 5),
(19, '2117647562522440740', 2, 1566663283, 'https://www.instagram.com/p/B1jZT0DnzQk', 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/68980731_169924317500371_1605579319052711787_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=107&_nc_ohc=enPToOtJYr0AX_jwhz_&tp=1&oh=6b696f621692ab2b95240cf5dffaeed2&oe=5FE3FF21', '', 'Олимп Парк-отель', '', 93, 3),
(20, '2075931646541850767', 2, 1561690358, 'https://www.instagram.com/p/BzPMNVyHmiP', 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/64868578_2132747306834560_7247322139204142911_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=104&_nc_ohc=lqdfqW8uZDEAX9yJhWZ&tp=1&oh=8ee828d25220aaf3a4fa674dc3d70247&oe=5FE409D4', '', 'Олимпийский Парк   Olympic Park', '#breaking #sochi', 68, 0),
(21, '2446541444305702568', 3, 1605870489, 'https://www.instagram.com/p/CHz3Hs0HM6o', 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/126886674_127962808856877_1930561688511551270_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=109&_nc_ohc=VnsIc6vz9nwAX-BDx9q&tp=1&oh=9a960f15ccfcaf3472fa30cba76d0c0c&oe=5FE2C01E', '', '', 'Ваш комментарий?\nPost your comment 👇🏻 \n#запаркетье Матрёшки уже на MARMELFOTO.RU \n#Бальныетанцы #ballroom #dancesport #marmelfoto  #кубокрусскогостандарта #матрёшкаstyle #матрёшка2020 #беззрителей', 1433, 33),
(22, '2446504982507960607', 3, 1605866142, 'https://www.instagram.com/p/CHzu1HHnDkf', 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/125893758_380392246508410_797186965280607580_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=110&_nc_ohc=HAPCa5RYUooAX8WFwmR&tp=1&oh=f6beaf2546ecf38ef82f3a1f4d8c4c68&oe=5FE35D47', '', '', '#запаркетье Матрёшки уже на MARMELFOTO.RU #Бальныетанцы #ballroom #dancesport #marmelfoto  #кубокрусскогостандарта #матрёшкаstyle #матрёшка2020 #беззрителей', 891, 1),
(23, '2446418292678499602', 3, 1605855808, 'https://www.instagram.com/p/CHzbHm7Hp0S', 'sidecar', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/126332028_289387302406535_868506353758835710_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=111&_nc_ohc=l-EyTJeF5qIAX8yzMVS&tp=1&oh=9f9985a0c46bf656effbb5fcadf5b93e&oe=5FE3CEAD', '', '', '‼️поиск новых партнёров ‼️\n\n📍Санкт-Петербург!!!\n🤩 Ребята в поиске новых партнёров для плодотворной работы и достижения высоких результатов! 😎🔥\n\n🕺🏻Самарин Марк, 2010 г.р.\n📏Рост 149 см\n✅ С класс с очками на В\n📞 +79160233574 Александр\n@amurchalkinua\n@samarin_osmanova\n\n💃🏻 Османова Ясмина, 2009 г.р.\n📏 Рост 147 см\n✅ С класс с очками на В\n📞 +79160233574 Александр\n@elmiraisyanova @samarin_osmanova', 607, 3),
(24, '2445864845474446175', 3, 1605789832, 'https://www.instagram.com/p/CHxdR5DHrtf', 'image', 'https://scontent-arn2-2.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/125949997_1020358955142437_3828308329308156374_n.jpg?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=105&_nc_ohc=OGwuGJKqNqcAX93qXz1&tp=1&oh=8c9d577bbb6c052eddcbbcf2592a74db&oe=5FE189FA', '', '', 'Прекрасные совпадения пасо\nWonderful Pasodoble coincidences\n#Бальныетанцы #ballroom #dancesport #marmelfoto  #кубокрусскогостандарта #матрёшкаstyle #матрёшка2020 #беззрителей', 2586, 32),
(25, '2445816511581867353', 3, 1605784070, 'https://www.instagram.com/p/CHxSSimn01Z', 'image', 'https://scontent-arn2-2.cdninstagram.com/v/t51.2885-15/e35/126175682_752289268832616_8077736516443074009_n.jpg?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=100&_nc_ohc=ukL7hn5pyEcAX9JrFwn&tp=1&oh=a279fdeaaec1f2a780b0d02f715bb6bd&oe=5FE11C96', '', '', 'Смотрите и не говорите, что не видели 🤗\nЯ снимаю по предзаказу, не путайте с предоплатой, её нет,\nНо есть договорённость, что я снимаю выбранную пару побольше, а вы должны выбрать не менее определённого количества фото (стоимость одного фото и минимальное количество варьируется от турнира к турниру).\nЕсли Вы намерены приобретать фото с турнира-пишите сейчас!\n#Бальныетанцы #ballroom #dancesport #marmelfoto', 208, 0),
(26, '2445810935145460714', 3, 1605783405, 'https://www.instagram.com/p/CHxRBZJHHPq', 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/p1080x1080/126030801_660927767921210_2102382232457933613_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=102&_nc_ohc=UBniGG8fOXkAX-aF0-_&tp=1&oh=8ab011d14be6cad83e320b0a3dccb050&oe=5FE2B2CD', '', '', 'Ух, какая!\nWow!\n#Бальныетанцы #ballroom #dancesport #marmelfoto  #кубокрусскогостандарта #матрёшкаstyle #матрёшка2020 #беззрителей', 1399, 14),
(27, '2445794737724994882', 3, 1605781482, 'https://www.instagram.com/p/CHxNVsHnjVC', 'video', 'https://scontent-arn2-2.cdninstagram.com/v/t51.2885-15/e35/125932508_1085098771935017_6374744429825309143_n.jpg?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=105&_nc_ohc=rtuEHeIwtUUAX_T0-8R&tp=1&oh=afc0f7602ac2e66e3db5bb4bcc9dbecf&oe=5FBB2635', 'https://scontent-arn2-1.cdninstagram.com/v/t50.2886-16/125857799_733812220567675_6365891209076220167_n.mp4?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=107&_nc_ohc=HWT4na8yqUQAX8ruS6o&oe=5FBB4EB6&oh=e67320f5a2e9bd11fd93d13f94df952c', '', '🌟Новинка в школе @alladanceschool\n🌟Онлайн-интенсив «21-22 ноября» \n🌟Тренеры: \n🔝Алла Аксенова @akolobova\n🔝Александр Сладков @alexandersladkov \n🔝Вера Бондарева @vera_bond \n🔝Мария Тзапташвилли @mariatzaptashvili \n🔝Станислав Бекмаметов @bekmametovstanislav \n\n🔻В программе: 6 групповых занятий\n🔻21 ноября 3 урока латины\n🔻12:00, 13:30, 15:00\n🔻22 ноября 3 урока стандарта \n🔻12:00, 13:30, 15:00\n\n🔻Задача этого онлайн интенсива получить практические знания:\n🔻по принципам движения в стандарте и в латине через технику и биомеханику \n🔻выучить и разобрать разные танцевальные связки \n🔻попробовать комплексы авторских упражнений от наших тренеров для развития вашего тела или тела ваших учеников. \n🔻этот интенсив подойдет как для танцоров разных возрастов и уровней так и для тренеров\n🔻по окончанию выдаём электронный сертификат\n🔻доступ к записи всего интенсива в течении 7 дней\n\n🌟Для подробной информации и регистрации на онлайн интенсив переходите по ссылке в шапке профиля @alladanceschool\n\n🌟Также вы можете зарегистрироваться на сайте https://alladanceschool.online в разделе «онлайн интенсивы»', 139, 1),
(28, '2445732131773491345', 3, 1605774011, 'https://www.instagram.com/p/CHw_GpyHiiR', 'sidecar', 'https://scontent-arn2-2.cdninstagram.com/v/t51.2885-15/e35/p1080x1080/125943117_211969813607261_5217479924810071489_n.jpg?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=105&_nc_ohc=ciD1x5abUz8AX9FsgST&tp=1&oh=93f9936cf121ecbbf8d191e85e484885&oe=5FE0B01F', '', '', '‼️поиск партнёра‼️\nОвчинникова Вера\n2009 \n151 см\nЕ класс\n«Бок о бок» Москва \nСт.м. Крымская, Академическая\nИщем партнёра. \n8(916)717-83-58 Надежда (мама)\n8(915)242-81-38 Мария (тренер)\nДирект @nadyarubtsova73', 438, 0),
(29, '2445650358372851542', 3, 1605764263, 'https://www.instagram.com/p/CHwsgsXnt9W', 'image', 'https://scontent-arn2-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/125554493_3398682333561037_3709013494865602064_n.jpg?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=101&_nc_ohc=Yi7oIAxyCqUAX9_l7NJ&tp=1&oh=849eba023300afbce3d362a2a879b110&oe=5FE32BCD', '', '', 'Глаз не отвести 👀 \nCan’t take eyes off 👀 \n#Бальныетанцы #ballroom #dancesport #marmelfoto  #кубокрусскогостандарта #матрёшкаstyle #матрёшка2020 #беззрителей', 1255, 4),
(30, '2445326446099228264', 3, 1605725660, 'https://www.instagram.com/p/CHvi3JjnOZo', 'video', 'https://scontent-arn2-2.cdninstagram.com/v/t51.2885-15/e35/125893756_132675071619800_620827139492614633_n.jpg?_nc_ht=scontent-arn2-2.cdninstagram.com&_nc_cat=108&_nc_ohc=ZbzDTz1y08wAX8-jZFB&tp=1&oh=dcbdd10ea12495744b42070b8db9950d&oe=5FBB4221', 'https://scontent-arn2-1.cdninstagram.com/v/t50.2886-16/126066374_199230821853513_5123338990471707801_n.mp4?_nc_ht=scontent-arn2-1.cdninstagram.com&_nc_cat=109&_nc_ohc=yzbp8N-DevAAX_5JYyl&oe=5FBB57F1&oh=7a4c37565a75008b4bb537a696f1c642', '', '‼️Поиск партнера‼️\nПотерина Станислава\nМосква\nНа 10 ку\nРост 160\nСильный D класс\n8 906 702 27 07 родитель', 305, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `auth_key` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `status` smallint NOT NULL DEFAULT '10',
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `verification_token` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`) VALUES
(1, 'admin', 'dLmM7DihSWxW9pNxb94WGgLn0B41f_Vd', '$2y$13$BuR1OnqJ5eNcuTjCrV634OQRI.p892M2ygILycwuDG.J.4pIA.Uhi', NULL, 'mit@krivoshchekov.ru', 10, 1605869901, 1605869901, 'vGFVfQUc7bhl6FR6ZlAbdGzysWv6X7aN_1605869901');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `carusel`
--
ALTER TABLE `carusel`
  ADD PRIMARY KEY (`postId`),
  ADD UNIQUE KEY `instagramKey` (`instagramId`);

--
-- Индексы таблицы `instagram`
--
ALTER TABLE `instagram`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `instaKey` (`instagramId`) USING BTREE;

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postId`),
  ADD UNIQUE KEY `instagramKey` (`instagramId`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `carusel`
--
ALTER TABLE `carusel`
  MODIFY `postId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `instagram`
--
ALTER TABLE `instagram`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `postId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
