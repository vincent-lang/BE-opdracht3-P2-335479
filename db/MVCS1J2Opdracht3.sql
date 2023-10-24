-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 18 sep 2023 om 20:37
-- Serverversie: 5.7.36
-- PHP-versie: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MVCS1J2Opdracht1`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Instructeurs`
--

DROP TABLE IF EXISTS `Instructeurs`;
CREATE TABLE IF NOT EXISTS `Instructeurs` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(50) NOT NULL,
  `Tussenvoegsel` varchar(50) NOT NULL,
  `Achternaam` varchar(50) NOT NULL,
  `Mobiel` varchar(50) NOT NULL,
  `DatumInDienst` varchar(50) NOT NULL,
  `AantalSterren` varchar(20) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `OpMerkingen` varchar(250) DEFAULT NULL,
  `DatumAanGemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Instructeurs`
--

INSERT INTO `Instructeurs` (`Id`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `Mobiel`, `DatumInDienst`, `AantalSterren`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 'Li', '', 'Zhan', '06-28493827', '2015-04-17', '***', b'1', NULL, '2023-09-18 19:11:20.741026', '2023-09-18 19:11:20.741029'),
(2, 'Leroy', '', 'Boerhaven', '06-39398734', '25-06-2018', '*', b'1', NULL, '2023-09-18 19:11:20.773201', '2023-09-18 19:11:20.773206'),
(3, 'Yoeri', 'Van', 'Veen', '06-24383291', '12-05-2010', '***', b'1', NULL, '2023-09-18 19:11:20.799239', '2023-09-18 19:11:20.799243'),
(4, 'Bert', 'Van', 'Sali', '06-48293823', '10-01-2023', '****', b'1', NULL, '2023-09-18 19:11:20.826634', '2023-09-18 19:11:20.826638'),
(5, 'Mohammed', 'El', 'Yassidi', '06-34291234', '14-06-2010', '*****', b'1', NULL, '2023-09-18 19:11:20.854712', '2023-09-18 19:11:20.854716');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Type_voertuigs`
--

DROP TABLE IF EXISTS `Type_voertuigs`;
CREATE TABLE IF NOT EXISTS `Type_voertuigs` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TypeVoertuig` varchar(50) NOT NULL,
  `Rijbewijscategorie` varchar(50) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `OpMerkingen` varchar(250) DEFAULT NULL,
  `DatumAanGemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Type_voertuigs`
--

INSERT INTO `Type_voertuigs` (`Id`, `TypeVoertuig`, `Rijbewijscategorie`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 'Personenauto', 'B', b'1', NULL, '2023-09-18 19:11:20.883214', '2023-09-18 19:11:20.883218'),
(2, 'Vrachtwagen', 'C', b'1', NULL, '2023-09-18 19:11:20.906639', '2023-09-18 19:11:20.906643'),
(3, 'Bus', 'D', b'1', NULL, '2023-09-18 19:11:20.932517', '2023-09-18 19:11:20.932522'),
(4, 'Bromfiets', 'AM', b'1', NULL, '2023-09-18 19:11:20.960922', '2023-09-18 19:11:20.960926');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Voertuigs`
--

DROP TABLE IF EXISTS `Voertuigs`;
CREATE TABLE IF NOT EXISTS `Voertuigs` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Kenteken` varchar(20) NOT NULL,
  `Type` varchar(30) NOT NULL,
  `Bouwjaar` varchar(50) NOT NULL,
  `Brandstof` varchar(20) NOT NULL,
  `TypeVoertuigId` tinyint(3) UNSIGNED NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `OpMerkingen` varchar(250) DEFAULT NULL,
  `DatumAanGemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `TypeVoertuigId` (`TypeVoertuigId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Voertuigs`
--

INSERT INTO `Voertuigs` (`Id`, `Kenteken`, `Type`, `Bouwjaar`, `Brandstof`, `TypeVoertuigId`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 'AU-67-IO', 'Golf', '12-06-2017', 'Diesel', 1, b'1', NULL, '2023-09-18 19:11:20.993603', '2023-09-18 19:11:20.993607'),
(2, 'TR-24-OP', 'DAF', '23-05-2019', 'Diesel', 2, b'1', NULL, '2023-09-18 19:11:21.017835', '2023-09-18 19:11:21.017839'),
(3, 'TH-78-KL', 'Mercedes', '01-01-2023', 'Benzine', 1, b'1', NULL, '2023-09-18 19:11:21.044121', '2023-09-18 19:11:21.044124'),
(4, '90-KL-TR', 'Fiat 500', '12-09-2021', 'Benzine', 1, b'1', NULL, '2023-09-18 19:11:21.072528', '2023-09-18 19:11:21.072533'),
(5, '34-TK-LP', 'Scania', '13-03-2015', 'Diesel', 2, b'1', NULL, '2023-09-18 19:11:21.098089', '2023-09-18 19:11:21.098092'),
(6, 'YY-OP-78', 'BMW M5', '13-05-2022', 'Diesel', 1, b'1', NULL, '2023-09-18 19:11:21.127374', '2023-09-18 19:11:21.127377'),
(7, 'UU-HH-JK', 'M.A.N', '03-12-2017', 'Diesel', 2, b'1', NULL, '2023-09-18 19:11:21.156750', '2023-09-18 19:11:21.156754'),
(8, 'ST-FZ-28', 'Citroën', '20-01-2018', 'Elektrisch', 1, b'1', NULL, '2023-09-18 19:11:21.197275', '2023-09-18 19:11:21.197279'),
(9, '123-FR-T', 'Piaggio ZIP', '01-02-2021', 'Benzine', 4, b'1', NULL, '2023-09-18 19:11:21.227081', '2023-09-18 19:11:21.227085'),
(10, 'DRS-52-P', 'Vespa', '21-03-2022', 'Benzine', 4, b'1', NULL, '2023-09-18 19:11:21.254778', '2023-09-18 19:11:21.254782'),
(11, 'STP-12-U', 'Kymco', '02-07-2022', 'Benzine', 4, b'1', NULL, '2023-09-18 19:11:21.280425', '2023-09-18 19:11:21.280429'),
(12, '45-SD-23', 'Renault', '01-01-2023', 'Diesel', 3, b'1', NULL, '2023-09-18 19:11:21.311684', '2023-09-18 19:11:21.311688');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Voertuig_Instructeurs`
--

