-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 24 juin 2022 à 10:51
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
(18, NULL, 2, 'test stranger', 1),
(17, 1, NULL, 'TEST commentaire spider', 1);

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
(1, 2, 'Episode 1', 'https://www.youtube.com/watch?v=l7nzodXfVsg', '../assets/stranger-things-S01.jpg', 1),
(2, 2, 'Episode 2', 'https://www.youtube.com/watch?v=l7nzodXfVsg', '../assets/stranger-things-S01.jpg', 1),
(3, 2, 'Episode 3', 'https://www.youtube.com/watch?v=l7nzodXfVsg', '../assets/stranger-things-S01.jpg', 1),
(4, 2, 'Episode 4', 'https://www.youtube.com/watch?v=l7nzodXfVsg', '../assets/stranger-things-S01.jpg', 1),
(5, 2, 'Episode 5', 'https://www.youtube.com/watch?v=l7nzodXfVsg', '../assets/stranger-things-S01.jpg', 1),
(6, 2, 'Episode 6', 'https://www.youtube.com/watch?v=l7nzodXfVsg', '../assets/stranger-things-S01.jpg', 1),
(7, 2, 'Episode 1', 'https://www.youtube.com/watch?v=ZoK-GoaukxY', '../assets/stranger-things-S02.jpg', 2),
(8, 2, 'Episode 2', 'https://www.youtube.com/watch?v=ZoK-GoaukxY', '../assets/stranger-things-S02.jpg', 2),
(9, 2, 'Episode 3', 'https://www.youtube.com/watch?v=ZoK-GoaukxY', '../assets/stranger-things-S02.jpg', 2),
(10, 2, 'Episode 1', 'https://www.youtube.com/watch?v=TYIC1XnBBBg', '../assets/stranger-things-S03.jpg', 3),
(11, 2, 'Episode 2', 'https://www.youtube.com/watch?v=TYIC1XnBBBg', '../assets/stranger-things-S03.jpg', 3),
(12, 2, 'Episode 3', 'https://www.youtube.com/watch?v=TYIC1XnBBBg', '../assets/stranger-things-S03.jpg', 3),
(13, 2, 'Episode 4', 'https://www.youtube.com/watch?v=TYIC1XnBBBg', '../assets/stranger-things-S03.jpg', 3),
(14, 1, 'Episode 1', 'https://www.youtube.com/watch?v=YvKpTJ7Y--s', '../assets/star_wars_serie.jpg', 1),
(15, 1, 'Episode 2', 'https://www.youtube.com/watch?v=YvKpTJ7Y--s', '../assets/star_wars_serie.jpg', 1),
(16, 1, 'Episode 3', 'https://www.youtube.com/watch?v=YvKpTJ7Y--s', '../assets/star_wars_serie.jpg', 1),
(17, 1, 'Episode 4', 'https://www.youtube.com/watch?v=YvKpTJ7Y--s', '../assets/star_wars_serie.jpg', 1),
(18, 1, 'Episode 5', 'https://www.youtube.com/watch?v=YvKpTJ7Y--s', '../assets/star_wars_serie.jpg', 1),
(19, 1, 'Episode 6', 'https://www.youtube.com/watch?v=YvKpTJ7Y--s', '../assets/star_wars_serie.jpg', 1),
(20, 1, 'Episode 7', 'https://www.youtube.com/watch?v=YvKpTJ7Y--s', '../assets/star_wars_serie.jpg', 1),
(21, 1, 'Episode 8', 'https://www.youtube.com/watch?v=YvKpTJ7Y--s', '../assets/star_wars_serie.jpg', 1);

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
  `lien` varchar(255) DEFAULT NULL,
  `auteur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id`, `titre`, `lien_video`, `categorie`, `resume`, `lien`, `auteur`) VALUES
