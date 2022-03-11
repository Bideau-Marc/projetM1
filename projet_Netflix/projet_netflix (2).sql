-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 11 mars 2022 à 10:56
-- Version du serveur :  10.4.18-MariaDB
-- Version de PHP : 8.0.3

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
(1, 2, 'Episode 1', '', '', 1),
(2, 2, 'Episode 2', '', '', 1),
(3, 2, 'Episode 3', '', '', 1),
(4, 2, 'Episode 4', '', '', 1),
(5, 2, 'Episode 5', '', '', 1),
(6, 2, 'Episode 6', '', '', 1);

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
(1, 'pokedzjnscfvc', 'liee', 1, 'raise', 'liencreergracealapi'),
(2, 'Dune', 'pas encore', 2, '', NULL),
(3, 'Nos jours heureux', 'pas encore', 3, '', NULL),
(4, 'Titanic', 'pas encore', 5, '', ''),
(8, 'nouveaufilmcreergracealapi', 'lienvidcreergracealapi', 2, '2', 'liencreergracealapi');

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
(1, '0000-00-00', 'star wars', 1, NULL),
(2, '2022-10-22', 'star was', 1, NULL),
(3, '2022-10-26', 'star was', 1, NULL),
(4, '2022-08-31', 'titanic', 4, NULL),
(5, '0000-00-00', 'ALF', NULL, 1);

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
  `lien_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `serie`
--

INSERT INTO `serie` (`id`, `titre`, `lien_video`, `categorie`, `resume`, `lien_image`) VALUES
(1, 'star wars mais la serie', 'pasdelienpourlinstant', 2, 'petitresumer avec espace', NULL),
(2, 'Stranger Things', 'pas encore', 2, 'En 1983 a Haile Ses amis ', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `favori`
--
ALTER TABLE `favori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
