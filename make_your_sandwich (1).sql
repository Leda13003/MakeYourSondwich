-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 09 juin 2024 à 12:51
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `make_your_sandwich`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `created_at`) VALUES
(1, 1, '2024-06-05 11:12:03'),
(2, 1, '2024-06-05 11:29:36'),
(6, 1, '2024-06-05 16:00:01'),
(7, 1, '2024-06-05 16:09:00'),
(8, 1, '2024-06-05 16:57:44'),
(11, 1, '2024-06-05 21:09:32'),
(12, 1, '2024-06-06 09:31:14');

-- --------------------------------------------------------

--
-- Structure de la table `processed_orders`
--

CREATE TABLE `processed_orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `processed_orders`
--

INSERT INTO `processed_orders` (`id`, `user_id`, `created_at`) VALUES
(8, 1, '2024-06-05 12:06:09'),
(9, 1, '2024-06-05 12:31:14'),
(10, 1, '2024-06-05 15:05:33'),
(11, 1, '2024-06-05 19:51:30'),
(12, 1, '2024-06-05 19:22:54');

-- --------------------------------------------------------

--
-- Structure de la table `processed_sandwiches`
--

CREATE TABLE `processed_sandwiches` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `base` varchar(255) DEFAULT NULL,
  `base_price` decimal(10,2) DEFAULT NULL,
  `cheese` varchar(255) DEFAULT NULL,
  `cheese_price` decimal(10,2) DEFAULT NULL,
  `drink` varchar(255) DEFAULT NULL,
  `drink_price` decimal(10,2) DEFAULT NULL,
  `dessert` varchar(255) DEFAULT NULL,
  `dessert_price` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `processed_sandwiches`
--

INSERT INTO `processed_sandwiches` (`id`, `order_id`, `base`, `base_price`, `cheese`, `cheese_price`, `drink`, `drink_price`, `dessert`, `dessert_price`, `total_price`) VALUES
(18, 8, 'Baguette', 2.00, '0', 1.20, 'Sprite', 1.50, 'Beignets', 2.00, 19.40),
(19, 8, 'Baguette', 2.00, '0', 1.50, 'Mountain Dew', 1.50, 'Glace', 2.50, 12.10),
(21, 9, 'Tortilla de maïs', 1.50, '0', 1.20, '7UP', 1.50, 'Éclairs', 3.00, 19.30),
(22, 10, 'Baguette', 2.00, '0', 1.50, 'Dr. Pepper', 1.50, 'Tarte aux pommes', 3.00, 13.00),
(23, 11, 'Baguette', 2.00, '0', 1.50, 'Root Beer', 1.50, 'Tiramisu', 3.00, 12.80),
(24, 11, 'Baguette', 2.00, '0', 1.50, 'Orangina', 1.50, 'Glace', 2.50, 12.30),
(26, 12, 'Baguette', 2.00, '0', 1.20, 'Dr. Pepper', 1.50, 'Glace', 2.50, 12.50),
(27, 12, 'Baguette', 2.00, '0', 1.50, 'Root Beer', 1.50, 'Glace', 2.50, 10.70);

-- --------------------------------------------------------

--
-- Structure de la table `processed_sandwich_extras`
--

CREATE TABLE `processed_sandwich_extras` (
  `id` int(11) NOT NULL,
  `sandwich_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `processed_sandwich_proteins`
--