(1, 'Spider-Man : No Way Home', 'https://www.youtube.com/watch?v=7w_w10HVa54', 2, 'Spiderman heros.', '../assets/spider.jpg', 'Tom Holland, Zendaya, Andrew Garfield, Tobey Maguire, Marisa Tomei, Willem Dafoe, Angourie'),
(2, 'Dune', 'https://www.youtube.com/watch?v=gHt8tCHbB2M', 2, 'Paul Atreides, un jeune homme brillant et doué au destin plus grand que lui-même, doit se rendre sur la planète la plus dangereuse de l\'univers afin d\'assurer l\'avenir de sa famille et de son peuple.', '../assets/duen-affiche.jpg', 'Timothée Chalamet, Rebecca Ferguson, Oscar Isaac, Jason Momoa'),
(3, 'Nos jours heureux', 'https://www.youtube.com/watch?v=e9d_PVFIBP8', 3, 'Vincent Rousseau dirige pour la première fois une colonie de vacances et se retrouve plongé pendant trois semaines dans l\'univers des colos avec petites histoires et gros soucis à la clef  !', '../assets/heureux.jpg', 'Olivier Nakache, Éric Toledano, Jean-Paul Rouve, Omar Sy, Marilou Berry, Lannick Gautry'),
(4, 'Titanic', 'https://www.youtube.com/watch?v=Quf4qIkD3KY', 5, 'En 1997, l\'épave du Titanic est l\'objet d\'une exploration fiévreuse, menée par des chercheurs de trésor en quête d\'un diamant bleu qui se trouvait à bord', '../assets/titanic.jpg', 'Kate Winslet, Leonardo DiCaprio, Billy Zane'),
(8, 'Super-héros malgré lui\n', 'https://www.youtube.com/watch?v=y6LXJnItN1U', 3, 'Apprenti acteur en galère, Cédric décroche enfin son premier rôle dans un film de super-héros. Un soir, alors qu\'il emprunte la voiture de tournage, il est victime d\'un accident qui lui fait perdre la mémoire. ', '../assets/super-heros.jpg', 'Philippe Lacheau, Alice Dufour, Élodie Fontan, Clémence Ansault, Salomé Partouche, Tarek Boudali'),
(9, 'stars wars', 'https://www.youtube.com/watch?v=pHgwf2eMFnA', 2, 'Un an a passé depuis que Kylo Ren a tué Snoke, le Leader suprême et pris sa place. Bien que largement décimée, la Résistance est prête à renaître de ses cendres.', '../assets/stars_wars.jpg', 'Daisy Ridley, John Boyega, Oscar Isaac, Kelly Marie Tran'),
(10, 'Marvel ', 'https://www.youtube.com/watch?v=wV-Q0o2OQjQ', 1, 'Marvel', '../assets/marvel.jpg', 'Robert Downey Jr, Chris Evans, Scarlett Johansson, Chris Hemsworth, Jeremy Renner, Mark Ruffalo, Brie Larson'),
(11, 'Spider-Man : No Way Home (2)', 'https://www.youtube.com/watch?v=7w_w10HVa54', 2, 'Spiderman heros.', '../assets/spider.jpg', 'Tom Holland, Zendaya, Andrew Garfield, Tobey Maguire, Marisa Tomei, Willem Dafoe, Angourie'),
(12, 'Dune (2)', 'https://www.youtube.com/watch?v=gHt8tCHbB2M', 2, 'Paul Atreides, un jeune homme brillant et doué au destin plus grand que lui-même, doit se rendre sur la planète la plus dangereuse de l\'univers afin d\'assurer l\'avenir de sa famille et de son peuple.', '../assets/duen-affiche.jpg', 'Timothée Chalamet, Rebecca Ferguson, Oscar Isaac, Jason Momoa'),
(13, 'Nos jours heureux (2)', 'https://www.youtube.com/watch?v=e9d_PVFIBP8', 3, 'Vincent Rousseau dirige pour la première fois une colonie de vacances et se retrouve plongé pendant trois semaines dans l\'univers des colos avec petites histoires et gros soucis à la clef  !', '../assets/heureux.jpg', 'Olivier Nakache, Éric Toledano, Jean-Paul Rouve, Omar Sy, Marilou Berry, Lannick Gautry'),
(14, 'Titanic (2)', 'https://www.youtube.com/watch?v=Quf4qIkD3KY', 5, 'En 1997, l\'épave du Titanic est l\'objet d\'une exploration fiévreuse, menée par des chercheurs de trésor en quête d\'un diamant bleu qui se trouvait à bord', '../assets/titanic.jpg', 'Kate Winslet, Leonardo DiCaprio, Billy Zane'),
(15, 'Super-héros malgré lui (2)\r\n', 'https://www.youtube.com/watch?v=y6LXJnItN1U', 3, 'Apprenti acteur en galère, Cédric décroche enfin son premier rôle dans un film de super-héros. Un soir, alors qu\'il emprunte la voiture de tournage, il est victime d\'un accident qui lui fait perdre la mémoire. ', '../assets/super-heros.jpg', 'Philippe Lacheau, Alice Dufour, Élodie Fontan, Clémence Ansault, Salomé Partouche, Tarek Boudali'),
(16, 'stars wars (2)', 'https://www.youtube.com/watch?v=pHgwf2eMFnA', 2, 'Un an a passé depuis que Kylo Ren a tué Snoke, le Leader suprême et pris sa place. Bien que largement décimée, la Résistance est prête à renaître de ses cendres.', '../assets/stars_wars.jpg', 'Daisy Ridley, John Boyega, Oscar Isaac, Kelly Marie Tran'),
(17, 'Marvel (2)', 'https://www.youtube.com/watch?v=wV-Q0o2OQjQ', 1, 'Marvel', '../assets/marvel.jpg', 'Robert Downey Jr, Chris Evans, Scarlett Johansson, Chris Hemsworth, Jeremy Renner, Mark Ruffalo, Brie Larson');

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

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

