-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 20 juil. 2023 à 14:46
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `recouvdb`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `displayActionsByClient` (IN `IDclient` VARCHAR(20))  DETERMINISTIC SQL SECURITY INVOKER SELECT * FROM action  WHERE client  = IDclient$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `action`
--

CREATE TABLE `action` (
  `id_action` bigint(20) NOT NULL,
  `agent` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `id_client` varchar(255) DEFAULT NULL,
  `id_nom` varchar(255) DEFAULT NULL,
  `num_dossier` varchar(255) DEFAULT NULL,
  `observation` varchar(255) DEFAULT NULL,
  `phase` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `action`
--

INSERT INTO `action` (`id_action`, `agent`, `date`, `id_client`, `id_nom`, `num_dossier`, `observation`, `phase`) VALUES
(1, '1234', '2023-07-11 11:06:53', '1111', 'ar', '28887', 'Risque : 14 , valider avec Succès le : 2023-07-11T12:06:53.472168500, Risque appliqué sur Client : 1111N°Dossier : 28887', NULL),
(2, '1234', '2023-07-11 11:07:18', '3691', 'ur', '3211', 'Risque : 12 , valider avec Succès le : 2023-07-11T12:07:18.500938700, Risque appliqué sur Client : 3691N°Dossier : 3211', NULL),
(3, '1234', '2023-07-11 11:07:30', '3691', 'ar', '3211', 'Risque : 14 , valider avec Succès le : 2023-07-11T12:07:30.351922100, Risque appliqué sur Client : 3691N°Dossier : 3211', NULL),
(4, '1234', '2023-07-11 11:09:27', '3691', 'dr', '3211', 'Risque : 8 , est Supprimé avec Succès le : 2023-07-11T12:09:27.909028800 par Agent :1234', NULL),
(5, '1234', '2023-07-11 11:26:57', '1111', 'am', '28887', 'Mission :1263 ,  valider avec Succès le : 2023-07-11T12:26:57.154884400, Mission appliqué sur Client : 1111N°compte : 178965', NULL),
(6, '1234', '2023-07-12 09:31:55', '', NULL, '28887', 'Document was added successfully in dossier 28887', NULL),
(8, '1234', '2023-07-12 08:37:55', '3691', 'aa', '3211', 'Affaire : 3699 , valider avec Succès le : 2023-07-12T09:37:55.237435300, Affaire appliqué sur Client : 3691N°compte : 256323', NULL),
(9, '1234', '2023-07-18 09:37:35', '', NULL, '28887', 'Document was added successfully in dossier 28887', NULL),
(10, '1234', '2023-07-18 09:55:42', '3691', 'dr', '3211', 'Risque : 12 , est Supprimé avec Succès le : 2023-07-18T10:55:42.157037600 par Agent :1234', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `affaire`
--

CREATE TABLE `affaire` (
  `id_affaire` bigint(20) NOT NULL,
  `affaire` varchar(255) DEFAULT NULL,
  `avocat` varchar(255) DEFAULT NULL,
  `date_audience` date DEFAULT NULL,
  `date_jugement` date DEFAULT NULL,
  `date_transmission` date DEFAULT NULL,
  `dispositif` varchar(255) DEFAULT NULL,
  `juridiction` varchar(255) DEFAULT NULL,
  `localite` varchar(255) DEFAULT NULL,
  `mnt_autres` float DEFAULT NULL,
  `mnt_intr` float DEFAULT NULL,
  `mnt_jugement` float DEFAULT NULL,
  `mnt_pr` float DEFAULT NULL,
  `montant_imp` float DEFAULT NULL,
  `nature_ass` varchar(255) DEFAULT NULL,
  `ncpt` varchar(255) DEFAULT NULL,
  `nom_prenom` varchar(255) DEFAULT NULL,
  `num_affaire` int(11) DEFAULT NULL,
  `num_dossier` varchar(255) DEFAULT NULL,
  `tribunal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `affaire`
--

INSERT INTO `affaire` (`id_affaire`, `affaire`, `avocat`, `date_audience`, `date_jugement`, `date_transmission`, `dispositif`, `juridiction`, `localite`, `mnt_autres`, `mnt_intr`, `mnt_jugement`, `mnt_pr`, `montant_imp`, `nature_ass`, `ncpt`, `nom_prenom`, `num_affaire`, `num_dossier`, `tribunal`) VALUES
(3699, 'affaire1', 'avocat1', '2023-08-11', '2023-09-22', '2023-07-27', 'dispositif2', 'juridiction2', 'localite2', NULL, 7889660, 25000000, 63000, 50000, 'Injonctions de Payer', '256323', 'Salim Ammar', NULL, '3211', 'tribunal1'),
(23698, 'affaire1', 'avocat1', '2023-08-05', NULL, '2023-07-20', NULL, 'juridiction1', 'localite2', NULL, NULL, NULL, NULL, NULL, 'Injonctions de Payer', '178965', 'Assyl KRIAA', NULL, '28887', 'tribunal1');

-- --------------------------------------------------------

--
-- Structure de la table `agence`
--

CREATE TABLE `agence` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `agence`
--

INSERT INTO `agence` (`id`, `libelle`) VALUES
(0, 'TijariBank'),
(1, 'BHBank'),
(2, 'AmenBank'),
(3, 'BarakaBank');

-- --------------------------------------------------------

--
-- Structure de la table `agent`
--

CREATE TABLE `agent` (
  `id_agent` bigint(20) NOT NULL,
  `nom_prenom` varchar(255) DEFAULT NULL,
  `profil` varchar(255) DEFAULT NULL,
  `query` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `agent`
--

INSERT INTO `agent` (`id_agent`, `nom_prenom`, `profil`, `query`) VALUES
(7, 'assyl KRIAA', 'AM', '(t.agent in (select agent from agent where 1=1 and region in(\'2\') and agence in(\'2\') and marche in(\'2\') and segment in(\'2\',\'1\')))'),
(9, 'jihenne', 'CTX', '(t.agent in (select agent from agent where 1=1 and region in(\'1\',\'2\') and agence in(\'1\',\'3\') and marche in(\'1\',\'2\',\'3\') and segment in(\'1\',\'2\')))');

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id`, `libelle`) VALUES
(0, '0'),
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` varchar(255) NOT NULL,
  `groupe` varchar(255) DEFAULT NULL,
  `marche` varchar(255) DEFAULT NULL,
  `nom_prenom` varchar(255) DEFAULT NULL,
  `particulier` int(11) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `segment` varchar(255) DEFAULT NULL,
  `agence` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `groupe`, `marche`, `nom_prenom`, `particulier`, `region`, `segment`, `agence`) VALUES
('1111', '0', '1', 'Assyl KRIAA', 0, '0', '1', NULL),
('2365', '3', '2', 'Foulen Ben Foulen', 0, '2', '2', NULL),
('3691', '2', '1', 'Salim Ammar', 1, '0', '3', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `num_compte` bigint(20) NOT NULL,
  `agence` varchar(255) DEFAULT NULL,
  `id_client` varchar(255) DEFAULT NULL,
  `jr_impaye` int(11) DEFAULT NULL,
  `jr_sdb` int(11) DEFAULT NULL,
  `mnt_impaye` float DEFAULT NULL,
  `mnt_sdb` float DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `type_dossier` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`num_compte`, `agence`, `id_client`, `jr_impaye`, `jr_sdb`, `mnt_impaye`, `mnt_sdb`, `montant`, `type_dossier`) VALUES
(17896, '2', '1111', 45, NULL, 600, NULL, 600, '0'),
(178965, '1', '1111', 56, 41, 700, 350, 1050, '2'),
(256323, '3', '3691', 100, 63, 300, 200, 500, '2');

-- --------------------------------------------------------

--
-- Structure de la table `compte_rendu`
--

CREATE TABLE `compte_rendu` (
  `num_compte_rendu` bigint(20) NOT NULL,
  `adressenc` varchar(255) DEFAULT NULL,
  `agence` bigint(20) DEFAULT NULL,
  `autre_element` varchar(255) DEFAULT NULL,
  `client_contacte_avec` varchar(255) DEFAULT NULL,
  `compte_rendu` varchar(1000) DEFAULT NULL,
  `date_echeancefp1` date DEFAULT NULL,
  `date_echeancefp2` date DEFAULT NULL,
  `date_echeancefp3` date DEFAULT NULL,
  `date_echeancefp4` date DEFAULT NULL,
  `date_echeancefp5` date DEFAULT NULL,
  `date_reglement` date DEFAULT NULL,
  `date_saisie_compte_rendu` date DEFAULT NULL,
  `date_visite` date DEFAULT NULL,
  `faxnc` varchar(255) DEFAULT NULL,
  `heure_visite_debut` float DEFAULT NULL,
  `heure_visite_fin` float DEFAULT NULL,
  `lieu_reglement` varchar(255) DEFAULT NULL,
  `montant_echeancefp1` float DEFAULT NULL,
  `montant_echeancefp2` float DEFAULT NULL,
  `montant_echeancefp3` float DEFAULT NULL,
  `montant_echeancefp4` float DEFAULT NULL,
  `montant_echeancefp5` float DEFAULT NULL,
  `montant_facilite_paiement` float DEFAULT NULL,
  `montant_reglement` float DEFAULT NULL,
  `nombre_echeance_facilite_paiement` int(11) DEFAULT NULL,
  `num_dossier` varchar(255) DEFAULT NULL,
  `observation_incapacite` varchar(255) DEFAULT NULL,
  `observation_non_reconaissance_creance` varchar(255) DEFAULT NULL,
  `tel1nc` int(11) DEFAULT NULL,
  `tel2nc` int(11) DEFAULT NULL,
  `type_compte_rendu` varchar(255) DEFAULT NULL,
  `utulisateur` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `compte_rendu`
--

INSERT INTO `compte_rendu` (`num_compte_rendu`, `adressenc`, `agence`, `autre_element`, `client_contacte_avec`, `compte_rendu`, `date_echeancefp1`, `date_echeancefp2`, `date_echeancefp3`, `date_echeancefp4`, `date_echeancefp5`, `date_reglement`, `date_saisie_compte_rendu`, `date_visite`, `faxnc`, `heure_visite_debut`, `heure_visite_fin`, `lieu_reglement`, `montant_echeancefp1`, `montant_echeancefp2`, `montant_echeancefp3`, `montant_echeancefp4`, `montant_echeancefp5`, `montant_facilite_paiement`, `montant_reglement`, `nombre_echeance_facilite_paiement`, `num_dossier`, `observation_incapacite`, `observation_non_reconaissance_creance`, `tel1nc`, `tel2nc`, `type_compte_rendu`, `utulisateur`) VALUES
(5, NULL, NULL, NULL, NULL, 'MontantReglement:4444.0-DateReglement:Sat Jul 08 01:00:00 CET 2023-LieuReglement:Tunis-Type:Promesse de réglement', NULL, NULL, NULL, NULL, NULL, '2023-07-08', '2023-06-26', NULL, NULL, NULL, NULL, 'Tunis', NULL, NULL, NULL, NULL, NULL, NULL, 4444, NULL, '28887', NULL, NULL, NULL, NULL, 'Promesse de réglement', NULL),
(9, NULL, NULL, NULL, NULL, 'montantFacilitePaiement:4.0-NombreEcheance:2-Wed Jun 28 01:00:00 CET 2023:2.0-Sun Jul 09 01:00:00 CET 2023:2.0-null:null-null:null-null:null-Type:Facilité de paiement', '2023-06-28', '2023-07-09', NULL, NULL, NULL, NULL, '2023-06-26', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 4, NULL, 2, '28887', NULL, NULL, NULL, NULL, 'Facilité de paiement', NULL),
(10, NULL, NULL, NULL, NULL, 'Observation:ceci est une nouvelle observation -Type:Pas de reconnaissance de la créance', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28887', NULL, 'ceci est une nouvelle observation ', NULL, NULL, 'Pas de reconnaissance de la créance', NULL),
(13, NULL, NULL, NULL, NULL, 'Date Visite:Wed Jul 26 01:00:00 CET 2023Debut Heure Visite:9.3Fin Heure Visite:12.3-Type:Visite', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-26', '2023-07-26', NULL, 9.3, 12.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28887', NULL, NULL, NULL, NULL, 'Visite', NULL),
(18, NULL, NULL, NULL, NULL, 'Incapacité Observation:test-Type:Incapacité', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28887', 'test', NULL, NULL, NULL, 'Incapacité', NULL),
(20, NULL, 1, NULL, 'fax', 'MontantReglement:6000.0-DateReglement:Sat Aug 05 01:00:00 CET 2023-LieuReglement:Tunis-Type:Promesse de réglement', NULL, NULL, NULL, NULL, NULL, '2023-08-05', '2023-07-12', NULL, NULL, NULL, NULL, 'Tunis', NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, '28887', NULL, NULL, NULL, NULL, 'Promesse de réglement', NULL),
(21, NULL, 0, NULL, 'tel', 'MontantReglement:3200.0-DateReglement:Thu Jul 20 01:00:00 CET 2023-LieuReglement:Nabeul-Type:Promesse de réglement', NULL, NULL, NULL, NULL, NULL, '2023-07-20', '2023-07-12', NULL, NULL, NULL, NULL, 'Nabeul', NULL, NULL, NULL, NULL, NULL, NULL, 3200, NULL, '28887', NULL, NULL, NULL, NULL, 'Promesse de réglement', NULL),
(22, NULL, 0, NULL, NULL, 'MontantReglement:3652.0-DateReglement:Thu Jul 27 00:00:00 CET 2023-LieuReglement:Nabeul-Type:Promesse de réglement', NULL, NULL, NULL, NULL, NULL, '2023-07-27', '2023-07-18', NULL, NULL, NULL, NULL, 'Nabeul', NULL, NULL, NULL, NULL, NULL, NULL, 3652, NULL, '28887', NULL, NULL, NULL, NULL, 'Promesse de réglement', NULL),
(23, NULL, NULL, NULL, NULL, 'MontantReglement:30.0-DateReglement:Sun Jul 30 00:00:00 CET 2023-LieuReglement:Tunis-Type:Promesse de réglement', NULL, NULL, NULL, NULL, NULL, '2023-07-30', '2023-07-18', NULL, NULL, NULL, NULL, 'Tunis', NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, '28887', NULL, NULL, NULL, NULL, 'Promesse de réglement', NULL),
(24, NULL, NULL, NULL, NULL, 'MontantReglement:18.0-DateReglement:Fri Aug 18 00:00:00 CET 2023-LieuReglement:Sfax-Type:Promesse de réglement', NULL, NULL, NULL, NULL, NULL, '2023-08-18', '2023-07-18', NULL, NULL, NULL, NULL, 'Sfax', NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, '28887', NULL, NULL, NULL, NULL, 'Promesse de réglement', NULL),
(25, NULL, NULL, NULL, NULL, 'montantFacilitePaiement:2525.0-NombreEcheance:null-null:null-null:null-null:null-null:null-null:null-Type:Facilité de paiement', NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2525, NULL, NULL, '28887', NULL, NULL, NULL, NULL, 'Facilité de paiement', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `detail_engagement`
--

CREATE TABLE `detail_engagement` (
  `id_detail_engagement` bigint(20) NOT NULL,
  `echeance` date DEFAULT NULL,
  `effet` varchar(255) DEFAULT NULL,
  `frais` float DEFAULT NULL,
  `id_risque` int(11) DEFAULT NULL,
  `inter_conv` varchar(255) DEFAULT NULL,
  `interet` varchar(255) DEFAULT NULL,
  `nom_prenom` varchar(255) DEFAULT NULL,
  `principale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE `document` (
  `id_document` bigint(20) NOT NULL,
  `fichier_path` varchar(255) DEFAULT NULL,
  `num_dossier` varchar(255) DEFAULT NULL,
  `type_document` varchar(255) DEFAULT NULL,
  `type_fichier` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `document`
--

INSERT INTO `document` (`id_document`, `fichier_path`, `num_dossier`, `type_document`, `type_fichier`, `file_name`) VALUES
(1, '\\src\\assets\\1.png', '28887', 'cin', 'png', NULL),
(2, 'C:\\RecouProjectGTI\\angular\\ArenaRecouv\\src\\assets\\img\\2.png', '28887', 'cin', 'png', NULL),
(3, 'C:\\RecouProjectGTI\\angular\\ArenaRecouv\\src\\assets\\img\\3.png', '3658', 'cin', 'png', NULL),
(4, 'D://photos//c.jpg', '28887', 'cin', 'jpg', NULL),
(5, 'C:\\xampp\\htdocs\\images\\5.jpg', '28887', 'cin', 'jpg', NULL),
(6, 'C:\\fakepath\\a.jpg', '28887', 'cin', 'jpg', NULL),
(7, 'C:\\xampp\\htdocs\\images\\7.jpg', '28887', 'cin', 'jpg', NULL),
(8, 'C:\\fakepath\\P.jpg', '28887', 'copie jugement', 'jpg', NULL),
(9, 'C:\\xampp\\htdocs\\images\\9.jpg', '28887', 'cin', 'jpg', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `dossier`
--

CREATE TABLE `dossier` (
  `num_dossier` varchar(255) NOT NULL,
  `classe_final` varchar(255) DEFAULT NULL,
  `classeimp` varchar(255) DEFAULT NULL,
  `encours_global` float DEFAULT NULL,
  `entrectx` date DEFAULT NULL,
  `entre_recouv` date DEFAULT NULL,
  `id_client` varchar(255) DEFAULT NULL,
  `jourimp` int(11) DEFAULT NULL,
  `joursdb` int(11) DEFAULT NULL,
  `mnt_impaye` float DEFAULT NULL,
  `mnt_sdb` float DEFAULT NULL,
  `phase` varchar(255) DEFAULT NULL,
  `sortiectx` date DEFAULT NULL,
  `sortie_recouv` date DEFAULT NULL,
  `type_dossier` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `dossier`
--

INSERT INTO `dossier` (`num_dossier`, `classe_final`, `classeimp`, `encours_global`, `entrectx`, `entre_recouv`, `id_client`, `jourimp`, `joursdb`, `mnt_impaye`, `mnt_sdb`, `phase`, `sortiectx`, `sortie_recouv`, `type_dossier`) VALUES
('28887', '2', NULL, NULL, '2023-07-21', '2023-06-28', '1111', 23, 42, NULL, NULL, NULL, NULL, NULL, 1),
('3211', NULL, NULL, NULL, NULL, NULL, '3691', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('98778', '3', NULL, NULL, '2023-06-21', '2023-06-26', '1111', 14, 32, NULL, NULL, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `garantie`
--

CREATE TABLE `garantie` (
  `id_garantie` bigint(20) NOT NULL,
  `date_delivrance` datetime DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `codeppt` varchar(255) DEFAULT NULL,
  `date_enregistrement` date DEFAULT NULL,
  `date_expirationm` date DEFAULT NULL,
  `date_inscription` date DEFAULT NULL,
  `date_renouvellementm` date DEFAULT NULL,
  `droit_hypotheque` varchar(255) DEFAULT NULL,
  `estimation_courante` float DEFAULT NULL,
  `estimation_initiale` float DEFAULT NULL,
  `garantie_deb` varchar(255) DEFAULT NULL,
  `hauteurm` int(11) DEFAULT NULL,
  `jaugeagem` varchar(255) DEFAULT NULL,
  `main_levee` varchar(255) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `nature_garantie` varchar(255) DEFAULT NULL,
  `nature_hypothèque` varchar(255) DEFAULT NULL,
  `nom_caution` varchar(255) DEFAULT NULL,
  `num_dossier` varchar(255) DEFAULT NULL,
  `numero_congem` varchar(255) DEFAULT NULL,
  `numero_document` int(11) DEFAULT NULL,
  `numero_titre` int(11) DEFAULT NULL,
  `observation` varchar(255) DEFAULT NULL,
  `pari_passu` varchar(255) DEFAULT NULL,
  `port_attm` int(11) DEFAULT NULL,
  `rang` varchar(255) DEFAULT NULL,
  `type_bien` varchar(255) DEFAULT NULL,
  `type_doc_caution` varchar(255) DEFAULT NULL,
  `type_garantie` varchar(255) DEFAULT NULL,
  `type_titre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `agent_id_agent` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id`, `libelle`, `agent_id_agent`) VALUES
(0, 'GroupeCentre1', NULL),
(1, 'GroupeCentre2', NULL),
(2, 'GroupeCentre3', NULL),
(3, 'GroupeCentre4', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `image_data`
--

CREATE TABLE `image_data` (
  `id` bigint(20) NOT NULL,
  `imagedata` longblob DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `num_dossier` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `image_data`
--

INSERT INTO `image_data` (`id`, `imagedata`, `name`, `type`, `num_dossier`) VALUES
(1, 0x78da014406bbf989504e470d0a1a0a0000000d4948445200000074000000490806000000ec7e0254000000017352474200aece1ce90000000467414d410000b18f0bfc61050000000970485973000012740000127401de661f78000005d949444154785eed9c2f9413311087912791482412893c89442291279138e4c9934824128944229148e449e4c9255f9bdfbb695eb6cdee66b7b94ebed779bdeedf36bfcc249964efd9d0699efbfb61b8bbdbbf9fa20bda387fff0ec3cb9741a8a0d4dbb771e311baa00df3efdf30bc7ab51713fbf831ee384217b45110f3f5eb4731afae7ac87db23c3c0cc39b378f62629f3fc79d27e88236c8fbf78762e2a9885c4217b4313e7d3a14f3f9f37dc7a8942e68437cf9722826f6e347dc594817b411102e15f3ebd7b873025dd006a0f74a685d2a2674411be0faba8e98d0053d330c476a89095dd033427e56429238f8f62dee584017f40c30a6bcb9791493f6f3d7afb873215dd08d21a597b6993f7fc69d15e8826e489a9fc54a537aa5b816b4748eb1063931c9d7d6c6ada0b7b7fb4265ae714a6a6d2eefde1d8a4927688dfbba15d416f0daa23214b162624b872763844bfbc44e1c63884a58ac0d21fdc58bc37b95ac3c984bb8bc4f946aa37055d0b471b545fdf0e1f1fa18f75db3dd0eb7f0890af8fbf7c3013e1d95dfbfe3410bc9cd9eb06d4dc22dfc8187a88035064c53708464bc8bce13c7948a4cd280e3d3496a6c8d5e6d4ab88d3fe800a990fffc891b03a4ded2f66ea9d19bd5df4483b509b7f1071ea442cef56e119615766946678a2124ab0f94e2a3a2942e235942b8953faca0a5854cae95f3109bf09c33dac7343cabf355b204b3062e05b5e3c2354158dda756f2fd14ae05252c8e8100a907e27d53c2a6ad385b845b702d28c9841c4a0be68cb690fd2550093867ec3e6b106ee70f9bc7cda16400ed1f1d234c6da18c2188ed21e790a05b0c5744b89d3f4e790ee11611d36106dbedf812918f0d45e808711cd7da0ad782ce2d68965c5a8f1d0bc1f2f42ee8ca2c151418bfdaf9cddcb0a40bba113504057aae36b99f8ada05dd885a82422aaa4dbe774137420f04d52a68a6dc34bfcad85663ce2ee846ac51d036e12f2f552440ecad702d2843901248e191254a0dc1ac69a60601f9ac508cd7a6c7e64cb960d9a9716e8e8b14341580b1a22d38f54e11002f95312e657b6b66131c7c7f864d63ab1ec2e1ed419b446db522c8a8f55604b230b942d8caa804fa2ef2502b80b6617c576d4f6d4e65e21c565bd83c71d8dc1e7649484d53816ad259a13135ebddb292150bb9b6d93ef7c9fe526893756f7d2f2a734e782a901e0c0e1fdb43a9b73163d2d80a80f183ac00b9896ba142b1438c1a2894f3fd2cf639164459ba488cf39997b5c3252ae96eba2e1ee30a1542cdb5b1843d5d37ad28ec4b73c0251e5f02d75158a7b287377fa8606baef1b1a1754c2c72be0af7883aa7179b43b3475c33bcf9820e970a9ed05c0bbb76e81888bd2bf8702ca1ff58d3500a1553bf29bc7c611300350555d84bdbcf1cf411e4a93544c5d3f59bc2cb1756d01ade01f69aa5619c105d4b547bfff0f2055ea91f5f4b50bb7668caa314f63c449ddba67641e38faff51c8bc69f7372b65654da56c2f1543847d7082f5fd80e442d34ae9d9238b0f09d147e799f3a9c624caa732bfeaca781f5881acc693f73d8f124c6f3aba51144d381bbc446dce686da82daeb2d0de164806c6e1a8195d23b86ced93dc41cb7b9a1b6a04abfe11db5b009080c0fb409780b9eade376cd49dcee069bd1192ba4526cb86542a1267474b40a02a3c2a4e36622829d0adca51fe33e37d81abd34f5a675b778d3d2847b0e04520f5a46be561312ea8c61ca1f873f7d41ad562194b44f6350d80a8b6b3f594628b51da6d41057848ffe502e754998b473b6b592ecc7a002714f3c94304b65620627ad942e0555bb43af700e14ae3c66ee35d6c2a5a08428c4a09623ce54ecff851f9b2a3b172e05b5e9bfa9332e747eb66a3be7e052501b32a78e1fd7eed92ec5a5a0603b35a529bbd6bd13dc0a0aea1c95ce47b6ee9de05a50da4f791c21f85807e7297827b81614ecca01dec7920dfaef9d2d7b27b81714f04c251b102cedf9da0964862c2dd3058d58517957bed4e64c95006f992ea8c18a9ab3a963d67310be66c782a8b4977aec0263ce7349227f4bbaa0174617f4c2e8825e185dd08b6218fe03aa12494bb859f0f40000000049454e44ae4260825f48f41f, 'Capture.PNG', 'image/png', '28887'),
(12, 0x78da030000000001, 'test.png', 'image/png', '28887'),
(17, 0x78da030000000001, 'ok.txt', 'text/plain', '28887'),
(18, 0x78daed587938d4ebdbff0e1995adb490f59cd271b28d224b96a9a41211a289981189c8922c5966a6fc4e4238a508698a63296264a92c631ce2440cc99231c6be0dc636966996f799ea9cf3bed7fbd7fbe77b5dfde1727d9ff93cf7f2b9efe77eeefb893d637d4262b3dc660882242c4e1eb383a00d780812bab35108acc458ec7402ff604176278e42456d0a53e063c3e523a78f4050499218c74d047c6f0a38793e0882a4af0bfe60039eca6110a4bc6a71ecc8d930d7591ae2ec486f7d939bc7d84915e9d8c73a9b638fedb6555091d697361c51bba7de54221d5b78e1e6dafb532a8b518851bfd7f69b3b9153fade37944a2e6784a4f78f3ffe9d621154b58a037a8e6dd48620fc16181c82b6ec268385a31b6421e8f01d481882366ec580859f85c421e8a763781804fde707f807f807f8ff0b78fe3997bb4a1715158db06fae2f28285808bb808641b3001479458775f0a5f141054906037a2a21248eb7991d1fcf5de98e6990855e6ec140f319e85aaca2a262d73c9bd6d5d5b5b41414a50869d8e0616485bd656d148a4fd8694363e3c8b0b07c84107eef266d682d5ada3d2f2faf9cec9a962f8cef0246a2fe9a9d9d4d45a0afdcac9113871f10c7e70816cf7abf4c4e4e4e4733b55d442165a069f94f2fddcaca4a36c66eed8f57bb5ebf7e1ddc32be8ec94a6c5c65d21996304c1c24fcd4d2c6c626c721fca34b273cfa08ad6135eab19b9c38fe35703c7397648c4ea803ab696cec12adf992311269833b51521d6bd4003dfa850c4d0aa4f8e456f7d1e988b7d770383461c04947424f56dccfcf6f3a088a0c079e9701b3013972bf8af50794070f583b331977205d20db56076d646c68b8efad1d81aaa9137ae7615b358934d0552744fc09063fdcf6a14732f40d494e077d4243524a4a594969ba138a3405027f9f62f7d5142b92f2747bd7d76f28aed4f6ef80cf7b038ea473193e1388c856875b41ecaa54236dda46481d30e0dbfde1813ca1942437b2b0c6e8296e9d08080898f7468ae229567818f1482d96cb56b1f7d3c8d7ed1d15de27a10762b60d8a94048a24805bfe17b3cfa013a8542a3bb6fa809909390fe444ef83a100d41e777f66b2d5db92a7534c8f9d72e2834b024dcda38b3d9f3f9f7769a87d82233cc3eaca75a942bdde4054826c5253b9e6ca4ae45240d1628982b2b2bef2bd2f7590e926189c7cfc82abab9e77e0f5eb6765161abd74af98e6dc66ee169a3106247cc9c5b180c9e8e07d4b56a7ca9fd5412119205c973a83fc1f3f7efc29a7da7f1cab2d0127d60336afca253545d73dddb469a90de1975ba78540b4a89e270863624056f4e9a661b8939327a3342fe5d69d6a4aaf52c6ac8265279da8f5969768f55f2542c2c3fb22f1129d9dc233b240ad4f2e02d765ae515cc6181a725bb20004b1783c92298cbcb20d0395d58f15ef6cb5b2a9adadc54545cdaa67424687f1b076c9d4dabe83260f7123f3f3f34343cf4c25c821d2004c1e2b3e2d9b707caf8f94a464ba54456050903d018e1103d1721a5cec394e1b18c0ae2fe6acff470cb91d4eac017e68f602d2fb3005089ce070353535711f73a28c9552affa988e1e8d86f9ee038c55deae776bbd5533cb2bfde8318ad1ce4fea21c6a664ac3f137091006430d22ff00e191915c457d8ebc46599ba9ac56bea9f067b8d047baf48cccc5efd623c152c7b75032a2a5be282f4270ce47c1aa44251ba90338f5b9f25994d87397ed07d74632bac029c7b8c263d0f5bf442abcf2958b6468a78b1b20e1e5d87c6711d08d0533ad05690f104eb4ef587d4a74f56fc4c8efb8849a6bbaacf3199208d961f81edc1c953fad6d6d6155c38316b97a5ad72f13352c72fc2856fdebe7d5ef0996a6460d07bd305222e0149ea95b5b5f4127bbea7817954f56df6717949e24563251b6cf6fae2e22b2d91a7c5028c5ade97d61b7c162bd8a56c2c7d683b6b416e5afeaa29390ee4a8a7cb4b4ab8d4618600961ec917c441abef5a6b401c3b4c8295b01be6f8e9618ea328b959e1390c656b32467f96cc3bf444539cf8de572177189a3404f4a8e5fa438037b44e9680b7a8ecb3f84c0241bfc0e8d0a1033b440f1340dc1cf71b8ed0d3e4c971ef83ff007235495dbb1b47163c1290584ebe256c521906cf58580b0b5d5d1a1e1e76ee78bced74b546e59bb5f5a5b9851252d81ea51636ce79bde5cab90bde3a8f52258a990e351afbcc3ecf9f7cb178afed6efeaece1636c3b2af834ba20a7522f9e53afaf81dad85732f3feced1d76d6ccbfdec390bc911697bd8c72d97c98b251dbcbc130143131db6ad17eb4799db3797dfe550a1b8e3885e2f2949290c8dedbf155ec17c888d34fd814de68f9dc74ad7323a1d1ee43b54791c3393ea19d44dd0a7438c874944f4c4c6467677bd6ce90932e0acfa8c1e09ae755a407ca67d23834736e0c9fbd822e7f20f15c8cbe9fd5275568f0642c6334bb44a36a97fa4edbebf4d93b87d83526afe559cda38dd537d72761ec53f82362dd863802aa305e8e79a285305db0b614d7bdf9fed8f1c50e9423f5ee58f7137aa85156a27170f4b6f802a3c622d8a4baa817aa2706bdeadcf6275a3252d56927f501f2d351f591f58ab555851eb99648b1e2eaf8a8d77ba6899963ab140fb5c40eafb332b076555ec89f9503b5e3cb87900d34dac883aa2a82f28043f9a037a7dfebc66533d7f184b5ab09caf0deaaecf5154f7852ea50f587385bb4b64fc7ee34fd94a655bd914b9bef9e53a617b2621a1f878596c9f703b3249df02c0a2862a53ed636368cdd10bb816e8deaa126af898c4787ad5283e333df51625308fefaee9eea5710515b549917b6b03b5dac99129e25e2e14629868107f97bb8834671ea45464466c831c552884100e6ae26c463a09a517fd5421fb60af6f9a65de3136d472f2ff8d7bb3566a5e2735be94f44e8deac3a0ded9424d34fab5a299a653497992a45db180d72f8d4f272d96723ad5bb0e5df6b3389153d62bbd55b6f99aeea62b95ee77348e3b51376ccb261f9488394df5e78255c9bc108827211d66dd92953c7f949f6307d8dbac9253d7467ed4983c8ed9a05e6e417ce8b198619ac89d5309c463c6574ffaa89de05b3979117a90589283cabebfd7b8bd26850635c361c4682ad9982ad870daa9535d51d9be2a8fb7d1e0a45f86b58bec40e64f856de76627fa838ab48841805821328aaa8acdc630e2d47d766b6bf341c231ec7bf0ce7d19d2c0bb51fbf75f71e19a636fa78950b02891741a14d4c4cba4c3c9461cb77470e5cf769b3e0082decd77772447ef1673ab56d6696f5a96afb0cc4e9476d2accd4a4db0593ade7223e4801129205c257847c13e21141037e5da1ce5863cd4b5696fea577251d3f2b0793850a9b046e23d7a99b684eb32a249a3d5f8f7eb5ed613eb2fa9ca50f1afbce671b0631edce6efa4798d20654017dc099677427438c18acb559eb28be263f696a2f7223bcdd0c2459a3b1e9008dcbb91118b8306b1e245776c7146ca8d026ebbd11441838af2f530785ff45b7f6a28ed028d7fa5c29371cef49120dfdbb8b6637111bc0491358b57a6183f0a43ccee89949522823b3e69c506134d4320b622c0a62eccfde8d0284e729243e534c42229c0c70b8721fd84a8c26c394fcea8bdf894f30a33c3a3cf8dce7f3107730405cd36b55eb45e666a2bf4c28aeb72851588324b024804999f2f7f707974d73480a3f855f6c894cf3b4d9c1da0f655e33b81d1c1506e7cf0e0f4fd068eeb668139f724e6f185ec42cab05625c14a4cc2096d02915535ff9b018f44151c3c9cf4764305f95316e30b7f39c0d6fa0472f5cc007cb606882c414ed6706b1b95c6ee5437e25a8e594a85f82e785c49f2a2b24ba692e5186520d249847f0adf266da2a87c488892bb4c47ce1b955c3285a434d4d4b4bcb380edc2282be8fdde9d5e8faa909bade3c24dbbd7f627be4d0736539938dc4b7d9a82b5b7cbcbd352c4551e7befaef6f817f3809ee35757e1016eb4af862952ef52c3f0936f9a07e7fa1dbdcc107631f2f9527af85d870ab6a3674dbe2832b048ccca76c402d05182be9f3973e7fb23982872d470be06dbbd6ee4fccd76c24ea359654a634bef2fd1bee28d29be7801481c1dba5249b88b777b691cf45c457d8709df3ef3d2cd74dd929a451fa2de45438cb7ecb377a7c26675448b3f6fcb7f426b177c72cddb762ce8370fbcaff4f7d7632894a133575bb551766096c0aedfe5fe6c494c6fbbccdc3cd5fbd1323b238df6efc0cde6f93ec7d1bb5f1d80083db073fd404944d9ee77074d6b292a10c348651c3a8aac57032fe9bd144c8d966c9f29260dfb8d9afd3eed0a13110b347114aa4bf2cd6fa3bf9576ee26a6f4211a1c98e61234d550499d60ccd33ba8a22a8cb7f2bfe344b9ddfd91dfc5d657975d0ded1eca5793b5526815c8b1a54c16e83add89e8fac7ae33c49e3ab17abe9a7e40817167c3bc5bde1d32b9bb4f1940610bd25db324e75064f7a606424c3f846f0fe2a0d194dffc8eb81796b21810b4b1334975dddb8e6fa0385f1fe4b7c373f8d1651d4897f2d00ad15211650c590ea582c4955b72c15f9e886dfe1233191e02a8ad2ff5fb8328cb599c6203d9985154175b8466b0688a1f2608e0dabdfd38c8bd1f6d25b045d9bd6749ae712680074a60f6d0025c140c1cc686e3cf2c8ac301dcb0bb577600acdbc1bb92f9ccebada416dec936b790173f4f84786e016b807e61b0a8512eced2f1e530f24557afd2b2962675c4a0f357e1ae965cc0b09b5bd81bd19b4f62a97ee581e30a771899760a3ac36c4fa326b8febfe88c2f26565b83ff177f487563d937c4b9f5806cd784b2aa235c4d5d5b53ba7a6e3c311f4833385f17ad9e7418724dcbe2fc6dd8bda12293156569daf6a52dc5c9fd3f287be6b6e5f58a697bbe799778c579e7e899a8afd658afda11976c88c0142277d60408ffa768adee774a4d4ed5d6e715b57d7b770c231deacbb58f9b629c6ed157f7b86e7556cfdf4956f0e0813cbc28f23c88e3baa6085f9055bbf2533f9231b593778ac34d33caa5faa04f4399ee6e651e282ba0443f5818123c81a77fdfaa7fa4df0bcd34e81c64a3de626edbe765bd796a7d3ff112aad934c5c5f1839e1d267a9aaaada1a22096a4abecf58a78fdef3fc78bde74516df4e0554f02badeb7177aa34a3eb5dceaee4d82d4949498c2c6b702b9cc63e9d999cccd7a2fde1e9f28ff277a05a4cc58c7f300dd8d3d97c6ade4aab3b8acfabd19afd0bd4a0d1bcf77160a2ec5205d2adbe4b575733b4b5998d68d7537e535d5de8fc9915623d3ef02be844a73f4a1430b67df776fa97d2c0edfafafac1de14c17437b741bdf20ad1a21874e5632b2b155ab46acf9c7f2ca05951394c1cbfc066d94a59cef7dacf736c76a5569c97a3d3f7f2852fb7a28ba754134b0bfde47dc307fe8a8989a9d4cd3aeffd3da250b7c3c55cc3774824b2383edc3bb7eefedbb0e0e0ae425d9da5a132cf9a7fb4f48ccee546474757e617e7cafb6acb7296284856ece97412e761da7a8053e9409629fca9bd6413545870b65545fbd4ddae9c28d6f2f2d9a3259ffbeaebeb5f2db06213a6e617cf7514567e2f8e90e6235ee0d0e18f8553609cb1bb9bc1ebf3789d5a1be7d9f5b74aafbaeb9e9cb5856cadd99257f75abb77667700eaf17e08dc8ed6be78b62cdeda5041b83dd1e2e303697513c7d495de514f6231bad66f32233913cd534b2f97f976bfc09f2a52ec973a0899995d39267a7209e92fafce3099681797f28cc4643a6f7a7ab1c7e356739696d057f3cb3c0f285eec789fa488f0a9b4918bae1b1c1fcf35ad7932a5cf04436480416101fdbe0a7c4d5c30da1d028ce5719c3f62b23b26a7a7af1c405cccd6381fa4766f8a7dc8d0f0b965e9caeaaaaa7c3b3fcdf6eb407938a33996b79ca4e86f1e7d108c6e07d7375f0a0c0b5b9b9f3f43706eecececf4184ec8aa5f7bee4c7c9d4782d86660767b357b95f86a0ccce9c15568175757ad83c813cfdf20d0a44fb87e564e5ee5d6399ed0e436d14b50dfeb1a09c7fe8101eb13674bc0f837d8cf4ef6e7eea075f78c62ab0511db8857124cc10d8efabd61c64f06d61a9563ceb89e4157be3ea75604f2d443a891c160fc8d6a76d447ed0fc5269a2fbb35d7bd2f7fd335e7218c3103eecaeb7662f67a4f6fa3ba7b6ec49d75ed1fd297921f5978e397204f86c21b0377e15bd50e5e8b8cec6f204f4d79bb543a346fc9cdebe19341b19a603958e5bacd4c8b3e85852581c96be478b66da7f0bbeea8ad818cbb4d237598f6c8be4c0ea4fbf56144c59726a5eb8f48ad85d8e0c4fcae1da4fa104edd023ec3adf1b02d597542bf9452aa3822ed36607c7f9c06572fd7564a620415bed4bdcaf5700184a803a63f59454bc0a30b0ad4775590a6d86a84806f6309f4f15474e69327dd8e617bebbb75152419273e2729ef161e3401a2fc386c16039cede3f505f7ddc0b96379efd43359b8cd16128c5f8753073c1fbd374c39f8efcaaae701ab68cdb60679886a0e4225a6931c74f778367b03b38a442a22a4c6ea4315ff81849f224e4583ce53df30303cdc29f50005c9e72cb1183de3a56afd6c11a22660d5e4805cc215bbb5ddc35ffcfcfc7e29f5db3e2d868907a6b2c7389ceadbbfc123dcc7ff4cbdb107569108a4a13dfde055d5d5cb5f30efbebe1ea593e61d4e152ea3a2e4f09a3f93a1c94cc04797ed8119c1ab0037cdd8c4045422eee0e053eccee20b6b42bdaec04f5335c1ab8253b4fb298b7b4301287419030b8ed8584beaa145dcdb79116217b089cb5ab99c2e6fc4af6900b997c6eba7d3f965a93058482c3081994e250c60258a35fadf8b4784853d52f25de70b9e61142067101fe2c1012c22b069ee76b85167e3fafadb7de35f77615a3e705d87ebeaea582cd64a4573804164442ce537049eb6870cf59e0ad299f9f63841ba1811094aa7e420fad24f9e7d50af05b0f72a8bc331e616b46ebb7cf972fd5080b3906725e94319eceb5c5e35b8b2b2327b7736e772517131e1c993e978769eaf2badbba6263979dbeb0898e0ad869c289bd4d489a41b035a8a6b792f10d30938defa04a3a738785b970c390fd0d6bb0f9cdfa62465e0ac8e4c4362529211c76eb83f6d59f5930c7942f0fb791c97d5c3e3615f3e76ed2bf15e86aded0172b522c2c3d3499417e74858ee95176678ca71e0fe9753130a60d0989bba352501f3faf126fb03fc03fc03fc03fc03fc03fc7f01dfe17fa9e58bbe31745ff2b47b7e1720200b73eb63454731b7fe0bd68c1a44, 'are.png', 'image/png', '28887'),
(24, 0x78daed587938d4ebdbff0e1995adb490f59cd271b28d224b96a9a41211a289981189c8922c5966a6fc4e4238a508698a63296264a92c631ce2440cc99231c6be0dc636966996f799ea9cf3bed7fbd7fbe77b5dfde1727d9ff93cf7f2b9efe77eeefb893d637d4262b3dc660882242c4e1eb383a00d780812bab35108acc458ec7402ff604176278e42456d0a53e063c3e523a78f4050499218c74d047c6f0a38793e0882a4af0bfe60039eca6110a4bc6a71ecc8d930d7591ae2ec486f7d939bc7d84915e9d8c73a9b638fedb6555091d697361c51bba7de54221d5b78e1e6dafb532a8b518851bfd7f69b3b9153fade37944a2e6784a4f78f3ffe9d621154b58a037a8e6dd48620fc16181c82b6ec268385a31b6421e8f01d481882366ec580859f85c421e8a763781804fde707f807f807f8ff0b78fe3997bb4a1715158db06fae2f28285808bb808641b3001479458775f0a5f141054906037a2a21248eb7991d1fcf5de98e6990855e6ec140f319e85aaca2a262d73c9bd6d5d5b5b41414a50869d8e0616485bd656d148a4fd8694363e3c8b0b07c84107eef266d682d5ada3d2f2faf9cec9a962f8cef0246a2fe9a9d9d4d45a0afdcac9113871f10c7e70816cf7abf4c4e4e4e4733b55d442165a069f94f2fddcaca4a36c66eed8f57bb5ebf7e1ddc32be8ec94a6c5c65d21996304c1c24fcd4d2c6c626c721fca34b273cfa08ad6135eab19b9c38fe35703c7397648c4ea803ab696cec12adf992311269833b51521d6bd4003dfa850c4d0aa4f8e456f7d1e988b7d770383461c04947424f56dccfcf6f3a088a0c079e9701b3013972bf8af50794070f583b331977205d20db56076d646c68b8efad1d81aaa9137ae7615b358934d0552744fc09063fdcf6a14732f40d494e077d4243524a4a594969ba138a3405027f9f62f7d5142b92f2747bd7d76f28aed4f6ef80cf7b038ea473193e1388c856875b41ecaa54236dda46481d30e0dbfde1813ca1942437b2b0c6e8296e9d08080898f7468ae229567818f1482d96cb56b1f7d3c8d7ed1d15de27a10762b60d8a94048a24805bfe17b3cfa013a8542a3bb6fa809909390fe444ef83a100d41e777f66b2d5db92a7534c8f9d72e2834b024dcda38b3d9f3f9f7769a87d82233cc3eaca75a942bdde4054826c5253b9e6ca4ae45240d1628982b2b2bef2bd2f7590e926189c7cfc82abab9e77e0f5eb6765161abd74af98e6dc66ee169a3106247cc9c5b180c9e8e07d4b56a7ca9fd5412119205c973a83fc1f3f7efc29a7da7f1cab2d0127d60336afca253545d73dddb469a90de1975ba78540b4a89e270863624056f4e9a661b8939327a3342fe5d69d6a4aaf52c6ac8265279da8f5969768f55f2542c2c3fb22f1129d9dc233b240ad4f2e02d765ae515cc6181a725bb20004b1783c92298cbcb20d0395d58f15ef6cb5b2a9adadc54545cdaa67424687f1b076c9d4dabe83260f7123f3f3f34343cf4c25c821d2004c1e2b3e2d9b707caf8f94a464ba54456050903d018e1103d1721a5cec394e1b18c0ae2fe6acff470cb91d4eac017e68f602d2fb3005089ce070353535711f73a28c9552affa988e1e8d86f9ee038c55deae776bbd5533cb2bfde8318ad1ce4fea21c6a664ac3f137091006430d22ff00e191915c457d8ebc46599ba9ac56bea9f067b8d047baf48cccc5efd623c152c7b75032a2a5be282f4270ce47c1aa44251ba90338f5b9f25994d87397ed07d74632bac029c7b8c263d0f5bf442abcf2958b6468a78b1b20e1e5d87c6711d08d0533ad05690f104eb4ef587d4a74f56fc4c8efb8849a6bbaacf3199208d961f81edc1c953fad6d6d6155c38316b97a5ad72f13352c72fc2856fdebe7d5ef0996a6460d07bd305222e0149ea95b5b5f4127bbea7817954f56df6717949e24563251b6cf6fae2e22b2d91a7c5028c5ade97d61b7c162bd8a56c2c7d683b6b416e5afeaa29390ee4a8a7cb4b4ab8d4618600961ec917c441abef5a6b401c3b4c8295b01be6f8e9618ea328b959e1390c656b32467f96cc3bf444539cf8de572177189a3404f4a8e5fa438037b44e9680b7a8ecb3f84c0241bfc0e8d0a1033b440f1340dc1cf71b8ed0d3e4c971ef83ff007235495dbb1b47163c1290584ebe256c521906cf58580b0b5d5d1a1e1e76ee78bced74b546e59bb5f5a5b9851252d81ea51636ce79bde5cab90bde3a8f52258a990e351afbcc3ecf9f7cb178afed6efeaece1636c3b2af834ba20a7522f9e53afaf81dad85732f3feced1d76d6ccbfdec390bc911697bd8c72d97c98b251dbcbc130143131db6ad17eb4799db3797dfe550a1b8e3885e2f2949290c8dedbf155ec17c888d34fd814de68f9dc74ad7323a1d1ee43b54791c3393ea19d44dd0a7438c874944f4c4c6467677bd6ce90932e0acfa8c1e09ae755a407ca67d23834736e0c9fbd822e7f20f15c8cbe9fd5275568f0642c6334bb44a36a97fa4edbebf4d93b87d83526afe559cda38dd537d72761ec53f82362dd863802aa305e8e79a285305db0b614d7bdf9fed8f1c50e9423f5ee58f7137aa85156a27170f4b6f802a3c622d8a4baa817aa2706bdeadcf6275a3252d56927f501f2d351f591f58ab555851eb99648b1e2eaf8a8d77ba6899963ab140fb5c40eafb332b076555ec89f9503b5e3cb87900d34dac883aa2a82f28043f9a037a7dfebc66533d7f184b5ab09caf0deaaecf5154f7852ea50f587385bb4b64fc7ee34fd94a655bd914b9bef9e53a617b2621a1f878596c9f703b3249df02c0a2862a53ed636368cdd10bb816e8deaa126af898c4787ad5283e333df51625308fefaee9eea5710515b549917b6b03b5dac99129e25e2e14629868107f97bb8834671ea45464466c831c552884100e6ae26c463a09a517fd5421fb60af6f9a65de3136d472f2ff8d7bb3566a5e2735be94f44e8deac3a0ded9424d34fab5a299a653497992a45db180d72f8d4f272d96723ad5bb0e5df6b3389153d62bbd55b6f99aeea62b95ee77348e3b51376ccb261f9488394df5e78255c9bc108827211d66dd92953c7f949f6307d8dbac9253d7467ed4983c8ed9a05e6e417ce8b198619ac89d5309c463c6574ffaa89de05b3979117a90589283cabebfd7b8bd26850635c361c4682ad9982ad870daa9535d51d9be2a8fb7d1e0a45f86b58bec40e64f856de76627fa838ab48841805821328aaa8acdc630e2d47d766b6bf341c231ec7bf0ce7d19d2c0bb51fbf75f71e19a636fa78950b02891741a14d4c4cba4c3c9461cb77470e5cf769b3e0082decd77772447ef1673ab56d6696f5a96afb0cc4e9476d2accd4a4db0593ade7223e4801129205c257847c13e21141037e5da1ce5863cd4b5696fea577251d3f2b0793850a9b046e23d7a99b684eb32a249a3d5f8f7eb5ed613eb2fa9ca50f1afbce671b0631edce6efa4798d20654017dc099677427438c18acb559eb28be263f696a2f7223bcdd0c2459a3b1e9008dcbb91118b8306b1e245776c7146ca8d026ebbd11441838af2f530785ff45b7f6a28ed028d7fa5c29371cef49120dfdbb8b6637111bc0491358b57a6183f0a43ccee89949522823b3e69c506134d4320b622c0a62eccfde8d0284e729243e534c42229c0c70b8721fd84a8c26c394fcea8bdf894f30a33c3a3cf8dce7f3107730405cd36b55eb45e666a2bf4c28aeb72851588324b024804999f2f7f707974d73480a3f855f6c894cf3b4d9c1da0f655e33b81d1c1506e7cf0e0f4fd068eeb668139f724e6f185ec42cab05625c14a4cc2096d02915535ff9b018f44151c3c9cf4764305f95316e30b7f39c0d6fa0472f5cc007cb606882c414ed6706b1b95c6ee5437e25a8e594a85f82e785c49f2a2b24ba692e5186520d249847f0adf266da2a87c488892bb4c47ce1b955c3285a434d4d4b4bcb380edc2282be8fdde9d5e8faa909bade3c24dbbd7f627be4d0736539938dc4b7d9a82b5b7cbcbd352c4551e7befaef6f817f3809ee35757e1016eb4af862952ef52c3f0936f9a07e7fa1dbdcc107631f2f9527af85d870ab6a3674dbe2832b048ccca76c402d05182be9f3973e7fb23982872d470be06dbbd6ee4fccd76c24ea359654a634bef2fd1bee28d29be7801481c1dba5249b88b777b691cf45c457d8709df3ef3d2cd74dd929a451fa2de45438cb7ecb377a7c26675448b3f6fcb7f426b177c72cddb762ce8370fbcaff4f7d7632894a133575bb551766096c0aedfe5fe6c494c6fbbccdc3cd5fbd1323b238df6efc0cde6f93ec7d1bb5f1d80083db073fd404944d9ee77074d6b292a10c348651c3a8aac57032fe9bd144c8d966c9f29260dfb8d9afd3eed0a13110b347114aa4bf2cd6fa3bf9576ee26a6f4211a1c98e61234d550499d60ccd33ba8a22a8cb7f2bfe344b9ddfd91dfc5d657975d0ded1eca5793b5526815c8b1a54c16e83add89e8fac7ae33c49e3ab17abe9a7e40817167c3bc5bde1d32b9bb4f1940610bd25db324e75064f7a606424c3f846f0fe2a0d194dffc8eb81796b21810b4b1334975dddb8e6fa0385f1fe4b7c373f8d1651d4897f2d00ad15211650c590ea582c4955b72c15f9e886dfe1233191e02a8ad2ff5fb8328cb599c6203d9985154175b8466b0688a1f2608e0dabdfd38c8bd1f6d25b045d9bd6749ae712680074a60f6d0025c140c1cc686e3cf2c8ac301dcb0bb577600acdbc1bb92f9ccebada416dec936b790173f4f84786e016b807e61b0a8512eced2f1e530f24557afd2b2962675c4a0f357e1ae965cc0b09b5bd81bd19b4f62a97ee581e30a771899760a3ac36c4fa326b8febfe88c2f26565b83ff177f487563d937c4b9f5806cd784b2aa235c4d5d5b53ba7a6e3c311f4833385f17ad9e7418724dcbe2fc6dd8bda12293156569daf6a52dc5c9fd3f287be6b6e5f58a697bbe799778c579e7e899a8afd658afda11976c88c0142277d60408ffa768adee774a4d4ed5d6e715b57d7b770c231deacbb58f9b629c6ed157f7b86e7556cfdf4956f0e0813cbc28f23c88e3baa6085f9055bbf2533f9231b593778ac34d33caa5faa04f4399ee6e651e282ba0443f5818123c81a77fdfaa7fa4df0bcd34e81c64a3de626edbe765bd796a7d3ff112aad934c5c5f1839e1d267a9aaaada1a22096a4abecf58a78fdef3fc78bde74516df4e0554f02badeb7177aa34a3eb5dceaee4d82d4949498c2c6b702b9cc63e9d999cccd7a2fde1e9f28ff277a05a4cc58c7f300dd8d3d97c6ade4aab3b8acfabd19afd0bd4a0d1bcf77160a2ec5205d2adbe4b575733b4b5998d68d7537e535d5de8fc9915623d3ef02be844a73f4a1430b67df776fa97d2c0edfafafac1de14c17437b741bdf20ad1a21874e5632b2b155ab46acf9c7f2ca05951394c1cbfc066d94a59cef7dacf736c76a5569c97a3d3f7f2852fb7a28ba754134b0bfde47dc307fe8a8989a9d4cd3aeffd3da250b7c3c55cc3774824b2383edc3bb7eefedbb0e0e0ae425d9da5a132cf9a7fb4f48ccee546474757e617e7cafb6acb7296284856ece97412e761da7a8053e9409629fca9bd6413545870b65545fbd4ddae9c28d6f2f2d9a3259ffbeaebeb5f2db06213a6e617cf7514567e2f8e90e6235ee0d0e18f8553609cb1bb9bc1ebf3789d5a1be7d9f5b74aafbaeb9e9cb5856cadd99257f75abb77667700eaf17e08dc8ed6be78b62cdeda5041b83dd1e2e303697513c7d495de514f6231bad66f32233913cd534b2f97f976bfc09f2a52ec973a0899995d39267a7209e92fafce3099681797f28cc4643a6f7a7ab1c7e356739696d057f3cb3c0f285eec789fa488f0a9b4918bae1b1c1fcf35ad7932a5cf04436480416101fdbe0a7c4d5c30da1d028ce5719c3f62b23b26a7a7af1c405cccd6381fa4766f8a7dc8d0f0b965e9caeaaaaa7c3b3fcdf6eb407938a33996b79ca4e86f1e7d108c6e07d7375f0a0c0b5b9b9f3f43706eecececf4184ec8aa5f7bee4c7c9d4782d86660767b357b95f86a0ccce9c15568175757ad83c813cfdf20d0a44fb87e564e5ee5d6399ed0e436d14b50dfeb1a09c7fe8101eb13674bc0f837d8cf4ef6e7eea075f78c62ab0511db8857124cc10d8efabd61c64f06d61a9563ceb89e4157be3ea75604f2d443a891c160fc8d6a76d447ed0fc5269a2fbb35d7bd2f7fd335e7218c3103eecaeb7662f67a4f6fa3ba7b6ec49d75ed1fd297921f5978e397204f86c21b0377e15bd50e5e8b8cec6f204f4d79bb543a346fc9cdebe19341b19a603958e5bacd4c8b3e85852581c96be478b66da7f0bbeea8ad818cbb4d237598f6c8be4c0ea4fbf56144c59726a5eb8f48ad85d8e0c4fcae1da4fa104edd023ec3adf1b02d597542bf9452aa3822ed36607c7f9c06572fd7564a620415bed4bdcaf5700184a803a63f59454bc0a30b0ad4775590a6d86a84806f6309f4f15474e69327dd8e617bebbb75152419273e2729ef161e3401a2fc386c16039cede3f505f7ddc0b96379efd43359b8cd16128c5f8753073c1fbd374c39f8efcaaae701ab68cdb60679886a0e4225a6931c74f778367b03b38a442a22a4c6ea4315ff81849f224e4583ce53df30303cdc29f50005c9e72cb1183de3a56afd6c11a22660d5e4805cc215bbb5ddc35ffcfcfc7e29f5db3e2d868907a6b2c7389ceadbbfc123dcc7ff4cbdb107569108a4a13dfde055d5d5cb5f30efbebe1ea593e61d4e152ea3a2e4f09a3f93a1c94cc04797ed8119c1ab0037cdd8c4045422eee0e053eccee20b6b42bdaec04f5335c1ab8253b4fb298b7b4301287419030b8ed8584beaa145dcdb79116217b089cb5ab99c2e6fc4af6900b997c6eba7d3f965a93058482c3081994e250c60258a35fadf8b4784853d52f25de70b9e61142067101fe2c1012c22b069ee76b85167e3fafadb7de35f77615a3e705d87ebeaea582cd64a4573804164442ce537049eb6870cf59e0ad299f9f63841ba1811094aa7e420fad24f9e7d50af05b0f72a8bc331e616b46ebb7cf972fd5080b3906725e94319eceb5c5e35b8b2b2327b7736e772517131e1c993e978769eaf2badbba6263979dbeb0898e0ad869c289bd4d489a41b035a8a6b792f10d30938defa04a3a738785b970c390fd0d6bb0f9cdfa62465e0ac8e4c4362529211c76eb83f6d59f5930c7942f0fb791c97d5c3e3615f3e76ed2bf15e86aded0172b522c2c3d3499417e74858ee95176678ca71e0fe9753130a60d0989bba352501f3faf126fb03fc03fc03fc03fc03fc03fc7f01dfe17fa9e58bbe31745ff2b47b7e1720200b73eb63454731b7fe0bd68c1a44, 'are.png', 'image/png', '28887');
INSERT INTO `image_data` (`id`, `imagedata`, `name`, `type`, `num_dossier`) VALUES
(25, 0x78daecbc655495dbfb36fa20db42014504a52c5229e9c602444ababb597437b8151124a4a441e946a41b414109916e10915ca4b040fadc0fee5f9c33ce7bc6385fde2fef9fe1d81bd65373de71ddd775cff9ac80c7b212840414040882104a3e7ca08020273c1104ffeaa913f0c969e2f64504c15334bf7fffb1b9a115825c8a32d4d3130a8b48d06ca76d687815afaa40fa7339eddcf9cbe90d072f9ec4de7df624e249e85d9edb95150dbc832ccf9e3c79f296afa886af328dd11fefb8677573c3a91436ac09ed4c7a7be2673decb7771ffadf3ec8b41b57481739b1e7cb4957ca17fbe4c9243e3efe7d4ffbbbf2a7f1f16f10c31f726e92782f583e34345c55203d7ff953434316be41e6fd41a2abce24cfa88fa95c20f9d9ded01003c75fbd0af9287bcfe0fed231bcfeeeab2e0c46fe91692a91be66a6a6f8271e5fbaf340d4df77bf99d199e4daeb7adf271f7e5cc0c77710bdc76c4e81dfb4297be24480e6a9db51c7cf9eddcb3f7b762484369a2cea6e7e97819e5e96feef0f7cfed99195b1d3b4f157fccf45ff25473241fe61fdfa04ed7ba30dd204e57e3393f9becbf565a3963e1d2ca303cc69cce242623c99f95c7905e5f74dc38712fada3c78c6c679d77bd7b0d972ada2077b87571089a746d361d112db087215917c7057c9356171cc475ac934e570adb3565026a1a0efebd7e638f3873282bc19f96fb9aee388bb4674984a940a64e4c5b95ca4c4eca47adef819f34a17de365856c8725ff1e3b95afd5bc290fd9bd943e9d84077f5dff84ccda7bb36e2a8c979c5bbb9a5189c3b1a9d4ca7b692f93b5d4e9cf878858fcaad3e9cde2126d621c9c1246176635b48f460727369a4fc38f2af9f919d1623f27fff856cf9379cfcd7ef0d33a73cff7dc032e47f0efccf81ff39f03f07fee7c0ffb603beeab454440cd5a71084f2fa2ade9fcf4c026cf998933ba3170de0aab92bd613755e82437ee89199f087b429b7540b3e6371f4d58cbeb779783278273c1545f756efbf7f790c79f5d3b9ba6f78f866745bd4620a5cdb18b6780c416c0ff6b68dc8f1109ab8fac3fd959dcec33d396363e32f4bce3d2f9eaaeb9b993da4e4b526ddc7c3d3dbbcba88878cb21cbb82dce9fe1671a9416b73a97ce2263777d4732a5a6d4dcd7891ed9f172e6c2e8ed76a3231317d612543da990e77eb0f73abaaaa2aeaed4211a442f32f11c437ed120545f74c47bc13b63fdf88fc3812fea34f5557594343e3fdcb27fc051919e2565656e1690cc99e0a381c4ea3c256fffdcbe388436b5fae2a6e3e3399befa12e22b813c2146bebf15f4da29b979eb968cdc8fb8388adad5c633470f8dd12cb79e3715dd8db51eaf313fd8ec493ee0ca366e1ce50163bc7fcf4178f6ecc3701df779baed7def8e785eb621317c5ffee985bedc9b2c2c7d50174bf53e1cdb1fa9df8f5fc06223b499115f99f3bf1184262723839e9b9b5bb22be9a3939393fb427666381c8cb93dd59474fc0c197b145db8c55e640ecca8a73f5f13977a659ff1e8c6c69e83eb2b87072b3bf5600923f233889ee1610c6af499106a41e79877b3e9d13a0a5e5ec2fac4be12c3bfdf65a6a4dc938a6695712e62f727242464e2e4ec79264c4747370c1ed62746848c021a9318925caf0f7d3a860c52810df49a838383e74b0774387b9af3746a353c3617f5831124b4e4817ee800f6e83ea5a5a5e653cdc1768a3975b87ecd230bf13f13467c631b23ad11dfcbdc5c5c69600718b966785a63e33dabe11226b8bdef65b1c1a743197fbca1e0f8a86f67c75d4007b943726e130290e4e8d109225e1a51515176c201baae937ee8ec4c48f5894d228a8a6ec3c7b1f2656cb51be17bdef5e0ebe8c514bc8684fb83f8488c391a0397bb7a7b8dfab16ebfbe3028abaab6b80b23346ecf8463649a9b9b3766e26de270ee309ecc7ccdf2f73ac4082d1eccfdbbfe55887f215b41e7c51758492d79f90f25b7ffb9e8f9f3e73ffab11073fab534c84392461aa4a1e9de777cc455af798b56a7d6bdd47969584cce0009156aa469a787f9ecfc8c908b51b88898e01d9dfb003df72adca5c46ddd64acca492a5c494d2d4b269e87ae5a0d619f3ae5c11edfdbdb9b959f2f13289bada1abdbc9a8f9afc788c3a515369972c92ac6c674c20178a869635860164a2a2a64bce939132b03356eebe1da5c484cc4290f04f97207bd804d4646c6c2c2223c453800bbb0b0d1ab28f7ef276906252b38c11886ab9c6e29e61cbb138eda3bdc0fa0c1b6d37971f0fc4044454acadfe68648fb69f449e8a0eda6c4395bcbd2d21ed8d4e2548e72850cec7535168510172b4fb91f9039988102ed0dda13ec0ce736f5cacc30981e48afc6c81c845deae8fec1e8fd55ff1716587d8c5e94959d2d0f394e9aa8505a5797245f86bc7a8046d1902f5cca6ef55f1690847111febf5aa018b540f171347634e2e2e2c0a6b4621e24037d7df3d999498f9c8b20a3af2e7eb064f77ed407d8600e21299d4d00a4198d1a99a3d99418b68454247dbc78f1a23425beded7a3b3217e832979e3e4cb204fdcb1f9e54779d973f42842f4510a531e2485901ad5ce4b290cb77df99fbe3b597cf71fb4ca503aeeabfeec1dcc8012cd72128a7f23138ba482befe5b1eabe1c84503bc86fbf72119defcdf92417c089c731e4d865b00880d7ffd9705d49f093f2cfb93049f64b217b676b96dc66b8cc80991192e34682cd1a079d1d3db9b0698c2341c515150202b278c53425d474ca84f1c6ef51f248985280d0f420738820e300840e3238eb6202b4b6ff812e240809efc07a0b9522da51e3ddae8d7b4390aa55974648b47be79cbb006e8568a19607527c18f513ce5f1caf2bf53e0320cc957fbdc6fa4818af77f0105fe81ef4e7e71febdaadf3730d0b29f0f206a3e8d87481ff96509fca247f41f2086cb6a3787313b80ba9168cedf5fdfaa3fd4bee2b5711ec67a9d24202b3d5d0c20eb0b2b01f29de8c849d4e0a476f9c4c4c45fbbfb763e82f63f5f8450f1879770e0dd797f7ef3ea657b07076e9f034faf9df94c0d48e5d6b6b6086d5ae44e6ff2c10683d548994cf8d14d68d09bdcf527a20617234153ebdba73c56bff15311b909d1546ab14a86f7cc47b64c494288c1cfe0b9a39347caac14adad0b7efdfa452b09e2f30b2b09422ba3ac1c75ec89aff7ded415866ac6a3623b5aec23ed8cf7ef2a6debf3ffbf96537d61fdf36b68a01e7b5659198fa4829b1b0c6b005fb4b92b55829b8f8f5172b8dc66027f42144e5a0c382f7274b6d0d5f5d94ed5abe71e5f3df76d6e6e2e88cad0d6f61b153e1c79c7de78129801bdb0b076786462a2f08d5a674141c1e9ad5d3a496a6aea5fae42c47b9710a45d3954f4e077d015c3a6e784adeded096b53e86874fe196605715353937da596bd40a28ba7152d4957d42dd512a32f24fc5487873e5f9a26df5d3ecf55c7d93c3797d538f98ed6bc2b45cc7d26d6b4c4ac2b4532f43c913f1ad282af5b0466c69c0f4ef937ed4c5d39cc324d729b0951ecf7bb774d787fa3e7422b89876cff1adce97ad88b83cdf27ac92e87e05af1a9c2a6dfb305dad5f4850382f36e0289b26008b1ebe7b5ebbd1365d910e47bd87dc88e06aa62930e0a2747c7875dcd2460749be7fefe7ddfbee965a8e442b25ce263a4f04ce0771087400aa72d1fc94f1474b1581a2eb5e7a3b2b0b1e1ed2c2d2b6b5e9a4d0d1551f0f1a9a7cd2e2c9483923d13034e8e782dd175be098ae4edc987b424f2babac950e52f12f8b563782c07df9494943075f2921264979428ddb871c3cea7b0a0404556366488c8bf096eaceae151ed6625291950663964f077f2f2b235e78fdfdf3f3c85c08fa0b59aa8d306540f4f9b9999a9e080a29a555aaa1cdedbd373c3bfe92d78bda08075dda570209758e4f71d20685cb396da858b8b962ceaef3f6acd0e62205a5619f508af00165bbabaaad5d6d6063eb8eee2b904e677f7f0b878f604c3626a71b1226449c66c2e1d1551fc2c58e422b8818f2febc387bb3d4f7954d82f29b15fea5d5d5d8d3426f0bbb7b0b858938b3b0da6774b564ecad6899fd3ba584b34d5c9444a30bfb7bd1eb1ecb1e761a03ec028ef6650985f4a7df684a9a5f60928682e73dfaea5676662f7b726a253f0ee2e3a5f4f4d4d85a4e39c7c242efe9c888aef2a10cfd55291e4cebf08750a55c14c90b6ad1d1d51b4b53b0bb933b8d9af892f3d0a2f6efef6acab906729fafbc31ba6d091259e27f210c4d1badee63a5bd3d1ba397979edcf84e1f22777ee7cfaf429a3203e686225f48ceda875f97675a9686e023896e2f2e5b0016cd4c8928aa1612a0727e785fe6495c11b4cd63955a829f94802621e33dcb8715f3653f1ede38770133b7d3946520575f55891bdd5a6d32d959edbefb7cfd2730a09e56d6c38c28c6e91127cb292739a00eec54e79943f271b2c907719e497eb85873c0c3c26dd6b75808a30785ac16da4a4a4b442b5c15dba07bfa21f4949f5e81eeea8f648a145166083b37077075ba8aca9794bcce3acffbdb715dc9e79496501eec76fdd659b4a95085d182c32b42314847ad4dad9996caf113d39a93f3d3d2df3bb7a64a93fe00243bb1301644c878db721854de41b72473eaa1041dddcb519d5fa9da88329d183fb813c3c51d1d1f15e09822e5f6b322b2bd56942253ee83d86f8cab82673da9d9f9888286e8b69388bfb603858546e6cda050f7925f4f6f1e7de1bdef5ba1ff4bef5de2daa3f9cd2ae76ee102a13af7870fdbcd7ef497f3b5c60f371befeac2818614e59990ab80e86417fe9f2e5cb5d45862d4a8f1fb34fd662070a934b84d02a57f255c87baf82c663f1b6e2ebe1610d16dd3a2d70584b0875440a2e118aba61a870c6e8a85670505056662683759a6c9e1ebbd9c2416020c1455252b3b6d72c3b3f5eb2458687a7c4f3da3cea72ff46e09787ed1e19c1dc4b04824b4725d90b3aa47c8425bacdf8eff80806b9b8aabd46bf3333a523e536d1b48990db81e3179626ea7561e6cacaca047f1d5b585951a52509c8f5b8fff6150707c7cfad5d865ad33557a15fdb9e165656cae6e6d9b2097c6f21a58e1fc3037ef069ac1840ae9d270848e37711dce6e64d3636393131b1f0b4af5fbf562c7d591c2e6d7b766b68686827da673bfa59eddf17ad6c03bdac20c6e7fb2808fc7ee2dc65187bc6c769b67472f51936b9a7fc9a262b743e804b672abbbb1538bb190026cacafab97eab15622c2d7b3b7d0ed6993acbdfbefd20c4cac4747b5680832365acda257ed6a089a670e05672a7a9fbdd96cd8dd28f9bbd5ea01d22c3c2ae89518618483052f3db3f08e479c6a259261df6f0011ac7b519861efc0c0b4fa846567987aa4e016d51d0d149e2076990526185342cde1610c881213051185468b12aaba8c42d65f7bb06101ae8b84d5f940c6f9a7c3858f916202fb0ffee84d7d6d8b3302e72369d48dadaad710f8592ba52f1c5e67edd88bea9b0871f4719d23233dbe61d5b276de78a3b457a1a1a7c4f9c380133ef78a126e5e2520eb22d322989554c025fc664e8bd7146487e7e3ef822aaaaba3a2a39b9302181eac28f8d8d8d8fb585804cbc36e35ca94feab667e24fef962de8dd7ab6fdfd2971da9cf0dfcae3831ebec66daf25c36513058c0f7800b0be7e9545716f6fa935ead6859052af5d6737a124a6015e0052cec991e5b16aa8641d9b1f9e9e64f00240bcf3be8be538e2bb7b8ec85f26b40f4a9a9acf769bae34e3ea5acb15b961fcdeb861e929f114a1c3bd75bb9e38b596773a1eabdfefe66b943e9ab4555357575728f9f0058b5b00a51a82655ab4affc31bebb396223e74e63da99c41daaa9a1f173cdb5c4e013c14572f2b669fbecdc5c297e7e7e3b6173f488a300aa062f1c533f739d41606290c9268f7f6fa050b710423aaef4994126a6c89d58e2faf9442137fbd6a496a9d9dfe5f712fea8ef6619ff88e4649b99bd724747c7cf536b8ca404b1576fca131be50e6c28053fd8dd5ae19d543731c900c2f9737d9bf4d45f1bcd9436667d39ca1175e4c8aaad938b0bc6c8e88175b9e64acd7a0838e2475926071f9f194d4b0859aca8cfc1b3010da7f8be27fa35757522e8540beb0faa2e4779acfd10833c1dedd555b914f919871de8981a64ea6a2efe9b4eac29f1015ee7eaaa6de39bb6495bb3893aaf8c1be28bbb9c1c1c1b20a95be71d9bb5a31fccba2ff46657847d0e2f01bd54b134dd161ddfd2ef15e24408c4b2dd4c174bc3e0bc61cf8cad2dca7b677693c8ff3ec8e19bacac2a405020f986acadacfa50cd46d57716415e3183c84346531fd21a88971a999a62a65ba386df1bbf1c4acad1172d6b31b76c6a8288139c2c2dd26f0fbb21b1d1a7aa2bd9b5aa0f531e1b1bbbc9c8f80243bb8342ece3c76f606ac335bcf2a186521212fe6e96dcbfd2d2d365d4da0729844989fc3b361c8a30276478645e364d3e767028be2c1f111b9b0d20606c6262d111c74d7f27a096156e99d1f579da3eb639dd6b77f3d3d2c892730b356759d85c7b2ce72ff75abbda77f9a524061e975a4244de7bae77f05ef84a272aead3fa4ea20bab2a2fff16c06f7bdf1b7cdc6db93256ad0a49c04582d7c01c16177753ec694c5d5ddde911c5bee9a21b92792164e1edbd2645804ebd13136cc04b5ebf7e7dba53d3496ad1d14422842ae04ca88ecf3e4eb28d44b350abc256bfdb7c48c7734d6cbd222ded636f40519eeca508ead9df6b53022ecb093b3b3bd2fe410707dec081b2debcb9ba5c555256b600119fece81341dd33ef1887013558545135a68145a7e6710d1357b646d237d49318929f9d2d19e86caf5e621656b9b2e65eebfe238021a39418417cfd8399c680f949400cf30a4bbd0c0ca4b794a37316881a4cca0ca0503798cd5b5959e115b6c8df5ecb4faa57b91196a21f6090e1504cc69b14544a8cc979fd00a820bf8965e7f8a01301894c8f81a494d4cbf89bace74e7d5ed9bac5c9d9236d75c143dba0937b73658a5cfa6b6767e888b34062ebd7afaf0d8eddc40850150e608ee503a76d8932f6949b1d3437602e3a632147c7a325e8b199374473f972c0995590c8c67e1b81b253d38e0253658682dc415b7beb9df12d3e40c9219c6549555afc06ddf5808e02cd8d38716ba56eb78034ff64be931b983d6391f99ce6d6fe24b10fbb62dc26603e10e4f9f9f985a525ee6b01b4631576f7694267437ae2d5f3ce730351e901fc51d6d129b8c0201b339bef113258f50b2cccdbf28205eba886dd7876ef1a5a811eb10be73b11db6eff32764818c47201ef35a7c6d4008639f814fb1c7a03b58c5dea143d4ce0065edd902786b25761181bfdd5a17a9f7a32160dd272ea6aef7657156283e033fc06994645795a95dd42cb7373ec0e6b2d07a645333560755546528edd320a197a4319431eefb079600c84c4c4f1496d2a37a49c9d9d1bed8392538c6b40ef6467664a747474d8612f52f3d9ea353af1bbaeea351a06259bd0d3d11937da018dbd2a46d90fe4b0c34d3dd82c7ce3571b5b7c8b9797d785104319ea0b1881dac88b9c069f979c31901d17caf0906289bb779f64d7e7e6e4402cd03b97481b1ba787d008e76c4df8f8dcd3ce89e1f6a63587620e7452e98f588a8c8e3615507a1898cb901772cacfcfcf4588387719bbb232e07fc51b45f625c891c01374fdfbcf2e8643cce6e4e43c9208a5813af51a2e6e677cfde06b9230d4c34c5091d33333372f9dcd494ffff4d743156a4ac1c6ccacaccf5ae458adcc91b56bce7f9538c9b4c8c955033633694cec7a8a500bbb2b013fe16da1a0a48cef2f32f06bd2e7d4c8aaaad290cde4b48e97af42103d9e1b47e5de13c4a27df518508601e09cd968d65bc9d197a9da58ca7d5f3b438d1925355691030590323eaee3e4ecdcccb247b5ab81396f216358b73358b99e5f6a05069479fac5c67b9d9229e32dddb953668e8ebd355f6fb6fceee27d6dcb9707f3ecebeb9b1f2ec500395404317779cd305f102a897453586943698a7064bea15a4be2a3c5ed65e0194221560f5e2e3db10c4ea1a0a6e66e09d09e9ab5feebe9dd0b647dbdbd73dde95226d56fdfea0f0bc7e321c49d3efb033ed9a9a94d5c8b3e3009bb9100b4c8abaac69b7fb2c060fa2626aef0c639ed61f2e787f7bceb4fbbddbc79f38778be5a4feca7c0a5bddbb15066b3014c46fdd55a6cabc7720a0a7852157eadafcb5cc67fe21b4bd40f5e07e48f08d1f9f2e5cbed446e717171252dadbce6667187b3589dc6495b54b2001bb41b10eb22ba1121c3cb9bd434f9024b95f2574f0f2bf01360556054d016262cf7c506b6aaa36d670218921e032c0b080844464470ea53a22e30a4e24090ad0f0051629e180c0607388e9d0a1555016a3e24db3bf8dd964f3a550e8499a748b2f7af8864dac58b5482a1b5132baa7272a1c03fa49f8a5bda8c0e0e6874ee7ad609ca0a9350be222527bf2528a819cda6cbe353dc983a78c77c7f07d7dadacaa1ff1c08f5da54cb85659ff11a3701dbefbe302720963950014056aeeb6034bb9e67c10441115ae8e9018a4646467e9e7794e5ff14624011a0a1a9d9c198b9b8b858f1ee131617272e804d302cc4a49c17e991575767122bf4d0d0888b35c84c4b336a6cec427c873e4cda4ac7385b0ae0798128ec2fd0ce7dfd9a2c3d2d6d2e4a55a7abc66dbd7dae67302c17d843eb972ff28ca4ddb19ca628b160d1aee29ab40377cdff2c725dfb711af7fb392165646c2cff245599d548464aca75ed0adbbb139eebc13a5eb8bed34ea16dd31c85582cb6a7143350e2b9fdcbbc4f1ec4c37095532eab4e4d964dfdbe0a1313d323199944f69d7e2036504715f9a8fa07747df23393bd35d8ea7e1b8c0acb5b58e454fac732c7303133736d3102e626dbe65311f913101000cf7f037a1448b8f97c77ba4699a5fa28b794632d3de74135bb37e57f72281dd25226b7cca22f07d83228e3acb76fafb146828e951d8c1f5c30df1b9938e0b14e8c0d0c0c3c5d2b536e3341434e95af5b7f10626cc747b53037f70d744eefe0a059c824ce1df7e1e49598136420a766664c4a4b4b99ce9d8a79fc118bb3383cd88fe009e14f942d85fb43eee71d1a42bdb29bad316e3b32ecea64935dcf98b1a9e9849d559a1ae47ee819abbc6c6b03385d9acff48ff01f77e0bbe0611d0050164a76cb2c80bbefe1ab35ec375a0eefb1f8b5eeeeee0c66390d8de1c8c2229d72980a936ec48bb6e9ee1ce5dc0c9c4e745bfadf7ffffdac736c9e2a7397a24d69d6331383073a3cebb73fa8900959e76b08429cccad1d9d66ee772186bfa9a9a9ca7bbf6a7e1a23f372c651e0c2a62be189a77140c6d282c5c21ed25ab3bc5923a403b16cf2ac3d45ec25fd06050d35755fba54f4463b67a734ffc55690f25f13057929a96522ffb517e06dcb72e2b326fde20a9c91703c8bcaf762a32fe115f6cd49a96dd3718e578a14dbe9040606f77138dcfc9069722d167b7c17705a019434102d06e954ae0b71f1f1b80ede09b3a6e784260f2e7d1b1a62aa9f40db0a4b23e56c439ff090079f0e7c140d0da782aeac80422956170d3a94c3474659349811e4e1fbb55ad595de08270161e7cce196c48c6c3b81c49e85d3584781954ad35547fc942ff7f2e7650b39c6743e28e2ec93964bfeb4a5902f1ba1ff6a68a13fcbc44f88fff5bb6f07daa5fce7e76881e2ffe3c04c02207057579711393edaec02f90326fec27a024124d12a8af8f2d39104cc35118b2af151c93acb4375c5d7eb5b7afaf429da3c4424a71fa26d398791106a412e76f6578b0648cc532831bda3a309f07b68426beba34401a79b439f10f693b8ad2dccda8f4f00d652e88d1e1288c368c20d2c2da50b6b3729f4897dd3b63fb179df7d7a6e15090e0e36efc99079268c84cf002d4db73e89b49ba32a52c8f1fefdfbc3356ec5d6635574923799997b3185b5af170df05c9f8dd5b829428e063eb83e6373b8217718d9cb81171abe527fa8b3bdbdbd33e97f855612ede7d61f60ebe9abd5101afd8085cde4838d4c49960b604eb41dec9a259b2c920f431eabf3d20c2ff1d8b24e07557d746eb9f59802e818ada7e77c4f9afed3ec75f290940c1877c7e61b919f69b861e9395687ea143e7c843dfa763a25f2fdadb98545379bf7da19f4767222db6907bbf587f1ef4e36045539615f7b6f1627cfcf74c487a741f61a919f764d2b292d358718a25fcccecebeb688c79e4ad2b7f4671d0a41622e5e9a84013202dfd4efc7aabf370ac8c9cd2db59d6c3c7a36b3fcd357470b4dbe12e2401dd40b67bf30242b7979093b09fa5ee6561f3b103d5c17fdc24a8120c5c7d06e3cdab39b8790e55264aed9e8961a2e360df5de48bd42576d06537d26dcd07e999252515e3eccfb707742aaab6a6c650b03d00e37f095b8e42488202ea8b5626eff3f5d9121138ff6fd43f9289ef9c6aeef6f4ddc12159d70fca9566e9d58663df6488208e10caca2467ce7af8127db5ff464cae5be7fdfdd3e5f0f96eec7e2b14f999d3b66f2f5dbb7573cd6a3660b9be1e124479f668de0213122687f1f7fe09f7ebd40e6e178ad472964ead1fc434e5cd39b01f3656764345bc239737ee43a0f2d6211a11df4da0a4174b1eba4454b0835c5a54baf6841f63e00e2c0fcfdac5e73d7d5bfdaff09d24781ce3fb30a0b33ad4ffe796485c7d165687cdad46d67c4f61ca647eb7427097bc4f45c69084abd7b2ae6b2a1a12114ffee159f430f268df2dd7faf65aebe488588fd3e7e0e027c79049d90cd789e66b9b56438c19933a510d9e8a8a9ee3c3dc7ce597778e0313d3b1b1f42f5cf62c3fc673cbd66f9727cc476056d126f4d6fccf7e4e4e5719de15b19afd50422fd8595cc97df17666c729690105d54ccb03e9c4b0ddde83cdcebfc730cb5f12edac1ad30fdd71a97c3ce7fadf0b4e3719dc2e34ccdcf9701f5a850627dd857e89d4eaee37a6de8d331f6938fd1671f1e3ddbe81f93c1e5aa4a4aef7c397dfdff461faca4a2022a5551816b31fbc860ab8fd18b56f58ee6db3a381833eeb92ec39979f8cf92c7cc069cf1edea5f42aeff6db0e130c3ce24e1de25848660c1194168a8500f9710c29cd6673ad00ca1cd7ef7ee713c8fd5d190cfc39089c7811017eeed79f684a5c221c841da45bc7f3d1b85b68cff188b9c8c6ca17440a707cd702372c206aad57f2d8110de6bc0e7fa67bdaaca0bb7d0e7be543ab0312b7ac80f9efb33fdd5efe8dd96b38a8b15bdeb45976d40377681420e57a1471cc8e1fafd33279e82ea0ed91d59f1de12dc5f76a997d28845dab5613288d025346c98a8051c1f1e2db19c401e867b8a5c81abbc04dc37b2804046689f455ea111e6fa06b5b2e2709955bcbd8343547434832458fba17318d27ef74fbf6d672dd427613105295305c2f0f7dfc7008fa4c281e801c94533cde12c9a8dc4e3a2f4d5ff290515a27f89fcfb0f1e0914c4fffce839fc1f77a0818a5b4828efa8bc192afc576debe1002362b1f9a0226cf9a052b54bc211b4721cd0930408bdf31a99ac3e09214924f1fe0cdc8a26046a64fdde349b7da556785a4d8d1068815b0c0cb3759b9acacadcf30ebb9b4bd5b3fb3af5deda6e6e6ee0c18a592f5a4da08317e484aef93fd564455c4941260136c8c9662a8e8d8dfddadddfd2b639fef42ed0303a4f566e6ee5e3c78f6fd5ac545509cc8b60678d287cd838155b066b3dcab558a35bdbdaae0c7aaf434dedea3abf3538b536ba7e60f2031dde62683ffc77f92e1f555249d135a8d2363ebbf109b2b3f7d9069458b52ade9495f1f47ceee9ea5abb43217dec89effbe2e2a8d8d86de4d1f6218b46c967aea0c1a8ce594529a99742349d911397c726058f23a1555d5df2c29b838611277e16e378df03d18c8d8d052add15c78da179588b1b739900e2087acfbdd1e125395b5da197e867e4c6658315e365c77aa7cc955ea596537f1d43172e1b77098c498a966d407c3beaeec606acd020c83b51c87124c3dcd15109cc804a85ee9e1e868d10c23f4b3b800ea39f63ffacd3e46b552adc522d886c9a7c0c961c2a362d35e9a0e879dc353292bbbd3e7b8b8545269c94c0cf71efb71ddab5c50c140463de5da2a1e9fffefd0ded3c68813020f0d32fc74cd92f45a6049fb1b2b2aaf2dc7e2f202818151191fae1c3ddf48c8cb881e7f7aea14dee3364cc8f7574c69f7931c39d5858582e24451b51509114b5c6c1b9204ebd7697cadd717daad338f78eba7c87b2d6f3047e25301a4222a2d6a9b5182fd75a1da0c0b268fb0ffc05a2d5e9c7c7d3920adede75e667a9604838ec40a9e510879393d33c00e2ccf620d67179945fbbda5906ed2b8220d8ce6be65d556b91841f57af0bdaf1206c838382e63e065c68ede850be7fff29ab6e5d1eb1c8ef064f6203636363a61b37ee03370eada679fd608020e691b2725f642a1eda2f4017a1104bdc5e7d0421258fb4c0ced5d74e8b5fc46f199998dce4e6c63de1cd68d4c9ab2a282de59e7ce10f66864a0a9c2cbeeb4cffca6fbf33e43fbc0b3d3c3ce8247355f2c35370bfc0e632c297031ef4f6f5714f7abd0643a00c0b540c6f7d8f8a17c9eec8c8d0503637a61f15cff497d46a5c8bc0d5460b2c6282be1b381cbae0075ee1de7dd75a04b682f8e7e6e24229322a76b4c6d8fb4e8dc208c45e927d99b69f7fc956c78e8ba0757271897708617100dd54a05bcf2a09e94670c4eeebeebd7dc5af434b72fb6deb6f0ef5596a227fa79f9fc32a76e306ddcbd3d3c52a2b2b7fb90a41fa5a989bcb3f7af468b4567ab154bddebbb646c766d4347e6e58abde5b7859871e120d12f4d7b6e76951394caf14987b54f86fba2eaf085aa883a0d91f80421b00c954623552767aa06bde7181b77e5b6674d6622c374fbbba7fd4c372e8bdf1bdabb8f2fa7d1960c01ac526c1953401751efd221eeeee5c7c7c59bce3aef7dba2d9a27be695d82fd564ae8cffeeb47b7f14f86cfda89e23423b1a6cad4dfec4b91919e2e80a68e7c9a728d433ddba25a55aa0258fc1e49aa7ad6d7b4271e96f68f05dc062a3e2e33119db029ebfdfcdd7529e3da1aca262e2ee01a46117a60150830a7fa81d324fa5d92f29e9e824b9bbbb3bfe5ed547a3e4d2d99b54446d2b5b2d1d1d13fdfd3ce64d79132bbc6fe5b5b51341f4d39adbda3e86d4ce98cc031a101575d418a69d1f2c42eb73dc268e928a2a7262656077a5be1015bb30b630000bc844d0524a5a5a54bc68b3600082a67dfbe3726a49496fe4f6b7b7f701ab7aa26ea93a4eb75e8411641717f7d41c0cd41f9496590ea540b59e03ce30b397b74f76f1e2fc884dbdb28b4b397a2427e726e4061315d12d36b6ce3c1b2555d54cc0589491515353b7b6b7734db6290dcc40ead80de8036370df1a7351d6d52d84072dc033ed9295e5e44275bcb78dc13637050535131313ed30cc3238f563017f1dc35b5fa10b83b4387e0c2f3824c40280e7c91d3d8d43f554e2e58d64274b2c6ed2560d6d69740279eb51138c1fb8102fe94f441d67afd12ea14c4b226f635308d6827f64ac5a97c83783424216e6ba525bbf7e55019edd9fa79e9a9444c34471ced8c4246ee71a0c5fabe9d34bf2dcbcbcf6de6870ab09177675f59d4a81d6e52d915c9d170faee7e4e474037175c22d2883cdd19e1e05e8d3efdfbf3f9b185f73caff94934b9a8f81f3b37776dc417bc74c6c3ea4bdeedf740d0465a8c8ce4320471a40fd035fbeec1b18e05dc20cf6f7672c2c58786d744968bcd37b4244c5f706fe04294fcd677b67696969a6f4ede3cf91b7ca58cd31184573f36cf404f003234900232faf2a8ce0918c8c324c0422a8a35e2e77d9d2ccec5ba3df995297151dafede9e899d17c77970f7f1f87905080b0c9be420cd73f3d49dcac1dfffe3d07a4f4baf063696ae144ccd49a2b54a7b7100e719dc5e5e503a38a3f7ffeccaaac1c1abda1a4ac1cbb23b8a956946ccc47a5e2e353afe38553be484696535464d728dc5aa05dbdb19e7ca875869c55c9ceae68fb403dd9c7dabaa040a7366773d3395fb7debbd1856eb3a2dfa5302fcfb2d1a5b3eacaf6928d4f2e9dd4ebacba3a91c9acc2eaed65f5595bd109610461afeef2c307eaf5db53c4efdeb56dcfbad3c2a1f9e2816161e7a32223e77e7e89b0ab95689a7c0758e236016e0199eab8b9a83efdf3e7dc7aa7a8aa8aca6b0e4e4ea7ef0d78ca4a4a9fa7d6cc2056f6f7f7055c57dfa8e46ba40353c8cb6346715ea7706043680c38dbf5b017443442681347869ffb45cbd46dc582e095db548098c3c3393333263df8bd806db985751cb56912e2e268ad02d7e4ab15dd4357187bb054229e835ccdeacda1ccefc40b1e5c3f0f31aa5de32a8fd61160894e938dc7d3d3d363313cea4f9b5baef858b6f68e8f170406123804f5f62a51c3b509ba8ca41cc99226261930951f645cde50a7941f3fd61321c78c58fcae739c0f7fcda299d1dfafc2698081c960070a555555a32b55fa1969fc9bcebb5881d7fb0607cddcf935074418185a825c3fb7b62a383b976d2e8d3064f664a37deeacac875e5e5e398585d1801db3660338323d629a5006eba593d8093fdc3e15dba6cb47f7a5c4febfd677f7edeadfa6a6a65a9899b1df105c36d526a916f039d8cb4bc8b0a407a603b9f928dc19ca9ebee3a7ae540974d9be7020372e2eeef40de2af09fca9414167d1cd45335ef9f9f9a81cadd129042057d2d0c80193e7d4d7eb32c82545a6bcad1ac02a03634990cd54505050d2d4ccb5e5b3f4ded2d4d484da5c6af089002554679d0cd47177c02addddddd299f89255ae6b29a3d6e51a9a9a749268c145d30b98454c17335bfddefbcbc2f6077bdb15eeaa117961aa3a3ad6759c2abe3725211c51f8abf3da8d4c4e2e84482c5ee134fd8a6ee8a592e1e5e04881d8e36ce5761eb9b95ee9302b5d99e4b1ccbf1e6f3bd54c482de8dcbe3742e8776f617e3eac67be975874ef4d73b3b82271665ada5cc313fc9b6c6c0380105322676e35bccc4f8562efb5bb295311bde62a84ca00140e9797add1f67db892a222002bd7baae9b5be5f0c888b296163398ac53f4d0b3712529658b4ca75015fe49bd660ea3c5e1709fbc58fb5d64c3c12ced4ee5206f60ac39e03d98682f3c8fa166c27e7f07c754ef01c2d7a4a41f02be1052787bff60f760597877b1d8c47116f094de730b417cbd50f1c3eef798310dbc920f3ce5defd2f737359e2e2e23fd7b723e3e305df762d2f0e152b6cf8ecb158976b0a0b0b034104bea5e0e454bae75dcfc1c1b1f15570e561f8d7444106c99d85dc42746531760baa7bee9b377720a7d0ed63b4fc5444eba28b4584742e53ad51b7c2d34c93dc9af7aca0c0da11a2bb2132f43b085e8b4b4874f08b6e8d3a5ce85fbd5cffb50198864c2c1dda35016ad0faf9333b5eeb80ae0f4bf9084be140fcaa27789649aca9242c2cacc29055bb4a09c06fe3c1a67b6d866740e3bbe9b668a9aee694412bac50fdeeb26047b2a86e60810b29a519baa8a8b5055375902d1a30b909981c414b78f62ce3b9531fb949619428133d5a587f3763709f8fc60b383ce4a585955530868ba6f04822ea76747440caa28bf7ea946d71dead71bf72d3d26827491f4146a05b30da23e3810cf52d8f555f3cf597f4531b77f72ad27d97cbb78485bdeead720b08e4848410ed6f96d747b54d3fe2539e0274a2a0a090e65bb6af6c274d44170aeba702439a87dfe937e157bd2f1e7199f03215781444ec414a9dfdddb91ab75cbd429f6092535b3bd69b1cd87f32b0df58e5c66eb662e6cfad5da7d5ef771589a9049da50379deb4d4ad84faeca5d6c1fc99346c18297eaa112e280687c7b7aaea7a19d729061e94558f59f7b8dd0f57c953d34f9223dda3d3a0b419af719bb10332eb9610176741a3494d9477fe13d496e14a07d3467b1353d378cc5e07efc4c73e7322fffb434343764f242c63f364cf93150e60443a2323492bc7962bd6d18d44b4e8368b495bd77bb34418819279adf835c863b486e6aa164239e8f2cc28dafddcd1d107c21c1094c285d83000281de80280e6ca935f3e7f7e0c58a4758964b75263407833e9134120706788369213e245b37992751ee11b4036faa4cbcdbd4c9b265723b10f6467ab4db54d1164750eed38e91100880461cfef80b9e2f8e78469420113fababb53806d141fb4fe3e9133d81cb616cccb6b3dfa2aa5d6b1454a46a60faae1d438b960fee726c7cce6d7d9fdab45d2fd7cf26a6a59903d503f51c2e4be52bb453fe6efa49dc9b9dfe3d029cc3be95544e3b3b7c6546e58bbf7abed91a4641889e773971e41d1b230b5f0718f95da0a715d4c3e0a0b6eb53a3dec844239e8061fa68c6b0e37eb0f708532a7561c053a5e5443dd824ac4c8c626e74f7c05dd7f052ce4b4f1d30f6fa0fcd349d2d1d101c4743dc13fb95cd95e5b5b8bee7f1b59ea879c7302182ab6c22d863eb88e261a7c088fcc84da9c93992901b10ad363bf9102899aad99e14048731c0dcc1f9f5ef6f5f6a6c1908c4d4d73b3b23e733d58192a96d0d6d606e6b99a862ddcfbc9201ab0cbf2b5adede52e6179c1742966809eca676f17287f5a3caf8d6cf51eb1fdce876cf1990522cc6f468a1cda1f6bae3f71ee38dc802e66be3b1ddc7f1bbb2bfda98aa152b50857d07cfcc6947aaa0d0b10d05feeb517041e4b4b1cedf77a0932155db81f1db51450517bfb0eb73bb9be0db110675ba2a8ab9bfc675d8982dc8849435473a568b983de811733a9462d4552241e1e1d1989921a40a3859595e4cd3ac34a2dd6fdd52662935deb023660e0e447d2f3bb7d25896cb1b18c360caed46642647b1f5ddc8f31b7807cdb68bd55f8b0eb7bb305ed29bf7bee508dd2cda6ee5a59e5c7c5c72babab6703f1c9a9a9190de252aff3ac3447cef8ddb3af1ecb28cf2f1509e24e1f8140e910da4653b5e5cc5fc78020f2cc1a76905f19b9a48f7b400db327b42067d57ae131b1ffeeab3e47ffb633105e528279304ffd9408442214a883557fd118877d08ce1feee4a2a7fa4bd58b0cc44653da5d1c82d0b05068e712035c3c9dc9e47eb8bfd53771b4c4c0597ac6b63eef53078307eb50555515ada4bababa0bba798e43518689e267505050cc3cdb45c20bce2be3f94004a25ebf6e9d778c33fc28db7699f2d858fe0d899098f9f0bc897640516db874b8dea75e64779193d39e43547422480b15fee1745225b693f780b90053fabcb285ad9c4d529495fd9a96dc93da3c69cb084a3cd96b33f674a59788ee28a96eff46b4ca7d6f944c411918324d661215d50559c5abff194a08b03d138a77f9f2c2822ecb505f55a1480bd1848e7bef5aa175b3868d24600e6a81468959d8b64c39052e7f4a03f3fe53c8c712f1c9e647a4916a3da51ac0b9200aa413b7aeaadd787ea1e8eb00c55b9e4477ccd270e985036da0fbdcbcbc138adbf4bbc14cccccbdc0b4193cc954123d1854def002c8a6a45c07620864503ac6fd9f1da681f37ab7fb9cb240acf205a777cef680fafb9111530c82513b703c5a2dd5c9a0e9edc18137105659f776725dcfdbcbc24513b5fbbb5b6d585cdc94c69677bf97dff28f6ade3ec74a04f9de85bef0d0c0c5074543a3f411e86805f0c4997b9a807304040468559c8338a9725bcf007e032e0f0c0cdc0040c8aeaed684b298313b0f06426becebd719cf9f9fd8f61401023cde4ead0b34686bdca39339cfda4fdaa666ed796b6b2baab18a2b6c1d1c8ae1e6a8adb1ba871ae83e0ca22b22cce52356ad7c3e079ee88a0bd43390c50182e58b8b8ba75b8ac9549342d6b05b6a0a8a8a9954fc86da82c99da61965525c06f4ce391452e037b8b79282c275490b4b4b2531313f37efbd12e9adc649dbcfb3ebd9007acbc36a184619e3ae1431887ed0a0390505fd3d72a2c26f6fdfec8fe3c6fce84fbbd4a9d1f6a4d4d396d7801c2357768141d60c244486fcc6afe936fa769d7aef7dea095d050512f2708dbbb28b4a925035d02941e6a35bda22220cbdcf181c2e7d928d75e40567c70ab06e96b7c625752f78d51b7d21a91cb3e6e6e159d89e4de6eda91d9b77312c28ead765027902c4b6b9b9f987377e8b4bce632e5f1b18bcb272144cb2e3c5171842168892bcd3d320537a7a5281d1a01d876f3020e0a182935e2da157a2dba6397a3e4ccfcee61615c903a941b5b931bfe3dc2b524e420bcbcb180c26ddee8628babb8f73097bf28ae71b10684c19373e384a931d1b37ff199a921a0d04e022815f06f5a09a62e18ea788c395f3bb5bd5dc073a5f7e010188c3aca355c7f63acf83c42027b6a9f5ed129fc3838ab081a9b11ab79ebce98817a5073138745d7f679acd877fd209547719dc510671ddfe355db1d2f59b88a3da79a91b64733e104487ba88226f4112af2d54f78245c00bacd6631fbbbb15a845bd3dc5eb3d10a4a10e6d2e5748a95c8d78d1e73064ffe3e3697489dbcacaca7d73c854194a18904b60e6c240afd03d7fbb795959dfd6a65ad0bd380015700444f99769fb4f383ddd528ba8588bafd3f6e6bb9b4b3331f01f450f8f6ab4c5f8fa3519dab4194f467b467f1a04838331ef8b8b3b0404e134ce164d90abea46eaa71bc9327b2e0f680e5acc3d24dd61d6a951eb145a6f7fd6fc6ad050aa7b0787bd48e43fd5ffee5d08e741517a4d8d16489501180ababe55c16ebcf6e3d36168ed6e68c0aff6adc34383ce04b9049a978252069fb94c4aa57f580fbc8be9eefad950256cf0d69fea8749acb1413b7ffadf1bcc1dfc833996c4311963d7d4c934f9a8b8425262a87a38172c87bfb3315a5212273c13d33a9dae2ed3dc1ffcc4317831ef9b43b3b0a065bd0fd5cc0107fb55467bcea6f5b0848f00761ee35b152dd8e5fdaac22deefca8f6de388609a5209c80c2c4cf95ae8f3d5361f52f87bc295f7e4ac13f4984b6c2aa5c56c6f16dbe099b2526a9bd255fbd5a94a4129a9593c341e6a97b56a79077c109e46d99f558ce8f1f3ff84befc40dd7e5a4a6de77bf3392f53962a9c88459802ae4b2cd43b98bb193b7f9f8cc12da7ad703a01abdd7c847bba55d050a17304f3e5aec061c520a9aeef272fc7aec47df88eec5feb3b7e20eaa68745c278fab3393e1363640c55e32bc6b246e6de495ac96fc726fe4ca6597ce24e15c901c975b1cf9a89a77e481b0899b916f27807aa549792823c37d506e523cd4dbd797de16cd8685e9f4f4bbc5092c4b1ff08ad827c4d2647c6e6b8bb7db8bddabcacb932eb71ee3188e97d94f526b999b9f973735cd8412b4d12dc526965fcce5b498e459979d9d7dbbf35a3ff64bbd0c2428c19933b8bdf54eca01eae27d9e8842e3ebc51f4c7ebdd173f915b33f9f997c93979777a13c909191f11bd0e8f39b4bc03fe6e7e7051ce71eb7df99efcd560414eb6a0ea64ca5f919332ff07375b249fe70a4edebd7d79f0ce4edec8ac223229c7637ada2a2a3dbaccb6f313048a8166875014e5f693bdc44903b7b52a810a9e3a83e8534fc7829d497c5dffe2ca6b30e59e57b1076337ee35f7b011a03001cbecc3b8a74175d2f6e0ca116cc0032ca3a57349b5259a98e36c1002686ef881085a9c81213781a7408bddcab161d99cd5ca68cf5e3033089bf7ddf30e3b2757180a7f7c2da98f5569e5560774f4fa93bcec26abc867fc6edc1df299f2b78704e79fbd731be7c895fb370e5f4f19e4f85a88872819ca1dc656eeedbe7cf0f7bcf7ef8e22311b69ed06653f7f8faece63b1fde06fb88d8d8ed061f6c854a52b51f95cf95d94181ed7a3f13825df2eeb16a97e0d8b1bd95d308bbae9006fa5d1257972dc7aa949fdcb913cf6315574a18d934f942e3a9d88562db0ce0a35de813ca3e6b5c8b08bd783bba4c2362e4c9f270a9d4489955c4c44af27a1e3dba7e12135a18ab7db492d23e0072914df2d7ee3e817f53f747c541d183b550656565e367029ae5d651b45065a42e145b5fc7384baba8a931ca68b8d05211617faf4df56c3a548f2d2c2df5819e2902612f03c09a2997cca3636a62227e5c3cccc92023ce5cdf03910a6d998a2d3aaee1eebe13c449848720646742a3d0b77d5e0802398d6a9a7c35808d02395e663502d5312da0cc2baccca253782be14f97e0a7a380d3fa8c8cb18989ac6613c3fbe4912515c8b19d9d9da07366ef9746ca7353539bccdc5ce09429be4e91dd3caeae7e163a3a31180cccb8078a96e3f62fe3d4e3da46ce72eaeab1704ff4cd230c6ea1efe5af6a3c57d7e28ec5e291a512f1bf803ede387afb97e4b1b5f572de4b3b89f1f81a57970746b7d72b9967a8875c7e192c4788915d08c5093b9cdfdeeb9dd26426831a4e484c8c85aa0fe6838a89ae97bf7fff3e681f4a7690df9c5c929039f37b1d65e58b177f1b1919418d9d7f4a2cf218b8ae86868651f948544242de93277886a2fe4d6fcf90b39ad9da3e9608a589a2ff3b7e36d9673ce68361a906081803e684e5f5ed9fced5a5862d441068437ca80e08f6fb8e0ef6bb3c2ae77dc52e9adb718dc4512234633fb9310668cd9497976fdfb2e419c117151df0e2e4e0880c0bbb9d6928dc3ebbe45cfd484a4a594343604a84eca5989b9b1bb1964bcba4add9ca78adfc88c1be2c7c0854149506794e1d9b9498eb9702f79ca1b21c757c707826674e3cd52832f874ff64c5cb6ba4044c97ce728c4050324be54de223880954e67420d3b223de3b1be686f981db02aeab7aed86c790770940cfa09eb42d39e7e6e43c82105b585ee6a9666e82f8417769e9b167d9f251958af7299c5357bd75e96cce9b37572d4e00ad6fb0bf8bae029af48e8fb3267766969595652de1e3e3cbb384c0b1547ea78548ef9d9ee485f4689df0b6690510df376fde8451183b9b4344a3cbbf603be3f211f45d683adcaa381f95caddbb4fb86e571700ca4d4f4fc34926d13081775966f3f03f93a8f8f8dc85050bb459d14cc6faf6f143d5421db4096d6f6f9f32cce6d7a4efe4ecbcb0b934824ae4f64e180dda77dedede2ed1c37bc7a8c51a8dd64756fc57f4cdf70a07728153a5e2f4c4c59f27b92f30a1af1b5311b5191431521161c0d9a69d49516dd381143623c3c391494905100bfb7dbafb51e84e12418b4522bf7be8b2168fd5306d7c079887b17e824d268fe1e2908dabab9acbf26818ad76a5bd587a7a3a484579f64b289f43dfe102c90b9a2d273fbf238bf77d928abdfd51cd4875c2fc74a5e4b17c0c3aec76bf7f937e69498959471c37dadcf9f4cba79ce1fa00619c5a13e617bfb38b0b96b77e3b98761eca63cf7342ca8d4cd17dc94cd9440eefa72c9a655915156aa033131313892da74f21c8ab8731477e473b58fe4dd7425b2eacef832b41be7073739bc31372f2f2d07dad6bdedede750b582c9de448b98d2ae4c09a8e8f4f3d184b595535139026fbcd9b3b2d21d49acf8a8fbd1b353632b2bd7149ea799f85325c0a6ab62b4e3a1c324b4949c9e8993018fb26135318ad610da1dfbdf03470d6455252b405bce373b872985d55a581aae010b40f0f37c7a2bb6500bc21c6e8eb270ae1514c828223667d02ecec6f5a5b1fa1dde3a3b731a5a259d197c14f1967a05de1db4d265071d137914c4e129f3d3b87beeceebc3c9afdf3a7d1457272ecf70f4f9bef5fc5e170166666afe80b987eadaf3bfdfa2909a40add1d5ac16a86c128823fd097f02461ac5ddfbfebb5bb3393bde4e0e4ecebebc3bdf0e184e45df3bb2c82207a2a72426bcfc6bdb6b46116d21e716ae1227babf7f9a988005d24bbcfb0d5bcb11a29330797abe42aa3ef826d7bdaf351a14b48331df1c19dcececead905029298d1501a07a4db53da911df074a40f37efc30801b320216c22c5ec6710bf2f16585859d072ed16a5d9e5b5faf4b4747576537f5bca8f3e7dae0bc634e71718f6b6176b62420272000835c9212e0e5513782d766bc175d2b0285251948514d87aefe01850ea3d7c810336911bbd7131242c4cdc5c578eb9654381ac74030a7f6ef5c7d03cc453d5f253824a4158b4379104fbc0ca63f4fdecbab7673792c975874ef314f7c079fffe7203a99f64d7333b36f3023e32235476c3f4ba2b0870ac44f6b6767f4003698c0aeb8b838f8a42cd8ecf51954e9afde71aed6868146454555817ced258c0142836e8f1fe4ed6e3406c7a18bcbf4d677cc7f048c7c4ea6bbcc1b81ee5931fff14547a6c4e76d2925a2c75f34b284769fd82ff5167ae36e193e9782d9022e3a81f242f7457e7b7b5f3eb9da7e3af0fc02ba89aa7913346c564acabd8b172f5250522a5e3df7aa650a4dbaabe7bef1d6ad111a9e08a5bf17fb0533fea019fb98310dec9c9e91d19c2778e9ac8591d10339d1fd9222abfd1d5c4e6e2e67c8ac2d5fd06b3bd4128f1e05dad5be09f095bc3040646e6edebc0916bef1acf5f3e76ff33d99c198e775757559d8d06c2a227f90c5a4047e2696926720e3cc50eedf9000c99005c56fae5c945cd77b7b1a7f0b7d574043e24637c909c477fab34931131b9b1cc0bb46b5737e8d8e4d2f856b444b3be8c4cb4f633e070d7ff87017ddadcfc4c404e1d4dc74111d238fe5e039a776d1fd7939cefe8b6e2f0c731e4a55aa5d6f89a7faf1d15d981c4a008c5f1144a94aa18eb061eed00b8624d77be18e87075ea84fde59a21b847cf98bd49851360b209cd23f0720fa9255b7ceb22664f4b7a49c1c6f9998c9e2b326fde3c7f0a6c44347965ed3973e3bed778f8282c2c09918d1533ffdd73128a3e2d5652f3ee3936dad4c0c38740a33008c26245019ca24a35f3a919d9914e826fdf2d3f5f291fcaf5f65d18d9bd3d1baafe98fd14111e5c6f45f9ab2311a7ba3f6e1a191e6d5732fe2d229cf9e00f901f01f151e9e02fca03d6b1f68a6bd4022e70996dadadadbe5f5bf7fbcb4b0b0e0d04916f1d280b272938d4dd5c9a9148472d090349c01a7ca27270bc533705c70fb257d1d66f8e06853ca0c33847b656525fa3aecbd64803bc8eb6ca86b28abb5fbf14c414121285e04ac8b666a1b5b7dded6848f2efcd9bc86ee160b0c240009969e9989be6b2b9ba9181c1cccc97a9610b993a20ece02cd0f79878a3874011e4a0dca2e0412df0f59bafffac2402729e8b2dc2bc5569b16c12077f3dca907f9a59ccab2b221c095d202b837af7baf3ebd82ee214e4d4dedfeb8e30677f727be12e296303aaa4548444481876e5c76f7f028759845f7049b0138e464653d86e8b7ab01e9d0b1ebf2fbab4b9de1335db47db7ed89761ec7aca38f589a32d412d4995aa15482ceed3178e86b65e84e2810f94f9f3e9527ce82fc643e392a09c484b3b5a32371d37179bcd6235d92d375d1b91ad403ba720635aeafbf9f82c580761e68d3c2e262eff7ef6f800ec1318b9ae8a8a874c092ed7d6fc2b367d157a8dc27fdc84f79f8f2fff39a81397364c8a781b1b1fca85baa14c544befefa456a477d9785bedc2ac7f9f0a2b2af3f6ff7191465fda1dbe84720c66e86b6183e130657f50c57436141fb88e88e92b8790525a534701c2a9c41ed8443428319b9cecf48133e025e8f3bd85d91a01e5872062eb270b0bf3b5ced525866335180be5e0c8238302e3b322e8e821bebb2b0c6505f3664b9b0b0d03ddd160d6190fefcf98954eeb1ea95badcad710f397084fb6ca2cb06fa1624bab60c62294f25578826144c12e4fcdecbcb6bb8ca097b6c9f10ecf6f1e4720684d8e5bede5ee911d06a1956e51af9f2676ec99914a905959ee2b28b305f58039822af71be1a86724fc02988409facccb922dbe7cf9fa3cbebe068104a3de124c41d16a5e03f4c3f326050d45e219777dba30cd89ff0ccef7820832c0dcca0c6d03de4fdfd2641b36127ef5ca7226a29b12a0ad97a33a092cbbd50a56f5fab182aea56ffc5c71aca19fba5208d5d28f87afcbfe3868ebeda2c26de962fcfb025042ddde1e806264eb34f3f50ee2921e1cf65a7b83758647844ae8e3333e6f6e5808246df24f9a0f76dd1dee422819f92b6763e7cd65ef1fc1c48b8943f5fbdf3e38e8b4b3914d3e9adddbed1d13c3030d90dddebd739afc4c7c7c367e84b91cbcbd6c56dc7c89454545e036e002ab6b31aab7cd07b4c13eaaf120dc3534f49a7445fe07f06e6699b5a439b436aa64f9d0a5e6704059d351c7b0fb9c79f280bc4a06786f0f40d9a7ba4d5635f0f3bf1105fe3976839461a48b82abd348daeadd7d4083526d1b1beb756078f59f2505a8da39366a640c10ed10b4057dd81d2786fb7e9b6ceae6767643c2f65fc11048c454626187df1023ebf292aaa0ba809164045db9335d7abe8c01e9c05bf950ee8401179e3a5f937905e01e0b0028282ca6011c8e985319789f46952744bf7f1161fe163f00bfd19bf7ba0955fc17dd1c54e0d8d98ae883bd7adc6d115c5fbfe44a803a01a0299dd13c6474cd0af7759d09cd85169df5a1ead4c5df15af1d899e1adcfb6f19ca27ca903c5cffc8fb1a5c1f3193b3bee43963cc00a38d66f3c81728dae4e0a3a2f7ec314d66680bcc2742609a3efa6577381618eda90868686b727aa81381cec4f1c6a8797386155a66766166c0e666cc82aef210d0ae8de54359ebf3fbc11d9df5044771a98441ffbc80df05c8a19e8b6583c0f7a560e46fb41ef55fc415b10804be72c67631d4cfcd7962871d06c43a39e90ee0eba8f1fbb0bcf3afab2a4fd9d81fa7eb43b967cb8373b5c8a89d6621d48e93b85a8695ceac3434e1756576bcac8c81040f5e0a382ece0aca6bd6a0d008bbe930cfcc7cfcf0f507846bcebc6d1ee35e08be8eb3eda44d220d30c9c4fdb3d59a352e30b9a0d98449922b814e20fd74c6933a77b30ad8b2e430395e11d776d5afc058ed0e33a89d0a2df91f2058bb3f807a18c8a87da594fbff098b455031c04bedb0b33ed1d1cfc2c93e2ffcea2ef261429b152478fad3117f3f9b2b3ff78ff65dc1800a189b3ba14c514ffbbd54b9d175e7e32e8eaf4397040b9cfe1a6cd61466424e9d278edc8e27b0479b988312187d89c3a47e40fca890e88eccc8c0990113b87536a57ff2836406bb4f90cd1d1ceca5400c170a4364d4c320808081c57bfdf05f955dcd668788ec00ffd0be5869c9c8a573c57f1f247697cd7a85c3d610c116dd3ddffbc65867ed94095cf61dd101d1e4276fe093172f51a289f1ce07e22c972f03893687c5a1026f4c99d6885eec9948bd796d52ad6c84771125d7a1b18c8047045df45a1228ad7a620bb03c20b6838307ef410704434d25472fb16bb5f0b353b7c5f33149213baa592f7d8ca2a1fdde734f70d468b87305f47bf0babf1b47f133c792049d8c395e0926bbb254f3ce0a76c029fbe33d3e90fd6e56db3eb5f20d5ebea74a03672f56fdff584580081960982637acdf5e7fab6d908af04c4d60f7d780a084174bfccd1f70024fb1c540e4d2308d969748693a3950e1240b24115ddae26d5531f04fa02d4eb143dd9631d9d24b4279aaf59de7a246003796cece84909d0920fc10cd4a4cfef0cb9d9048f1cfa1403788acf968b0f83e44ed395033d672690e8e8eac1433e601850ca9905ce3093e4f6ddccecc9ce552d8cd37e740f58d34d1616650c26f7ef0f57adc67f7cfcb96905a0969f9f0f1f1b4bbb9ffad76dc3fadf363501a81e43d468d1bdc8cf1e60c9f5ec40ad8ac1ad4da2c35e41ad25ba2292073508ec7c0b10687f7fdf24daefd2ceee117c42be035747dffb29b1f178f0cf5d99819a8368ec9f6cf2ef603d8ebc7b78f40d26ab9f55f2358c9d4f9f6603aa43ceaaf5585fff2dba6f0314be1ebb99b3fa2bd2b3272018d3c3c3492e92912d403d47df18ab664662789bd73faeb7de2a9c73a9df4d44d7858e2c70e76833efc7802f56e3b4e6c03b04bc764a868c59309972c9fda0ce680336ad105fba59ca89dfcf87e8c025e70fe950f0fb78b97aac002a41a516eb1f3429febfb87bf3702abff77f7417954a860c5132eea40c1119ca94503b4924649e4232cb3c179993211412426632257332654a652653c8942953a673afbdebf37e7fbfe7fbbbaeef75ce3fe73afb72bd079efd3c6bddeb1e5eaf7bddeb7e32c596bfde34b5b0500162dd938cbcb21aa1358ca7b04c83aeb87a31f26e6aa7f17c9ef0a198f857eb98917f9d9a918c659bff4feb19bf7f97185bffabc10c73ebbfced67c10c14700c2a11be17f5528ff7fe121ccbb20ec1ddb3902646140888e149d0d85f50f54d1e1827fd9661b2caeef79582d9366f966fdeb014c95a68f54c26bbe9f17d1c918b85426cd5c1016d436dd606adda766185d56d279009e19c285bc0f8656fbe2c58bcdb380f7722a7ea70390e50a1cdbe121924a78d2dbd7f7342e4e6c6eaeb1b919b17d40d48c25e3e8a45cab5df37d7700bea8eec7c6c62668c98561fc262706636bb7be7807352673cdc9ccbc0694fe4ddf6c5d11c0c3c2e2e2361706843800868323497abc9a0bb73f31e965d76cef0e300e10bace136723fe2e7590e908f24c98fda8c1427294f659ede2a2a2f4e26255f08c8b8ea2f852949e597b70c0cfd4266b9e39bbaffe1c40bb80087b80218c3e6a1d7d121565bce90e71bd0070d368c20397d59f69809eb57354dd2b7540e979194d5fa7a5f9370d25c23081b4f1693b00c92f2fd79a9d9d05f27f4345a5d360e3a763d9380c269a53fddd2e582123d38db0c84823622a605f68a70d04829dfcde185ee73e6ce558d7690981025683dceca050bcfac6c60653f7236ea52f66dc5f525ee8282a862259c6c4640087049a74576923fa4a5fb41ab72148194c78a25f9ddda639ad528e974e20b99601c3bcdd2cb86d646c7c39d8127c0521fdebb777dfbee0ad07d5434159838f7c7d83f3ac584c0f11ef069748cec0f9b07a8828e73884b8a4ba79302a08fc57f1650baf0d645acf9c5db94e93762fdbe89d4580e6c1e6fb998de68697122846c5c09ac2509a473236b040c8e5135506449cdada5a409e21ef70d613adc7219a48b7fca6676444e50827e3db8c6726ec4b113f106178ecd4454742fcddbe34a908df2deac5ddfa630c0cca6e6ee5e05983b6d001550e363683eb83633625a8080eb59f20f3ad3161cab71c1407348da3ca8f9bb1dfb8146ffc3d3a74908bfa0078fa6b31b700ffa11a30918e4318356dfde04a7e20f4a88d0c4cbf627351ce60a3fae1be8e6fdf2c3489bc09293b90bfac15e533cad23b4db4b7b33a9dbad6479976501b20c53ec0542b3f072e980f12e2fad19ca68f1f0b6c275a45dc72f0dce786a5650ee019883ad6ee77eedca9b3def8fd9b715234555bc8a7466f166286fa277e3bd2331c1cbc8cb1fea2ba8743f233c01ef50d1e816a5af3080975bdddc517a3cbfb7a71d106f53c1b0eda80580c2243bbaea055c78f1fef2db68cc783bbd532e30d183000784e402eb0a4533f7ea0540333c50d39b9a6822d37f17818c67340c30b8ec8fd2a299d4dadcd383109a436ec15aacb9cb5b3b38308836e0817c2f227b5e61716de42c3766a35669984c00b16864e2903614148ddda363d2bcbbcb51e622d934ac62d30b0abf2f26e4315f58f8ff34b4519c7bbd9d76d01a6083a67034fed000a57502080d26a5fd36e2e65e76565c923925c3a80c6d93611fe6532a26d225084c7a55cdb80aba5a5e569d7f4d3fad1675f1c648c28719fc315c4e9975f0cce45f5cd0a3e3eb72c0aa8fe44a35a9489b8fb42a00e0705099d812361cfbb4c7baee0de8b8a0a71305d24229ea87bda83e00373e9086a183339f919fe0ace2a2d27a72d9a9b0dc71872594444849ff18c4d92e12255bd8c8c8c7aa57b3984abfba375c1226d45a1aff2f2f8d0b613e8969a9fc899336d24b8f48c8ca4171fec841914f92d18c87c410df6eeddcbf8f689ad874725800b161c427729e583dddd26992e5680487001ea9c2f0b0a9451f206bc93c5c0bb73133dd78a2d0723b1593a95da203ef801c370de5e9f781a167636d50083893c12d322384ae7bef81d67305b4e92fa45c4bc39f6f4d983468bc2ea376f2641d89d8aaadc1c2b338e4b4949f938ba40976f040b074343ad390e1ee1b976e1db77bec29414598003e073c863f7531df009b21601b5a2cb60435bc4e0ece837eaceb75d69407b1d0683256a85a64fadcd0df3d42242431350e20a3c22a89262fd517a7aa7997ba4e0aa440fa0f8725813e0a1005f4d2a5c0092fe2cfde37053559527f614b067d30d60d52770aad99acf54870cf27b5057825fcd3bf13beb4ce097b6b6572b85a69ebb2e013ce19e5a0aad32b4b2e24d1f6f1869cd731465044681fbfcf12967b27f2757b825b34c6f2f6a57a6181f1cbbda91a13ac1b036d39d77096024eabb098a0a9830b8530006451ad362d43c540e28d6d9c5c50e040e7650ef8a613d3b5a3779ffbacb196e6e7910c1011fa925d3e9c8d050bd4c552ad2bdcb3dc6f193848c756796c69795f8f329c03cbe10b6a6ac945b428b4c6f8ac4b546678db04b7ca0a4af3468b1686d6e8e5d759255cfff0678eff95bb200d1063e5e5e5e6ed1de32a7a5d8c70781dfedc5cb47d9c868bce0a4e9a58427da1e5b76e8649098985b273d7f681596f5cd9c6b3cc0f11ae7a516a1541f7efe16d7c6d6d6c7b72fc3e7abfc4b00ef6ccd9fa56fe49b76a4df2ddf60138aefccbc4d65d78f7a35853fc8f46b9856137232d22fee0343be0fba81d247107720522a2a608930bcaa67ca7f7d2ed8c70f3e1f8c9cb5e56ca92a9fd411f9a02c10c03be7e5a932a3d45fabab6883c13465de8c5f35555bd5ac3bf762182acb91299fb87f3e7861c0281f1d394507d917bcc2d2bab0010bba570d355c5c4a1f3d7a34bef94906e0783b238f7e51dbf538376230ae08abe4dd98aab3fa85ea852eab16c09eeacc6a597168974ebfb9cc5f54f182ddded6879b23472a6fc03d50866bd949208fe4d7f763572843534dd958b7964efa5e78cef2e9794873f33554941f1c2c3370254074f8820e44c2ba6b29d9d93c71c2d652e0a2c038b7ca8ca4215aca01886320bbdc6cfffa39758074dd742344af647f5af325cafdd160910b9f6498299ef4cd3e2ed9f9faec5c289fdbd4aa8aaaaa44aefcf435d6fa90655d59c3c8452a0551be5403f0a96c33a73839f9b303df9596de52545cb8b18c82f2e43d0278e93aa2e3ca82bb7afdfae3f56d945794170dbed063e9b1d1e7fbbba2a1258a681f199d50d2fb61abafef88c3b54aedb9a7ec328fa91e6479f3b8fdeb5240ac4366aabff16132df605d943e7ffdba412d70c85862a367b70a04a056a36354592a19b1d78d9bed5343f3ccb32ffab117fad9826319ae078537de6cfef4e9c6d7e92b7dc5ebae730fbbcd04211282bdc9bb9c39ebe2906dd1ff96453e76f4bbaf2e101fda974a80f86a11e2938cbd07284843a38f68f5e0de8768b7ac73fe593fb9c79b2b1b4f5352d8113a1849696b4fba7c0287fce3b28c1129ea4175c0b7e62804e218cb8abb6573102560cc5de0a34de15e40c100373c080749586b0f6e304f77e544618f8b397f7d9b868ed2a16cd573b5a893fa4583c20c64883bf415a3ec66631178ba97764498c39738a895d046f8de162c5c4041f263a8fa21aafeec9b7d61edf69c5ba3e84a18da57c79fbccb2c2a12041d0268d67c4f45fe7bb52ff0e8eaea8b6807cdc161fa833fd5e70feace808314e39d801a072f4dfefca9a2a3130f7ac5e82cd8760d955100068a13773b3f254ae425f9d5898c9cbcedf7318fa5984181d6bccaca41e1eb972fd7074d9020cd6dff7c0870f291bb32670bbb3c5c5c5c9a535d6f2a297d5f70348aadd6cf5383ff50d629103ed4f8b71640e74c711fb76f4d028c092cf5e9d3a7f2f71404bfac5e518211a0fcd3b273475f5fc6e6a66b705010da434131bac83c06dc126a92482c7f3df526582c705221f58ab1f1719e35d64670fd1b2bb37878099e1bee9a2418524f65676b9a3228bce882fa2fbc7c29d9d3d303d1f9f7d69c87a5f71d20ab9a9f0031fab300527ff7ceb9373ac9dfda78eaddd9e774e427259ef076a0dd1f80c44ee5daeb5beeb8cf806df88aae435ca05812867807364528d33a7dea145f5da3dbc60a3a7b07c815dcaaacf0d9f5e8f0faafbdbdbd223becb628998c36d9b2b35b495e02ee8a00800968c4a0d2cbcb8bdec340de5b1d2684b0d044777f7f66be715b3a205cb80d9f31159810970ca22c1f4442eaf953cd9fff48a8d4ab79f47a8faf3962e10a5f47ea43974dc04d75f4f4a4c56f7e3fc9d795f06cd2853dbf6f16210c60b416831559b1b10c7f222480027cdfbae7cfd3c1349a46174cbea4c8a3768a53539f7ffc780dc24f1d78b5e0286aabedcbdcb92e434d439306d626dc161b1beb7b5e01a8e0e3c764e834012a90fda22091a5aae376ab4d7c632648418f081359ac367a13551a18b4a6c8c7a488650edb9444c4c51db76b06ac0bee3b03a0505252d2692eaed895929e8a938b1558948600e48052d1cfcfdd838bb9e11937385e9dbbd779055f2acd800a4e50f5063c10f515090fa7b26ba15cff5652241fe7ec9ed7ba044808bc8acac58bd5057c428b6e79d9bb588f1e3b768ed086cdbc3bb77a2dae72bdc552d66d5533db09955cc8e28d3bf0dc34b6b3e8995a5627fd6a1b2c2dbd67f3aa4ba6ca7481cf53b6fa78aec333dd6645d11b6dab2ecb9e4b319af5aead4bdfca5dc25ea1dc771f2084376fde443c7d7a6ea217836952cd5c68b4286ecbd8eab966d0756df4678dab42269f8de96cf88e689fdadb1b1342258f1befcd352f6f20a72da1c115193d6192df63247a195c4d7200a2a0ba8cb08228e52d17f6c26de5364abd606c51aa68eaeba9bb89271800cfb2e2b386d1be40f7efea1fdfd35b08ce9b8947a7822ba78b13f7b1ad4da814aef2ac7f40b8ddbb77ef489c81edf26b1499a12ea03d7750bf55151d7e7498d9d351aa1b44b0a9b7090cbd69d7ff7fe9f8ffdb87785eb6df5831cf97439d6dfd1618309e6bb2f834123af9d11223d4c243a4a602be397966c62cbf09f34492aecdabb6de910c23e98a9e8e8d9d739db800bcefc0de874651bbb98ea19d5c8065f035c9dd7aa2fb68994645309805d49afa8915a8146060b4f79c2fb72bd2677bdb1d020cfef448d46e662fde17448181f801a0715db982120060b15f07072ded4f494a417c42fbfcb76f3fcb54c9e819c35ce14599255dd17d18663eb42d7858e94ff1e9eddb384eba213e608a917db32aeaeacf0302035b78f649eed617ddc72851670b97ee439938bda79191a7f9f96f5a146b989b9be3b71188b1dec0a1505f09f0a33e3e3ec0ac236af5f94ab930fb0316181c45e9da7661ae88067dc7787aaf746a58a6e5e7df84189b9e9d1d09a4a4c508dcc23b7c3ecb495273127c0d888f0678a99530c406846ded6f632277d5d9ea0ec354314fdea265dddfa29f874af4c13dbcb39d780ce4e0fedc37b143a4a4d15a47291c3e7ff9f2342e2e4b3e46b0d128ff991699e71d6f42221983c1f2a076076f74f3d40c8bfbee14f79dc0011f81196030e3fe2044b022fa7bff0f952b32589259d77e3f98d8ae8172175580e77ca5a4f06b62fc3db80e1a18182c3a97232e68e8b6d13728588ac560e64950b3700d0d4e1cf0a1cfa85d488cd6610c26056fd092ef8f313175a1e47a7bbb22b8fcc9b58551f53c7d9f9e3bbb309ebe02e2e2d9e3e346066612b6e3a4061730ba3d78b59694822fa91a1824c95e06f4713984b1e39ddd74330f0067d1dd958339802be4c256e606dbbac93018fcb00f0f24cb45051d93428751df5a27a1a4b2e765d45f723a29443c0c5ba2c9033ff972bb31ba3866c2a8107e2fb19dc0e29e3d7bd64fb11b4c05f471dd55fcaebe594e66a6009a5724297ed2d85710c547eb43e4c2946edeb4fbde4089ee8309d13533bb0648132f8a730202d168ca720708a369edee8e2ed3ce11b0bed430b78a17862331ea7fb7bcd2672917069ffb0b2332596a79ef51f25d4d09bf0c4f6ed4d5d7a30bd0793b1c0e77de7d5358c81b8cdb607474149de1e52b8a17b17d94771ce34947f8022f7ca1a3bbfb350816f719701a10c6f3f94d686c5573abd3bf97a7c35e6d6dacf21701dc2722cc24482e8a875ec8fb342767a1f5a82c611e43a321129d9799dcb0e8c834fc203daa0a23f4eff1fe0428c576a2151776969fbf848518dcce41e2dd00093e7fe8d6be7dfbae3d0e74e22edef9f8b978494aa262686c724aca5443281b5e1f19ab411260c8585c6363233ade8797ab287e341f0a813203f6b83bf2e8c9e09c104193b6d7ea2550abcf482cd29591dac0bfba92fb1defca982d824342a6e1824e08e648909b6bd61624102aea4118766bf37a7f5469834daddcb910814504c1f1f96c62c238e5409c60db5fe1fbd8c91fed49eac516717865bc3cb4ba61b7f5db0ef7797b6b83be8f29b4561fd58c32890880fb39a84285195ac88bc65735cef3f268bd33eca7407b3170450b0fd88be80394596272fb158a6d1cb3819f675a616920b513b8929292f4b4b4502cca2694978b99a27abc2c8de2a93ff54fc0a3f5198d51ae7ea0d4a17ef31a80680585107800f5b21b7cd579a1f6086875a1eec47e8c9a30610a17004aa11e9302d6540625834879bffd37e5fd025fa19fa6ae73b66c797e2eec5567a70a081a7e44e2ae972fb55e78a39ef5457c74c13148e24f421301781313bf0356ef8773b727e3b771f08bcfd2bc086902a6462d2c01b0ddb97307e8b81ba9f1218c233561249cffcb45fff2ebd72f3a8fd6b6b678bef9c6b6b6a8018b28ecd8d8d82906b28ce46419c094c004baf631b9f272ff6a6c6ae2df8e0d0f37f03e2f2f2fafe8a560889a2ec34a2656a42626be7f8d3f43222b5bf760672f381042187bbbb03e113f3dd393fff9c321964a8819b82541414123e4c7b8e81d7ef6f3d5adbc7a85d52a735c08ed8af1578d775dc47d251d5fcfc5ef8a7494bbac7e5f5abfbf3cd571bb2ffb36172d6a7f0fc857b1ef61f54bbe7c78a8be7a8650602d6b7c5baa82c4163a0b1baf1a0c50648ec0fc30cd1d603eaffe716fd60e9750b2699aacc74c10219daafb13ad71fc752bfcc6ad1f06ba2b6e003d466f4e101b211d3f7ec1feca4da303b58749f7ded2d6e6c1fdae2677d735db99b5f4e094cfece03f37e39fdb6306812da047900ca3cb63844c40b77163297e8761f9f71fe5bdbb2c1a54ea30275b98b1be51b9e382f7728ddd951e1efdc1b307ef9899359b18acbee68f56cdd1e6c6a11261807949df32d2d3ff84a82073426eab6efa9890c595306dd7855adfec5d00b1508c296b2e2e44c9eb8f1faf9af7bf6d9f393b0e37bc5658587878d6349798869a3a5a6bb7e79dd63f0affe81418e12d1d9d4a5dfe68b67c1b2002fa15f19191290505023825e0f453d3d3c9b8e98d7e7c872c9bb18fff790e3883e0e6e6e6b7a52c7f02426f0784a74b464629e0aa5a786a04503bf1a347c3684df62ecdcfe70ab48799a73f7ffefc751790a4454751748e04f0b8617e4f815ecd5e9c92b1313ad5c298468ba91a41f144f4d3544746476fafa93d3d2632efe13ef2ab61a8202e5fee59716424adc1c08bb1feecbd72e4107ff88f8b3ade58fd39c0affe8cfb323a7a944d6914532d1a6fb703d1198b72156e4315c03278a2e46667671737b6407f508db191c97ea1db0e0ec58296df4447cf4b00b89dcf398b19f2e2a20d9cb12f0570aa562768defb8a697bded7288acf12f58a00a0fdeace37782e157a6ecfacfdd6e684844e9157f5c978d744e473a9f263dd21c422989295955557d9868e4a6165b2f2f863003d01db90431da1267e3d6b782e06861686f5ad612150ce9f3f2dc056e5379af30ceabf2f3bdffa93cb7623c7e85a73b529d22094980cac67e6f038370589f440c3edd65953400da6453d6cfe16262657f07df0d14971111bd4f6061cbe6ce0391c3aac88c521f5b70fba4287c58161a1c27d7c4788c10a373ee33d32bde532a4a4a4a8fbc8e788e57e947c7ffdea9534ea3b29cc80daa02ccfe4b74d81cb7c673316000192508a74e4c7915d182e6a42e18317821d10573f7fa0ca6f2ad13a84c1acedc0ead377ed813982c03f7f083a09dc3abecdd8fbcca953a760f591337b7c535191cf5ce3ead5003206610a5b95c729dee729c97c2fb9acccf8ff7e1c14440ace1125bd2948ae6df080ab75f8e664dcd3dabadb3339c8e3d92e540a21202898d2dbab8e030a1386da34d270aa446bd16230bc3d6b6b6f4171d1415bf021c725dc45a78eeacd7d2b47750208cea2cd42beae06eb12cd8fadad8f7b2309c4b3ad3bfdcbe8c2b5be712be15f1fa8149ad7e86169506dcfa54b970031bf73987bd199a393b33cdd554ffa128003111e38e44aa290dedf6fd6df2002514c0f7ef7047b4e50109ce895b0fbbf7e2842dcb0e815178c31ef5429a2a7a75fdafe565656e6e4211b06b8382f0580adb86b0b7a3911c653bafdf3e7c4bf408969491690929a7b6bbc84a5269bb28a8ae9685d30f2d55724f17ebc6ab7b0c77659b66609ab7c818635010360223d15c4d7a5c1758563ef1819d904038831236c835ea626214eb4f80ef7798eb08ddaee3f1e4d3eb3d0f60f3ec2f2e2977388b29fb09cff0526a9ed06c01834fd007eb5bee58ebf5c9870390b2c755a51914a584444c4abc023674c6b0368f0f52dd704c131fcfeed1cfcf8f1e953a7701073268eeec2cc7713f80db99eabab2630ffbae05870b2566c4080ae8421922c2080c5a1ce599d591ac6578f57ebded8589deb020f726a901ca3a64998fb2593bb77db61214ee05053ef59bca4d4ff8ba4523a0e1ff0f9d57e9969126d38df3d87c1d0125a26f22afcb1642c0e3c024f54d34c18aaf0996f3c19ffa3bfc436ec5573f3b56c4a0c26104f8281dc4a3253d8b1a5be79f39970217af54d4a0a3b4ec9d434fd3183883ee029cf3b8f08d726814f07c7763d2c2236166db7e3d19a5c1584566bad27b1b15cf8300797fb112e7f0860aaa3b3f3ea7f47979e8d049f9cf34f7cd2640379e28bde31a255a0ddcf6362828f8918b7c60ea3b9ffdf14ae158db5891a3fe1790c3737376aa289bdbbb3bdd5df00a613f66a69a2ed5817c9bfa077241fc19669ff77d2f97332c288e27fd62adc5579f98e50b6cbcd0866e16fcc1cf9bf920de60a6181ef036949cfca7afadf2125261cb06446458576525212622e0ba3f525b2083110be864540d1c242d0e27b2ce0ee63406525c3be02dc4e4860f9076ec383ab088507d73effcbe0da82818631e3ce83555907dfb87d3b0d358c43b3522458d0feff5132d63ffb45704a4646ec5d2418cf138dfaf8b7d65429cdebec2cebd4dd2c05a692fe879ae47e78f51770edc2485ec30fd8d3d05bec2fe062e0ba8936902d2d8580bd4992125c27bab62a080de02823a360293186b70524b6304180468a9c2a99bc85ec70ef02ec3f7a12290012f73c70e04033cf2eccb528b04a8281a5a0da15d47e9707d8452dea64078c7aead7e4173c9c1e03d3e0c42f952402d325a1445fd4b2546e67a9e43741a8ffd4df9f991aefde3b73165c0a335ca6960241f2f7efdfcd3c44d6cc0c64d3b046308b4f80aa0ced45aa1ea096a9f6f645a8fb340fb8022e3efb522dfbd201f4f5682af4140a9479864884dc34aab912a93218b52989080dd583808f7f114f18e13c929a3ae0dbdedede0842a5cad6ece07616286c088d1e3eb1c24cc95b83771d52094faec79d3f51397806870a0bb67fe7eca8fbf8f8a008d6f1f5aba1bd3f813347e3534b4d9ad81f0bcee510e140c9ce19892adfba758a9b5b3e2d2ded634bcbb95265c2b5cde8554e9e774c4d3f7de9ef67e8e84d2f2dd5802542800c5588dfbc47789d6bd50c5a1f352346ea5fd22beb930a1ea743ead9625a8cd4b3fe3cf2189a70a47f09b11825e0b6bb77ef7e6c6ad2f8759e900be2f5409a807d8b3fcd2191faf272b87a496151d151f44a86e22b1dbbf1170de9a194c993a1ed05a61d45b80139a9b340dad3be0ab70dc3e2be6074f6050299b6b729e196f3bc684057ac52afc785d59e2d66917863d446eeb15653affde78db3b464f812098b6cbdb6ef2a16b65ba4f832c622f0a5d3486f9182444648ecacb7a1a1e98eab58a0bfe746b86eafe34bed509b0e58d548067ce17d958a45b5ae55fb3d7c086bccd62a4d0152349d91531186759b7319e407dde71d0014b50fbd0410ddf06565e58e5756bfb38bcb2d2dadf21f8568d09e5854e3062035ec558ec7d6b4f368b0106ae18bc279f494c7ceaac732f9ce3c79dd3dbc24f3ac843301ddaa97e08b7adea053bacbcbcb382a3d859b37c3f1099ddb18ddf42bdd4b63513a57c32a96b32c51c8c98d85d0d2dcfbf1107e696d76b6dd508952e0998a2758b7d5d2c10e0dcbf2e4cab5c04ade52010c6fc7d75c63c047282baf80ce78dba0c4d0d2ba91f918be80c8686d73a90db5ba84d87635cc7ea63b8169ebc7656f314c64b99a5e08be3ce00c5ecf1441cb9d9cd663d54b50f54c06ea2e88f92f222adffe3dfd7b7bb5d2128df9ddb3f72f48f0534c582fb029b59d788ccdab436aee598f3ab02087c8de39edf46fe1fcbca81782573f7713fcd0744f398f3d55fddad57552de5b0c30a17aa1e953709c9e93e3875750d8f11cbb239ed5cf0ac6bbc08427c6b99f7e0e56e6bc7f2fe506ac35ec15b88552f44237b59c7d9871ca7f7d05af86d61bff8779f3b6e55e466bcbc55460837f59568466a9bd3cb8fc4e551db71338e7ade5ae6590e52084375d5cb465371b7e96bebe7709f20c69eac937464d82e433bb9650a1e533e317288da77698917d065fcfd344441802174d4ed96240def51f5d95db76e83c5147fa2d8436e4ded73c1243d92be60519f512808e04ede06dd9da58455b1d672ad6a4c27e0dccb9ab5a962fd34e2f63aabc2fef77412f2194d40f2cb0b12d1d587a27894fb7f9fc02628a5edd77f4f8f1a7d8d9eebc4b12bfdb43485c30baef93fe3c220f34e94ad8e9d3a7f1ce0d5375d66eb6f7dcecb7720d1db7e5a758d4e5a16bb572c72dbf69b7e7090396f78c48fd9ebc252c50959971db8b5be6e6590279da6dc72ccb1250231c249646b5d7041962d9ff8cbd6fa7fedb567d81f5c4faa8c7b7ce0dc5aca64847377db6f47ee7637203f76c874e938d9197991d3b5c9ab09c727a3f59f0fd8427922caa8abb47ec674958820afc5e5dec79f2117ba83d2d80e162448383d9ccf865b961f2a927354d614d6353c4d7db7fb32a774509a42bdaff5cdc1a9d76cad947b44b2ad76be2527aa7818bd1374635e3e88932edb9808003a46464bbf3722780bd5e9193935bc9f5f353aa937a24a63b74495aba4034efe9314af439d1f4e10331f01bebd59f5a184915155a8073223ae4948ab13e642e5555be7e7e26ebfb7da4ccc664a5d107c777fe7cc0e7cf4afd951e4c981b9a9ae83d7bbc332cac014b02ef1979e7595859d5b5b1382979f9431a25f8fbb7271e3b7af43d70e1851fed6c982a88520b4d3adb677b6a5859af9e52e09cd945c4c4ca9a383606a6e227cdfaf73181e91919070102499a55bcd0d9f9dde538991c1526c6c59a18b12850f3e739e252091410197b3e06fba10fed2d19993d7bf7edf352ebb60540f52a39f9848b9ab4f4a9b1bbbe7fe79cfb67cedc45fefefba9696947c05d633c3333b98094d85430b226e268d9fe0e089c1dfeb6267c6036890505d4ab7383fb30d4478e18d43f3e4eeae2e7c77e3b33771fa92b5c12295e64c3c60a9fc45a010101ef7297d511802d184fd0e2d1a8cacd3b6f7c65a4236c68f9ffdc3a39f83fb706c09e909c2cc3657c076052c5da4820f671801fc7f2e6e0ce16d36326890a133d72ba350a18b0f97f04330680c1aa44336002b52219820871e9731dcc8d9a4bb69b68af385c2177e4afe4f5215ad21d3b46d554b9567be6a54a46f87976d64465da033ef3f512db94c7842c340bb2b9cacec3770a88ffaa03377b60ed6ef8896fdb87799d9525232b2b8b1ffe9b32ed332867c83325ee91fbda05a69bb8a75ac542facf873a8406ffeca0fe8fc0a1ff4e103e24ba3ee43094cfacc536fc312d0d2d2df22b567fffc62143584829886764be6c3d975858099f44eaf7e2bce876d2ae9c4285ea7133c31494848fe2013dfcfd0e57fdf36c012ac2bc317fe68da67eadfb33680547ad0c2be59fb561bdaa9870830475909de8ccbcfd10b50999f4a8a10f96c578f698c9dadada2ad59f550dc3eae9ea62842cfaab2064eec200106c6868b8b2f2c94f89162dddf3c2d1fa10d410b991b12ec0a0b8efafea71c81c222757e80bbe98d191989b4b01f0f746dab8c3a995a1ea87a0d3723cb94e878148f9368d3d5f3c17d3f2283d3dfd95ef5de9343faf3651ad129b3daa39daf22bbca0c12de8ddb7a3bf97a7d54aedb9510f3e1381e786e47765e69dcbdfda4dd302578a9f492088a2ddc0d0d8f85252fb10302e92bd0f497c6b4029e88e1e95b2b55d8add897c2ccd6a553a80c9d5df1d7f8303fb9eb15c3ba478d0fd18a0907947d1f98d2df8231d030375bd8fdff6031885b2b2b2ae95156f4f0d33ebd5800b0e3fabf4f3b02e749c0f448dc9ff0a95fb10d0fc02864069d6b5efe10a43f6a5c3ab1b0bdb1b739c520126020131429623531d196f1de61817979668cc87767b61debd7bf761a35cfb0c889be861357391c7d66f3b525252666eee43a897fcfdf303414fa5614d009d7557b895763fbe16860d0a0e1e06d1d33132ca023c2f32eb09a350aa0d7131332385b5e8ced5ab89d888ec7ba3f5d64aefa3dbf5b15f93011b4bde7f6b01be8c2cd4337970adc4c7c7876895dab3d091ea0fbcb3f3934d0aa87cca164a827ae6001bda575b5bbb3f6b10d499e2dec1d5add541363ad2115f894d96edcd0909a23c41d785d170ecfe281eade78b85babc7ec0b90cb67e2f373435dd0c623b1a9c585c7c04f3242aca1762cd70f5c37dfbfb989d8fd2ad3557ffcb897a5e4fad19dc9e1d6447ee47a103bd5745cd48aeb8b6e6afca06721ef6f763be98d48ee56af3914dba686777ce62b0e250e56008e0c9229a60d93cf33e41ef1abd0577115280da0fd5b36455558fb88ac73b0e0c5b559909d6e8f232d391be37ca3fb5326153f2b26b3a35d3d55f9a3540f0ae783cb9513e3d2c94374d5c5c5c80a029fc02ec91e3cc1955cd8356e7e302ac1b43cc058f99debb57bbb48f9c5139a87662e9624e9701cac47dbbf23c32929dd1c1c121d02d4339fdae44cc8085efe09c2a835c7e4f506faffa826d78dfcf672d4610565819c83819ef15aad74e1ca5a7a79c2e280438f87b63a3fdebd7576b25bb249d9c4a4cfa4e0e969d9238c37433f58bc8d844dce605703b9edd73e496dbaf4af487f8e5800a727073d7828bdc858115e92eb135467ee697f2d6b850256e854285ebafddaa6bb69b500bc61c1ab6a2333737775c1f8ba2695a2aa1574856aa362d0ce01d196f89e1a52335b1b43c9270d1c94944d0a2df0f280788cf5194919a8626a1a88836f48a74e6f48223b840165c987e2b6aba2cea388f21f325aad6a5f092644e0893fe56e74f75f2537bfbaeca4172f07de18dc481b5892649291da6eddfbe3d6e6dbdbee62a7e1f44c30bea1270e3839960527afa01d0dcf97557b0a5ee22f363bf9cc580ce901817a873abababdfd0d181d504b3f4dadcdcbccb190aca51abf6ddded1c9c9e98b0aa51ddca9cd583046efecb3212be1a1a5f597304716ea91dde87d2c864646acfcfc54b06ef075121fa9c4b357b27feef23c744c10e3c93a73eacc997a8830c8006d4a72ad47ebbc47793cc86089ceddebbcb6ee545a8a7effb2c3d47a7bd32956dceda845f131f52c5a3131b1a5171bfe2aecdb45cdef3f7da258f939107839847117e6e8d1a3ba0247c351684d459d740f2127bf1be3bebd143f2ab13d2a1126f68ae6e15f774e3b08e15ba6e3b28505cf694e4e5886a7cf9e9d626cf252b0b6e60b080c5c006bba94d34584099265731567bafe42d43f3191d544e0a8ccad5006e92b61de21e2bf39869d4488dfdd9ffc1c9155f3f8f805f66dd58aa29eaeae7d107282658942ea8930899f5fbd7a450c8a0b0bcec6c696f8e64aca97c9272f5e3c1e1f475d0958c4c4b4bca9dcdcdc24b966422f05aeacd82b3e85f0cd2ebe6a78345856917e747543e6655287a9a29a9a1f00646b331e9d0a52cceb8c8c4b8a8a941419add6a5036f1d17f4a5861eaacdd30c1ecd292cbc1554fafa354918d6bfeaa351fec52c1536b0cedcfa597b98caa530ac669923258c047c74dce25b7252d266bade888888a1c5b12670bb6052266666d47d6626266a7cb642edef758796e8b4b4b44ceededd85c9d42e3f0a60fed3e4fd46465acaf69b344c2b65cb9d1a0d8d8d5e03160a2bb92aa4ffa8b8768eaa376a8cb9bf4941dfd5555334b2efe91d4343205d4c108c248d8d4f62fc446a4e161f8cb996ac0412380efee97d4303096ba8dfc8726393dfade80f4dadad8f06e78e6c286774444747572104fffef9da6cc34d4d352eda5fcbcbd5134bd56336f0c372e1c231d0c25cf52cd66e61879fb16b5c222222fb474bec677b0bbcc8f567bfcb5dbdcacbcbebe9e5b58bd213cce8ad264f7fa98382b264238bf2bd7b19241686208ed02bd884e38310a96a0d60d920ba80abb49d684d00411a18188c2c6f6eba62aa8ce3ddd85fc4f45f27cf1bba6b73cc35a665a5fbc0f1a7577d400d4854326e296b350e47b74dd4009eae9e2612b847ea6a74435191a5e2d7fdf3c763afa726fa6229db6d0444669c965a84165a8406b12e6a9c7bff138e2a424329319eda39beb2493835f7c34296dfa843c68ab4c1a03b3a3a24b95c9f4d8ba3f767bd0f6ed46b356bd808af39810b9b877805f62b95d1d1da3df03a2f4fb1ddf47a76d55d73739a25f246bdf6d1a2735430bcfe7ecdefe3e389e037bc243177eedc91cc7c9f929e7e95f2f1e4b273a646318fde85612b356bd716235b29927c97558bf6c3678e068f2cb5491c198dcab0ff9e26ceeb1b7fdb355720fcd7affb94e783838298252474b8407578e7136e1b0cf1fb10c067c0f7f39c9c078383831dc79f1987890980019aa6e7fad2fe27e29eb87cf7eea97e0ba107d5ccadb122e1b95cc50762326e70bc7a7dde09581f0bee30e0084f352babef0d94af95d36fef135ae8e302e7f042cc85c25ffa43bfc0cd679acb54122187f4cd87be5f7d0686f263d959e6e94d51982260d88b8460bbb9be94b8f54c74071dda1fb62fa524f39df81ac6457d40cfd1910e8c6cff53eebd0f775d4fbd59905d6a3ffb3cd1195579eda711cc472f4260d429b53f343030206926ced253177c4c2646c4b786457d92db1bfc2565112afd881c1ba449ec59bbf866df1353d9cb97f3eca65528570044d74cde3f3bc3927827444f61f12ff454b401578162495ea76ebb89721ec3011fa3c2b8be624b36ea0310cc4700f8729c3a459903eb0b566a6068884d30d760a6b8217a245896aa883b242135f5f242191617606f107a85380c7bea1bde175091107f58b2f9643df5f5d442ffc37de414c1b2b5b1e218ab89d6e3cc9d4fdf5b148f024ca36362f2d5ce0181a739c66bee612bbe48e4b9bdedceacd26158dca757dc4763bbabf68b8980953003f8fbd7d9d9b2cc1414f1270efb0fcd0fd748662eb29f3cb9eff4d3ab05aaa5aeeb6713db39b0b8f7cff88d3f08a79e8f0c4feb30a5449b4881f132172f7a392ab816b64e7e4985d5630d2521631425291d78cc6fdc2a6a2f7173ffde87ac57d0997b138d7d28fd5bc61231ee4d236efde8d1a35c87396d51e75f24984f9f3ef1ce855d0212e10d926b74b8de581ee64f2013d663a0b4d9d9d795a351d42b2b630043d45fb7fe2e681e0e51bb6ca9f5822497f027d342082a000013afd61ae5fb5fa50f6ff40e3c722611f45b79542d4b25222a0abdb58378f7a2e879081b0026c011bb5732edd9b3272080a95c9b3ca685bdd7bbf11a3b156668b67890f6d6a5e5e565b8e3a7e965fd6c26270f2015d47d76a50323763dd95aa51f8c8324d817363a4c0bc14bc62e0a832c646842fadf9bbf01cfdc1ec97df2e465658367d7d86b2bcc04fb3289c24746f46b8ddba797034e33961c680287356b1fe8e463082a10dfe1ce7ec1635bb4d988ff2c3f7f684c4c20ac64c09d9238867633be79ffc9a9292939b98318dde5a90e1353d307d753f17cf7c5f947628d278b6d6ccfc795d9fa12a0ba7f4040007575abab86378bc5f6f3c6ac46e5d334640cc29e499743580154416007c33f1abc17001e4db51cc42e59d9bd5353531f6c419c9f4c04004a5d7670107a3fccfbb1a949514969f7d3ab27c63b9f695e446f2282c8fd7ef2feee3cccd56f27f5f53ec75d70901efa7effbc5e9e1a5864aed39251de9c98cb4ad5e4fdf7a30b7e252e14f70e15c3c22e08655d4d96d2d161727671415a4a59d5b01127ea7b5d34b0f601b8711afb52b184644d7b7b4108b13459fd36b6b6c30b8e9fbe7c218a6af2018801ce573e46f0d4e94cc693ee318b7c31992525f420b1cbaaaa5189dcdad6d60b6535cf7a7b7be9a3fcc74772181bc7b838d508447917e67c1cd9f5542a2005840025d4973b11635901d1691f66c10d7730f5cd9bc318ab99ee3c43721fbcf022436f7010677404000b1a7daaaa7dfb89f9c7012b51c6b607ad7a6f94806a51bee3eafccd9f45152cbb50c3b46d552729cb8e3b5c575f1ffae2c576f7aaaf5482d34e45c346bb894048394e290cebba3ae0a070ff9af13d9efa0015f69cae838096828f095dd7c82a7ab2e9bef3317bfe5974b4a49e5e4274ce4982ab8ccdf1f55321565979b5b7e4695f6de09170316a0263543754387aadd978eb59e733b9aefd4faf9e9ba698c0bdaf2e99b99cacc47db5fba108236762ed1b7da2f8f676c588c8c800ff0f20cc3c885886e4817e268abc33b8430b59fdb4d3de117fc969642a0dfd1ae9a143680bf24969cf3901013f1b65d6c4b1c77a0a53b97db30d106e6bf5712b37fe5e6fe2af61eda500381dc01f0693a19a237bf326d5fdf35a08d51670d0adbc22fb1bed81dffa1424ee8e0f0838c0d7f3f67aeac32f93d2f0a5ff5cf8d844e0e33fecb6e0a58af4103f1f9f17984c7fb90bb08fa74f7deaea6445979af91b198f52b627ea7687abc75e3ff92ff6fb407dc5abedc70f8eab7272d63bdb6e1849c067f63ffb9fcde841e03cfa482c2d198085787cc83f34dde422f77495b1890989cbeacf5a30050ce6d0a143bc4783f18a91a8074f00b7f6fcf9f3ee3f8c1781c17ef23031cfd4e48c8c832e2b33d5f0a55ce765d3cd9f0e9506dd97a4390fd4bcf83a7aff7c9ec5c0f9bfd91119964193955489ad5388e927cae47271ba9e3e7d9a575818fcdae47dc0527ff354b487e0cb7fe95241f757d373eecb193a08bb484830b5896f98bdf1853f28b4bf49471a52053a7beafd8bcc4c2e081e7c1055687c608df4388508b43fd261d0edc8ced6e04e307a17910b87b4f4af08ee98037f346104102dc6131ccf4c7f093f4a4aa92b93ba2851fd11a6e29bdc745f3f9331355a1af14b972e75e719f892b80064a65ba1680fa8c93d79ae31abff794ccc5f3554f7fafce5cb4212d3160993c7a6f51b5f2918644f18b92b30e15ce33646e4c14131ead02e0e5d701d41f5f86670f27f933b8d294a69b91e3bee9b7d955bc7b6d7e377447a6a4052a926b8e2fb19af5f532c2dffb87f5e38ee7a6b1708980c6454fb4746110750631ce9244506111b62f0dbe0ae1b190f53528aed913bfbc788587e7e2b3f8869f8f851cac080ed85d3f83343f260c2e3b56c388542eac3ff6616f436566661e51de7ca57c1c93c7cf7eefce68cb1047e5d4c7671975419dfbf4f9d9c9cac5ff1a22343950d160460024111d10bc28f6c4e786c9facca3d39d690d50f7ef3496868e8dff4cd2e0c7a9fda70951711ac350727e7c3018bfae99cca17482ddb77df56f252e0a096c2e1f6338a3a32bfd840279418cedfe7481b85456407a5bdfc227f22cee1db7f6c8e1a9de531eb7f4b59fff8f825303650cf277171c1c0b7e9d1e683c4e83b10b67681f561caf67eee6755270ffbbf2c2f3f7ea66c7ef7235f5ff4be13c33b77f029421c2538acb1289ddd79dacd11e747344ad294e5c6e36f1396f4227ae95a4245052304bab7366307201a5b2d8cc880a0b13d97d858134fe61a664bdf15382a20245403411060d3eddbb74d2c2cae238185b1521ff0aff255daf73725a7b4f47b3aa7ed5d564cbb89ebd428acedfa06602349d072cdff24278dd18bfb18775352b6e8362aa3ec5ff2d97fb90e437d7c028c0af8ca3fe6cb91864f138a01d915fcd7b5aff4dbe8e15f272948f702b6ebf9c776c302f0e9ba252c1e44fecba8c31e17b37e09a3f1970694b48bf9ce9902d9244569564a8ca4b3f379e5d31d116d94ed9f056e71164b327b6667f37cedec944a6ac76652f94b5bcd0f5d84f0970804c0b835b67a7e7ede60151d1cbd6f67d762aab958316b5feaf8b3334b43add8e2384632f58b5e57b6d68d8c8efccd577f1d5dc494daf0a5250818bbbd30046044062121a78b532a3a7516201a1016f8097c53b9fe637696c6808189297e458455ddf9bb8a05aa06647d0bac98c7557cb060d007c8b478bc65ef13632b2b0af17805e21afed0c10bc7e3db7cabab2f6228f414b087bd9ac61e341a2294c6581a32c67134f8bd8900acd509e41e089f838f92f7089c013a211823bf10ebdaae98d131029adbd0d24293132762bb17e8396871ae1a97ed371dd0a34d77095146858f2a4baf8ee2c29e8487137de03940d5fefe76838a858c8c0cc7e9d3879bec4b8f039822f365d3ebdbfbf0621e576571498953efecb1e03aefae4b091457af5efdd4db1be0f0cd69c2fff4a1a4f61f069c3e58dc6ecc6be5d3409d1716ac4d049e9f4ce77ddee29e6abb34dee23417f577f16fe5bdf71daf1db6f2abb7b3b313b61e2106bb7b09b093cc57514b2b589797e39bedcffe12a7394e98e6dcea49d1c1fefea0eaeaea13478c801af2fd4ca5d70692225a684e9575ff66a18dc6d5b367cfde505323c1d0d1d145afb88106285b3d6f3192097c0b240f60d77bc3b3d546f9d500d3742fc37295699f3970e040eebd2e1ee2ddbb8242426a4c0bf159b2a165673d81a3c3cbce34d31fdbea5587611200a9bbcd04a3afb177cfda13eff6f2766394706780fb07f55814077a84cfd85ff8f8f12306a39241239bb4b0ff31f66fd2774ad787bce53660ee23ad088ac54d022701d422ecbac61b24cb86dcc5f89b27831e809d80e8faaf9f805805e8f31130d8fe0a374476d1267af4ea48f333fe9144660c785013bcc1728e9747bbae3a630f5703557d0468406fe09d5d4373f3b5b7815a155625a0be74a47bbda558be7efd8ad0eea30ed3b88eb8d1306c427e3ed5eacf811ae0bf79a61da7bf7fffdeec585ce67a8d42a84d76f36d6969291f611b407febf772807963fced171b6c20fbc9fb52a95f125ebe9424be02ba80de56e9aae2749cd5f92cde01e7b38e0fbdb39ba6751567fae52c8647d884543f821a5f263fc0fdacd6e6f58419c8644e185dbcb80b20e89bfc7c454dcda0c1ed95e27cd35b42c74b4cf3b2b3510bb21fd3d3976edfa687bf5bcf74f361aa7af28d876d4a74f37b72cdfb04118ab81cc22873eb160db0cb22cb41b20fe94a4d4d4d79f6b3bd7b84affe3580c6e2cd1ce576d4ed91f2951a57a4f7187a4bdf4839ea28472c401b28d3fea6657af9f47814ca3eef7df83a3dfd7d88fb2f36b3bea243408fcb7eae6eb48336539dbc5ea5cbabebe8a8a638c02661616151373f9fdb5dc4b006b12a222282233d10d8ed9f5cd1d2445b20f3656d217e7e2a60f3d2f7ee71625e1616d280a121455cd0cfee9aae1daef1a519dd878969790490f66e57f8c42ac6333dfd34a5ab3c63f1e09c8249c8498ff12bd80713f11e8cf2f2f2fa3b3c51720cc58db6ce0d4dece1773fc6cfa6dfcaa0e65ef33331b5bd3bc6beef6bb8186e28ef865402c5bbd2d25d98638266d10be5d5babc09c78d01e3c32a3c661061ad3829cf4e95a9c2793d5e3cb8b7571dbca1778d1ef024b40f80f1ecefd75456516177b56c7db4b9d5ddd9c95e91c3457b10380a9abd2433e66135b3c56110ce03f5ac47da39f54d672a83722a7e1f000f053ec095bc7edfd85f79cb1dd77817fa008b431c97bbef3b336b854f8c6c92578fd95e0c3cd0ec5bd9ed824d7f722e0cf39933e4e6e6e6fa2540f11843f64d4e4e0abbac64befd1115177728a49e08381a26e040f4e2a24d9ebb86c63140e705a3ab8ea2faa48b15df976b867313d5af74c2d08687f56285ada5669842eefad3fa4b0f59097f889bb6283ed6d3d383c114f7c57dd2ff616df1adec549db920ca0bc8b894a5a4a478af6e6cb933883953033b0d2889e0d17a877dfc5094d1a904289369e151325f22b447a06023cc803a9799a44a4bfb8f7ffed832b75a33b1746253e856e0c754f44aab8273f97db3af3333bd810e0a33c86a690d64a6d32f2d2e7e301069e829b84b058c81f2800fb57917a82766088c0ce359b9515a79d3acc9b4b0f5eee6a0c78e1866a8b7f01ec6f356868abfdb23299657c9c9bbf278c5dc373656e72ef3d279637140d5c037933a2024efa7fcf6e2230472c5b13825cd93b7cd32e7597c1e3dda4ba90ffe0f5c51ed9b6b152e1a1556a7741a883140a7064a1d6af4f324b354467d8e68534c676995aa685af5810b3121c74a14dffdc2ae183a6a258c52b6b3f6da8ec33ef467ba1b6df700c9b6bebcfe42cc85574080b872903ca43e698de16c89d48fd11089baf196182f35c7b34e0fee3f7365a1caabc2b2b1115d7ecc40e9d5040e95d12573b4711abecf1749b48fece5bb7747ff64d894869242c4a5808092ee2502c2261393060a686868c8f18dc9a339f67a2a899b286388fe7a87aa4edc1b562fbf6d90f5ac7d5bfa530dd77bf98e09374c5a13eaa5e6d75d81f403a07b9d91f1b0d1f0b91de630d301b7e50e55c9ccf44f6336f2a5ad808b3dbb57edcbceddeb6cbedb0f11cfb95cdbb5b26969ee9afd442b046b7777715146f24df74a920fe682c78037d1e3b72477d91c9c69342f45d907a5382c6e6de821b96ea17ab8fda1075ee4fbbd2425bd0551a81379219b549d67500f04781ec6999093430ef00625b6f73eb4126640adaa175aad8365d93a6566787ead094a845e31547178515fa9931d869a9094ad7ce4cca9020d9a5b05177aba885395b3d12060f0db7d1ecdb7cc8c4d3b13b7d2946f3ec285b0e1c2deb2898b0b073a80cff58ebc07663192d76e72ed75f6f3c7b5fa94472edd3335fda08975af649aabdca9a03b48b9e5d3ffb1c528ffd4e95d51bb93dafdc6c7c7f7949ab0ee131c1b1be3e0e080b8d726b6ca40a19ac016ce693d6e0a7101060cb1d57b644381dd232743f9347a5d4b33a5c3f0fb3d945f011bb64c0ed224a6a62525111d3f7ebc91712fa5e2c70069d680953c6969db5b3a3a214d51674ebad04917ec5edfda16199c7f77c3715cfa812be5f58c0e80507e25dadfc7d21acc6db86803aff08ea5c7a3fa77e59e6b27003e32e372ba6a4c0446003ce593f1b00792077ea79538bbfe9e6d9c122b3f06bf5528d8beffbd74ee644cba3ec736797c63fcaaf577cc35f1cec5b31a2729e4e52de46f6b69c5cd246007c09276610c0c0cf8bf65b1b61dc2aafe68602f6ed22c34ed88986e12226af8e6387a88d2af6d9c87be503d989004857805ac4b6c65f04462ad92a2a217a00643f2877e1c77b62a775677100b2a93bf76ede5ab57c43a80c511e1e144ef7adefbb0fa49c42901c7156929501e54e1c5fec3c2cc4c99abc9c1371eb0534d4d0ddacf448dc5ac0f672ba5a19e0ced29e6262626bd6eb830efe7cf8f32d3ae34f4a56566c6aeae2d3b9747afa6e4e428289a534938b4491570f595bb1493648cf4652dafae065a191575889f7e7a001cd7fcc61698fdd2bb831e6666669d7387f63e4c3c74534323467f1d809bed37a1761ba12e158ba6b8cdb8b1a5f51bb76ef9040591022a696dbdfe56930740017803d19dcd25c9ccc2b87e9eb314244323b58101b38dd54fea472fc23c944fd34825dc902a1c05274efa61dcd165a1f648824a06b8aa0f9527aea752b549ec8842d8fe1374f3b245436eb806dec0d031321ac508a92b53515175bfb3e3fc3958498e68d87bb4bb82df22c4398c37d3d78abc0ff1d83478e140d95ee6ba315bccc1c5453da181ca5e10f54534a52048cc711e535858f8048b135d15f25812c21d236f7b79e5469af2da8fa410b0bde1a575ddb3cf0e4772d31e04bcc7c6f3e19c80005a1be772c6841b24a90af1b47d7da50e96efc565656575f3d4e6071c06fda7c2205cce556c90ed2cebec244737bbbaba8a0e4bf5cff6151b9709ab020a8c6af201d40cd00ea010fc334fab5cbb9279d675e424efdccf9fb2c0d6c05bd70eec80d9d8f66a5b5be7bd7ebb9f78b75aa5bb18cabea7677e3710d5b13976a1849b463f6bc6c6c6465a8e3da625f293e06393648d8f59fd2f5260b1956fddaa362d94cae9623beccfcc4076099036b88a3dfa348284fc638c9025ed9c0be2a3bdbda78b925532647e68ddb88109967dc8b4b3568f36379b295fb59b00bc41bb624beb1fcefbb979344a3039699fcdefe13acd3eb61eb8b8b4e4f5766ebec6973c093c100831b632e8057a8f6ad9c6cf52c7b579168a8d628f89d63894ef50fc8cba6228bc65f186888192d606f56488bafb69c5a0ad08b457a65ec728eeea3735654ab922bada6fcb6a759d76aff82be0ba5e40c034df5a5d546ebca6cdc3cd5d0b721c5edd488db395052306f86cfef1c8d6f7d2ef628c216fd58e90f9e6392d1931af8458ffc9287efcf8a9b3f3d1e6a62b83b82b1da028e2d35f0a2f3acd16760dd9947cf86d531bd23c799fa7c13aa0f28988d3884d964aa056a97dcb5d97c5b8e9687da9c5999919272d93ecf4f4c312c7c21b89f37b82e0e981075f060707d3d1d3533699dd92893011cfea47fbf1f93da2e66fb93c3caebdb8778d5d4222c6caf99d7983516f9bd987366b5a0518ebc4120b18c0e764393f6956de67d7f6db169f1312427b9ea04675107b175a2fcce9baba6a52ae61aa42d92ef39e3dfb000861d942dd3160483280a8bbbba3132700a77003c1fcd4d7175851218e40d3685d70620b837ec7d37b9d99d51d19aa80948983658952bff8a303e0fda7325532da4106a879ed1539b99afc36f10b7306d202c754b3352fbab995bf5d4319f03b075559139f8eaf56ee88896faf1960aa50bf3dba0fe123337f6b0148f7b69eba2abdf4b9a3c327329236affff3e70751dacea7d20c5813c7660144aef97aaced6b9f4d03b8ace3bab0275bbbfcf9576bbef904e2c5d87d5fb8ef091c05ef4eaa9d738431e4b2e2d3a4aee93ccb41f1f6c4cbe356c2285d059a6737dd79314ba566d80ae514f0dbeeb7fbf5caad4765239e3ead361334e848bf0586696269e9db6274c9de7e25c8416f7ad919e8494271b16a4152536babacb5359fa05977eecb703b21102dd8695c5cdcc8cf85f7efa5a8a9a99b9d248e06ef25222202ec5bd59e74b936f6087a4b80ad23b6a9a141524bebb8ba8646ad8c0ec0cb07c298fd4dd2bf8e2c998fadbcddd111cbb6335054a40c0808302acca92f7710e7669d78b36d567109b13a0d8d0ba32ecaa76fbd2f4ab970ddb450bdf9f82a76545f868d3bf2f163b2fbf7ef03f7cad10e4e4961ff71ff1d4a4f714cb2fb8aa1de8240a72267f428db0f2b13421951de5256d2e59056a76c906849f4e999f6e9e5b591c0336162029b1d6ceb2a3527de033f54e156706609a48dec1734cbeb8c39840ba34d5e5d929a33ceab939753e5a07ed061ba0723e3d3f365b14568b0caa298885fb99bfb641816e50600b0841ce234b1f83ea8e594cd943896999828e56a3c854f7f69bb32b33e679f711a7f663cb4bab1d078325eb7e5f9b9b52e8fad2e43f270bf1416d5d32ea22f5eb5fa8bf0f17985851d76dd5aee92347397f6ada93ee0ceea9c9e72d00533f4c19feaadf3f269a03f8f7fff760ebdd3b0874c216670ced8879c3b76fd91a002e7ccc599ec85dadc4f1b7add9722348ddb5e8056eb655c627d1ee5efbf1fbdb8e19745eb7fcda6714cc29dfdfcc647fa2c2b65f4f41284075151e60d75f58f7354f058a3032e4a7b724e535152d6eef7913231378fb3e5147a1ef7ebd77d47d117f47db687b9ef24252539ae0e382ccc0f5ffa2f49db64e24762d205147f9c119f84be9393c837d7a516b4469125c9142b9e5e2829a473051f3cbbcd8a22362fbb888002e2cc37247f09a0222380282323972e5d7a68e224255df019e5497d3efd4fe66199e64da897fb7504e525973adadbbd403b98056f5bfd93d18e388c82bfd4eb9c9cfab1a628afeef54ed0511109564a313bb9537feadc7698344a28db5d6fe16b8b28302fbf4c0edd3fefb4e0e5c7f1488f9c522c0dc48876d2a7732af7ea2fb19d672013dd98c94799446e5b396ec23d588b6cd812d7518e17704ead61354aad99997df7b9c69a480712f9f5aa626b4503eda52e65157f733e989c9cbcc9c392986a71ea4f99e307150b690187ffa35449f1f7f88f5447fe559c9848a39bf6e7269cc7d13c34ff2d44a2205903bc18ce2231844f11b69f28627226ba2ab7cf693b4f26a39551f14c6620ac4c962112a5ed5f51da2f24a4a5ed3f1fc783af82a42775f1fb81ebe8ea1a5d1c6b929c719dfed19e14cb14ea475bab444ea8c0544109c0c492d7af5f570d0d31a3f459f5e4fdc511224a450634032c3b3bfb0d25a5073995db478736fda40b1a222f118a010b941ab3fa8129a30c9f9100584396467140e303fc2250d630b23a1f1e74dfe046b529eb2a483033ddd57394acead44d2708f257f7ffae620141b8a4a4a491918c3239f7df11b3742df7cf060a47322fa8d349541a7afc82bddf3aa5c742a0ced072974ebdd0a06bf84c0265fb817954dad65de9b1f386e4cf9c584b9ec6d40c5f59b9e1c7e1f33fca56092f5b12e2dd1c9c9c374557c7a2744600795deb8df63319539f225446b65fa51afc289fa572d245583a22f1fcf9f3a884e703fb418b7f3601950ee0276adc1a7bf1debd7b6f7c2f4a1363727bcce4c4ff4c1187174e5262e26e2026184cdcf57d108c0a0a0afe35315061efc44456c58bb30b8ef8843678c20306c57d8035e691d76964fcf880a02aa83ea1fd1aac47aeddb40adf6d2b423dadd3ae703f93c3b054f049f3c72b040952087efae3c76b4be72a027dc9997663feb523c531866a6a4137b45081a9898cd5f93874fdcd77366307a6a6a7f1a5b492c896b9a5a4a53daa73d1de264721df3c0b6be29db6e965c415d0abc510203f9542a024184f88b649ff523b1154c40ae261c24ba1f3bb880b12047bc67f51325660faffbe3a722f5ead327b66ed519ed987e00a69f0b5b18677ee24e4e5851e39e3ef9752851f92c9245e2a4db4482a86a15788f7ecd903aa93e0f893dc638da8c8bc2ff2ab3598e1f93f9299dbd7c8880137f685b9d8e682d510be9e13f3a7d2ed3d232bab73d944bcc70bf01df802d00368d891f8317f312dfc3133e38dc20983843b83c47aa302a158b80380c7255f321636b6877fbf86742ff238b2a7341381a3f093b7191ebf494c4f4f8f3b4e45a9783a70a7158b72e75febf157d2943cd5d0d038f6afcdb5806a11b426b7ff6e30a14d027fb56134cf475dd33e837397757474f07b3f7f36f05e13fef800f8e6e4fd377fb2fcf0c912c62feeedff6937d18ff6b8c63b7858d8c9629b52c705fd7fdd2f821aff355ca0e5584abb49981803f82a6e0a92971919073110e037942ba266ed2f6098f9f9a96464640e566cd58762f78f8e8eea8b88891d3f4db39349d81bf83eaac30e837b85aa2f14a7dee273e74c9897e9e95369c4e28b2bbbb84c87a8fca53f0d0c04fffc69e15da3577b4f30e650474707a9fb9f1d87b523fb2929b96f23bd2c58741465c478aa67697fdd725f6c3c894a4f31592a0793da39de9f2cee0b0e3c726664737d29509c8720af1ef230310c8c61dd4f36097d3f62f76e2f4c62fb8fcc6fc7e0918383e4b830ea365f29968541e5e96babbd8661d896a9f2302c20d266d318bfad18365f310233686969a16360f0fe9323d32cb537ff68b7b1b1912a2adb6ea2cca7bd9edffaebd9a84ecc94f0dedd5ede13940e416ca17e6a914c54f8855c24a850d89fbdd3138acc1455961e1b1ac40f2f32af94bbce7d2bf75e0536eae5b58b41cc59b94c1568490db984b4b636e357d373f0a54d7709cc4be0a5ca8d10765b62848830bf9cc5fa2d84325538290e6a3f8f89a1194dcbc9512dd088d97c91d6fbe68eb1b101dc93978ef48b7b27509ad3452cb83093c1ceee6ebff4f4d3af3b4c6b0f912cbaca2e70fff8d8d49477af8b6761ddd9c565d84af8c3423853545454cd98cdaebc299672ed33450bffa9634a4c4ddd17861d069c2e6c37a5fc7ea1a5adedc868908405d89a7ba5c4f01a7ee3adfd731d7ea636bf37366a073aa4a5053cc2b0096fde1c964da24475c9581cf8437da7f3d5ba1477eedc61d585ff43a975409854df2e080a3e029e53eb5233cccb40b66f656e901cc3c1c3433b179213467fec1855c8ea6c9fd0ace3632689c76fde9c8545f8b1ec6c686c4c94b7ee5ea69de33858fd70dfb04d09f5dcd2c616b8f14bcc14d1f61b7b1f5ef4e671af640260e9f5da4c294db9a1a1e186b758bb09357afc0c5f4ccb27d342ab124de01d375586800ba989ba03094a11650cbd22cd500f00f9b5f2695252d2aa612bbf8916a37ce10ae019fb3716d65d593563ae335378b69b78b79b4873504b797854ea3fc3ebab1215decd29fdb38d6db22b56cc851686a19e457be2c40994447dcd78ead4a9ff8bb1b780aa7af9e2478f854588d2202a222a2075e8345142900e29a5bbbb5454544a40a44144babb4b04a405a44ba45b403a7c7b0efeeebdeffddf5bebb958f7eae17c6366f6feeccf6766cfec503b213eb5eba907e3f2f351dae41b71925e801dc22f8c365b5b5be06027c39bf1be7c3e835be5b93824c2c6f6369305033cfe51df928dbdfda12ca3b360f117effabefa563762719ecae766003d71e5f7cece910e69919a985b9e1f3a8d0e60503ae19232da7d22f8fe161da835b86946778a412f9926f1d892c3b78101ef4347095f4d82b83e939fd166f063c901090f18fc5adb8501bea5a856e16d4941962b573018909b075e0994832b7c6c1eb0b11e080a0e1efd59e3d531c4fb888de20bb7b8b8387a515ffdfbf79bdf3d25450b8cd7ac9806e4f7ecd5cddc256ee7d4bd37433000b43af561812f5a528c7ac0464142ca373f3f4f414d2dc7dc985619dfdedd7d99b6f1829f78dce762db599247a77e7e0eb9477f30a1e32a6d636d6ded87eed947fbe2dbae44465d9d2048fc52575eafc947823e9d9807f772f503fbdf27ed4f982d956f9c881a1ad2c0272262d2a870d9e4589bebc5ceebe72b333bac762a9d51fd7cc4e3062f0d61dbe3fb71b2c8aa1f97adadad3d37252022ba78f1e2ada50174be8dc342d9fad02d6363a66755e7e9fc8f7152f91c7307cf037d437281ecf11fd18395c0729ef494de5c2e5e026a73ceb9e379f5088a6920b1810ba1c926b44a01d60e820b4bcb84e2ec7d702208c41ea2b1551b1bbce0c182b4d29f1debd56ed311d3083a58f475477fc27a0eecd95958580cf5dfcb7f70e5f9efdfbf295bd3266f092f40401d29950ca0e7e4e4c4e408eec53c380666434145f54c34f6a968ec0d4343c3cf9b8f39a9ee989bb38205010d3edd72751ced215ec61ba4c7ade65ea3c4a1a805bf80c0536507e8cd33eff5e93cf10387f53942491ac1e80f5f1cb1a0108e668d890b19c8661611d114e401bfd462bbd2e5e36e9abdf1430ff44f47396bf9b3bac575afac2f47799614f8e5da0c387b72f48900d6e1b124d73aa0f9a2a2a24f943b032587a45dd8ce9c0ba967385772ed61feabbaee0ccdbb9c54a48fc2d44c4934af92e0e3d5b8fdbc5530db9dc1949fd23dabbf7ab45035ad161d092c2cbd932d5801a8d2267e49acdd7b92c0cad632b9c8663ae0987e7b47c708d0a3a8a8bddbfddea2b168de79da064d1dfc117a5d5a2a081ae7729f68b64a9aa2650b997b47878edf766498a4f0024b30d3a332e054cf575a43f3b5f354d9a1613f7f3e463309af6ed3f5943ae6fc8cc806ac62083c9e201579534f8f01e5c339aee8f598702f158db1378f5b7ffbac8debc5e3b85ecc0449c7f2f9a9165b48a6a0dc943677f899674724897550b0cf5305800a699ea03ce40cc279881aa8634a275aa4eb485f9f49c9785367bf3844ea7749ec73f49f1d7d19ca5c90f3c4f285830b752f55976ec69c02675cfa5175686c62e260d6757a1e1ef2cb5211d7555428311f8062d5f99e3dd3298e9970bd9b0ce3ae9171179c6fba238134637c7cfc40d649aeece5e565158541703233c5ed60fae397a5a30e3f1659dcd02dba740e75e7191f51e83e8be53131978d11cfe39197c7c48f0737c625461c3f7cb0d066faf4f2ca0af267674f4f4fffe868d6641180d79f13e11babe87883c4d3feadbda704ceb51b707e3c789195553ae2d09183072c5b00367ecd170c8316a7636525aaaeaefedad878a69f00cf03d8a1205c2832cecd494580e66153d54b1497f81fcfeb25a4909c7871b3d0759b1b259aad3aa163a197f6f6f6dc5255f3c469c81ddd8968052b4fb2969e678c1d3785cf4e0094914e0a813745bbeff145392ff029a729d6841cd0826e0552265fca72eeb2570ddd84f33bf7f7bbbbbb85d0a73757c577b25eff096db63119e3637776727af0e00126a5f34499869ffb5682bbf8866303a912047854618cc66f63f4598f638e6446f7685f9ef14f1ad22cebf68de15ec0902501ba15a7b2af4d4d5fe6fb0b0e5c97090a0c0c3ce4238a16545eb52eac6f5bfefc723c6b11783b31beeb5aaffe1546c6b0657d692fdc4ea55c7a946ed1f6998302ff0a2beb518cbc82c2480db92609f9724a72b25e2996158b95137ccfca792f805ef5750d1333f3e1c7559e2e09c6f4a79f76cfde4f4cf61f662ab81f181d9e74e4258db796ec8fefbdbdc701c563db5e3db8f2e998cf5832dd973d8b35a732ec9a674652d20d3092e49414d2b41106e7f120a52762a462cb7697c49e75cfde8180b8b4d0e26075c96f78913cc6afd7848c9c439e3128c458dfc0e05e566b92efa21ae0cafeace8c7ac2c992c357575a10cd3d360ee0ad0e7762567c131cacaca0c0c0d89ddc3c5039e5f3fffa4a1411cc600256d3f170aa0af32e18e4d4dc50746000a8b2dbc19bcea9eb474dd48b5e79d9accee5952d3c7c4db3c15f08d02f361515757a113274e7ce1bbedee2e62c24d0dc081d69cc1d5daf0ba462caeb470151717dfbef3bb60d88d292a7a4703a25678f3cbdc5cce087edb130c8162119368475b7c3cdef6fa629d75ab90a75c82d4a33f7bbb39c26e607c28715657f7d2c26089674ccc057845e04dd43c661fcacb3596f6b6b69c76a6a5dd3ffffa053cc3f331355001083f873000bf0f222a088988aa7538622a2a34bd8bcacb694bece60f3e5ea16bb0966f881ed4cb1969891400fe43c2c8c424a3a2f21aee89f2f311765048c303a12178478f8277819d7de0e5964ab056ac8bcfc8202ab15f2413691dadf3f3b2cef3f6c64799fefc9184f0e0c7515f37c4b3d2d3596c6c6dafe617990f0b2306c87c37566663d7cd520de89f5424ff0b69e14dfa11fd3fbbebc3a3a04df1303df37659ac41e22ffafa548917d0b6eb6fb3abc72fbc033468d6936be213abaf432c4cdcd18aa9609a219a01e82fb08daaf1c660627c3cb4c90468163e21e19b71885157bbfb331f7938a82928bc00b65353cabda4e13ccf55a8c602f8454242f2aac8f054ca109ffbdecebbc520521212c135ebd2ddb57e0353d317ad93b7e84f57316594d2253b36e9e514f6730a085003c941abe8b4b4a2f4a789e7c7f592dff61698471fe36b6868806073274ed225057ff3d9672fd6f244dedac5b2755aa928c1abc2c1fdf3510a79c96af51eca531ecaba8aa53c430eb772eb737a4d7a720d0337e6964b6f5a931e3bfc65d2c8dc9cdcf4c6a993ed64c5478588896592df88c65eb97af5061bc56d4747c7cf2e3c60a80a0a0ad74df6ca408c5d4dd600ca708ad0b3c609975d4380828f99194b5f7f3f9008943ae3597d815ff5ab3549c3ec8b9bc84c5c801a642a331b1819dd54573ffbe6cd9b533ea2a8c3b4d8120bafea67c3d059ee3dce5226e129f99aa63dce3825e4bcf6213b5b566d2a582445ad28e2fd7b3ccfea986317e3676afd434393127712939200a0ebde5f7b88e288b7b7f7ab958a0757e87d6578696ae143b44e79c985b0a8e176007de1a0d99dced7c00a5e9c24bf9d27015fd85c998c514cc942a1a1b47e6dbedf7360404dc6751497e5fbc5ea0a098afaa0014133027ede5168cc33eefe9255643bfb9e57e98d08370860b47973e6326e97e53370565f5f4218574b5ac602221630873889608b99ef5781032d512624bf1f063378dc7217b7ae9f51d86bb8be3068c14bf3c6916394a91e240830722b2b2b94f50611d6a437fbce8e604949498d8f4ae0f8e464f5bc5debd64b06a72d8778a9dbb7afe2366546d10689c78598e3054e4487fae2524fbf001010137aee6f1a224d6bfa39dcdfd5f5723f1bfa4de6d12cb60b7b1f5fed7826b8d47dd2c888eea4ffbc58ba4288f931561ff86b7b978ea6bea585ccfe051db7a1a9bd3d8f1a4b305d22ee1317a94b101f69fd8e7271717d7415771110007077dd5e7bddfa51310501337856d5e4ca55e19c8ee9085b01be3cd56b3719253b86582e5f3e2a95700622bdacb7444ae767680253043b05fef1b4a9f7cb3af528670d25a7e1e3f9439bbb359caf8d94de26bc0c0e8e4a28f166dc48e53898651de58036cd8049012b9c999979008c34a79739f9e558f2f8c66aaeea354035b485cf8297d9ac12a5753144863202e1521299b5e15f52037d077072d9ec957fca1b62a5f9b322d13fc09d9ec13832e60b38baddd9a4b9b7d7bf07200626091e8e526d6464885ba245fce6e6e60cffec05579f2d6a984c10d94d7240b50261b8e828509f889c294a5377595d418701f7e4ef14fd746f59ce2ab21839c8a25688f9e24606204ed7c441e583a50d4f4ad5aca0ada9a92904b3d960e6003a6db66309c39e5f83b6138434ebb529a272051fc5d518cc8d75740ee3791c181c1cdcf8554d54334be67564737393829212adaea0834e72f3f3190e47c8f9f797a35340234a2ee376dd7e7c578b724793eec6c9be16c13f8a87872a1cc974caaaa9e17fd99549934d7a1b1eee05a6dd96228cc55af789d08aec6d682fd5fd1cf36278b50ad01f261e77737f99e176eb3a0135377dea39f76e9d9dc284be561d4a4aca8ddf1dd2ecc2c2be8b157f8463f4f774e00de187d0f310b4123a0d98e11b0c831bddcf690649619ba9b785dab2698a970ff32eb77e7e9cf5aa523f99fdbe2d4a6e34d0837bfd72109c9a9e06103dc3e3383636f6cadda33b55c503d0d964a8d4b16f53499221f0a7a5cb292bb4a1838c452ce0d346815bfcaa1ed3e9d7a0cecd15dde5a4855b43243a6b25ad37045b4040f8584fb68c44da0f3ded9f27335d88fa7e7388332c34f4354431adf656dd785769db1d50898814b5956f80e29797b7f5bc792142d85555fe615e5ede85cb97f56b5d4d87cbcf423cedc9d63d093204b8ddb7fe7e260da5944e10cf535353d7efdf27f83c92f938fad5eedcf84a7740c069806db45484645a987bb2d1c6d3a707402a83ec57dcfc740c4daabdcb1e53345bbec30821e29a55c819f3f8eb172e5e1ccd223fc849d5eced1e2162b69bc4501869926cd9fa523ceef476b444508b0db9f277a355ed4321bda577c986c3b4b337359ea00dd5d3a08550c2f15c5fde49e8705ea7df48f47e6b6fa763794b8d8ff7bdabeb63490935bcfe3703ce8d8d51bf3b25d9801f4b8b8e4030575a4588bef4253698d6cfccce5aaecda99090925641e8cdcb53b03ce3591a85cb6322bf56432f761330ae2b5d3dfcd4edaf2b455f9426256d6534d2c902fa932f705f6eb1312d25eb033045298d39faad8cb5d8334554576908bdb43939383e6ea49ebc41dbf892809a647e7eace87dfc99734f5c20905e3789a2896e3d0aceeae6aeb3347fc894bb3f35d958c7ea08c0b052d33a85797fbe29ea5f442bf737278c7d2526de006d7947ebd21fdaf5f575af4c396142b3026aa021395497af11e23a36003a163e28bd77677f064decd2f0970bad15d960f135b3814caf894f5e025400a19c8956f97e76cddb8d6e4e46df052e04e8a1c54661f1a3f280bc92121010189143aa6964288524d1ed389ec763167247a9f74076bc1c49c69f5c078a06dc0768c5cbba5199c367809981c5438443f9a93f73a6579dd8d77f00bf41f96e11bc4b3dda744a7aebbf7fd3e7da547fe23b9e10db668090bcab4bb1c7245f6570eea36c921677b88c82421cc5ca4d85a3f563da584791651711acbfc795a2f92ca984ea1a2ff284d222c3c78f0fc233159f7b04f6cedb9def8ae78d02e77cf4e8821a4b77ae0876b3f643bd48376e5988dbe557d5d14cd5b4eba91c6a7bae81ddd75859efdada7241e3879c178596040cb9c3ef38ebf68e0dbf40b94033f1ccaa1468aef1caa57aeb354961cbf3fbb377e2f1a12c1ad2e9f40bd3d35595951880af27f7c3b95f6fee946ab0a262427b1360e4771c1df99c9c9c90158252d602905257478b7a3d403c7a326a1edf00218732ea9ac3792e829e1db8d2dbdbfb3a2a8a16edd0f6243c2b6bd3f4b5b5957ce550bd75c5d79167fdf3a2e74f5d575222e7c062d18c98f172292787a33a5f21f059608912215e78596b05c65da96289a5ece1cd6fc86c9dd7175e40d8ce37edff62bd347b3fcf676242eff0c1036ac536572f48869a352debbf7117dcccabcf68ac9b688f9300473030363e23323abd7651c48e3f1250bd1a8444bcc96b860e034e3f82b73fd7492bce7d519df1f1f1796d149de4db1d7f3ffcd4ebdb2415154e651ab9d7deb9f3a0f2cc10b66b9a0b9614cc083d6fa592ffa175940c7447ef4cb9c1fcb1c2e9f7545bac0ed16316e82708dc4d7fce39af9febff1d396cb95313f9a7b280b0c5e1e657527e03efe4928f6a52cf9fc4eba45e4cead09d6ce332149437fc14cc6994547c3d305e6e20b28f2a49c5e0753277c23b9a11bf1394169d0d3ce976c7cfb36c7a14df58e5487edaf28051de4b7752f5b07c704adbbc5fe37a0aaf9ddb8d6767965dee2566edeeba892c2ef2289cde5edd2d156151520c3b8ef1ba2348cbb3583ab5b010b5b2840e9608b10f18f0b9130e71e1fbf7ef9cb1579b306ceab51f9377bc0f3ca9a75cac80f89a085194ef1cebe9d7e850973cc534d5b83f3bad7f225696300351bd7b0fdf54343f290a9664185f72f8fd5d4e3a293f7fcdd75777c7f55b4707767e956d121bdb39c4eab67432e8ddbb81b62cb094dfd309d161b38ce3a3e6498bcd9b57309826ccfee131188c5edddeeeb6828c4cccb367cf54a63fcaaaa85cf5ab8b053f090a0aba4aebd72a1e197236d7e610a68969ff1c1b0c26a4767b86eb7fb90067817b262727a34226ba594d5234e858ac898909153e323df2a74418ad210a0a8a07b8920a11792237ff1eb6c4549cc0cc82bbe9c9699bb0fdc39430984a5374944cd3c9c8c8c8ff3d0a637666d70a837124f7aa195bdffe7b340e0633c080ce105d668c94329e6cf9f7cb0be818e5f31906ff7c8d6f6b02bef6f29f07cc69bd842fb0fef38526746ce7758d6ffb272041cb847eb71ec00cd8fe73473d72ac0b06634ffabfce7ad28b8e6a2d4cf9f70ec25b53f060aad8a0f0e1c58420eafd4fd9bc50059e42266f45335abfbb5209d8e1f1bf0754afa303222bd5db7a7baf8a19191935d85ffdfb6a429e6efc98277c779978f63fd03263af3e8a61bb386da3bae4e022dadff1cf3b3e4415ed28f70f078f5a5bfbe75d27685d6d3118eb7f5b3b58850fcf8ab897d0b1ec54f66f271d446f10e1001121489201d7a56cd2cd36a6a2a835e6b87b6f4e849bc70f30d0faa5c4c6de428c14d7fc89181bfeb4c968778d5bb76e6de24ef9c9792e3d32e1fff3e74f97608c56445555954b30dbe297c7ec456ae9c735a5133afaca9c79e0522d3cd5870f6d7f7e79ed127c408bf8cd6d3a740213709b65f51318e62bf53ab2a8bea0d940a1ffa2ec9323cdd33646cd615c036c8212856f304f54ee408784949b57ec2a429041874f452fca629865894476d81e11619a2a2b2b9f0cb96d9bd63c66e78b9402b5365642af5525ce10088fc9ee9f4f4e4f57045553d57af6e74cf3ada62b98653f4afb823a83f189f5edcd230418b98dadd90c5452d4df9f58ac1d25baec8e8aec6997371eb42042e53bc3c2c383a4129a27f76632f61833b80e54decc76ffe3666b6f8f0efcf5135c7e65c2fdb05ce2205929740d109f2488e3e87cd321a7d96bc272c587d4f83095a91fc02a2487c9355d62502968f7ad8e687a3100ba2d4ff70d4f97e0233f68d7ea44f664eedfbfafd79363d2cb81b5c0c348b2444acd0657ecc481b2eeece8a86ebaa745a6c24c464a4a5abfb8be5faf558980806093c5b86a4ba3fc2406c3ccdc9daedeb829887adbc997562819221276ced0dcfcf2dc01b604dc71d4a85067932d83aaaaeaef1f1e4413e828293640194e5ede2b15c3d23d879a88c39b51edf78505b3b3c22ebcc3e3cccafb8646450598a0526b2dca54800e1c55ed301b5d2afcb9b441a3781cb322676c9c820acf8989ec8c10ad42a09bbe2cb22986ebbf46d235366a6a4c3c2b78e970b96b5f9e31f9b581277c7a39bde89ce21f954f5d82b3b5d039500b5f25558beec4ca20066d5532c86f37d7a39e428c599e073ad9890e62477550023ea10cf9be0af78af7ac9a518bed9881ea63ce981f2d0444444cfef71281610dc761bc3e03297a778f9ec4ab6659bde1d9172a68800047a4a2599b817c46c55ef1e3ac102a6a6a54b7f4ab51de5027ff81f39ae57b5bc6a8d2a9b1eececea44837424dd73fdbc3adf686988547e8182f0154315856f633dd72a5fae33c550559d98f40b9960b1a4d7f5c26c5fcc8a74c1be01710b0de5b12109e9a9e9fbf34752033d165a986dce9e7ebcb4dab4ef03c958ca3951117e70e3ce90563feb1d097adeb85eef9f061f8a22c19cdc16881076a6aa5e77d0578797953ea0e65165e0a14339464e2096e8c6b6f6ff7363de684b98e4eff2cd2f0a3cf2b28c8d1200298e8016f26e357d51c1646deec7d9b8ed8b14c232728bc7b964bf3e2d4812722c6a6a65cddb39b2344ee8905c36ee13cd7301334e87cc0ca9fa23fb0272766f1c38ac29e1ec6fcd9aef8639c6f95a39a7618da3a033d0ede10e9063d2011e006a6da30bb6a34dd1eb7c9425029e49b89cee8c419c5caa68b55915af162f9f6d892037ac1f66e4df7b49919231f6fef7b01e87c8b59f28a8d17e57f7617274b3831ebbc9f69d141db95473116027b8b7ff6a4c9bcee004386679e9ff6622dff76465a300665a5057c22d770b8e1be5de01ebe988d613e080300f0844efad39bdb1efe538e3bd5dbac20fcc3d1ca8ff6bfa764a03f24626757d196be70744eef1898b51706770e622d2e987c459911b3f0c445ddac5f4c8731fb4874dc9073ce717bbe20cf6573195c508bf8fcdc01e81a0717d5a39810e282fec8c5d398f38b28fda5b3b3737abde24f19fd34d29ce85cbdaed903164aa7d6d0418be4fb0784e2fdb521108bb703725db7ed8496be9c81375f38816bb5e4f3fdb34de3d1816bd2824bcfc18e45c402f626ccf74451fdd304e43aa883e92c66bbae95fdfa7c12d7eaafaff72f7b69c0990c7eea3de9b65e328c8e6e551f323a98e9408cde40ab7471bc04172dca055c362c14c12a367fc28038a383f55fec576a263132365678f830e5e7cfc762b26c14efaa47bedaab60c842f3f3b95f543fdaadd1dcb9532e815a2ff805ffdf0a0b47fe537f43ebe97faa7428fff84fb90532de83ffbf2e61de64f9a101561e01fdfaf74f255d2dfeb901d22479f12507b57a1dabcfa6f14ebb7660faa8182e954fcb56d664a00dbfd0341708d03775a3e2091dd8219ee06a4fa294b4b4795fa3ff152d6d22d4db184099d32a4251ec7206f97e02e79096d4c850c21daadf6b929f6a3a6056a0c612bc36d71be8796251f20a89eca3473134847735662d4a0621469cf0ac56c97014a4bd74faf8e6ae1b5f648b7737f4f7d8aa53677bfb47b411c667b5eae8b92b645ed7be2efe3d2d1233601c32e25162b63854666f2b18de1c2fe4bc9698986820e51b2d9530be8a8ac7725eae8b66f1aaf908e2f4d2e9d7a9a1fc10e75edfbe196003ef91eaea51f5817edaff2e6de89a4396f29caff17e73aebb7d19b55cd1640c0ab3e9df6cbf7199ca6748f16cade390987dcca615c193fa531b3fd2adf82351ed2ab4794c187a2ee6c1bd43870e5156b83018dfe25ee31a9d55ab28fcd8960846502b3c5a201127fb4634f6c48b9b2a17ee3206b58762f5e951adbafa5e8e6b645e865a5ae7f599b8629bfbe45bfd44825fbb658110146bbf1ced12b054bad4635630eb4124fcb558d1ffde6dbb1221e309054eaac8ccb5acedbac7ec2f6ec6444cee9fc3f964b36ede2efc0f2a5ba2a6960a46e6281895daea219bf40e147aba4619ffa8e51b2f2f7d539527294a195225be102861101bc7ad4227558074c205106d1cda5b4bac8a028d3103d740aea9afb64bb0a2509a51b616868eb1f1d2fdf9e7885cd23bd01b7a2d92ec0e82b45c3c3c1281b96c02d613dea0bdbfc340656773140d9a6dba082b282a8ac7dea89dcda830c3e38538ebb431e2093c9923ffe48b9b7a4cfc1e2076cdcd3360fc45538a21d6412c67a2c06f18b1b8427262fa479507e505196dedd8e49494662d5d185e641ca63bb522e611fa969659d0243516a5164a89706ed300fad5f5f5f0492d4110347d59da9ea51a19d0e854c514fae9e5f1465c056dc3dfc123db8b1519878e1286740f9915a41417ab4a0b6f7e2a8a1e4127d7d5aeda17a9199999b5f4e6ffad88b3e2b9e4e87f81029ff1f4ebc4a4243120c2e864767a3e1adf2305f8773435a3f9f9f921167d0cd674532112fcf58445bdf8939ff0d6bdb367cff2838e7e172d7df02401d6c542294dad4896b56227fbf4ebe74ecece9707d722ed8764e8fcdfb64e76fcf8f1c1f79c084b7023aa8f2dcf78096cb4b6561467a33ca00d03180c64de4b32a0b3967538924033422b25626fb42b83a782574925c8edeeeef243bf83aa80486b33d7c32e26abab1b87ce4f0fb5e50789f61895c34853cebaa9df12d1064f83e8487aec303a9eb369a318481af819012161c3e44ae8d36e07eef0e6883bba03716fa51248093df36c671549c9c8c40340f66a2d58cf7cbf2ad65eeb437d490c58bedcddbb9ee804df3efbf9be38183804942ada54935dc3c3ac20582c785dbafbd7f63147ebb1a844ce127c595e45c570cf7936ad003a8d4ecc0910bf799e61f683b64d5d68f2b50149231fd158b97ccdf0d43352fc915dfb47c7227290989b2b0f1a332e2e0e9d9b5bc4fcb9c87ad22aaad5a6af8252dd3c7ec61bcbc6f63687e92dbbef920b3359a363a90127ff34c59283600af63419ebc17303b67025e3d5ab32f6f6eb9fae55e69b0fa7b7b44859c7bf69d693535109a59ffe3ddd11f0c9f39c9b32d5195583df9ebaf4a765c4c4c45a541834dd36e3e80d81ca31323206741a29dcbae51121a5df95ef56a1695ebe190fc6c54ce605cc19deb3737050689a8f6a760cade54ea81f844722b2cb4c166e399bf3ecd941b1f646d68a54704b31fd56944f4b85b5aedb5884ce1cb7e045cd4482b03f9ad7f26640aedbae93e1ef85a362289fb6a98f898969dcaa88e4f5ed6cb75e5465035920bc8ab5758eb8b838d9c0d9bf80bfce111bd72b0faf03cd8b5addf9f52b136076333442d4e36599f37a726aaa24c4774626a68ea1326773e7c1498862e0ebe0a29ddddd291f3fdea4f5bb3cb9d4122990909ccc68fdd0af2e9078079d58a13719065c9fdbf84f7a3a0b58899ecd37b13859a7b55efd66b31b407ff921cab5a88270965750b804a30eca33759ce9e752e1dae2704673384f0a788d59c143d0a4945c511007e0ef683a09e05f90d60f7eb8cd874c58d67fcde5b42697976b84f398b724eb6a6955966a00fd86970dac1b7d54ffe20e0432c72cfd565ab1f685c192cb03b5231653319eb4b21039ae90b4a34d92f878d87c4bfe48143c0e1f9cb016ed09980d0eac6d3263d72ba1f0fef0452b4f354faf990aa86938d7dc7085bbeaa47e6aa0f5d66f43ebe10757745eb28280eae06f71403b22ada82f1ec6a67b10bf14daf8e111f0e9cd9b132b4e71b2576b908862c10ef0b9ed14464825403ce230e2f1ae78586956a02f98df6b224e7fda3ef718ed5f91ead7381ed0381e6655021e8b0e626fd7f613e21eb1038f85f683ed000a9ec0f340a5a0861783eb464397b6784156a6a5a5a106e079f0c343c07d811c0beffcaa4e9ddf75ab30e10e07ff6e9a9f999d6dceac36ca036fbdea7f4f9282ca4724dab43fff2ae05356960ce053c0275f5fdfd455847ea0842f228399999ef6074b873fb57c25830860537272e4aab4be096ab8baba76e91b035a31b2b07067c4d00bad3461016a3b50893a809ade793b5b1b9b90ed78d9aba87ac9c4eacce2a292848417bc596fe831af330427fcc9b9c3efa362aa53530fae9034289bd7a2c37b206c03d406d0bbeeae76abf4a35206e8f7cc64811dd39cfd45a643a57c933d675e5c8300d4e240e35707542de136dd85840ec396ec50c2d1e0af1babee0bdf3756adad5472f47c38a9f83bbbba66407240a89d28071b793fbca8c411caa92f20b43515db3ec5ba7a9b2ee6361dfba3f96016f580ea11b6737ed1a6f2caca8916bca9f28c35fc7f8b98ad3cb15c5975f0f0f000fe05a0ab55cbdf271c2d3d3e3e7e8676b16c7d085b8015ee363630f8863626717171a1a0c157322da9e3e0a05c62371f00af2e628fca8501651b5eec064fc10a933301a82829056ff64cdb348c2ee9b898296868a4bb6eaf85c6f8898a68bbfc6ebb9bf7a8faa5f7283a39faf56d3aedc18fa3757e936af995d3367a6aad75b4cea88c32aab90318d2d47aa42ee3292a26bdb5e574c4e306345a2fc2cbb2f4e54b3c1413c9bc406a86775b00182d3b95155b8c3c836bde4932e4a42b999aa611d2f0a2fa1cc08eb3b8dbe86aeccf3aae6c8cfa21c2f0b67bb613441887860443a05e4f474787b65486a0cb4626442e8e7cd731ffbbdfdbda62e412a4a6f7b61795e84ffb8339fef20c23bee7cd53ae3f99a55d073105c03aa06d28b5b0d0a1c11ab598fe741b3017b359cfd9c8dcdb39cacccb0e82cbdbbb400adfd43c9e183c10f0fbdb2d22b100e13f3bd6917cd60ca37cda041f74384257a8c6032419b0cf22fb23cb0eef53951d36e1c5fda90154509793aa78ecb14d16e5f08dc9a74769df8a0ab434d1ffb2e4a5b1e2a59950bd35ecb2e20376e7b862cf11da74ccc0db125f64a38a885e0c821afb2d32089a30da0e82e97b7b6e91803323163d3b4d29717135f81adead5f6b69bbf572c6f11b6aed8f7314cfa89539750adadf4a5f3302bfa77cdabad17a27522a01dd5bae803e4d358f51db7ba9db18865d2943834b60119f88487f20d3a7c60340483b4b19b432482cf82f8706562feaddbb773abfdb39b79e6b94d835bbb41cbb7af0e913b79dd1731201c08db8470a6b8946626262bccfb98cde22d3360d47e7d3e39bd6ee4174ed38f3920fd0c0ff1efdacd94b656606f04c3cfa5a7790f22a1210c40a637fda51e43878f74a8986f3f81469a04975bca347c76df8b107c3d31e1624979408307da5d42c1981b0d2e4d062305e3b47fb9700a61516f2327dbf17270bae1c08c31f7f3f9c61d75b7fbc2188ef9c3b403736f9629078fde48aeec0134137caa759de798904b59346e03d0d7d5d231689f9f9e8987360f8c83201713adbda2e14f45f4be934728be2da73b1a21cbe64b0232c4aa1975b1bde006e82a5252721013eaeebb2c0ebe60d980752e60e1df14a517d3a391951d7af1b1a941dd7ea5a19d86f86dea3fff8e0ca271827f80aaa0e40356fca67e79f3319e52c05641c401f103070e8c6afd873bbf7a84c0bc84ebc20f1aaf90de1412f8d4ffbd32a40249819f0676819d6dd014c6c055e730215a6dfd7247db986817ca29c540a8c41a8e46bd146589b79878180fdd4b70b2065eec4ca38960d09ec1d304d5dd56e0aa072befbc4d26cc442195c33e55c0a3121823fe0e713aca72094e9473932a41c3536364eb919f3a096952ab8912b6dcdfaef9c9f26847e0da7e94b620dca3ccecc170f53d1d2b6380c390876503f052901b474ceae04585d3aae74ecc8713fec9a9e45f30f3c1db0d38f1fe9f27273ef69ab76504647027c0b3c4a1dc6ee695a5baf9c3d2770ead895d3af75d4599f80b115584fb6a43e01b00f2be32ad3c84085bec100d6b79b575d501898f779722bd6784bb2562fe72a10e671abfad955343bb0be30d89767ac546b076000bd099109d55b752a0336c24dfec6eb361d5c8c2a9e378ecbf2d2bcef9fef02aa506430f08694491e3826d0f615cff4e1459eeab704d4dca8cc0ec42b08f44ec0055627c2cda5524c0774a0f194b783c0f49b6ff7155a6ab71827b4695a080909b54f71a52726b2b98feccd285534f02bdadae6411c2a8a044c09d254dbefbaaf7e27c959ee050024bd5fb1d5768d5ec21a99f1b0b1bf3f86ce3a6dfec610241e3a3b22995b565558d477eac40b24629e3e7d1ab1ed17ada0eda2c85dbeb7bbbd6efc676f5785e7ba746de21f20507ab35c9ed531414c4a4660e139eda475539280a266b4adcae1d45ed4d7062d9450ae409516db64eebd944e461ccb0e6267fa5454a42260bff0bd37477fb5f21051881c56d3719c747ea0083b4b51a5f5204c8bd1908da269e3d18c056f2e700f5038b3ac7f965975b3949b34cf8b2eca80ca04c851668ea7e6319b0241ca392b00711b2487a36446b771978eb7a6bcfc27604d6077ae7b9b9394936cf966dae12002da4d34f523b6378cd9cf546c756664a7273ddadd5a9d58a5d20cb44cf0c8c2fb1627118c1054779703b840b66a5a76af092a45857603e4fd38bbdf8bcbac2427c40253ebb5d984ebd0217a9cc526375844eda30a86ddfa779a9868fd6607ed8783e83bbf7f6f4a14d67ed91c73cb33d771450f18d02c280f76cdf54d171cbbac03eb4705d85859bb5767bb9bc7e9bc2d7d1604c00f8134d46fa8b19279851a93007b13d356fd82ea002c6fba4cf0f30f0e0e5a15a96155639db7d750b92a784f149bb360b01f6729d73a8d17a414162a67294b2e966fa70fc1838e6774cfa75ef37de1b3c8bb7022a593dff094564eaf557cbf624aa79a41b35696b2150b3f77db4d9dd1026986c0be12fb0ce03b7c672e454a811444f59166798bfaaa7d32ecb357727a4d5426d93a97e29d04cf06ce63dbb8685a0b0f3dfad85debcbd5c9070ab8e92e8870ee70d3a1a1dc00a904541f1a0c63f92574db00774637d3f83197cf23162d8a5a7625eac2d1e69f2bfcc196816badcdf75f2ee8377d49059f039d51795a7b7bd4c0467d1e8902682d442860b6b220d83aa6bf2f8dd6a1e51980325011d81076fef5b9fe82d688ce9f56454ddda6dce1a0af70e53c8e73f06f5250515337b71678e7d5aec313805567cd4b9a7fb6e3a53943db38ba3460d913dbb6dab8ebe65ebbca517ccc51903607db267fe0dc8250a976e547ed9cde5c60ada8ee747b9c049a8875f8f52134f31006f36388ccafae99671de28770f4a2ef307e415edefd0d558010d382058afd2aa56c14115d04022b328828751e42b156af5272350217e098de65f69ac050eae9d3f8bcbc1b141404a007a8d021c15af60edb14621091e56d31890a3842dfc96b6898b5344c4f4fb775a628e519753222290bc40955c855578f6c89124af1f727060aa7bf5ba6a0aa9a0c0158bdd0e20630cbf6905041f856fd899cda686947c7a2ae0c4df33d82c0592ac9f5be548d3255a0db5f95f54b3233d926978c8c8ce41515b9a729b433babf7e7dc56d3660d0d5d7db9b04bea57396dceb90bba5b60c2ade02ee6efb7b4a661e3a7c27868ffab8000653f9d85f92e1323e47fb746ef9f64289238f3503ad5ff8ec2da3dcfbf326bf65883cabc15655cc5b2e194eb7c715b8aac50a59a6777d3d89eac883bdd210d67dfad36af0e64f02dc69bed1d6ba51d2cc214b35ed8c19b82fe7b4be51c7d93abd1c14d12697ea38cc9eb1f7c5dd5758975f1da762ed5e3ba3eed15fc67dc6b62b74a1e78c3a6bf12f66b3c3c2f61f8028dda0e976c07a496277d1d4e71391a37cd01f68f840030398447977cb25bd43abd0470e1e98efcb6b74d1a6823037e279ce08a0009c31b8e6310cdc7754b3ed7e3877e8b965ea93b354e6f2400e50ed49549c7df0b5e15c469b00bd0f4f53cc832bdafd105247461e21d1a2676ead1d1e13730174bb9e89339a0e682894fbce5bbbb53a0b522f8149295d67504c153a7b247c579e31ae23415a7f60ba08d80a5fa41404c8c142cb8ba3cd608adddfbebd5519059cfe0d508224322333b3bcbb7b05ade31871af0937c0da91834f23b888080892b2b365631edc534a579301a8e8b2dd9a49c94025982100851a3f74db18f1d473d5ceb03f7fea5bb66ee3985d494eba79baf11908edaf6fa3e98a9597291026a11b982623f3505137fe48a7e9b8608e85c4b3eeea06d2685a4b671bb7aa82c1b0fd81e7ce0f5768820ce8aaf238ba3a60dd3a1da4a4c1aee957f318158b073d8f8e3ecf2b28083fd7006e513fba646061f100001dae00351e084a888d82b33fa666d412b17c3099405c356df0a5cb52110fd828503de08f6d897c5175a332f02fa0fbfdf3dce417d79cca80aaea990267e477fa6dd0b2022115150fa4476f031707b36a768d370603323ca2b53630b8879637a25c96c5d44beceec38ddf420c6c5b5d714215ed3b800632faac59c02b17a335adb0b077e2714df3aec2d1cfaa3e146982c75680482f908a16bee6f3921b7aa4d865339b932a646eb0a43bb5777675a6573fba135cf337fcbf7ede8e29522a7c72eff34956b40a05afa1a8a010b4b630983234a4019d0523b9c24f2beca20cf70171ccefba95dbd0d0d06461c6d03d011dd78666253c8e12a10982edf54525415a1ecdc5c5c56eb0b3ef7d7d007a8c68f169b498621271f6f3d45817bd2a97c81b5825ec5b5443a510ed620574041783384099230cf16f66660648dbf79e9e90bc2e49e061bc34dcddf5eccf9e83c8a89fb699f1e119fa06e4d866e3d723d75f5547276ee683f675ab181e600d1237eccf370520929391f147b5771e3cf8000134aec3d0d6ce6ea621882930cab3d34801c607613825ddd3ebd701abf58cbd3f7fbe79c4a3ca5b451c150ddd9fd41930b3af75ba8e4e7d777777af653f79f22456d5d43bf2c8d8fab6edda9c8ad0dec668c02754323e37571e74b9ff3d9dcfab97ce39cfb1af840053889d001f438b64a85257c1300c0688fe80fa4f8c8c8c360b037cd6f1dbad6e6b582e4ece2b9152c62b13cd013a2d7d273cabb7c602a5c17c92d0fce2b0970d7f1a749f2b88c089d44fafd3efebeac6956a98d7367d6c6f9745a705937925c18081e95cba7409fa8ca33f88021b832a48a2c2a8a0e6090808268c91d167ef97a30b9107793668a604d15931fa37d06ce01e010101de44ab04e42c6a6f45f5cdbc096e09afd65179fd2f17001cc190f3b9a1b9b992ab6b193052b034fafa88acd3f878d8354456c2c2c39bf3b50274b294390efaf6038c06dda3e7e8fae108c3029cff510b9b257fa45e49ae9af10c0909894eda488e5167b2779d3679ab6d911ad8be2c084f415a3fc2b3fc9fa04948e352a9cb3b3838f01ad368e35fa470da9a4ec0fa46c32df5782987b1b16ba0f7c3324c070a65a8ca5e52e5bc5d5286500dd47bd4f9514e2f09a167b385c15c5e28aaa318164685d83a9d7f6a7777866606a03d2ade35f107372bcb208a2b8ca6250ba41fd58e04336514a39ccde0a52104d57c96dfe61e74a954825cabd07a04b7f95044d69ef8a34731ef5935597c8e33e36b1f7a05a48445bb227a774e5fb5ccc9b66537de383954848a403a5ef6c1032d37213753cafb592f5be51b1a1bd1a42b40e42d4fc2a4ac2cf6498a9c6b4a165cfe6ac327478b7dcab8e5d8bbb038dd5abcf0ad27ef436dfaa138f63f1568c63364bfeaf513319534453012743cd4644b64c76c46050b50c3fcd3d6bc3460585d2d9102b65bbf0dd1d44ac0a7b535bbfd2927a0dd21d8fb204761c038f54cc38164a04641c8755e9b6b0be332fed4467945743bcb419005d8accfcbc3d00f7a5e59ebc3ee9aa8aeb6fe163e0141688e8f5404af3fe9bd4f1dd3ded76b462cbe9a15201231e1069a56414cec35df841a9ad2046b0288033dbf30589230506794d7306da377580f300e940336ca144b398a42751f7eaef7628d4d463348051a42cf9b316ff7ab6c6ab86d8ea76a65a6a5dd071ab95fbc74621da9d0caeffb8b52925e10c8c09977dc2a7e2e15b2a817bf5bdada58555a28591486ae01056100fde2349394c0c9c9f9c982d7e4e51d535353c012543ff71091e0f982feb4bbe75ce5e3e2e2961d048d4c4d9b7b5a951bc7214ebeaf1bf517bd157b8f9e2ebaf5b218fc7262ce7fc97886e25a1740160aa47aa58ac0d1e2e319b8b8b9c5038a4b4a3adbdb1f970be7df576519ade3f0361de5ee3586f83433350594aec92892c71fcdc668647447d47c1f1c34d508ee95575737f5b59eefe3dadc7573148c32cc6bb7e68f4ccec8e0a91019ed76a4326e0ee39a50bd5e44f1b4cd45fd2e2a7efaf5f2fee21b76c2829761e79b462c56115f5d5d7d9f5ba1b8a3af9f202e2141ea55a393d33bb6ead4acbde5228ce0015a8ba673d16a0a1eb6d68d8a80d85bd1bad618cd74d1831e9103bfe92ab29efc3e30908ae4839a446262e23d1f1f1f1416d09a289a993c4c253084a4f8b3d70a298aba2f4eb10437468c0023fd74fc66347c327d57644ba6768d8ac0d99bf20115410c8b66792af4ec779716a33c3d1fec1a05087e34399ca55dd774bef698172a51d6c595af37ea5277ce78ce78f41cf5857ee0c2893a1c57a35b139697adac23b2aa3a37c220660150a3da5268ba4a3d3a0b6081c155a89b0fb9c10676bf43ac41145e49110a868e562eb913c077cb608efb4c331dbb6af3b8939b492648018e5ada92d68da5cb54ac4abbdaeb67dd23d46acdb1c23b16bc342afd3d26f957eb2c7969f832aa258da36696c00c37c2ac5da3cd95d2ad1137f8a53fdc68ffcfda26a6107b58f89f7f9cdc77c4fd05ce83ff29529f5949fc6f297b668bf72efb0b892b3780156edac2609870f74778074a25d80221e313c01542ac798d5bc0c59c4f825869dc958a0aa7310685e558a2ce2c735e6fe95d42afc12c75f8efd78016011f9a1805087970e51df1deed581920582bb3c0d5e023b822ac957afb5260bdf7a8e7cd0b68d30eaa1e5fe3454e7ae2455337441b34875eed49a4ef4dee5747ea23cac5c6f601c46febf4266a8672cfbe8b9df78431c9e80e271e40bb36eefad172e1c80318138318586b30384aa75127a24ab39a7ffa065869fd1a67572722f850fc559097bf72ead814e27630f695954fe80d81b9a4a5a5011d6f0732b3f85905f7a844e56adc4ab2991c33594728561f02462e1046a01671b25751f9318d0c1495b29599f9ede642001870a50d2f5ebcd83ee54d2786f429482c784490540274481c5a2103970ef8749b2e468bed8a67b57fb7354a5f62abd81f944a0401d9ca7b3bf90d66051201e55b334ca6a0e00350e8051673f5d43183ee747595edba514becb7e9c5c5607ae0a32faa1fcdf7e6d40dec274554ca1f73d1bb616969592e81a38d27cb3727a8c5023a8d9a7bddae854a36e8e58c0fd8831e98e8564c51a0f5bb8b84aadde250da6dba472faf17a123803b663a532e8981366e9f52c5555d63534f1dc1059e362a0a8a0796965940124173a0a3887be7ede00d00d10c258fbd934a207d7d9b63ed1c0d0d670577d756d19fbded4b62c06be4e84fcb989b6714e5b7f698764ce7028e02c02b6668a43534882b282a2667663e08e7366de8c1cde2c57fc68f16605b6b1e3461d33bd1bc66890c6b2c1f143c3c0a2dd87cfa74dbffde6dc080760363ae840e308094b302765728f0c34cfbf1b9c3ef4393fc84d642086978cfa389452e8887f003282d242434219ca298260ba01f282d9c042411b41b9804e257c576f36100d510d38119c4b5e55be2da4dbaefc55eef6b1efb0f2f76d79d734f0579b1fafb37c0d05797dd669ee1ef001b36e30da4654bb5d427f03c28b717c1265ebc78c16f33f5d66ebe2f6e7979d9bbbbc06c30598723d4b2e9e3473ab4ba1f28e6ba3d5f80445d3591482a91c8ce837a1d1096ad822dc90a29f2cacabc93ddb842a59ff7dd564b06a47f725a9a0244882e6342cf5b881e8d2ef5ff5e5f4fc9ce6e8ff0c12a7284ca83c69093160a5aeddb988f94d26fd1262125d57d7e07d70ce22e5c06c413957cf73f6e60f9891f3e5cf713d973286f441f671e63fb6be3b7eedf6f7e9e01769a949c2c0e6ae95dcde77e16f402c5e96a45018ba7c998871cf7ad3424b533ac7aa430250fee5a6439ecba8ecac06eb21c52964788909d9ded129c75beadfd6f9e20c6ca612ac61398f13b498615f51399066aa50e32eb83f69ae58dca6f4346b044a4e4e4932587ffe66bb4416b41086d6d8cfa29a0c424ab27ce1a9c540ae07f2f09a871b954ff248784545ab70a25f8fa12de896d73093e38d001d0a1faf061674fcf9594ceb0452b327abd8da68b1e1e1e9b2c7f61b29202dccfc8c4045538d9418b4b28676e810fe898adad2de3952b0f206c9537aa64868cfc0f30030d0c0c90cd836940f46f9fb641171c8701f3243a87661b6c6df3508e9d0a73935c91ba1a1f6a01f13d8640448897d5f1327f801845b3732ea70e60bcbe3165947e2c2f17065a270dc001ec37bbd704c4e577885f2beab4991f604811df7b53f3187a6079d305b44993bdcac9be5fbfd870706ec17af2c54da4a63745933f7c383f7ce9c04918fb77ddb3418366000c25f21a1a52bf0e61bc5e01f900d20d440ecd0381cd222d864b962450b63871f224aa600ef2ba8dc192eccb6376548ae902ce4416ee8022292b2b9b5958509490f0428277e8de819cf3a0b3ecedd7d7d78d5ba38436598e632c825598c9f86808e1470cb8b029f449e62bf50a37f5b367cf9ebe36888ccd599a3fb26ba55524c38b9c9511bcf39c28a6d0ba767010e52bd48db6eded6e7782cc5eccc659e060a9a35c46f95632bd617dc025944788c21b5b090ab04b3fef000df94cabe5db63c20de236a5a4e4e1a14387365990cd7a35a53d2cf8ded919874b9af4bf7877bf1ab0b318882f7bfb82befe7ec311bca6acfd89e7a9f982e1165c96abb2cec1a74f5aa24558c5805975f6e5191fdfbfacbe37477fdc861f5ce4dda2ec933b23fe77696598c9e438429bf62fa3978ae48f0bbc2c2d1e900f2e0d5c5d8c6ebfdb2ef1980d3cb871e3467923868c20bc9901983c3a2570380e85296994683dd5212d52c6a45df3981d5a23d65e6c3b8b666acbf719fdc0adadeded3cbde63097e003cc8c478e1c41f308603d68ba139d8baa3795ad537f7a77b6626f36c217ad4988a9e69b8442ef60352eefbf003b5a51b43f5ef951565939312626066e040d2a99eb4a7b38333dddf6f5ebabf7cc2a1f2fdef53500e8b7e6e86a0ee759856788c756c99e3ff595ca6b3f5fea8940262e0d0dfd55f0184866f7bd52fae91a72cdefd047933a110f0bcc9252522420bc057c42f7aa7943aad2ff1f3ad15499249760b33c2626267bffbe0f84d20993d4ac2a5963e3d9e755a7ffc34738ff76832cf815f8eb24fa563bbcea6582f7ff49e98a1f81a6239a4a7fed61be646464a43577578f96e160b1ad91b979b48df37f12beae0efcdf0c68dedc3d254e22b8a55e79d4236e6868e8eafa857f73c042befc6b33d754b26fdff5a509cdc9d477c9243976389e8bec3faf49ff3f2b715aaa21cf0338e7a3d437c9a417832bdade9032c5e7b1fee7cb87ffb10d34a3272787d5d7f621780fadd32761fe4f178d9dc2e58f5f12aba9a901e38bccc9aac593807e8db4ccbcfd2f49636b599dedfe67a0f90504f6bb68df6a8447b54ffd7b436fcb9589fb656030019f2e49bc9f2aa8d84d7bcfa2ce7f59db87e83d5888f92cef7f5861acd960715c7a3a8b8fb7b7017414bfd5d8d7881742d049d7cf5bf46bffe735bd4ffc9fa39f5515407f96cfea3693626ae1fce87fbe7c8fdf76e61dda4a2a969c9424034124c2878b5b195a5736aaf5fadf4c3c66a72c6549b70acd00b4b2d1d5d5c5476d6c92996b3bdba572fc3fc35ef9d16e77cbd6d6c606b75212dfd2d2b2ff3db3417ef0fed606cb6b395624ff66fa1938382803f50ba2474359b13b6f9e6733ddce4769ec92f9bdbf5fc0b88ee1df81f7ea32775ba136e49ce3db6f368ff9d0f7948c72235fd26387f56c99558bfff7cd277716ffd7eab11e747cb79252b0a8a8e83f03af678baff7bfd67f65dacfd164b6e2e2e282e687e68c1e3d782052c45d2300e439ffe5aad3d8ff344de16fcb05f6fee728c8ec2799951fbffc6b494f4a8fe1a1705549976fbfa881601b67f8b52f4e92a39d13e201f0fd84b5b5353eea7d9fad2cdd9fec3711d628b28a637eff7ab818c8f65920c4f03e20748b2514a4d4eeeed3fae7fd3e2222299dfcd36bd68f8af38666b9005e5a472cc620f47a85548f7c73dfa97397dc721b95a2345e630697834060cdedbb3f344d3cd5d5d567d69658af5e6d5b9befcf034206ecaf33458994d013a20977ac25c8dc7fd21badeb6ca96de7068aacdb31dad92bd6fbd39ab96ebb5b7cae1d7c83aa93ed2e89073016db7fa774274bf031851767bb33943435872368b601e62a9a328201b0ae9fffb0efc778fbcebe12d031fd1dae6aaaabd27a0034107e10ad3389da67921359edfdd8bd1d54c3f9d051c2c4f2720da07e6e15ee2db51a89ddf81836771b7b7b443494d97c69f83e923229366dfef58e65465a3f093ed56234dbf3fcf4f8f8b8d3dee624b0d9df20d89301f202de89c7017bd1cde9d5c953c5fafa8bc7d98c7c7ea112ce7ec6afce76bafd92694fe605e3d42c60c5880051f39849f6e899ed6c8ab58ffa89a45f8e7691cd526e12bc3cbae3dd6587b2b39a07255bad77d803eb3fc926c9778d660d072ef58ff147b1cbe9cf65f9f4311817048bc7fdee54d29c3e2ab27120cd15a315655da486480cd97390507ff616ff280281e94a577756aaa5c759f85b2551e79caaaa2ab1821c65e6be72d7123aff7bb52b09d2d1ef811cb44e620fbd33e04c2e2f2ff756e100ee9c9c9c5c9c76fd9196d675102f94ad7c9152659b13e12a75d4545401ddb3cd3d0b71c11a615d5b37c9bcee08d8cda1440a3421dfd0d0e0bd82f5a5c6c71bb7e06db2b5f83cf2cbbba58337de3202141d230d61e3e2faec5c6f0e826c5191effd45d60940f5d1c19d685a2f27470ea81765ddcaa6cb09cf6a94e823bc3976c6b10ca5cc4038c8d12b198471b3d37da156e77bb6b150c2652e04f364539fbbefc3c1cac76839544525292c2cac847b627da1ef1e1ab3b71e8de3615d839fdb0cbee3abe79b0f0b8f40dfaaadaeae2e6fef228ac74621afad1d5b5c5272594d409f23495e1c257182f27856f501c22d4aa955668ed7aef3d5355d5c751ab72a02586e46694641920c095c43414c4af46288a4d6ae6cafcdcb8989bd062567c21dee18057c12a8196a816314b046acb0349a8601f9cf91a18e5b5756e48fe4ce18ec37af88b475fd3c921921a55fab2a88165ce19ef090cedede24d07faedb6bba3ebd68c62563491bf19d93285d41fee14367a53a1d1c1c3c290d9b921aa9aaba91979787ce537f7dfbb3cbd0e48ae1ca44f319dac56f31b702de65b548dfbae5015aea1ae8200741e1d8de8b404dff66edaca7a4a5753e3d74b4c942d7c42b2720e0f44a0428d4858a3f6e68fe1f654f1cbb6df55a3416b01e37f9a65366969b15f8c97ec8b16e27a363ba89bf35eb5a573cdae45154d49beada9bad0b43fb0dd4317024949847e889f5755d9b53116b071a1e6c99fae6cd092e4ece90ba863cf374769f2d4f4fcfd0f14308a48de3ddbd5af1f63133a4fb8d97175c8dcb834454766b6b8b616028442cc76abcc17bd2e7c1a78a0a77d151011a4270e819b0ffa7002c2038817c6fe2993938f06a6f031dd01174fbf1f428bd18398bda5707611ac294c242de514d57d732faa49c1cacb1cf87842827c6d1acb683ad284dadc2a89311974ecc11bbf2ee1384567d41b75f55472f8941400a68b22339e7be9355e4439ce94334522bc2c2c41428aa7ff83e77bccc9f6fdfbe79cf229825c3fe7dfb6078fb1cbd3f9f64d11a4ffdecaa51e3fb6b2a31af443d487cf0b8b429abbea24b5499e871d9e3baa967398575288d3797c729fd7ca8eafc8c0bfa21049808b300e7df5d1fce804e1f13cc58aae3ba19b2644f487543c9ddddbdcb894f8efd66d66b5fa0a1f4e01408c9f2f3157153f548f752e64470324c85bd222ebdcfc580ac64fa11588b963884b326fbe3108d63475eb7f13353e04f0cd42a1319ec48062cf92530e1d22bbe9a15a45454688201eb25729e3de3637c58b5b6a2af4f35e8fdfb097c672b763d411fcdd98970f3f2503bd3979f3fdf146b0774b6a66d0c898c6d0b157d7dfb26a098c9e4daaf6aa25607c9eadbdae92a3913f97ec7516c17459b31c4108fc7a5e20115192ba1c1607ea34d33019fb6172b442667fd84b712e9a721e436380c191073779c1ff9f2fa4cfb942a9f2845a02403b68b94cad8a5913776bcdfe428855981c0e8069ef6446bcf5b3dc6dab90ba37dbe225d3d2abc68a713fdf4f72439a4b051462a736468884113bce7f01a3be2bc35686b075bccff83aa8e95d0632a85ae909cb84a72e27e913ae8e52b24c07cdfd223e09eb42312fafd967e1af4bcbc206d30fd9d58196bd1070a0a9dde33d8be74848ce2091d6fea46d1f2fc6671eb6463882e969737d18093510c3e45f92197c400f223da0ae57a5116ce5ecf8a201836a75e97af6846964c07a88deba2f3b559b52f8db9c3efa3350f9057f4a7db20902d4c093250599bece2f86e2dda2474fcc8bff42139cfb87b02f7e65f6757c565bb9cae8d58f0eacf728255002f3afe30ba172411089bcaa787ac701b08c4e94fc37f019d548cb725397d45abc39797ad0060efd01183acbfea7fef6f5a0baddf5d30265757d70961e0a168b20ce0423f85939b3b3931718a3bbde50b201d15353530238e968e691bbdc804082300b7d92fc1b1c4d10a1f9f477da1de68c62ae81ad374c35cddc6f702fc7ecf9e1dececee0e5f9590959090e85a479651398608045f24bfadf865e9a877f4a683c50a003f3815e9076f4ae967cafdb0cbfaa5da7c3508d3f1954d0ebde7dfbbba6696eace75a3a9dfeeee84e5e5e5d44ced6ccb5ae033ed4ba375abf03bb4c305fafc3b4804dd2ce5effb0be621dadb2ec268c20c1e80f20481b4fd061dae7798a1b63045312dac6bb5ded6ede5cb9778687d76b2c8b43f3f62beb3d64f9fa6432f47d74409443138c38b9b38b5ec27b257c8fc7eaec04764abcd8f5e8cd6ef32137ed854cf687406705c1595507410c5497216a4eb823ea5cea2593c2d27d45495c759213b6e15f47f854aabbd1828cb9e8d5021c514aed9a27a5e1adf889c1bfbc9d30c119d1c8196d0d546c6c63951acd7ae3527df89bdd066e29d22d6d2cad6e9c858c715351322d7a99f9bcbc4ca1a6d57361a7deee1a2fc2ad2092154688769f57f7502d0fd15f5d3f0aba3c0435a22f862d174e3888583eab59fb89d224288eb74fc4ffa05bcff8760a12d781836227c222294b51c306655f4bb812903f90cfcc1890d7ab1ff171ebcac4e86c1149e443da1c59608c14daab0b92188a97378b8758b1f0dbde01d90346fe9ff5f2c1a6311ac9cd675d583c6ab86ceeb45015a51ad74592d4393d15f2b504ee6587d60c02794ed171fcf307ce92f330f3900345079ecffece0bfd9c7c8f5c9b28048a2dda201b926bd1cab6b6b13fbcd803f054fd1ef93c279cc67805bed4b86a7d7af4b04b334dbabfcfd8ed921e856e69bff5fadc551f47ea4d4bc1e9c3ff56d7365f292585a5a9a6a891d9a03d9ffbdc55130032d7fbeff89a2be62db14d084cbea7f771c3d11c05d7f8f992c707831981e1a29353f3f8f1c625f25309fff75e0c99d9fff11bf737ffa4bdcbf159e14c6ffd15aa653c8e2ffe97cfbb510a9170f38a73eca1db6b55c36e04ebae24b772fc7e6046f840cf3d967b7c6ba28cc39ee5abe7dbea1cf2e31fd6e44c962e6fce50bf6b7087eff3a3b145cee9ee7aad9b7b73730891d346d75a8705e7096762ad3e8f5c7bddedddb2387d88e48494be7949747d11be6a94eaf6f1b16f4ebd6e1da474bfc82e87af57d86401333333d4eaa4b627676761c22229a76cce8b73f886537309c6a15c3ad6d6d32013aa6a6d74e9e3ca97b77ff4a76b8d2637e7151dfdc9c552c3b3b1b948b9c1d6e707eb03f80cbe465487a8786a4022244dc8507cd0ae6702caf52fbe3af03061f961c2220f6d1d7cfcd99fcfba675f7460e7d634b484850d1d4940ec8554dfbbdbd9bdb3f9fad8db3173fffcf473fdc600814e3e6e1c152f904d00b0808844647b30ae0c6f157c855170cd5a7e1c5c9a9a92b62d9f9f9ef5fbc78917d1177a5f413b8f2c2dafa7a4e414130bd8a8a8a5842c75501dcf0fd7a7e052efb70e58d89b9f965b196689168b382877f1b711cdafe7dc041b0a5b6563440c7ce8ebb4c23e36f23cec4ff3a905804dc945e2ca553bc6258ba6490056e5829cfc7c7775500ba07ee3a63f6dfeea4c1305606b7fed20123670230d5ad037c69687e77f6c71f5be0a32e2bcd3cf0d1959aa5a5a58a52cd870f1b215c1b3a62127d8164d3d0d08cb5c749e8de7d9a64e9e21201889d3c4781c14816f59109df91199be94c41970e8266e28f94ea65c724be9a8c7617a6a6a62e725e3703dc90b3a33128755e5f184f88765b763981b93e6da4b481ea503aae762a35fa1e78905c62bf3851b258de88781f6a3fbcac8ea525bb7e6b5433d0550de7f9bcecd1eba368969bcf79cd24ca6d6b3a3b1610661ceea356eac04eceaac12c80773d6961a028101d4cdd9da1c92a700243fa7baddf7c125e0fd53dc6f2f028c17ba48e8e8ebaacf5ea6ffef020e2c0ca95d41963305413acba47313fdc79787882a54576bf939fc4ec28a11c5ee7c5b26080f63f3daeb7cfddfa84c11c5941b90087687dc0e5f56c6db91a1b1b1dc783941a7c01404f9c7bc28f360fa9e361f6be03a75d41a9b6f01d44a340ce34f81ef6b180ce63add8e1582c5d9142a7b0a3ac76b7e78730d72f6dc89fc0600838b1d840001b088dba60e8157b5bc6a84a505373f3f878b0268b00edf786fa7a31b3c1e2a0fe02f3842b6f98595826faf28c1d410a37f8e26130eb6080980f317a7a7acba0322796c71b373727a3e548ee4849492d033b0c3e4b60a46f687815a2ad13da85f47f4d9a9ba1c10b98c4181c0e9f3d730614dedddddd27ef9bd70113588698347494c7743974c46385652b644cc1e1ac26740822cb0f3cac1d9c6221f3ecc3870d6f24fe2719cd7c725cbe1e181b0c0e6bc1ca12bc7a8e3f2ed97d1794504f01db6df1654b543cd75f3f0dcacf4fd66ebfa765cdc7e0a00b51cae5032c067273534da4965ecd4a4d4f577f5bb6fb4d84240fdb77fd3e60d202a52e6046cdf284d8bae0fefbfbfb17ed2c7aea25262676aa6fca228d4dbb77cf56898c8b3b07ac76c12abdc12a79b7efdf3f7fefdebd4b9cc24d0e3f3400264ccf49376fde8cd95db616949db62e03f9b0814dbb4be9f6eddb9eadeb32fed57abf38d62b3df547b52543835530a8a5eee0dc7bfcf1a9d88b21a5de1c0c0bde898042e78203b4a8d02a73bdfcfaabd6765516860b2c5ca091858c192753269d3d7b16a88387ad59464e4e4df4961013430617380c4d7cf6df5f7f47d417583eddbdebabb505a44f05a26fc2dfbf7fdfbc7dab2aba6b91245ffbd4db204d52104d2e90e24cabc4d558aefff2dbb2c95db99c8c0c26bd87401d0aa9041bb9f0775d69463353803df9a268270606df25607fcdb2b6b53dfbeb5755d046ed5971ebc377ea2a32342c0b02fba91752ec8601f519483cf9f0c160e58569020c0e93c1b1b1e0d8afbf754fd765742d3af1ee5d5ed042b03e4858f8420bdd951744cf1658acb903d474c024002cc52bea3a1158fb8082faf1478bbb79e62b6f20c99eed010722249a43f38041991075660a78256e45c5fe3f9fbcf7fd7ab57a4952b809b0a403fbe1b20b38064d4131fb67ef9b95a744cf26189c78f83011e29eccc7faa0c981056dab8a5c83458efe155aa505d6750214627ffaef553ceedda4cc10bc4e0b14f11b20269e0287e6158fd07519c71e17eeba9b17b4116cd4535038ca81767bc796b12474d57e3aa90e2c4c571e113d9b6274f2dab530b7c5814bb7b5009bd533210a818dc9537d0c3ea0a3d79f3eeeb73f77c6e767ffa7bd71faeeeeee9ead6085b13fe70b816280fd17b08773ba6f820a30255bdad8f88023bc811714df0f1481e175f7eedd254e20b7fd81c465c58287053360b5932ac8a81fec60477f580e71f1a42557b39e021328b4167d305f033cdf606f22d7bf79ebd6a91733a684ad9e3a77ae6c2a3f8303eb5948f8ae58b778f1e2dfebd7c7ec9c04ac98823e034dbbbf139cb5e5565c7eb9e4f2cb29b2cc40232efc029614f5fad62c0c0c369ac0f22dd59d61c5dca74f9f82ce2504d5190ffc778035fdbb0074dbbad8dd61653c40130e809c17fcf4dc5c6b90fa56608710744e00d0bb601732323c6004679803f53f1eb6cb173d3c042ad4a6cab23234b42f80972e2414380c0c01c55c90d1fa8659c1d0a1d32b730e418686173c13a19e51ffb8be4bd8363617af7c02e27bbafab9ac734a68020046828fb0, 'Exemple.png', 'image/png', '28887');

--
-- Déclencheurs `image_data`
--
DELIMITER $$
CREATE TRIGGER `compte_rendu_trigger` AFTER INSERT ON `image_data` FOR EACH ROW BEGIN
    DECLARE new_action_id INT;
DECLARE new_numDossier VARCHAR(255);
 
    SELECT COALESCE(MAX(id_action ), 0) + 1 INTO new_action_id FROM action;

    
    
    SELECT  num_dossier INTO new_numDossier FROM image_data WHERE id = NEW.id;

    -- Create the new action with the desired values
    INSERT INTO action (id_action , id_client, agent, date, num_dossier, observation, phase, id_nom)
    VALUES (new_action_id, '', '1234', NOW(), new_numDossier, CONCAT('Document was added successfully in dossier ', new_numDossier), NULL, NULL);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `marche`
--

CREATE TABLE `marche` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `agent_id_agent` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `marche`
--

INSERT INTO `marche` (`id`, `libelle`, `agent_id_agent`) VALUES
(0, 'Marché0', NULL),
(1, 'Marché1', NULL),
(2, 'Marché2', NULL),
(3, 'Marché3', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `mission`
--

CREATE TABLE `mission` (
  `id_mission` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `date_transmission` date DEFAULT NULL,
  `id_affaire` bigint(20) DEFAULT NULL,
  `id_client` varchar(255) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `nature_ass` varchar(255) DEFAULT NULL,
  `ncpt` varchar(255) DEFAULT NULL,
  `nom_prenom` varchar(255) DEFAULT NULL,
  `observation` varchar(255) DEFAULT NULL,
  `prestataire` varchar(255) DEFAULT NULL,
  `resultat` varchar(255) DEFAULT NULL,
  `sort` varchar(255) DEFAULT NULL,
  `type_mission` varchar(255) DEFAULT NULL,
  `type_prestataire` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `mission`
--

INSERT INTO `mission` (`id_mission`, `date`, `date_transmission`, `id_affaire`, `id_client`, `montant`, `nature_ass`, `ncpt`, `nom_prenom`, `observation`, `prestataire`, `resultat`, `sort`, `type_mission`, `type_prestataire`) VALUES
(777, '2023-09-27', '2023-08-06', 23698, '1111', 300000, 'Injonctions de Payer', '178965', 'assyl KRIAA', 'observation mission test', 'prestataire2', 'resultat1', 'sort2', 'typeMission1', 'typePrestataire1'),
(1263, '2023-09-11', '2023-08-05', 23698, '1111', 300000, 'Injonctions de Payer', '178965', 'assyl KRIAA', 'aaaaa', 'prestataire2', 'resultat2', 'sort1', 'typeMission2', 'typePrestataire1'),
(2020, '2023-07-28', '2023-07-23', 23698, '1111', 144, 'Injonctions de Payer', '178965', 'Assyl KRIAA', 'aa', 'prestataire1', 'resultat1', 'sort2', 'typeMission1', 'typePrestataire1'),
(3636, '2023-07-26', '2023-09-21', 3699, '3691', NULL, NULL, NULL, 'Salim Ammar', NULL, NULL, NULL, NULL, NULL, NULL),
(123321, '2023-08-11', '2023-07-21', 23698, NULL, 111, 'Injonctions de Payer', '178965', NULL, 'okk', 'prestataire1', 'resultat1', 'sort1', NULL, 'typePrestataire1');

-- --------------------------------------------------------

--
-- Structure de la table `nomenclature`
--

CREATE TABLE `nomenclature` (
  `cacc` bigint(20) NOT NULL,
  `cnom` bigint(20) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `id_nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `nomenclature`
--

INSERT INTO `nomenclature` (`cacc`, `cnom`, `libelle`, `id_nom`) VALUES
(1, 10, 'Add Mission', 'am'),
(2, 10, 'Update Mission', 'um'),
(3, 10, 'Delete Mission', 'dm'),
(4, 20, 'Add Affaire', 'aa'),
(5, 20, 'Update Affaire', 'ua'),
(6, 20, 'Delete Affaire', 'da'),
(7, 30, 'Add Risque', 'ar'),
(8, 30, 'Update Risque', 'ur'),
(9, 30, 'Delete Risque', 'dr');

-- --------------------------------------------------------

--
-- Structure de la table `recherchemc`
--

CREATE TABLE `recherchemc` (
  `id_client` varchar(255) NOT NULL,
  `agence` bigint(20) DEFAULT NULL,
  `classe_final` varchar(255) DEFAULT NULL,
  `groupe` bigint(20) DEFAULT NULL,
  `jour_imp_au` int(11) DEFAULT NULL,
  `jour_imp_du` int(11) DEFAULT NULL,
  `jour_sdb_au` int(11) DEFAULT NULL,
  `jour_sdb_du` int(11) DEFAULT NULL,
  `marche` bigint(20) DEFAULT NULL,
  `region` bigint(20) DEFAULT NULL,
  `segment` bigint(20) DEFAULT NULL,
  `type_dossier` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `recherche_risque`
--

CREATE TABLE `recherche_risque` (
  `nature_produit` varchar(255) NOT NULL,
  `num_dossier` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE `region` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `agent_id_agent` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`id`, `libelle`, `agent_id_agent`) VALUES
(0, 'Tunis', NULL),
(1, 'Sfax', NULL),
(2, 'Nabeul', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `risque`
--

CREATE TABLE `risque` (
  `id_risque` bigint(20) NOT NULL,
  `agence` bigint(20) DEFAULT NULL,
  `montant_creance_entree` float DEFAULT NULL,
  `montant_frais` float DEFAULT NULL,
  `montanticentree` float DEFAULT NULL,
  `montant_recupere` float DEFAULT NULL,
  `montant_restant_dut` float DEFAULT NULL,
  `nature_produit` varchar(255) DEFAULT NULL,
  `num_dossier` varchar(255) DEFAULT NULL,
  `observation` varchar(255) DEFAULT NULL,
  `tauxicmarge` float DEFAULT NULL,
  `tauxirmarge` float DEFAULT NULL,
  `taux_indexe` float DEFAULT NULL,
  `total_engagement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `risque`
--

INSERT INTO `risque` (`id_risque`, `agence`, `montant_creance_entree`, `montant_frais`, `montanticentree`, `montant_recupere`, `montant_restant_dut`, `nature_produit`, `num_dossier`, `observation`, `tauxicmarge`, `tauxirmarge`, `taux_indexe`, `total_engagement`) VALUES
(2, 1, 32000, 45555, 545520, 120000, 214, '545muio', '3211', 'observation mission test', 5454, 200, 1222000, 445),
(5, 2, 8555, 454, 4550, 2000, 3.3, 'op', '28887', 'azertyuiop', 52000, 3355, 3.3, 5454),
(6, 0, 100000, 40000, 50000, 5000, 60000, 'xyz', '3211', 'observation test', 2.36, 1.23, 2.39, 50000);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `role_name` varchar(255) NOT NULL,
  `role_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`role_name`, `role_description`) VALUES
('Directeur Departement Informatique', 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `segment`
--

CREATE TABLE `segment` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `agent_id_agent` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `segment`
--

INSERT INTO `segment` (`id`, `libelle`, `agent_id_agent`) VALUES
(0, 'Seg0', NULL),
(1, 'Seg1', NULL),
(2, 'Seg2', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `type_dossier`
--

CREATE TABLE `type_dossier` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_dossier`
--

INSERT INTO `type_dossier` (`id`, `libelle`) VALUES
(0, 'Imp'),
(1, 'SDB'),
(2, 'IMP+SDB');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_banned` bit(1) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `user_first_name` varchar(255) DEFAULT NULL,
  `user_last_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `adress`, `email`, `is_banned`, `tel`, `user_first_name`, `user_last_name`, `user_password`) VALUES
('1234', 'Urbain Nord', 'assyl.kriaa@gmail.com', b'0', '+21699000000', 'Assyl', 'kriaa', '$2a$10$pNsQdiZvaWUBnRomVG/j/OeLwsT3e9RXgOnqhuSM8J8XbNpu/2W1S');

-- --------------------------------------------------------

--
-- Structure de la table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
('1234', 'Directeur Departement Informatique');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`id_action`);

--
-- Index pour la table `affaire`
--
ALTER TABLE `affaire`
  ADD PRIMARY KEY (`id_affaire`);

--
-- Index pour la table `agence`
--
ALTER TABLE `agence`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`id_agent`);

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`num_compte`);

--
-- Index pour la table `compte_rendu`
--
ALTER TABLE `compte_rendu`
  ADD PRIMARY KEY (`num_compte_rendu`);

--
-- Index pour la table `detail_engagement`
--
ALTER TABLE `detail_engagement`
  ADD PRIMARY KEY (`id_detail_engagement`);

--
-- Index pour la table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id_document`);

--
-- Index pour la table `dossier`
--
ALTER TABLE `dossier`
  ADD PRIMARY KEY (`num_dossier`);

--
-- Index pour la table `garantie`
--
ALTER TABLE `garantie`
  ADD PRIMARY KEY (`id_garantie`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8gdyt3trc8kin3y96ahqfvfd2` (`agent_id_agent`);

--
-- Index pour la table `image_data`
--
ALTER TABLE `image_data`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `marche`
--
ALTER TABLE `marche`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKeydyigt05uyawko9khup3we6j` (`agent_id_agent`);

--
-- Index pour la table `mission`
--
ALTER TABLE `mission`
  ADD PRIMARY KEY (`id_mission`);

--
-- Index pour la table `nomenclature`
--
ALTER TABLE `nomenclature`
  ADD PRIMARY KEY (`cacc`);

--
-- Index pour la table `recherchemc`
--
ALTER TABLE `recherchemc`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `recherche_risque`
--
ALTER TABLE `recherche_risque`
  ADD PRIMARY KEY (`nature_produit`);

--
-- Index pour la table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKewrlhigfvwdhpxvlwc8wthuq9` (`agent_id_agent`);

--
-- Index pour la table `risque`
--
ALTER TABLE `risque`
  ADD PRIMARY KEY (`id_risque`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_name`);

--
-- Index pour la table `segment`
--
ALTER TABLE `segment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3i9729ec0hf199k2j86iwhj53` (`agent_id_agent`);

--
-- Index pour la table `type_dossier`
--
ALTER TABLE `type_dossier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `action`
--
ALTER TABLE `action`
  MODIFY `id_action` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `agent`
--
ALTER TABLE `agent`
  MODIFY `id_agent` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `compte_rendu`
--
ALTER TABLE `compte_rendu`
  MODIFY `num_compte_rendu` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `detail_engagement`
--
ALTER TABLE `detail_engagement`
  MODIFY `id_detail_engagement` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `document`
--
ALTER TABLE `document`
  MODIFY `id_document` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `garantie`
--
ALTER TABLE `garantie`
  MODIFY `id_garantie` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `image_data`
--
ALTER TABLE `image_data`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `nomenclature`
--
ALTER TABLE `nomenclature`
  MODIFY `cacc` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `risque`
--
ALTER TABLE `risque`
  MODIFY `id_risque` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `FK8gdyt3trc8kin3y96ahqfvfd2` FOREIGN KEY (`agent_id_agent`) REFERENCES `agent` (`id_agent`);

--
-- Contraintes pour la table `marche`
--
ALTER TABLE `marche`
  ADD CONSTRAINT `FKeydyigt05uyawko9khup3we6j` FOREIGN KEY (`agent_id_agent`) REFERENCES `agent` (`id_agent`);

--
-- Contraintes pour la table `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `FKewrlhigfvwdhpxvlwc8wthuq9` FOREIGN KEY (`agent_id_agent`) REFERENCES `agent` (`id_agent`);

--
-- Contraintes pour la table `segment`
--
ALTER TABLE `segment`
  ADD CONSTRAINT `FK3i9729ec0hf199k2j86iwhj53` FOREIGN KEY (`agent_id_agent`) REFERENCES `agent` (`id_agent`);

--
-- Contraintes pour la table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