CREATE TABLE `processed_sandwich_proteins` (
  `id` int(11) NOT NULL,
  `sandwich_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `processed_sandwich_sauces`
--

CREATE TABLE `processed_sandwich_sauces` (
  `id` int(11) NOT NULL,
  `sandwich_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `processed_sandwich_veggies`
--

CREATE TABLE `processed_sandwich_veggies` (
  `id` int(11) NOT NULL,
  `sandwich_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sandwiches`
--

CREATE TABLE `sandwiches` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `base` varchar(255) DEFAULT NULL,
  `base_price` decimal(10,2) DEFAULT NULL,
  `cheese` varchar(255) DEFAULT NULL,
  `cheese_price` decimal(10,2) DEFAULT NULL,
  `drink` varchar(255) DEFAULT NULL,
  `drink_price` decimal(10,2) DEFAULT NULL,
  `dessert` varchar(255) DEFAULT NULL,
  `dessert_price` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sandwiches`
--

INSERT INTO `sandwiches` (`id`, `order_id`, `base`, `base_price`, `cheese`, `cheese_price`, `drink`, `drink_price`, `dessert`, `dessert_price`, `total_price`) VALUES
(1, 1, 'Tortilla de maïs', 1.50, '0', 1.20, 'Mountain Dew', 1.50, 'Tiramisu', 3.00, 12.50),
(2, 2, 'Baguette', 2.00, '0', 1.50, 'Root Beer', 1.50, 'Glace', 2.50, 12.60),
(7, 6, 'Tortilla de blé', 1.50, '0', 1.50, '7UP', 1.50, 'Glace', 2.50, 11.70),
(8, 7, 'Tortilla de blé', 1.50, '0', 1.50, 'Ginger Ale', 1.50, 'Glace', 2.50, 12.20),
(9, 8, 'Baguette', 2.00, '0', 1.50, 'Orangina', 1.50, 'Glace', 2.50, 12.30),
(14, 11, 'Tortilla de maïs', 1.50, '0', 1.20, 'Orangina', 1.50, 'Glace', 2.50, 44.50),
(15, 12, 'Baguette', 2.00, '0', 1.50, '7UP', 1.50, 'Glace', 2.50, 12.80);

-- --------------------------------------------------------

--
-- Structure de la table `sandwich_extras`
--

CREATE TABLE `sandwich_extras` (
  `id` int(11) NOT NULL,
  `sandwich_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sandwich_extras`
--

INSERT INTO `sandwich_extras` (`id`, `sandwich_id`, `name`, `price`) VALUES
(1, 1, 'Jalapeños', 0.50),
(2, 2, 'Citron', 0.30),
(9, 7, 'Citron', 0.30),
(10, 8, 'Citron', 0.30),
(11, 9, 'Citron', 0.30),
(16, 14, 'Citron', 0.30),
(17, 14, 'Olives', 0.50),
(18, 14, 'Jalapeños', 0.50),
(19, 14, 'Frites', 1.00),
(20, 15, 'Citron', 0.30);

-- --------------------------------------------------------

--
-- Structure de la table `sandwich_proteins`
--

CREATE TABLE `sandwich_proteins` (
  `id` int(11) NOT NULL,
  `sandwich_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sandwich_proteins`
--

INSERT INTO `sandwich_proteins` (`id`, `sandwich_id`, `name`, `quantity`, `price`) VALUES
(1, 1, 'Steak', 1, 4.00),
(2, 2, 'Steak', 1, 4.00),
(11, 7, 'Viande kebab', 1, 3.50),
(12, 8, 'Steak', 1, 4.00),
(13, 9, 'Viande kebab', 1, 3.50),
(18, 14, 'Steak', 1, 4.00),
(19, 14, 'Viande kebab', 1, 3.50),
(20, 14, 'Poulet grillé', 1, 3.00),
(21, 14, 'Bœuf haché', 1, 3.50),
(22, 14, 'Merguez', 1, 3.00),
(23, 14, 'Saucisses', 1, 2.50),
(24, 14, 'Nuggets de poulet', 1, 3.00),
(25, 14, 'Falafel', 1, 2.50),
(26, 14, 'Tofu', 1, 2.00),
(27, 15, 'Steak', 1, 4.00);

-- --------------------------------------------------------

--
-- Structure de la table `sandwich_sauces`
--

CREATE TABLE `sandwich_sauces` (
  `id` int(11) NOT NULL,
  `sandwich_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sandwich_sauces`
--

INSERT INTO `sandwich_sauces` (`id`, `sandwich_id`, `name`, `price`) VALUES
(1, 1, 'Mayonnaise', 0.30),
(2, 2, 'Ketchup', 0.30),
(10, 7, 'Sauce andalouse', 0.50),
(11, 8, 'Sauce fromage', 0.50),
(12, 9, 'Sauce harissa', 0.50),
(17, 14, 'Sauce fromage', 0.50),
(18, 14, 'Sauce andalouse', 0.50),
(19, 14, 'Sauce harissa', 0.50),
(20, 14, 'Mayonnaise', 0.30),
(21, 14, 'Ketchup', 0.30),
(22, 14, 'Sauce barbecue', 0.50),
(23, 14, 'Sauce samouraï', 0.50),
(24, 14, 'Sauce algérienne', 0.50),
(25, 14, 'Sauce blanche', 0.50),
(26, 15, 'Sauce harissa', 0.50);

-- --------------------------------------------------------

--
-- Structure de la table `sandwich_veggies`
--

CREATE TABLE `sandwich_veggies` (
  `id` int(11) NOT NULL,
  `sandwich_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sandwich_veggies`
--

INSERT INTO `sandwich_veggies` (`id`, `sandwich_id`, `name`, `price`) VALUES
(1, 1, 'Poivrons en lamelles', 0.40),
(2, 2, 'Poivrons en lamelles', 0.40),
(11, 7, 'Oignons émincés', 0.30),
(12, 8, 'Cornichons en rondelles', 0.30),
(13, 9, 'Poivrons en lamelles', 0.40),
(18, 14, 'Tomates en dés', 0.50),
(19, 14, 'Oignons émincés', 0.30),
(20, 14, 'Concombre en rondelles', 0.40),
(21, 14, 'Chou blanc ou rouge émincé', 0.40),
(22, 14, 'Cornichons en rondelles', 0.30),
(23, 14, 'Champignons sautés', 0.50),
(24, 14, 'Carottes râpées', 0.30),
(25, 14, 'Poivrons en lamelles', 0.40),
(26, 14, 'Salade verte', 0.50),
(27, 15, 'Poivrons en lamelles', 0.40);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`) VALUES
(1, 'Adel', '1234@gmail.com', '$2y$10$dojwrrDpkeKWY6x.u/LSwehVmSc4UNQt99w91EtamWYCdB2PsGrwi', 'admin'),
(2, 'Adel', '1234@gmail.com', '$2y$10$xANFwx/pDHS65D0LBCQYtuDoLML211ZLK02FX2bgWKQA/JWajz9KC', 'admin'),
(3, '12', '12345@gmail.com', '$2y$10$yFfc4.tuQHJFO5PK6N/NYuDHPLYXk.fqYx2wyJdKdICq2V/KTnQyu', 'admin'),
(4, 'Diko', 'DIko@gmail.com', '$2y$10$t41slm8hI7NJhk/kkv7DxOCYZHPVL.1Km66nDc4hwefAqD3/NyuHm', 'admin'),
(5, 'admin', 'admin@admin.com', '$2y$10$cONmTWsa5DT..l0IvnqfNuSdVtO4RHOAaa7dK2DxJK1a4Yh4IIpJy', 'admin'),
(6, 'LedaBoss', 'LedaBoss@gmail.com', '$2y$10$dgtpbFTRg.HWT/dWIUJTEuKjPFiJ21w7uKq.UWFMcmtazxFdFj9Ce', 'user'),
(7, 'LedaBoss2@gmail.com', 'LedaBoss2@gmail.com', '$2y$10$xn9Jm9iAS6RLq509u/YH.uSggRK.2pI3MNm/hXnhdDArb/z7FPtaq', 'user');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `processed_orders`
--
ALTER TABLE `processed_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `processed_sandwiches`
--
ALTER TABLE `processed_sandwiches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Index pour la table `processed_sandwich_extras`
--
ALTER TABLE `processed_sandwich_extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sandwich_id` (`sandwich_id`);

--
-- Index pour la table `processed_sandwich_proteins`
--
ALTER TABLE `processed_sandwich_proteins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sandwich_id` (`sandwich_id`);

--
-- Index pour la table `processed_sandwich_sauces`
--
ALTER TABLE `processed_sandwich_sauces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sandwich_id` (`sandwich_id`);

--
-- Index pour la table `processed_sandwich_veggies`
--
ALTER TABLE `processed_sandwich_veggies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sandwich_id` (`sandwich_id`);

--
-- Index pour la table `sandwiches`
--
ALTER TABLE `sandwiches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Index pour la table `sandwich_extras`
--
ALTER TABLE `sandwich_extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sandwich_id` (`sandwich_id`);

--
-- Index pour la table `sandwich_proteins`
--
ALTER TABLE `sandwich_proteins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sandwich_id` (`sandwich_id`);

--
-- Index pour la table `sandwich_sauces`
--
ALTER TABLE `sandwich_sauces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sandwich_id` (`sandwich_id`);

--
-- Index pour la table `sandwich_veggies`
--
ALTER TABLE `sandwich_veggies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sandwich_id` (`sandwich_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `processed_orders`
--
ALTER TABLE `processed_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `processed_sandwiches`
--
ALTER TABLE `processed_sandwiches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `processed_sandwich_extras`
--
ALTER TABLE `processed_sandwich_extras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `processed_sandwich_proteins`
--
ALTER TABLE `processed_sandwich_proteins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `processed_sandwich_sauces`
--
ALTER TABLE `processed_sandwich_sauces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `processed_sandwich_veggies`
--
ALTER TABLE `processed_sandwich_veggies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `sandwiches`
--
ALTER TABLE `sandwiches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `sandwich_extras`
--
ALTER TABLE `sandwich_extras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `sandwich_proteins`
--
ALTER TABLE `sandwich_proteins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `sandwich_sauces`
--
ALTER TABLE `sandwich_sauces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `sandwich_veggies`
--
ALTER TABLE `sandwich_veggies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `processed_orders`
--
ALTER TABLE `processed_orders`
  ADD CONSTRAINT `processed_orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `processed_sandwiches`
--
ALTER TABLE `processed_sandwiches`
  ADD CONSTRAINT `processed_sandwiches_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `processed_orders` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `processed_sandwich_extras`
--
ALTER TABLE `processed_sandwich_extras`
  ADD CONSTRAINT `processed_sandwich_extras_ibfk_1` FOREIGN KEY (`sandwich_id`) REFERENCES `processed_sandwiches` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `processed_sandwich_proteins`
--
ALTER TABLE `processed_sandwich_proteins`
  ADD CONSTRAINT `processed_sandwich_proteins_ibfk_1` FOREIGN KEY (`sandwich_id`) REFERENCES `processed_sandwiches` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `processed_sandwich_sauces`
--
ALTER TABLE `processed_sandwich_sauces`
  ADD CONSTRAINT `processed_sandwich_sauces_ibfk_1` FOREIGN KEY (`sandwich_id`) REFERENCES `processed_sandwiches` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `processed_sandwich_veggies`
--
ALTER TABLE `processed_sandwich_veggies`
  ADD CONSTRAINT `processed_sandwich_veggies_ibfk_1` FOREIGN KEY (`sandwich_id`) REFERENCES `processed_sandwiches` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sandwiches`
--
ALTER TABLE `sandwiches`
  ADD CONSTRAINT `sandwiches_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Contraintes pour la table `sandwich_extras`
--
ALTER TABLE `sandwich_extras`
  ADD CONSTRAINT `sandwich_extras_ibfk_1` FOREIGN KEY (`sandwich_id`) REFERENCES `sandwiches` (`id`);

--
-- Contraintes pour la table `sandwich_proteins`
--
ALTER TABLE `sandwich_proteins`
  ADD CONSTRAINT `sandwich_proteins_ibfk_1` FOREIGN KEY (`sandwich_id`) REFERENCES `sandwiches` (`id`);

--
-- Contraintes pour la table `sandwich_sauces`
--
ALTER TABLE `sandwich_sauces`
  ADD CONSTRAINT `sandwich_sauces_ibfk_1` FOREIGN KEY (`sandwich_id`) REFERENCES `sandwiches` (`id`);

--
-- Contraintes pour la table `sandwich_veggies`
--
ALTER TABLE `sandwich_veggies`
  ADD CONSTRAINT `sandwich_veggies_ibfk_1` FOREIGN KEY (`sandwich_id`) REFERENCES `sandwiches` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
