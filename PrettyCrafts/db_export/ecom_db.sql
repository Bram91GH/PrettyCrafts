-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 01 jul 2024 om 13:34
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_db`
--
CREATE DATABASE IF NOT EXISTS `ecom_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecom_db`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categories`
--

CREATE TABLE `categories` (
  `CategoryId` int(11) NOT NULL,
  `CategoryTitle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `categories`
--

INSERT INTO `categories` (`CategoryId`, `CategoryTitle`) VALUES
(1, 'Paintings'),
(2, 'Statues');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ordered_products`
--

CREATE TABLE `ordered_products` (
  `OrderProductId` int(11) NOT NULL,
  `OrderId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `ItemQuantity` int(11) DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `ordered_products`
--

INSERT INTO `ordered_products` (`OrderProductId`, `OrderId`, `ProductId`, `ItemQuantity`, `TotalAmount`) VALUES
(1, 1, 1, 1, 8.74),
(2, 2, 2, 1, 232.78),
(3, 2, 6, 1, 466.68),
(4, 2, 29, 1, 167.28),
(5, 3, 5, 1, 537.39),
(6, 3, 9, 1, 616.84);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `orders`
--

CREATE TABLE `orders` (
  `OrderId` int(11) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `OrderStatus` varchar(50) DEFAULT NULL,
  `OrderDatetime` datetime DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `orders`
--

INSERT INTO `orders` (`OrderId`, `UserId`, `OrderStatus`, `OrderDatetime`, `PaymentMethod`) VALUES
(1, 1, 'Shipped', '2024-06-29 16:17:00', 'Credit Card'),
(2, 1, 'Shipped', '2024-06-29 17:14:26', 'Credit Card'),
(3, 1, 'Shipped', '2024-06-29 18:46:18', 'Credit Card');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `products`
--

CREATE TABLE `products` (
  `ProductId` int(11) NOT NULL,
  `Title` text DEFAULT NULL,
  `Price` float NOT NULL,
  `ProductQuantity` int(11) NOT NULL,
  `Description` text DEFAULT NULL,
  `ProductImage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `products`
--

INSERT INTO `products` (`ProductId`, `Title`, `Price`, `ProductQuantity`, `Description`, `ProductImage`) VALUES
(1, 'Big Eye Girls - Schilderij in de stijl van Pablo Picasso', 8.74, 16, 'Handgeschilderd schilderij Big Eye Girls in de stijl van Pablo Picasso. Modern olieverfschilderij van hoge kwaliteit waarbij vijf vrouwengezichten door middel van kubistische schilderkunst zijn afgebeeld.\nDe schilderkunst is expressief en vertoont een brute kracht, een fascinerende vitale energie. Perfect voor de liefhebbers van kubistische moderne kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig.\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/products/Hi-Res-MAIN-PRODUCT-bigeyegirls_2000x.jpg?v=1664919842'),
(2, 'Phillies - Schilderij geïnspireerd op \'Nighthawks\' van Edward Hopper', 232.78, 16, 'Handgeschilderd Pop Art schilderij \'Phillies\', geïnspireerd op \'Nighthawks\' van Edward Hopper. Olieverfschilderij van hoge kwaliteit waarbij een eenzaam straatbeeld met café door middel van moderne schilderkunst is afgebeeld.\nPerfect voor de liefhebbers van moderne realistische kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/files/HI-RES-PRODUCT-_na-3DEC23_-Nighthawks---Edward-Hopper_2000x.jpg?v=1715713265'),
(3, 'Loui Jover - Ready for Action', 387.69, 5, 'Handgeschilderd Pop Art schilderij \'Ready for Action\' van Loui Jover. Olieverfschilderij van hoge kwaliteit waarbij een vrouwengezicht door middel van moderne schilderkunst is afgebeeld.\nDe schilderkunst van Loui Jover is expressief en vertoont een brute kracht, een fascinerende vitale energie. Perfect voor de liefhebbers van expressieve sensuele kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/products/HI-RES-PRODUCT-CLOUD-MAIN-_NIEUW_-LOUI-JOVER-2_2000x.jpg?v=1669656196'),
(4, 'David Hockney - Winter Trees', 490.09, 2, 'Handgeschilderd schilderij Winter Trees van David Hockney. Olieverfschilderij van hoge kwaliteit waarbij een woud door middel van moderne schilderkunst is afgebeeld.\nPerfect voor de liefhebbers van moderne impressionistische kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/products/HI-RES-PRODUCT-CLOUD-MAIN-_na-2mrt-21_-winter-trees_2000x.jpg?v=1632834086'),
(5, 'Gustav Klimt – Gouden Tranen', 537.39, 19, 'Handgeschilderd schilderij Gouden Tranen van Gustav Klimt. Olieverfschilderij van hoge kwaliteit waarbij klassieke kleuren in combinatie met goud door middel van moderne paletmes schilderkunst zijn afgebeeld.\nHet schilderij is een combinatie van energieke kleurstellingen en contrasten die op impressionistische wijze op canvas zijn aangezet met dikke olieverf. Perfect voor de liefhebbers van expressieve moderne kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/products/HI-RES-PRODUCT-CLOUD-MAIN-gouden-tranen2_2000x.jpg?v=1610479856'),
(6, 'Vincent van Gogh - Amandelbloesem', 466.68, 16, 'Handgeschilderd olieverfschilderij Amandelbloesem van Vincent van Gogh. Olieverfschilderij van hoge kwaliteit waarbij takken met amandelbloesem door middel van impressionistische schilderkunst zijn afgebeeld.\nPerfect voor de liefhebbers van moderne impressionistische kunst.\nKomt dit meesterwerk in jouw woning, kantoor, hotel of tuin te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig.\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/files/HI-RES-PRODUCT-_na-3DEC23_-vincent-van-gogh-amandelbloesem_2000x.jpg?v=1713467648'),
(7, 'Leonid Afremov - Herfstlicht', 721.23, 21, 'Handgeschilderd olieverfschilderij Herfstlicht van Leonid Afremov. Modern olieverfschilderij van hoge kwaliteit waarbij de unieke schoonheid van de regen in de herfstavonden door middel van impressionistische schilderkunst is afgebeeld.\nHet schilderij heeft twee meesterlijke kanten, een ultra-blauwe die de heldere lucht en de oceaan voorstelt, en een andere meer warmere zijde die het park vertegenwoordigt en lichten die speciale warme tonen toevoegen. Perfect voor de liefhebbers van natuur geïnspireerde kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig.\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/products/HI-RES-PRODUCT-CLOUD-MAIN-_na-2mrt-21_-herfstlicht_2000x.jpg?v=1621466101'),
(8, 'Leonid Afremov - Stad aan het Meer', 706.1, 8, 'Handgeschilderd olieverfschilderij Stad aan het Meer van Leonid Afremov. Modern olieverfschilderij van hoge kwaliteit waarbij de unieke schoonheid van de regen in de herfst door middel van impressionistische schilderkunst is afgebeeld.\nHet schilderij heeft twee meesterlijke kanten, een lichtblauwe die de heldere lucht en de oceaan voorstelt, en een andere meer warmere zijde die het park vertegenwoordigt en lichten die speciale warme tonen toevoegen. Perfect voor de liefhebbers van natuur geïnspireerde kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig.\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/products/HI-RES-PRODUCT181_2000x.jpg?v=1612560813'),
(9, 'Het Vergeten Gezicht - Schilderij in de stijl van Pablo Picasso', 616.84, 2, 'Handgeschilderd schilderij Het Vergeten Gezicht in de stijl van Pablo Picasso. Modern abstract olieverfschilderij van hoge kwaliteit waarbij een gezicht door middel van kubistische schilderkunst is afgebeeld.\nHet doek is een rijk werk van expressieve schilderkunst en fascinerende vitale energie. Het waarin vorm en symboliek vakkundig zijn gecombineerd in een meesterlijke integratie beweging, kleur en licht. Perfect voor de liefhebbers van expressieve moderne kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig.\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/files/MAIN-PRODUCTS-picasso-face_2000x.jpg?v=1711059102'),
(10, 'Gustav Klimt – De Kus', 215.86, 10, 'Handgeschilderd schilderij De Kus van Gustav Klimt. Olieverfschilderij van hoge kwaliteit waarbij klassieke kleuren in combinatie met goud door middel van moderne paletmes schilderkunst zijn afgebeeld.\nHet schilderij is een combinatie van klassieke kleurstellingen en contrasten die op impressionistische wijze op canvas zijn aangezet met dikke olieverf. Perfect voor de liefhebbers van expressieve moderne kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/files/HI-RES-PRODUCT-_na-3DEC23_-GUSTAV-KLIMT---DE-KUS_2000x.jpg?v=1713203232'),
(11, 'Gustav Klimt – Golden Dress', 728.81, 16, 'Handgeschilderd schilderij Golden Dress van Gustav Klimt. Olieverfschilderij van hoge kwaliteit waarbij klassieke kleuren in combinatie met goud door middel van moderne paletmes schilderkunst zijn afgebeeld.\nHet schilderij is een combinatie van klassieke kleurstellingen en contrasten die op impressionistische wijze op canvas zijn aangezet met dikke olieverf. Perfect voor de liefhebbers van expressieve moderne kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/products/HI-RES-PRODUCT-CLOUD-MAIN-_na-28mrt-22_-golden-dress_2000x.jpg?v=1662325263'),
(12, 'Gustav Klimt – Adele Danae', 746.45, 1, 'Handgeschilderd schilderij Adele Danae van Gustav Klimt. Olieverfschilderij van hoge kwaliteit waarbij klassieke kleuren in combinatie met goud door middel van moderne paletmes schilderkunst zijn afgebeeld.\nHet schilderij is een combinatie van energieke kleurstellingen en contrasten die op impressionistische wijze op canvas zijn aangezet met dikke olieverf. Perfect voor de liefhebbers van expressieve moderne kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/files/HI-RES-PRODUCT-_na-3DEC23_-gustav-klimt---danae_2000x.jpg?v=1713210644'),
(13, 'Gustav Klimt – Omarmd onder de Boom', 45.81, 7, 'Handgeschilderd schilderij Omarmd onder de Boom van Gustav Klimt. Olieverfschilderij van hoge kwaliteit waarbij klassieke kleuren in combinatie met goud door middel van moderne paletmes schilderkunst zijn afgebeeld.\nHet schilderij is een combinatie van energieke kleurstellingen en contrasten die op impressionistische wijze op canvas zijn aangezet met dikke olieverf. Perfect voor de liefhebbers van expressieve moderne kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/products/HI-RES-PRODUCT-CLOUD-MAIN-_na-2mrt-21_-omarmd-onder-de-boom_2000x.jpg?v=1622316579'),
(14, 'Gustav Klimt – Tree of Life', 239.73, 4, 'Handgeschilderd schilderij Tree of Life van Gustav Klimt. Olieverfschilderij van hoge kwaliteit waarbij klassieke kleuren in combinatie met goud door middel van moderne paletmes schilderkunst zijn afgebeeld.\nHet schilderij is een combinatie van energieke kleurstellingen en contrasten die op impressionistische wijze op canvas zijn aangezet met dikke olieverf. Perfect voor de liefhebbers van expressieve moderne kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/files/HI-RES-PRODUCT-CLOUD-MAIN-_na-28mrt-22_-klimt-tree-of-life_2000x.jpg?v=1712606206'),
(15, 'Gustav Klimt – De Omhelzing', 311.22, 25, 'Handgeschilderd schilderij De Omhelzing van Gustav Klimt. Olieverfschilderij van hoge kwaliteit waarbij een vrouw die een man omhelst door middel van moderne paletmes schilderkunst zijn afgebeeld.\nHet schilderij is een combinatie van klassieke kleurstellingen met goud die op impressionistische wijze op canvas zijn aangezet met dikke olieverf. Perfect voor de liefhebbers van expressieve moderne kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/files/HI-RES-PRODUCT-_na-3DEC23_-gustav-klimt-the-family_2000x.jpg?v=1710972428'),
(16, 'Piet Mondriaan - Compositie in Rood, Geel en Blauw', 86.88, 13, 'Handgeschilderd schilderij \'Compositie in Rood, Geel en Blauw\' van Piet Mondriaan. Modern abstract olieverfschilderij van hoge kwaliteit waarbij vlakken en lijnen door middel van kubistische schilderkunst zijn afgebeeld.\nHet doek is een rijk werk van expressieve schilderkunst en fascinerende vitale energie. Het waarin vorm en symboliek vakkundig zijn gecombineerd in een meesterlijke integratie beweging, kleur en licht. Perfect voor de liefhebbers van expressieve moderne kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig.\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/files/HI-RES-PRODUCT-CLOUD-MAIN-_na-8nov-22_-Mondriaan---Compositie-in-Rood_-Geel-en-Blauw_520b3b99-f1aa-4f6f-9ddc-22d3a98283f6_2000x.jpg?v=1686078451'),
(17, 'Piet Mondriaan - Compositie 2 in Rood, Geel en Blauw', 250.77, 14, 'Handgeschilderd schilderij \'Compositie 2 in Rood, Geel en Blauw\' van Piet Mondriaan. Modern abstract olieverfschilderij van hoge kwaliteit waarbij vlakken en lijnen door middel van kubistische schilderkunst zijn afgebeeld.\nHet doek is een rijk werk van expressieve schilderkunst en fascinerende vitale energie. Het waarin vorm en symboliek vakkundig zijn gecombineerd in een meesterlijke integratie beweging, kleur en licht. Perfect voor de liefhebbers van expressieve moderne kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig.\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/products/HI-RES-PRODUCT-CLOUD-MAIN-_na-28mrt-22_-mondriaan_50e5442a-1d0d-4185-af1d-3250a233897a_2000x.jpg?v=1660768568'),
(18, 'Kandinsky “Yellow, red and blue”', 243.21, 7, 'Handgeschilderd schilderij \'Yellow, red and blue\' van Kandinsky. Modern abstract olieverfschilderij van hoge kwaliteit waarbij de ochtendgedachten van Picasso door middel van kubistische schilderkunst zijn afgebeeld.\nHet doek is een rijk werk van expressieve schilderkunst en fascinerende vitale energie. Het waarin vorm en symboliek vakkundig zijn gecombineerd in een meesterlijke integratie beweging, kleur en licht. Perfect voor de liefhebbers van expressieve moderne kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig.\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/files/HI-RES-PRODUCT-_na-3DEC23_-KANDINSKY---YELLOW-RED-BLUE_2000x.jpg?v=1711409537'),
(19, 'Vincent van Gogh - Caféterras bij Nacht', 463.73, 19, 'Handgeschilderd olieverfschilderij Caféterras bij Nacht van Vincent van Gogh. Olieverfschilderij van hoge kwaliteit waarbij een caféterras bij nacht door middel van impressionistische schilderkunst is afgebeeld.\nPerfect voor de liefhebbers van moderne impressionistische kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig.\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/files/HI-RES-PRODUCT-CLOUD-MAIN-_na-8nov-22_-van-gogh-cafeterras_6e69b743-a41d-437b-88a7-ef374cf26c14_2000x.jpg?v=1696339136'),
(20, 'Vincent van Gogh - Sterrenacht', 89.02, 20, 'Handgeschilderd olieverfschilderij Sterrenacht van Vincent van Gogh. Olieverfschilderij van hoge kwaliteit waarbij de sterrenrijke zuid-franse nacht door middel van impressionistische schilderkunst is afgebeeld.\nPerfect voor de liefhebbers van natuur geïnspireerde kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig.\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/products/PRINT-SCHILDERIJEN-sterrenacht_2000x.jpg?v=1628105879'),
(21, 'Loui Jover - Smoking Lady', 553.91, 20, 'Handgeschilderd Pop Art schilderij \'Smoking Lady\' van Loui Jover. Olieverfschilderij van hoge kwaliteit waarbij een vrouwengezicht door middel van moderne schilderkunst is afgebeeld.\nDe schilderkunst van Loui Jover is expressief en vertoont een brute kracht, een fascinerende vitale energie. Perfect voor de liefhebbers van expressieve sensuele kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/products/HI-RES-PRODUCT-CLOUD-MAIN-_na-2mrt-21_-smoking-lady_2000x.jpg?v=1623878502'),
(22, 'Nikolai Blokhin - Ballerina', 252.5, 13, 'Handgeschilderd olieverfschilderij ‘Ballerina’ van Nikolai Blokhin. Olieverfschilderij van hoge kwaliteit waarbij een dansende ballerina door middel van impressionistische schilderkunst is afgebeeld.\nHet doek is een meesterwerk van verfijnde schoonheid, waarin realisme en symboliek vakkundig zijn gecombineerd in een meesterlijke integratie van beweging, licht en kleur. Perfect voor de liefhebbers van sensuele impressionistische kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/files/HI-RES-PRODUCT-_na-3DEC23_-Nikolai-Blokhin---Ballerina_2000x.jpg?v=1713302234'),
(23, 'Leonid Afremov - Prinsengracht', 350.77, 3, 'Handgeschilderd olieverfschilderij Prinsengracht van Leonid Afremov. Modern olieverfschilderij van hoge kwaliteit waarbij de unieke schoonheid van de Prinsengracht in Amsterdam door middel van impressionistische schilderkunst is afgebeeld.\nPerfect voor de liefhebbers van stadsaanzicht geïnspireerde kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig.\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/files/MAIN-PRODUCTS1LARGEop-WIT-leonid-prinsengracht_2000x.jpg?v=1699996383'),
(24, 'Schilderij geïnspireerd op \'Guernica\' van Pablo Picasso', 246.34, 2, 'Handgeschilderd schilderij geïnspireerd op \'Guernica\' van Pablo Picasso. Modern abstract olieverfschilderij van hoge kwaliteit waarbij La Guernica door middel van kubistische schilderkunst is afgebeeld.\nHet doek is een rijk werk van expressieve schilderkunst en fascinerende vitale energie. Het waarin vorm en symboliek vakkundig zijn gecombineerd in een meesterlijke integratie beweging en licht.Perfect voor de liefhebbers van expressieve moderne kunst.\nKomt dit meesterwerk in jouw woning, kantoor of hotel te hangen?\n\n\nOpgespannen op een houten frame, inclusief ophangsysteemDus klaar om direct op te hangen.\n\nZijkanten mee geschilderd Dus geen lijst nodig.\n\nUv-beschermingDe kleuren verbleken niet, zelfs niet na langdurige blootstelling aan zonlicht.\n\nHoge kwaliteit materialenGeschilderd met professionele olieverf op zuurvrij canvas van museumkwaliteit.', '//degrootmeesters.com/cdn/shop/files/HI-RES-PRODUCT-_na-3DEC23_-Guernica---Pablo-Picasso-1_2000x.jpg?v=1715120312'),
(25, 'Aequilibrium', 179.4, 23, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-23-S.jpg'),
(26, 'Nec timide, nec tumide', 157.98, 11, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-57-S.jpg'),
(27, 'Fata obstant', 251.68, 11, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-11-S.jpg'),
(28, 'Near Enzo', 34.46, 21, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/ernest-joachim-20-S.jpg'),
(29, 'Horizon', 167.28, 20, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/ernest-joachim-29-S.jpg'),
(30, 'Territorial drift', 733.03, 14, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/leon-veerman-00-S.jpg'),
(31, 'The long wait', 163.28, 10, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/leon-veerman-01-S.jpg'),
(32, 'Love at first sight', 117.34, 7, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/leon-veerman-02-S.jpg'),
(33, 'Swaying in the wind', 96.85, 3, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/leon-veerman-03-S.jpg'),
(34, 'Fatum est cogens', 132.25, 21, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-10-S.jpg'),
(35, 'Fenix', 370.67, 18, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-25-S.jpg'),
(36, 'Improviso expecto', 706.59, 25, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-22-S.jpg'),
(37, 'Luctor et Emergo', 170.96, 24, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-24-S.jpg'),
(38, 'Nil desperandum', 235.01, 17, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-01-S.jpg'),
(39, 'Mirabile visu', 662.18, 12, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-09-S.jpg'),
(40, 'Altius', 355.88, 10, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-08-S.jpg'),
(41, 'Jacet', 542.85, 14, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-02-S.jpg'),
(42, 'Conversus', 146.62, 13, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-59-S.jpg'),
(43, 'Initium', 604.56, 24, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-60-S.jpg'),
(44, 'Tremendum et fascinans', 332.91, 6, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-19a-S.jpg'),
(45, 'Dies diem docet', 600.88, 9, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-05-S.jpg'),
(46, 'Nosce Te Ipsum', 505.67, 23, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-32-S.jpg'),
(47, 'In Pace', 725.7, 13, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-06-S.jpg'),
(48, 'Ad Fontes', 611.51, 22, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-34-S.jpg'),
(49, 'Tremendum et fascinans', 130.44, 21, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-19-S.jpg'),
(50, 'Titan XI', 317.67, 12, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-49-S.jpg'),
(51, 'Confido', 447.03, 22, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-04-S.jpg'),
(52, 'Nosce te ipsum L', 532.12, 22, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-58-S.jpg'),
(53, 'Dervish, Purity', 569.53, 19, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-35-S.jpg'),
(54, 'Dervish, Infinity', 501.29, 5, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-36-S.jpg'),
(55, 'Considero', 47.87, 18, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-31-S.jpg'),
(56, 'Genzai', 235.48, 1, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-42-S.jpg'),
(57, 'Caesum', 283.8, 22, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-41-S.jpg'),
(58, 'Bahari', 712.56, 9, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-40-S.jpg'),
(59, 'Titan S', 461.41, 5, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-30-S.jpg'),
(60, 'Diver Fides', 169.34, 20, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-55b-S.jpg'),
(61, 'Mirabile visu S', 212.47, 9, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-45b-S.jpg'),
(62, 'Initium S', 554.34, 10, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-47-S.jpg'),
(63, 'Titan Coeus S', 634.3, 24, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-50-S.jpg'),
(64, 'Shoonya S', 8.48, 13, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/philippe-timmermans-29-S.jpg'),
(65, 'Birddog', 389.5, 20, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/peter-hiemstra-08-S.jpg'),
(66, 'Polar bear with devout black Madonna', 422.07, 8, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/peter-hiemstra-09-S.jpg'),
(67, 'The inheritance', 191.86, 5, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/peter-hiemstra-11-S.jpg'),
(68, 'Taming of the bears', 443.08, 2, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/peter-hiemstra-12-S.jpg'),
(69, 'Partycrusher', 139.83, 19, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/peter-hiemstra-13-S.jpg'),
(70, 'Rat in my head', 119.88, 14, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/peter-hiemstra-01-S.jpg'),
(71, 'Black Madonna Octopus', 179.94, 13, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/peter-hiemstra-43-S.jpg'),
(72, 'Endangered species', 540.03, 23, 'sculpture in ceramics by Peter Hiemstra now for sale online! ✓Highest quality & service ✓Safe payment ✓Free shipping', 'https://www.wildevuur.nl/images/schilderijen-beelden/peter-hiemstra-02-S.jpg'),
(100, 'product_1', 660.36, 23, 'lorem ipsum', 'https://i.pinimg.com/originals/c8/12/17/c81217f5d7d6d792bc50c41e39aee0da.jpg');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product_categories`
--

CREATE TABLE `product_categories` (
  `ProductId` bigint(20) DEFAULT NULL,
  `CategoryId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `product_categories`
--

INSERT INTO `product_categories` (`ProductId`, `CategoryId`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `UserId` int(11) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Firstname` varchar(50) DEFAULT NULL,
  `Lastname` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`UserId`, `Username`, `Password`, `Firstname`, `Lastname`, `Email`) VALUES
(1, 'admin', '$2y$10$kkC8ZAasREjhPDIfh3gJce5ts6q6Idv/eTL3i.nx3FjuyVQS4l/by', 'Danny', 'Jansen', 'admin@prettycrafts.com');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryId`);

--
-- Indexen voor tabel `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD PRIMARY KEY (`OrderProductId`),
  ADD KEY `OrderId` (`OrderId`),
  ADD KEY `ProductId` (`ProductId`);

--
-- Indexen voor tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexen voor tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductId`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `ordered_products`
--
ALTER TABLE `ordered_products`
  MODIFY `OrderProductId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD CONSTRAINT `ordered_products_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`OrderId`) ON DELETE CASCADE,
  ADD CONSTRAINT `ordered_products_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `products` (`ProductId`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

--
-- Gegevens worden geëxporteerd voor tabel `pma__bookmark`
--

INSERT INTO `pma__bookmark` (`id`, `dbase`, `user`, `label`, `query`) VALUES
(1, 'INFORMATION_SCHEMA', '', 'DropKeyConstraint', 'use ecom_db;\r\n\r\n\r\nSELECT CONSTRAINT_NAME \r\nFROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE \r\nWHERE TABLE_NAME = \'orders\' \r\nAND COLUMN_NAME = \'ProductId\' \r\nAND CONSTRAINT_SCHEMA = \'ecom_db\';');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Gegevens worden geëxporteerd voor tabel `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'ecom_db', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"ecom_db\",\"phpmyadmin\",\"test\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structuur van de tabel @TABLE@\",\"latex_structure_continued_caption\":\"Structuur van de tabel @TABLE@ (vervolgd)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Inhoud van tabel @TABLE@\",\"latex_data_continued_caption\":\"Inhoud van tabel @TABLE@ (vervolgd)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Gegevens worden geëxporteerd voor tabel `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"ecom_db\",\"table\":\"users\"},{\"db\":\"ecom_db\",\"table\":\"ordered_products\"},{\"db\":\"ecom_db\",\"table\":\"products\"},{\"db\":\"ecom_db\",\"table\":\"orders\"},{\"db\":\"ecom_db\",\"table\":\"categories\"},{\"db\":\"ecom_db\",\"table\":\"product_categories\"},{\"db\":\"INFORMATION_SCHEMA\",\"table\":\"KEY_COLUMN_USAGE\"},{\"db\":\"information_schema\",\"table\":\"APPLICABLE_ROLES\"},{\"db\":\"information_schema\",\"table\":\"CHECK_CONSTRAINTS\"},{\"db\":\"information_schema\",\"table\":\"COLUMNS\"}]');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Gegevens worden geëxporteerd voor tabel `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'ecom_db', 'categories', '{\"sorted_col\":\"`categories`.`CategoryId` ASC\"}', '2024-06-28 01:02:31'),
('root', 'ecom_db', 'users', '[]', '2024-05-20 19:33:49');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Gegevens worden geëxporteerd voor tabel `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-07-01 11:33:17', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"nl\",\"NavigationWidth\":319}');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexen voor tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexen voor tabel `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexen voor tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexen voor tabel `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexen voor tabel `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexen voor tabel `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexen voor tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexen voor tabel `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexen voor tabel `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexen voor tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexen voor tabel `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexen voor tabel `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexen voor tabel `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexen voor tabel `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexen voor tabel `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexen voor tabel `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexen voor tabel `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