CREATE TABLE `seance` (
  `id_seance` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `titre_seance` varchar(255) NOT NULL,
  `id_film` int(11) DEFAULT NULL COMMENT 'id du film',
  `id_serie` int(11) DEFAULT NULL COMMENT 'id d''une serie ',
  `nb_place` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`id_seance`, `date`, `titre_seance`, `id_film`, `id_serie`, `nb_place`) VALUES
(1, '0000-00-00 00:00:00', 'Spider-Man : No Way Home\n', 1, NULL, 20),
(2, '2022-10-22 00:00:00', 'Spider-Man : No Way Home\n', 1, NULL, 20),
(3, '2022-10-26 00:00:00', 'Spider-Man : No Way Home\n', 1, NULL, 9),
(4, '2022-08-31 00:00:00', 'titanic', 4, NULL, 6999),
(5, '2022-09-17 00:00:00', 'star wars la serie', NULL, 1, 100),
(18, '2022-08-19 14:16:00', 'Spider-Man : No Way Home\n', 1, NULL, 21),
(25, '2022-05-20 09:47:00', 'Marvel', 10, NULL, 0);

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
  `lien` varchar(255) DEFAULT NULL,
  `auteur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `serie`
--

INSERT INTO `serie` (`id`, `titre`, `lien_video`, `categorie`, `resume`, `lien`, `auteur`) VALUES
(1, 'star wars la serie', 'pasdelienpourlinstant', 2, 'avec espace', '../assets/star_wars_serie.jpg', 'Pedro Pascal, Carl Weathers, Gina Carano, Giancarlo Esposito'),
(2, 'Stranger Things', 'pas encore', 2, 'En 1983, à Hawkins dans l\'Indiana, Will Byers disparaît de son domicile. Ses amis se lancent alors dans une recherche semée d\'embûches pour le retrouver.', '../assets/stranger-things-S03.jpg', 'Finn Wolfhard, Millie Bobby Brown, Noah Schnapp, Gaten Matarazzo, Caleb McLaughlin, Sadie Sink');

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
(1, 'admin', 'm', 1),
(51, 'd', 'd', 0);

-- --------------------------------------------------------

--
-- Structure de la table `vue`
--

CREATE TABLE `vue` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idFilm` int(11) DEFAULT NULL,
  `id_serie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Index pour la table `vue`
--
ALTER TABLE `vue`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `episode`
--
ALTER TABLE `episode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `favori`
--
ALTER TABLE `favori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `seance`
--
ALTER TABLE `seance`
  MODIFY `id_seance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `serie`
--
ALTER TABLE `serie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pour la table `vue`
--
ALTER TABLE `vue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
