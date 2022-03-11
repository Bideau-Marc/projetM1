-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 11 mars 2022 à 11:23
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_netflix`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `id_film` int(11) DEFAULT NULL,
  `id_serie` int(11) DEFAULT NULL,
  `commentaire` text NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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

CREATE TABLE `episode` (
  `id` int(11) NOT NULL,
  `id_serie` int(11) NOT NULL COMMENT 'id de la série',
  `nom` varchar(255) NOT NULL,
  `lien_video` text NOT NULL,
  `lien_image` text NOT NULL,
  `saison` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `episode`
--

INSERT INTO `episode` (`id`, `id_serie`, `nom`, `lien_video`, `lien_image`, `saison`) VALUES
(1, 2, 'Episode 1', '', '../assets/stranger-things-S01.jpg', 1),
(2, 2, 'Episode 2', '', '../assets/stranger-things-S01.jpg', 1),
(3, 2, 'Episode 3', '', '../assets/stranger-things-S01.jpg', 1),
(4, 2, 'Episode 4', '', '../assets/stranger-things-S01.jpg', 1),
(5, 2, 'Episode 5', '', '../assets/stranger-things-S01.jpg', 1),
(6, 2, 'Episode 6', '', '../assets/stranger-things-S01.jpg', 1),
(7, 2, 'Episode 1', '', '../assets/stranger-things-S02.jpg', 2),
(8, 2, 'Episode 2', '', '../assets/stranger-things-S02.jpg', 2),
(9, 2, 'Episode 3', '', '../assets/stranger-things-S02.jpg', 2),
(10, 2, 'Episode 1', '', '../assets/stranger-things-S03.jpg', 3),
(11, 2, 'Episode 2', '', '../assets/stranger-things-S03.jpg', 3),
(12, 2, 'Episode 3', '', '../assets/stranger-things-S03.jpg', 3),
(13, 2, 'Episode 4', '', '../assets/stranger-things-S03.jpg', 3);

-- --------------------------------------------------------

--
-- Structure de la table `favori`
--

CREATE TABLE `favori` (
  `id` int(11) NOT NULL,
  `id_film` int(11) DEFAULT NULL COMMENT 'id d''un film',
  `idUtilisateur` int(11) NOT NULL COMMENT 'id d''un utilisateur',
  `id_serie` int(11) DEFAULT NULL COMMENT 'id_dune_serie'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `favori`
--

INSERT INTO `favori` (`id`, `id_film`, `idUtilisateur`, `id_serie`) VALUES
(1, 1, 12, 1),
(2, 1, 12, 0),
(3, 1, 12, NULL),
(4, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `lien_video` varchar(255) NOT NULL,
  `categorie` int(11) NOT NULL COMMENT 'cle etrangere de id dans la table catégorie',
  `resume` varchar(255) NOT NULL,
  `lien` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id`, `titre`, `lien_video`, `categorie`, `resume`, `lien`) VALUES
(1, 'Spider-Man : No Way Home\n', 'liee', 1, 'Avec l\'identité de Spiderman désormais révélée, celui-ci est démasqué et n\'est plus en mesure de séparer sa vie normale en tant que Peter Parker des enjeux élevés d\'être un superhéros.', '../assets/spider.jpg'),
(2, 'Dune', 'pas encore', 2, 'Paul Atreides, un jeune homme brillant et doué au destin plus grand que lui-même, doit se rendre sur la planète la plus dangereuse de l\'univers afin d\'assurer l\'avenir de sa famille et de son peuple.', '../assets/duen-affiche.jpg'),
(3, 'Nos jours heureux', 'pas encore', 3, 'Vincent Rousseau dirige pour la première fois une colonie de vacances et se retrouve plongé pendant trois semaines dans l\'univers des colos avec petites histoires et gros soucis à la clef  !', '../assets/heureux.jpg'),
(4, 'Titanic', 'pas encore', 5, 'En 1997, l\'épave du Titanic est l\'objet d\'une exploration fiévreuse, menée par des chercheurs de trésor en quête d\'un diamant bleu qui se trouvait à bord', '../assets/titanic.jpg'),
(8, 'Super-héros malgré lui\n', 'Super-héros malgré lui\n', 3, 'Apprenti acteur en galère, Cédric décroche enfin son premier rôle dans un film de super-héros. Un soir, alors qu\'il emprunte la voiture de tournage, il est victime d\'un accident qui lui fait perdre la mémoire. ', '../assets/super-heros.jpg'),
(9, 'stars wars', '', 2, 'Un an a passé depuis que Kylo Ren a tué Snoke, le Leader suprême et pris sa place. Bien que largement décimée, la Résistance est prête à renaître de ses cendres.', '../assets/stars_wars.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL COMMENT 'id du user',
  `nombre_place_reserve` int(11) NOT NULL,
  `id_seance` int(11) NOT NULL COMMENT 'id du séance'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id`, `id_user`, `nombre_place_reserve`, `id_seance`) VALUES
(1, 2, 1, 1),
(2, 3, 2, 1),
(3, 2, 3, 4),
(5, 1, 7000, 5);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

CREATE TABLE `seance` (
  `id_seance` int(11) NOT NULL,
  `date` date NOT NULL,
  `titre_seance` varchar(255) NOT NULL,
  `id_film` int(11) DEFAULT NULL COMMENT 'id du film',
  `id_serie` int(11) DEFAULT NULL COMMENT 'id d''une serie '
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`id_seance`, `date`, `titre_seance`, `id_film`, `id_serie`) VALUES
(1, '0000-00-00', 'Spider-Man : No Way Home\n', 1, NULL),
(2, '2022-10-22', 'Spider-Man : No Way Home\n', 1, NULL),
(3, '2022-10-26', 'Spider-Man : No Way Home\n', 1, NULL),
(4, '2022-08-31', 'titanic', 4, NULL),
(5, '2022-09-17', 'star wars la serie', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `serie`
--

CREATE TABLE `serie` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `lien_video` varchar(255) NOT NULL,
  `categorie` int(11) NOT NULL,
  `resume` text NOT NULL,
  `lien` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `serie`
--

INSERT INTO `serie` (`id`, `titre`, `lien_video`, `categorie`, `resume`, `lien`) VALUES
(1, 'star wars la serie', 'pasdelienpourlinstant', 2, 'avec espace', '../assets/star_wars_serie.jpg'),
(2, 'Stranger Things', 'pas encore', 2, 'En 1983, à Hawkins dans l\'Indiana, Will Byers disparaît de son domicile. Ses amis se lancent alors dans une recherche semée d\'embûches pour le retrouver.', '../assets/stranger-things-S03.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `login`, `mot_de_passe`, `admin`) VALUES
(1, 'Marc', 'm', 1),
(2, 'Marc2', 'm2', 0),
(3, 'julien', 'julien', 0),
(10, 'm1', 'm1', 0),
(12, 'm2', 'm1', 0),
(15, 'm3', 'm1', 0),
(19, 'm233', 'm1', 1),
(21, 'marcaaaaaaaaaaaaaaaaaaa', 'm', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `episode`
--
ALTER TABLE `episode`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `favori`
--
ALTER TABLE `favori`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_film` (`id_seance`);

--
-- Index pour la table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`id_seance`),
  ADD KEY `id_film` (`id_film`);

--
-- Index pour la table `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `episode`
--
ALTER TABLE `episode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `favori`
--
ALTER TABLE `favori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `seance`
--
ALTER TABLE `seance`
  MODIFY `id_seance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `serie`
--
ALTER TABLE `serie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
