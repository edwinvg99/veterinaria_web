-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-04-2023 a las 15:58:30
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add persona', 7, 'add_persona'),
(26, 'Can change persona', 7, 'change_persona'),
(27, 'Can delete persona', 7, 'delete_persona'),
(28, 'Can view persona', 7, 'view_persona'),
(29, 'Can add mascota', 8, 'add_mascota'),
(30, 'Can change mascota', 8, 'change_mascota'),
(31, 'Can delete mascota', 8, 'delete_mascota'),
(32, 'Can view mascota', 8, 'view_mascota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$HFpECrSrlnoT5SFAC2I6am$0zsDJ5H2UPOF1lS/ZLoDCU/r7D2NjeGK3BEj41k7yYk=', '2023-04-24 00:05:23.000000', 1, 'edwin123', '', '', 'velasquezgiraldoedwin@gmail.com', 1, 1, '2023-04-21 17:54:46.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-04-21 18:03:26.255030', '123', 'persona object (123)', 1, '[{\"added\": {}}]', 7, 1),
(2, '2023-04-21 18:03:44.571376', '123', 'persona object (123)', 3, '', 7, 1),
(3, '2023-04-21 18:18:52.051097', '111', 'persona object (111)', 1, '[{\"added\": {}}]', 7, 1),
(4, '2023-04-21 21:44:18.534178', '222', 'mariana-veterinaria', 1, '[{\"added\": {}}]', 7, 1),
(5, '2023-04-22 03:19:47.595556', '333', 'juana-admini', 1, '[{\"added\": {}}]', 7, 1),
(6, '2023-04-22 03:58:37.062224', '222', 'mariana-veterinaria', 3, '', 7, 1),
(7, '2023-04-22 23:49:24.577847', '1', 'edwin', 1, '[{\"added\": {}}]', 8, 1),
(8, '2023-04-22 23:51:21.750515', '1212', 'tatiana-dueña', 1, '[{\"added\": {}}]', 7, 1),
(9, '2023-04-22 23:51:48.872859', '2', 'sol', 1, '[{\"added\": {}}]', 8, 1),
(10, '2023-04-22 23:58:40.482795', '1212', 'tatiana-dueña', 3, '', 7, 1),
(11, '2023-04-22 23:59:21.415910', '1', 'pepe', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 8, 1),
(12, '2023-04-24 00:05:57.177930', '1', 'edwin123', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 4, 1),
(13, '2023-04-29 13:23:43.697946', '3', 'perlito', 1, '[{\"added\": {}}]', 8, 1),
(14, '2023-04-29 13:24:09.155197', '4545', 'andres-veterinario', 1, '[{\"added\": {}}]', 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(8, 'veterinaria', 'mascota'),
(7, 'veterinaria', 'persona');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-04-21 05:00:03.340398'),
(2, 'auth', '0001_initial', '2023-04-21 05:00:03.712360'),
(3, 'admin', '0001_initial', '2023-04-21 05:00:03.775426'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-04-21 05:00:03.784397'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-04-21 05:00:03.792392'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-04-21 05:00:03.829796'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-04-21 05:00:03.860796'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-04-21 05:00:03.873815'),
(9, 'auth', '0004_alter_user_username_opts', '2023-04-21 05:00:03.882793'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-04-21 05:00:03.907044'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-04-21 05:00:03.909794'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-04-21 05:00:03.916797'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-04-21 05:00:03.927781'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-04-21 05:00:03.942772'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-04-21 05:00:03.954776'),
(16, 'auth', '0011_update_proxy_permissions', '2023-04-21 05:00:03.961673'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-04-21 05:00:03.974655'),
(18, 'sessions', '0001_initial', '2023-04-21 05:00:03.992938'),
(19, 'veterinaria', '0001_initial', '2023-04-21 05:00:04.002921'),
(20, 'veterinaria', '0002_mascota', '2023-04-22 23:48:20.218173'),
(21, 'veterinaria', '0003_mascota_edad', '2023-04-22 23:48:20.231162');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4y0ub9kvp812fpiv8v3xpjnagux1kmg6', '.eJxVjDsOwjAQBe_iGll2_MlCSc8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jawuyqrT75aRnlJ3wA-s90nTVJd5zHpX9EGbvk0sr-vh_h0UbGWrA6AwWhOii8QgBKbzZLocgbw1LiL7MwTnIzmGwfBmBXY0hF6wd6A-X9yiN9M:1ppuyX:vQs7W06fxQXJnr-Vgfz1qLkizUoN0R7i1vfWgsWYPoQ', '2023-05-05 17:55:13.741763'),
('y34eyz99k2jv14zfd50j9klg1s6b9w1o', '.eJxVjDsOwjAQBe_iGll2_MlCSc8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jawuyqrT75aRnlJ3wA-s90nTVJd5zHpX9EGbvk0sr-vh_h0UbGWrA6AwWhOii8QgBKbzZLocgbw1LiL7MwTnIzmGwfBmBXY0hF6wd6A-X9yiN9M:1pqjhr:sxD4azdN8dmiPPzhOyz6sruhuA2Bwfq7Z7zzMzQboSA', '2023-05-08 00:05:23.417198');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinaria_mascota`
--

CREATE TABLE `veterinaria_mascota` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `especie` varchar(50) NOT NULL,
  `raza` varchar(50) NOT NULL,
  `caracteristica` varchar(500) NOT NULL,
  `peso` double NOT NULL,
  `dueño_id` int(11) NOT NULL,
  `edad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `veterinaria_mascota`
--

INSERT INTO `veterinaria_mascota` (`id`, `nombre`, `especie`, `raza`, `caracteristica`, `peso`, `dueño_id`, `edad`) VALUES
(1, 'pepe', 'perro', 'doberman', 'negro-feo-grande', 19, 111, 3),
(3, 'perlito', 'perro', 'lindo', 'panzona', 3, 444, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinaria_persona`
--

CREATE TABLE `veterinaria_persona` (
  `cedula` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `rol` varchar(100) NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `contraseña` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `veterinaria_persona`
--

INSERT INTO `veterinaria_persona` (`cedula`, `nombre`, `rol`, `usuario`, `contraseña`) VALUES
(111, 'edwinvg', 'veterinario', 'edwin123', 'pass'),
(222, 'ssss', 'admincito', NULL, NULL),
(333, 'juana', 'admini', 'juana123', 'pass123'),
(444, 'ZOM', 'Veterinario', NULL, NULL),
(555, 'pepe', 'veterinario', NULL, NULL),
(666, 'pepe', 'veterinario', NULL, NULL),
(888, 'tatiana', 'dueña', NULL, NULL),
(988, 'pepegrillo', 'veterinario', 'vwveevv', '12345'),
(4545, 'andres', 'veterinario', 'andres123', '123'),
(7756, 'esteban', 'admon', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `veterinaria_mascota`
--
ALTER TABLE `veterinaria_mascota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `veterinaria_mascota_dueño_id_6c71e122_fk_veterinar` (`dueño_id`);

--
-- Indices de la tabla `veterinaria_persona`
--
ALTER TABLE `veterinaria_persona`
  ADD PRIMARY KEY (`cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `veterinaria_mascota`
--
ALTER TABLE `veterinaria_mascota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `veterinaria_mascota`
--
ALTER TABLE `veterinaria_mascota`
  ADD CONSTRAINT `veterinaria_mascota_dueño_id_6c71e122_fk_veterinar` FOREIGN KEY (`dueño_id`) REFERENCES `veterinaria_persona` (`cedula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