DROP TABLE IF EXISTS `Voertuig_Instructeurs`;
CREATE TABLE IF NOT EXISTS `Voertuig_Instructeurs` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `VoertuigId` tinyint(3) UNSIGNED NOT NULL,
  `InstructeurId` tinyint(3) UNSIGNED NOT NULL,
  `DatumToekenning` date NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `OpMerkingen` varchar(250) DEFAULT NULL,
  `DatumAanGemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `VoertuigId` (`VoertuigId`),
  KEY `InstructeurId` (`InstructeurId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Voertuig_Instructeurs`
--

INSERT INTO `Voertuig_Instructeurs` (`Id`, `VoertuigId`, `InstructeurId`, `DatumToekenning`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 5, '2017-06-18', b'1', NULL, '2023-09-18 19:11:21.343597', '2023-09-18 19:11:21.343600'),
(2, 3, 1, '2021-09-26', b'1', NULL, '2023-09-18 19:11:21.367750', '2023-09-18 19:11:21.367753'),
(3, 9, 1, '2021-09-27', b'1', NULL, '2023-09-18 19:11:21.397215', '2023-09-18 19:11:21.397219'),
(4, 3, 4, '2022-08-01', b'1', NULL, '2023-09-18 19:11:21.422841', '2023-09-18 19:11:21.422844'),
(5, 5, 1, '2019-08-30', b'1', NULL, '2023-09-18 19:11:21.450994', '2023-09-18 19:11:21.450997'),
(6, 10, 5, '2020-02-02', b'1', NULL, '2023-09-18 19:11:21.477166', '2023-09-18 19:11:21.477170'),
(7, 4, 5, '2023-09-18', b'1', NULL, '2023-09-18 08:30:21.000000', '2023-09-18 08:30:21.000000'),
(8, 6, 2, '2023-09-18', b'1', NULL, '2023-09-18 08:30:30.000000', '2023-09-18 08:30:30.000000');

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `Voertuigs`
--
ALTER TABLE `Voertuigs`
  ADD CONSTRAINT `voertuigs_ibfk_1` FOREIGN KEY (`TypeVoertuigId`) REFERENCES `Type_voertuigs` (`Id`);

--
-- Beperkingen voor tabel `Voertuig_Instructeurs`
--
ALTER TABLE `Voertuig_Instructeurs`
  ADD CONSTRAINT `voertuig_instructeurs_ibfk_1` FOREIGN KEY (`VoertuigId`) REFERENCES `Voertuigs` (`Id`),
  ADD CONSTRAINT `voertuig_instructeurs_ibfk_2` FOREIGN KEY (`InstructeurId`) REFERENCES `Instructeurs` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
