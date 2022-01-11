-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 11 jan. 2022 à 15:26
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projetm1`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`) VALUES
(1, 'Action'),
(2, 'Fantastique'),
(3, 'Humour'),
(4, 'Horreur'),
(5, 'Amour');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_film` int(11) DEFAULT NULL,
  `id_serie` int(11) DEFAULT NULL,
  `commentaire` text NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `id_film`, `id_serie`, `commentaire`, `id_user`) VALUES
(1, 1, NULL, 'LE film est plus bien.', 2),
(2, NULL, 2, 'SUPER Série', 2);

-- --------------------------------------------------------

--
-- Structure de la table `episode`
--

DROP TABLE IF EXISTS `episode`;
CREATE TABLE IF NOT EXISTS `episode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_serie` int(11) NOT NULL COMMENT 'id de la série',
  `nom` varchar(255) NOT NULL,
  `lien_video` text NOT NULL,
  `lien_image` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `episode`
--

INSERT INTO `episode` (`id`, `id_serie`, `nom`, `lien_video`, `lien_image`) VALUES
(1, 2, 'Episode 1', '', ''),
(2, 2, 'Episode 2', '', ''),
(3, 2, 'Episode 3', '', ''),
(4, 2, 'Episode 4', '', ''),
(5, 2, 'Episode 5', '', ''),
(6, 2, 'Episode 6', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `lien_video` varchar(255) NOT NULL,
  `categorie` int(11) NOT NULL COMMENT 'cle etrangere de id dans la table catégorie',
  `resume` text NOT NULL,
  `lien` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id`, `titre`, `lien_video`, `categorie`, `resume`, `lien`) VALUES
(1, 'star wars', 'pasdelienpourlinstant', 2, 'petitresumersansespace', NULL),
(2, 'Dune', 'pas encore', 2, 'Paul Atreides, un jeune homme brillant et doué au destin plus grand que lui-même, doit se rendre sur la planète la plus dangereuse de l\'univers afin d\'assurer l\'avenir de sa famille et de son peuple.', NULL),
(3, 'Nos jours heureux', 'pas encore', 3, 'Vincent Rousseau dirige pour la première fois une colonie de vacances et se retrouve plongé pendant trois semaines dans l\'univers des colos avec petites histoires et gros soucis à la clef ! Dès le départ en train, les enfants sont ingérables : l\'une a perdu sa valise, l\'autre assomme tout le monde de questions.', NULL),
(4, 'Titanic', 'pas encore', 5, 'En 1997, l\'épave du Titanic est l\'objet d\'une exploration fiévreuse, menée par des chercheurs de trésor en quête d\'un diamant bleu qui se trouvait à bord. Frappée par un reportage télévisé, l\'une des rescapées du naufrage, âgée de 102 ans, Rose DeWitt, se rend sur place et évoque ses souvenirs. 1912.', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL COMMENT 'id du user',
  `nombre_place` int(11) NOT NULL,
  `id_seance` int(11) NOT NULL COMMENT 'id du séance',
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_film` (`id_seance`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id`, `id_user`, `nombre_place`, `id_seance`) VALUES
(1, 2, 1, 1),
(2, 3, 2, 1),
(3, 2, 3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

DROP TABLE IF EXISTS `seance`;
CREATE TABLE IF NOT EXISTS `seance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `titre` varchar(255) NOT NULL,
  `id_film` int(11) NOT NULL COMMENT 'id du film',
  PRIMARY KEY (`id`),
  KEY `id_film` (`id_film`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`id`, `date`, `titre`, `id_film`) VALUES
(1, '0000-00-00', 'star wars', 1),
(2, '2022-10-22', 'star was', 1),
(3, '2022-10-26', 'star was', 1),
(4, '2022-08-31', 'titanic', 4);

-- --------------------------------------------------------

--
-- Structure de la table `serie`
--

DROP TABLE IF EXISTS `serie`;
CREATE TABLE IF NOT EXISTS `serie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `lien_video` varchar(255) NOT NULL,
  `categorie` int(11) NOT NULL,
  `resume` text NOT NULL,
  `lien_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `serie`
--

INSERT INTO `serie` (`id`, `titre`, `lien_video`, `categorie`, `resume`, `lien_image`) VALUES
(1, 'star wars mais la série', 'pasdelienpourlinstant', 2, 'petitresumer avec espace', NULL),
(2, 'Stranger Things', 'pas encore', 2, 'En 1983, à Hawkins dans l\'Indiana, Will Byers disparaît de son domicile. Ses amis se lancent alors dans une recherche semée d\'embûches pour le retrouver. Pendant leur quête de réponses, les garçons rencontrent une étrange jeune fille en fuite.\r\n', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `login`, `mot_de_passe`, `admin`) VALUES
(1, 'Marc', 'm', 1),
(2, 'Marc2', 'm2', 0),
(3, 'julien', 'julien', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
