-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 02 oct. 2026 à 09:30
-- Version du serveur : 11.4.9-MariaDB
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dinoscroll`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_articles_user` (`user_id`),
  KEY `fk_articles_category` (`category_id`),
  KEY `fk_articles_subcategory` (`subcategory_id`)
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `image`, `created`, `updated`, `user_id`, `category_id`, `subcategory_id`) VALUES
(186, 'Les influenceurs français :  entre authenticité et business', 'Petite plongée dans l’univers des créateurs de contenu français, où se mêlent créativité, stratégies marketing et quête d’authenticité.', 'https://i.imgur.com/5E7wQeq.png', '2026-04-16 15:51:55', '2026-04-16 15:51:55', 2, 4, 17),
(154, 'Theobabac, le nouveau roi de l\'humour', 'Theobabac est vraiment trop drôle et ouais le babacshow c\'est cool', 'https://i.imgur.com/ie37Zk7.png', '2026-04-16 13:55:00', '2026-04-16 13:55:00', 2, 3, 13),
(155, 'Le nouveau phénomène', 'La skibidi tentafruit dérivé de l\'île de la tentation fait fureur sur tiktok', 'https://i.imgur.com/WP2lGkP.png', '2026-04-16 13:58:54', '2026-04-16 13:58:54', 2, 1, 4),
(156, 'TikTok est-il dangereux pour les jeunes ?', 'TikTok est aujourd’hui l’une des plateformes les plus utilisées par les jeunes. Avec ses vidéos courtes et son algorithme très performant, il capte rapidement l’attention et pousse les utilisateurs à passer de plus en plus de temps sur l’application.\r\n\r\nMais cette popularité soulève des questions. Certains experts s’inquiètent de l’impact sur la concentration, notamment à cause du format rapide des contenus. D’autres pointent du doigt une possible dépendance, liée au système de récompense du cerveau, renforcé par les likes et les vues.\r\n\r\nIl y a aussi la question des contenus. Même si TikTok modère une grande partie des vidéos, certains contenus inadaptés peuvent circuler, influençant parfois les comportements ou la perception de soi, en particulier chez les adolescents.\r\n\r\nCependant, TikTok n’est pas uniquement négatif. La plateforme permet aussi de s’exprimer, de découvrir de nouvelles idées et même d’apprendre à travers des contenus éducatifs.\r\n\r\nFinalement, TikTok n’est pas dangereux en soi, mais son usage doit être encadré. Comme beaucoup de réseaux sociaux, tout dépend de la manière dont il est utilisé.', 'https://i.imgur.com/LlZMaq3.png', '2026-04-16 14:39:36', '2026-04-16 14:39:36', 2, 2, 6),
(157, 'TikTok est-il toujours le roi des tendances ?', 'TikTok reste aujourd’hui une référence en matière de tendances. Grâce à son algorithme puissant, les contenus deviennent viraux en quelques heures. Cependant, la concurrence d’autres plateformes pousse à se demander si cette domination va durer.', 'https://i.imgur.com/9KNI0ok.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 1, 1),
(158, 'Instagram influence-t-il encore les tendances ?', 'Instagram a longtemps été au centre des tendances visuelles. Aujourd’hui, avec les Reels, la plateforme tente de rivaliser avec TikTok. Elle conserve une forte influence, notamment auprès des marques et créateurs.', 'https://i.imgur.com/Tr2FofM.jpeg', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 1, 2),
(159, 'Les mèmes sont-ils devenus un langage universel ?', 'Les mèmes sont partout sur internet. Ils permettent de transmettre des idées rapidement avec humour. Leur simplicité les rend accessibles à tous, ce qui en fait un véritable outil de communication moderne.', 'https://i.imgur.com/q0v6GUa.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 1, 3),
(160, 'Les formats viraux évoluent-ils trop vite ?', 'Les formats viraux changent constamment. Ce qui fonctionne aujourd’hui peut disparaître demain. Cette rapidité oblige les créateurs à s’adapter en permanence pour rester visibles.', 'https://i.imgur.com/v349G31.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 1, 4),
(161, 'Les challenges sont-ils encore populaires ?', 'Les challenges continuent d’attirer des millions d’utilisateurs. Ils favorisent l’engagement et la participation, mais peuvent parfois entraîner des comportements risqués.', 'https://i.imgur.com/23gGRj2.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 1, 5),
(162, 'TikTok domine-t-il encore les réseaux sociaux ?', 'TikTok s’impose comme une plateforme majeure grâce à son contenu rapide et addictif. Toutefois, d’autres réseaux tentent de reproduire son modèle pour récupérer une part de son audience.', 'https://i.imgur.com/f4hwPN9.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 2, 6),
(163, 'Instagram est-il en perte de vitesse ?', 'Instagram reste très utilisé, mais certains utilisateurs migrent vers d’autres plateformes. Malgré cela, il conserve une forte présence dans le marketing digital.', 'https://i.imgur.com/5zeg8EO.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 2, 7),
(164, 'YouTube reste-t-il incontournable ?', 'YouTube continue de dominer le contenu vidéo long. Avec les Shorts, il s’adapte aux nouvelles tendances tout en conservant son identité.', 'https://i.imgur.com/dqiMG5Q.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 2, 8),
(165, 'Les nouveautés changent-elles vraiment les usages ?', 'Les plateformes proposent régulièrement de nouvelles fonctionnalités. Certaines transforment réellement les usages, tandis que d’autres passent inaperçues.', 'https://i.imgur.com/MVhimBr.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 2, 9),
(166, 'Les algorithmes contrôlent-ils tout ?', 'Les algorithmes jouent un rôle central dans la visibilité des contenus. Ils influencent fortement ce que les utilisateurs voient chaque jour.', 'https://i.imgur.com/0W9JJF1.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 2, 10),
(167, 'Les créateurs influencent-ils vraiment leur audience ?', 'Les créateurs ont un impact important sur leur communauté. Leur authenticité et leur proximité renforcent cette influence au quotidien.', 'https://i.imgur.com/5nBDfa9.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 3, 11),
(168, 'Les stratégies de contenu sont-elles essentielles ?', 'Publier du contenu sans stratégie limite la visibilité. Une approche réfléchie permet d’optimiser l’engagement et la croissance.', 'https://i.imgur.com/9eZnI0i.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 3, 12),
(169, 'Les nouveaux talents peuvent-ils émerger facilement ?', 'Les réseaux sociaux offrent des opportunités aux nouveaux créateurs. Cependant, la concurrence rend la visibilité plus difficile.', 'https://i.imgur.com/iGbRuwV.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 3, 13),
(170, 'Les interviews apportent-elles de la valeur ?', 'Les interviews permettent de découvrir les coulisses du métier de créateur. Elles apportent une dimension humaine et inspirante.', 'https://i.imgur.com/hjlMMEV.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 3, 14),
(171, 'Peut-on vraiment vivre des réseaux sociaux ?', 'De nombreux créateurs gagnent leur vie grâce aux réseaux sociaux. Cependant, cela demande du temps, de la régularité et une stratégie claire.', 'https://i.imgur.com/nrX7Dwr.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 4, 15),
(172, 'Les marques misent-elles sur les influenceurs ?', 'Les marques collaborent de plus en plus avec les influenceurs. Cette stratégie permet de toucher une audience ciblée.', 'https://i.imgur.com/OdYqEeS.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 4, 16),
(173, 'Le marketing d’influence est-il efficace ?', 'Le marketing d’influence peut être très performant lorsqu’il est bien utilisé. Il repose sur la confiance entre créateurs et audience.', 'https://i.imgur.com/nwzPS2O.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 4, 17),
(174, 'Les études de cas sont-elles utiles ?', 'Analyser des campagnes permet de comprendre ce qui fonctionne. Les études de cas sont donc essentielles pour progresser.', 'https://i.imgur.com/OkkztC8.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 4, 18),
(175, 'Les fake news sont-elles incontrôlables ?', 'Les fake news se propagent rapidement sur les réseaux sociaux. Malgré les efforts de modération, il reste difficile de les stopper totalement.', 'https://i.imgur.com/Iwk1EmP.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 5, 19),
(176, 'La manipulation est-elle fréquente en ligne ?', 'Certains contenus cherchent à influencer les opinions. Comprendre ces mécanismes est essentiel pour garder un esprit critique.', 'https://i.imgur.com/WLbZ2bw.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 5, 20),
(177, 'Le dropshipping est-il risqué ?', 'Le dropshipping attire de nombreux entrepreneurs. Cependant, il comporte des risques liés à la qualité des produits et à la réputation.', 'https://i.imgur.com/rTkQOqK.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 5, 21),
(178, 'L’influence cachée pose-t-elle problème ?', 'Certains contenus sponsorisés ne sont pas clairement identifiés. Cela peut tromper les utilisateurs et poser des questions éthiques.', 'https://i.imgur.com/q0v6GUa.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 5, 22),
(179, 'Les réseaux influencent-ils la société ?', 'Les réseaux sociaux jouent un rôle majeur dans la diffusion des idées. Ils impactent les comportements et les opinions.', 'https://i.imgur.com/TG0QuLX.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 6, 23),
(180, 'Les réseaux affectent-ils la psychologie ?', 'L’utilisation excessive des réseaux peut avoir des effets sur le bien-être mental. Il est important de trouver un équilibre.', 'https://i.imgur.com/zbCHngX.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 6, 24),
(181, 'Les jeunes sont-ils trop exposés ?', 'Les jeunes passent beaucoup de temps en ligne. Cette exposition peut influencer leur développement et leur perception du monde.', 'https://i.imgur.com/BAhkgKV.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 6, 25),
(182, 'La culture internet évolue-t-elle rapidement ?', 'La culture internet change constamment. De nouveaux codes apparaissent régulièrement, influençant les comportements en ligne.', 'https://i.imgur.com/e1tVsjf.png', '2026-04-16 15:15:24', '2026-04-16 15:15:24', 1, 6, 26),
(187, 'Anyme : le nouveau streamer nouvelle génération', 'Depuis quelques années, le monde du streaming connaît une évolution rapide, portée par l’émergence de nouveaux créateurs qui cassent les codes traditionnels. Parmi eux, un nom commence à se démarquer : Anyme. Encore peu connu du grand public il y a peu, ce streamer incarne aujourd’hui une nouvelle génération de créateurs de contenu, plus proches de leur communauté et en phase avec les tendances actuelles.\r\n\r\nCe qui distingue Anyme des autres streamers, c’est avant tout son approche. Là où certains misent sur des productions très cadrées, il privilégie l’authenticité. Ses lives sont spontanés, interactifs et souvent imprévisibles. Il échange directement avec son chat, réagit en temps réel et n’hésite pas à adapter son contenu selon les retours de sa communauté. Cette proximité crée un lien fort avec son audience, qui se sent impliquée et écoutée.\r\n\r\nAutre élément clé de son succès : sa capacité à s’adapter aux tendances. Anyme navigue entre plusieurs formats, mêlant gaming, discussions, réactions et parfois même du contenu inspiré de TikTok. Cette diversité lui permet de toucher un public plus large et de rester constamment dans l’air du temps. Il comprend parfaitement les codes des plateformes actuelles et sait comment capter l’attention dans un environnement où la concurrence est de plus en plus forte.\r\n\r\nMais cette nouvelle génération de streamers ne se limite pas à produire du contenu. Elle incarne aussi une nouvelle manière de consommer les médias. Les spectateurs ne sont plus de simples viewers passifs : ils participent, commentent, influencent le contenu. Anyme l’a bien compris et intègre pleinement cette dimension dans ses lives, transformant chaque stream en véritable expérience collective.\r\n\r\nCependant, ce modèle comporte aussi ses défis. Être constamment connecté, produire du contenu régulièrement et maintenir une relation étroite avec sa communauté peut être exigeant. La pression de la performance et de la visibilité est omniprésente, surtout dans un univers où tout évolue très vite. Anyme, comme d’autres créateurs, doit trouver un équilibre entre créativité, régularité et bien-être personnel.\r\n\r\nMalgré cela, son ascension montre que les codes du streaming sont en train de changer. L’époque des contenus formatés laisse progressivement place à plus de spontanéité et d’authenticité. Les créateurs comme Anyme ne cherchent plus seulement à divertir, mais à créer une véritable connexion avec leur audience.\r\n\r\nEn conclusion, Anyme représente bien plus qu’un simple streamer. Il incarne une nouvelle génération de créateurs, capable de s’adapter, d’innover et de redéfinir les règles du streaming. Si cette tendance se confirme, il est probable que ce type de profil devienne la norme dans les années à venir.', 'https://i.imgur.com/B71J7XK.png', '2026-04-16 15:53:05', '2026-04-16 15:53:05', 2, 3, 13),
(184, 'Le nouveau restaurant Burgouzz', 'Aujourd\'hui on va goûter le restaurant de Walouzz appelé Burgouzz.', 'https://i.imgur.com/N5Rqg7Y.png', '2026-04-16 15:48:38', '2026-04-16 15:48:38', 2, 3, 12),
(185, 'L’esprit Kaizen d’Inoxtag : progresser un peu chaque jour', 'Dans l’univers des créateurs de contenu, certains se démarquent non seulement par leur popularité, mais aussi par les valeurs qu’ils véhiculent. C’est le cas d’Inoxtag, qui a su imposer une philosophie particulière à travers ses projets : l’esprit Kaizen. Inspiré d’un concept japonais signifiant “amélioration continue”, ce principe repose sur une idée simple mais puissante : progresser un peu chaque jour, sans chercher la perfection immédiate.\r\n\r\nAu fil du temps, Inoxtag a montré qu’il ne se contentait pas de produire du contenu divertissant. Il s’inscrit dans une démarche de progression constante, que ce soit dans ses vidéos, ses défis ou ses projets personnels. Que ce soit à travers des aventures physiques, des challenges ambitieux ou des expériences hors de sa zone de confort, il met en avant l’importance de l’effort et de la persévérance.\r\n\r\nCe qui rend cette approche particulièrement intéressante, c’est son accessibilité. L’esprit Kaizen ne nécessite pas de transformation radicale ou de changement brutal. Au contraire, il encourage des petits pas réguliers, qui, accumulés sur la durée, mènent à de véritables résultats. En partageant cette vision avec sa communauté, Inoxtag inspire de nombreux jeunes à adopter une approche plus progressive et moins décourageante face à leurs objectifs.\r\n\r\nDans un monde où tout va très vite, où les résultats immédiats sont souvent valorisés, cette philosophie apporte un contraste intéressant. Elle rappelle que la réussite ne se construit pas en un jour, mais à travers une série d’efforts constants. Ce message trouve un écho particulier auprès d’une génération confrontée à la pression des réseaux sociaux et à la comparaison permanente.\r\n\r\nCependant, cette image de progression continue peut aussi être perçue comme exigeante. Montrer constamment des défis et des réussites peut créer une forme de pression, aussi bien pour le créateur que pour son audience. Il est donc essentiel de rappeler que le Kaizen repose avant tout sur l’équilibre et l’adaptation à son propre rythme.\r\n\r\nL’impact d’Inoxtag dépasse ainsi le simple divertissement. Il contribue à diffuser une mentalité tournée vers l’amélioration personnelle, tout en restant accessible et motivante. Son contenu devient alors un mélange entre inspiration, dépassement de soi et partage d’expérience.\r\n\r\nEn conclusion, l’esprit Kaizen d’Inoxtag incarne une nouvelle manière de voir la progression sur les réseaux sociaux. Plutôt que de chercher la performance immédiate, il valorise l’effort régulier et l’évolution sur le long terme. Une approche qui, au-delà du contenu, peut réellement influencer la manière dont chacun aborde ses propres objectifs.', 'https://i.imgur.com/tKwOaP3.png', '2026-04-16 15:50:25', '2026-04-16 15:50:25', 2, 3, 11);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Tendances'),
(2, 'Plateformes'),
(3, 'Créateurs'),
(4, 'Business'),
(5, 'Dérives'),
(6, 'Santé');

-- --------------------------------------------------------

--
-- Structure de la table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE IF NOT EXISTS `subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `category_id`) VALUES
(1, 'Trends TikTok', 1),
(2, 'Trends Instagram', 1),
(3, 'Mèmes', 1),
(4, 'Formats viraux', 1),
(5, 'Challenges', 1),
(6, 'TikTok', 2),
(7, 'Instagram', 2),
(8, 'YouTube', 2),
(9, 'Nouveautés', 2),
(10, 'Algorithmes', 2),
(11, 'Portraits', 3),
(12, 'Stratégies', 3),
(13, 'Nouveaux talents', 3),
(14, 'Interviews', 3),
(15, 'Revenus', 4),
(16, 'Marques d’influenceurs', 4),
(17, 'Influence marketing', 4),
(18, 'Études de cas', 4),
(19, 'Fake news', 5),
(20, 'Manipulation', 5),
(21, 'Dropshipping', 5),
(22, 'Influence cachée', 5),
(23, 'Société', 6),
(24, 'Psychologie', 6),
(25, 'Jeunesse', 6),
(26, 'Culture internet', 6);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `role`, `created`) VALUES
(1, 'Nicolas', 'fca56895aee0fa181d2b5806012c31be6c44ab2d71f8ceb5c904995aa18bd2c2f7dd0ac1c8f34720781f0f1fa527dcae9da81ac5136001307f043482975c73d2', 'user', '2026-04-14 10:46:20'),
(2, 'Alyson', 'fca56895aee0fa181d2b5806012c31be6c44ab2d71f8ceb5c904995aa18bd2c2f7dd0ac1c8f34720781f0f1fa527dcae9da81ac5136001307f043482975c73d2', 'admin', '2026-04-14 11:10:29'),
(4, 'Kalyah', 'fca56895aee0fa181d2b5806012c31be6c44ab2d71f8ceb5c904995aa18bd2c2f7dd0ac1c8f34720781f0f1fa527dcae9da81ac5136001307f043482975c73d2', 'admin', '2026-04-15 10:46:53');

-- --------------------------------------------------------

--
-- Structure de la table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_videos_category` (`category_id`),
  KEY `fk_videos_subcategory` (`subcategory_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `videos`
--

INSERT INTO `videos` (`id`, `link`, `title`, `caption`, `category_id`, `subcategory_id`) VALUES
(30, 'https://i.imgur.com/kJ3vxHj.mp4', 'Infographie', 'Petites informations!!', 2, 9),
(31, 'https://i.imgur.com/lOoblWn.mp4', 'IA ou Réel', 'A vous de deviner!', 5, 20),
(32, 'https://i.imgur.com/N5kaINQ.mp4', 'Placement de produit', 'Plus de sincérité dans les placements', 4, 17),
(33, 'https://i.imgur.com/QpIMxlz.mp4', 'Avant vs Maintenant', 'Clara nous montre les anciennes versions', 4, 18),
(34, 'https://i.imgur.com/CkoAmZQ.mp4', 'POV : Le Dino', 'Mon papi ne comprends rien à la technologie', 1, 1),
(35, 'https://i.imgur.com/kJ3vxHj.mp4', 'Infographie', 'Petites informations!!', 2, 9),
(36, 'https://i.imgur.com/lOoblWn.mp4', 'IA ou Réel', 'A vous de deviner!', 5, 20),
(37, 'https://i.imgur.com/N5kaINQ.mp4', 'Placement de produit', 'Plus de sincérité dans les placements', 4, 17),
(38, 'https://i.imgur.com/QpIMxlz.mp4', 'Avant vs Maintenant', 'Clara nous montre les anciennes versions', 4, 18),
(39, 'https://i.imgur.com/CkoAmZQ.mp4', 'POV : Le Dino', 'Mon papi ne comprends rien à la technologie', 1, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
