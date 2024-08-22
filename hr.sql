-- phpMyAdmin SQL Dump
-- version 5.2.1-4.fc40
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 22, 2024 at 10:52 AM
-- Server version: 10.11.8-MariaDB
-- PHP Version: 8.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `factuxorg_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `hr_benefits`
--

CREATE TABLE `hr_benefits` (
  `id` int(11) NOT NULL,
  `code` varchar(25) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `value` decimal(65,6) DEFAULT NULL COMMENT 'Value by default',
  `icon` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_benefits`
--

INSERT INTO `hr_benefits` (`id`, `code`, `title`, `description`, `value`, `icon`, `color`, `order_by`, `status`) VALUES
(1, 'meal_vouchers', 'Meal vouchers', '', 8.000000, NULL, NULL, 1, 1),
(2, 'covid_vouchers', 'Cheques covid', '', NULL, NULL, NULL, 1, 1),
(3, 'prime_diver', 'Primes Chauffeur', 'Driver', 135.000000, NULL, NULL, 1, 1),
(4, 'recomendation', 'Recomendation', 'When the employee brings a person to the company to work', NULL, NULL, NULL, 1, 1),
(5, 'health_insurance', 'Health insurance', 'Additional health insurance that covers medical expenses not covered by mandatory health insurance.', NULL, NULL, NULL, 1, 1),
(6, 'year_end_bonus ', 'Year-end bonus ', 'An additional bonus paid at the end of the year, often equivalent to one month\'s salary in many industries.', NULL, NULL, NULL, 1, 1),
(7, 'paid_vacation', 'Paid vacation', 'In addition to legal holidays, some companies offer additional paid vacation days.', NULL, NULL, NULL, 1, 1),
(8, 'eco_cheques', 'Eco vouchers (Eco cheques)', 'Eco vouchers (Eco cheques): Vouchers that employees can use to purchase ecological products and services.', NULL, NULL, NULL, 1, 1),
(9, 'transportation', 'Transportation reimbursement', 'Transportation allowance (Transportation reimbursement): Reimbursement for public transportation expenses or a subsidy for using a private vehicle to commute to work.', NULL, NULL, NULL, 1, 1),
(10, 'supplementary_pension', 'Supplementary pension plan', 'Supplementary pension plan: An additional pension plan offered by the employer to supplement the state pension.', NULL, NULL, NULL, 1, 1),
(11, 'culture_sport_vouchers', 'Culture and sport vouchers', 'Culture and sport vouchers: Vouchers for cultural and sports activities.', NULL, NULL, NULL, 1, 1),
(12, 'training', 'Training and professional development opportunities', 'Training and professional development opportunities: Opportunities for professional development and training paid for by the employer.', NULL, NULL, NULL, 1, 1),
(13, 'performance_bonuses', 'Performance bonuses', 'Performance bonuses: Bonuses based on individual or company performance.', NULL, NULL, NULL, 1, 1),
(14, 'company_car', 'Company car', 'Company car: Some employers provide company cars to their employees, which can also be used for personal purposes.', NULL, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hr_benefit_periodicity`
--

CREATE TABLE `hr_benefit_periodicity` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `periodicity` varchar(250) NOT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_benefit_periodicity`
--

INSERT INTO `hr_benefit_periodicity` (`id`, `code`, `periodicity`, `order_by`, `status`) VALUES
(1, 1, 'Every Day', 1, 1),
(3, 30, 'Every month', 1, 1),
(4, 365, 'Every year', 1, 1),
(5, -1, 'Every event', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hr_categories`
--

CREATE TABLE `hr_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(250) NOT NULL COMMENT 'Employee Tag',
  `description` varchar(250) NOT NULL COMMENT 'Name',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Parent Employee Tag',
  `child_ids` int(11) DEFAULT NULL COMMENT 'Child Categories',
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_categories`
--

INSERT INTO `hr_categories` (`id`, `code`, `description`, `parent_id`, `child_ids`, `order_by`, `status`) VALUES
(2, 'company_partners', 'Company partners', NULL, NULL, 1, 1),
(5, 'employees', 'Employees', NULL, NULL, 1, 1),
(6, 'independent_workers', 'Independent workers', NULL, NULL, 1, 1),
(7, 'apprentices', 'Apprentices', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hr_civil_status`
--

CREATE TABLE `hr_civil_status` (
  `id` int(11) NOT NULL,
  `code` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_civil_status`
--

INSERT INTO `hr_civil_status` (`id`, `code`, `description`, `icon`, `color`, `order_by`, `status`) VALUES
(1, 'single', 'Single', NULL, NULL, 1, 1),
(5, 'married', 'Married', NULL, NULL, 1, 1),
(6, 'divorced', 'Divorced', NULL, NULL, 1, 1),
(7, 'widowed', 'Widowed', NULL, NULL, 1, 1),
(8, 'legally_cohabit', 'Legally cohabit', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hr_clothes`
--

CREATE TABLE `hr_clothes` (
  `id` int(11) NOT NULL,
  `code` varchar(25) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_clothes`
--

INSERT INTO `hr_clothes` (`id`, `code`, `name`, `description`, `order_by`, `status`) VALUES
(1, 'pantalon', 'Panatalon', 'Pantalon', 1, 1),
(2, 'chemise', 'Chemise', 'Chemise', 1, 1),
(3, 'chausures', 'Chausures', 'chausures', 1, 1),
(5, 'veste', 'Veste', ' Veste', 1, 1),
(6, 'gilet', 'Gilet', 'Gilet', 1, 1),
(7, 'blouse', 'Blouse', 'Blouse', 1, 1),
(8, 'manteau', 'Manteau', 'Manteau', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hr_documents`
--

CREATE TABLE `hr_documents` (
  `id` int(11) NOT NULL,
  `code` varchar(25) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `version` varchar(25) NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_documents`
--

INSERT INTO `hr_documents` (`id`, `code`, `title`, `content`, `version`, `date_creation`, `order_by`, `status`) VALUES
(3, 'passport', 'passport', 'passport', '001', '2024-05-24 16:25:47', 1, 1),
(4, 'identit_card', 'Identity card', 'Identity card', '001', '2024-05-24 16:25:47', 1, 1),
(5, 'work_permit', 'Work permit', 'Work permit', '001', '2024-05-24 16:25:47', 1, 1),
(6, 'residence_permit', 'Residence permit', 'Residence permit', '001', '2024-05-24 16:25:47', 1, 1),
(7, 'medical_certificate', 'Medical certificate', 'Medical certificate', '001', '2024-05-24 16:25:47', 1, 1),
(8, 'criminal_record', 'Criminal record certificate', 'Criminal record certificate', '001', '2024-05-24 16:25:47', 1, 1),
(9, 'social_security_number', 'Social security number', 'Social security number', '001', '2024-05-24 16:25:47', 1, 1),
(10, 'health_insurance_card', 'Health insurance card', 'Health insurance card', '001', '2024-05-24 16:25:47', 1, 1),
(11, 'vaccination_record', 'Vaccination record', 'Vaccination record', '001', '2024-05-24 16:25:47', 1, 1),
(12, '10', '10', '10', '10', '2024-07-02 22:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_benefits`
--

CREATE TABLE `hr_employee_benefits` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `benefit_code` varchar(25) NOT NULL,
  `price` decimal(65,6) DEFAULT NULL,
  `company_part` decimal(65,6) DEFAULT NULL COMMENT 'What percentage will the company pay of this price?',
  `employee_part` decimal(65,6) GENERATED ALWAYS AS (`price` * (100 - `company_part`) / 100) VIRTUAL,
  `periodicity` int(11) NOT NULL DEFAULT 1,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_benefits_by_month`
--

CREATE TABLE `hr_employee_benefits_by_month` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  `month` int(2) NOT NULL,
  `benefit_code` varchar(25) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(65,6) DEFAULT NULL,
  `company_part` decimal(65,6) DEFAULT NULL,
  `employee_part` decimal(65,6) GENERATED ALWAYS AS (100 - `company_part`) VIRTUAL,
  `company_part_value` decimal(65,6) GENERATED ALWAYS AS (`quantity` * `price` * (`company_part` / 100)) VIRTUAL,
  `employee_part_value` decimal(65,6) GENERATED ALWAYS AS (`quantity` * `price` * (`employee_part` / 100)) VIRTUAL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_category`
--

CREATE TABLE `hr_employee_category` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `category_code` varchar(250) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_civil_status`
--

CREATE TABLE `hr_employee_civil_status` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `civil_status` varchar(25) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_clothes`
--

CREATE TABLE `hr_employee_clothes` (
  `id` int(11) NOT NULL,
  `employee_sizes_clothes_id` int(11) NOT NULL,
  `date_of_delivery` date NOT NULL,
  `notes` text DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_documents`
--

CREATE TABLE `hr_employee_documents` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `document` varchar(25) NOT NULL,
  `document_number` varchar(250) NOT NULL,
  `date_delivery` date DEFAULT NULL,
  `date_expiration` date DEFAULT NULL,
  `follow` int(1) DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_family_dependents`
--

CREATE TABLE `hr_employee_family_dependents` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `birthday` date DEFAULT NULL,
  `relation` enum('Spouses','Children','Others') NOT NULL,
  `in_charge` int(1) DEFAULT NULL,
  `handicap` int(1) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_fines`
--

CREATE TABLE `hr_employee_fines` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `category_code` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `value` decimal(65,2) NOT NULL,
  `way` enum('cash','bank') NOT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_money_advance`
--

CREATE TABLE `hr_employee_money_advance` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `value` decimal(65,2) NOT NULL,
  `way` enum('cash','bank') NOT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_nationality`
--

CREATE TABLE `hr_employee_nationality` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `nationality` char(2) NOT NULL,
  `principal` int(1) DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_payroll_items`
--

CREATE TABLE `hr_employee_payroll_items` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `value` decimal(65,6) DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_salary`
--

CREATE TABLE `hr_employee_salary` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `month` decimal(9,2) DEFAULT NULL,
  `hour` decimal(9,2) DEFAULT NULL,
  `date_start` date NOT NULL,
  `date_end` date DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_sizes_clothes`
--

CREATE TABLE `hr_employee_sizes_clothes` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `clothes_code` varchar(25) NOT NULL,
  `size` varchar(50) NOT NULL,
  `notes` text DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_worked_days`
--

CREATE TABLE `hr_employee_worked_days` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `start_am` time DEFAULT NULL COMMENT 'Job start Time 08h30',
  `end_am` time DEFAULT NULL COMMENT 'Job End Time 10h30',
  `lunch` time DEFAULT NULL,
  `start_pm` time DEFAULT NULL,
  `end_pm` time DEFAULT NULL,
  `total_hours` time DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1,
  `year` int(4) GENERATED ALWAYS AS (year(`date`)) VIRTUAL,
  `month` int(2) GENERATED ALWAYS AS (month(`date`)) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `hr_employee_worked_days`
--
DELIMITER $$
CREATE TRIGGER `hr_employee_worked_days_after_delete` AFTER DELETE ON `hr_employee_worked_days` FOR EACH ROW BEGIN
  DECLARE existing_days_count INT;

  -- Contar los días trabajados únicos para el empleado, mes y año donde total_hours no es NULL
  SELECT COUNT(DISTINCT `date`)
  INTO existing_days_count
  FROM `hr_employee_worked_days`
  WHERE `employee_id` = OLD.`employee_id`
    AND YEAR(`date`) = YEAR(OLD.`date`)
    AND MONTH(`date`) = MONTH(OLD.`date`)
    AND `total_hours` IS NOT NULL;

  -- Actualizar o eliminar la cantidad en hr_employee_benefits_by_month
  IF existing_days_count > 0 THEN
    UPDATE `hr_employee_benefits_by_month`
    SET `quantity` = existing_days_count
    WHERE `employee_id` = OLD.`employee_id`
      AND `year` = YEAR(OLD.`date`)
      AND `month` = MONTH(OLD.`date`)
      AND `benefit_code` = 'meal_vouchers';
  ELSE
    DELETE FROM `hr_employee_benefits_by_month`
    WHERE `employee_id` = OLD.`employee_id`
      AND `year` = YEAR(OLD.`date`)
      AND `month` = MONTH(OLD.`date`)
      AND `benefit_code` = 'meal_vouchers';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hr_employee_worked_days_after_insert` AFTER INSERT ON `hr_employee_worked_days` FOR EACH ROW BEGIN
  DECLARE existing_days_count INT;
  DECLARE company_part_value DECIMAL(65,6) DEFAULT 0;
  DECLARE benefit_price DECIMAL(65,6) DEFAULT 0;

  -- Contar los días trabajados únicos para el empleado, mes y año donde total_hours no es NULL
  SELECT COUNT(DISTINCT `date`)
  INTO existing_days_count
  FROM `hr_employee_worked_days`
  WHERE `employee_id` = NEW.`employee_id`
    AND YEAR(`date`) = YEAR(NEW.`date`)
    AND MONTH(`date`) = MONTH(NEW.`date`)
    AND `total_hours` IS NOT NULL;

  -- Obtener el valor de company_part_value y price desde hr_employee_benefits
  SELECT 
    IFNULL(`company_part`, 0) AS company_part_value, 
    IFNULL(`price`, 0) AS price
  INTO company_part_value, benefit_price
  FROM `hr_employee_benefits`
  WHERE `employee_id` = NEW.`employee_id`
    AND `benefit_code` = 'meal_vouchers'
  LIMIT 1;

  -- Insertar o actualizar la cantidad en hr_employee_benefits_by_month
  INSERT INTO `hr_employee_benefits_by_month` (
    `employee_id`,
    `year`,
    `month`,
    `benefit_code`,
    `quantity`,
    `price`,
    `company_part`,
    `order_by`,
    `status`
  ) VALUES (
    NEW.`employee_id`,
    YEAR(NEW.`date`),
    MONTH(NEW.`date`),
    'meal_vouchers', -- Asumiendo que el código del beneficio es 'meal_vouchers'
    existing_days_count,
    benefit_price,  -- Precio recuperado de `hr_employee_benefits`
    company_part_value,   -- Porcentaje de la empresa
    1, -- order_by
    1  -- status
  )
  ON DUPLICATE KEY UPDATE
    `quantity` = VALUES(`quantity`),
    `price` = VALUES(`price`),
    `company_part` = VALUES(`company_part`);
    
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hr_employee_worked_days_after_update` AFTER UPDATE ON `hr_employee_worked_days` FOR EACH ROW BEGIN
  DECLARE existing_days_count INT;
  DECLARE company_part_value DECIMAL(65,6) DEFAULT 0;
  DECLARE benefit_price DECIMAL(65,6) DEFAULT 0;

  -- Contar los días trabajados únicos para el empleado, mes y año donde total_hours no es NULL
  SELECT COUNT(DISTINCT `date`)
  INTO existing_days_count
  FROM `hr_employee_worked_days`
  WHERE `employee_id` = NEW.`employee_id`
    AND YEAR(`date`) = YEAR(NEW.`date`)
    AND MONTH(`date`) = MONTH(NEW.`date`)
    AND `total_hours` IS NOT NULL;

  -- Obtener el valor de company_part_value y price desde hr_employee_benefits
  SELECT 
    IFNULL(`company_part`, 0) AS company_part_value, 
    IFNULL(`price`, 0) AS price
  INTO company_part_value, benefit_price
  FROM `hr_employee_benefits`
  WHERE `employee_id` = NEW.`employee_id`
    AND `benefit_code` = 'meal_vouchers'
  LIMIT 1;

  -- Actualizar la cantidad en hr_employee_benefits_by_month
  INSERT INTO `hr_employee_benefits_by_month` (
    `employee_id`,
    `year`,
    `month`,
    `benefit_code`,
    `quantity`,
    `price`,
    `company_part`,
    `order_by`,
    `status`
  ) VALUES (
    NEW.`employee_id`,
    YEAR(NEW.`date`),
    MONTH(NEW.`date`),
    'meal_vouchers', -- Asumiendo que el código del beneficio es 'meal_vouchers'
    existing_days_count,
    benefit_price,  -- Precio recuperado de `hr_employee_benefits`
    company_part_value,   -- Porcentaje de la empresa
    1, -- order_by
    1  -- status
  )
  ON DUPLICATE KEY UPDATE
    `quantity` = VALUES(`quantity`),
    `price` = VALUES(`price`),
    `company_part` = VALUES(`company_part`);
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_worked_days_formule`
--

CREATE TABLE `hr_employee_worked_days_formule` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `column` enum('total_sold','pay_to_bank','pay_to_cash','total_to_pay','value_round') DEFAULT NULL,
  `value` decimal(65,6) DEFAULT NULL,
  `formule` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `code` varchar(250) NOT NULL,
  `date_registre` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Creation date',
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_work_status`
--

CREATE TABLE `hr_employee_work_status` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `work_status_code` varchar(25) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_fines_categories`
--

CREATE TABLE `hr_fines_categories` (
  `id` int(11) NOT NULL,
  `category_code` varchar(50) NOT NULL,
  `category` varchar(250) NOT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_fines_categories`
--

INSERT INTO `hr_fines_categories` (`id`, `category_code`, `category`, `order_by`, `status`) VALUES
(19, 'Loyer', 'Loyer', 1, 1),
(20, 'Gaz', 'Gaz', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hr_payroll`
--

CREATE TABLE `hr_payroll` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date_entry` date DEFAULT NULL COMMENT 'Date of entry into service',
  `address` mediumtext DEFAULT NULL,
  `fonction` varchar(250) NOT NULL,
  `salary_base` decimal(65,5) DEFAULT NULL,
  `civil_status` varchar(25) DEFAULT NULL,
  `tax_system` text DEFAULT NULL COMMENT 'Régime fiscal',
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `value_round` decimal(65,6) DEFAULT 0.000000,
  `to_pay` decimal(65,6) NOT NULL,
  `account_number` varchar(250) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `extras` text DEFAULT NULL,
  `code` varchar(250) NOT NULL,
  `date_registre` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Creation date',
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_payroll_by_month`
--

CREATE TABLE `hr_payroll_by_month` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `column` enum('total_sold','pay_to_bank','pay_to_cash','total_to_pay','value_round') NOT NULL,
  `value` decimal(65,6) DEFAULT 0.000000,
  `formule` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `code` varchar(250) NOT NULL,
  `date_registre` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Creation date',
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_payroll_items`
--

CREATE TABLE `hr_payroll_items` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `in_out` enum('in','out') NOT NULL,
  `description` text NOT NULL,
  `formula` varchar(250) DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_payroll_items`
--

INSERT INTO `hr_payroll_items` (`id`, `code`, `in_out`, `description`, `formula`, `order_by`, `status`) VALUES
(100, '3350', 'in', 'Rémunération périodique éèçà', '%7001% - %900% - %1604% - %7050%', 10, 1),
(200, '2120', 'in', 'chèques-repas partie collaborateur', NULL, 20, 1),
(300, '2110', 'in', 'chèques-repas part société (sans ONSS)', NULL, 30, 1),
(350, '2100', 'in', 'Total chèques-repas (Sodexo)', NULL, 40, 1),
(400, '6000', 'in', 'Cotisations sociales', NULL, 50, 1),
(401, '3351', 'in', 'Total brut non soumis ONSS', '%3350% - %6000%', 60, 1),
(402, '600', 'in', 'Imposable', '%3351%', 70, 1),
(700, '7050', 'in', 'Précompte professionnel', NULL, 80, 1),
(701, '800', 'in', 'NET', '%600% - %7050%', 90, 1),
(800, '1604', 'in', 'Indemnité de séjour', NULL, 100, 1),
(801, '900', 'in', 'chèques-repas partie collaborateur', '- %2120%', 200, 1),
(1000, 'x1', 'in', 'Prestations supplémentaires', NULL, 300, 1),
(1401, '6001', 'in', 'Cotisations sociales', '- %6000%', 400, 1),
(1591, '7001', 'in', 'Net à payer par la société', '', 500, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hr_payroll_lines`
--

CREATE TABLE `hr_payroll_lines` (
  `id` int(11) NOT NULL,
  `payroll_id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `in_out` varchar(5) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `quantity` int(1) DEFAULT NULL,
  `value` decimal(65,6) NOT NULL,
  `description` text NOT NULL,
  `formula` varchar(250) DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_payroll_status`
--

CREATE TABLE `hr_payroll_status` (
  `id` int(11) NOT NULL,
  `code` int(1) NOT NULL,
  `name` varchar(250) NOT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_payroll_status`
--

INSERT INTO `hr_payroll_status` (`id`, `code`, `name`, `order_by`, `status`) VALUES
(1, 1, 'Registred', 1, 1),
(3, 20, 'Payed', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hr_worked_days_status`
--

CREATE TABLE `hr_worked_days_status` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_worked_days_status`
--

INSERT INTO `hr_worked_days_status` (`id`, `code`, `status_name`, `color`, `icon`, `order_by`, `status`) VALUES
(1, 1, 'Registrado', 'yellow', NULL, 1, 1),
(2, 10, 'Aprobado', 'white', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hr_work_status`
--

CREATE TABLE `hr_work_status` (
  `id` int(11) NOT NULL,
  `code` varchar(25) NOT NULL,
  `description` varchar(250) NOT NULL,
  `available` int(1) NOT NULL COMMENT 'available to work',
  `color` varchar(50) DEFAULT NULL,
  `icon` varchar(50) NOT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_work_status`
--

INSERT INTO `hr_work_status` (`id`, `code`, `description`, `available`, `color`, `icon`, `order_by`, `status`) VALUES
(1, 'active', 'Worker active', 1, NULL, '', 1, 1),
(2, 'sick', 'Sick', 0, NULL, '', 1, 1),
(3, 'vacation', 'Holidays', 0, NULL, '', 1, 1),
(4, 'formation', 'Formation', 0, NULL, '', 1, 1),
(5, 'inactive', 'Worker inactive', 0, NULL, '', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hr_benefits`
--
ALTER TABLE `hr_benefits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `hr_benefit_periodicity`
--
ALTER TABLE `hr_benefit_periodicity`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `hr_categories`
--
ALTER TABLE `hr_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `hr_civil_status`
--
ALTER TABLE `hr_civil_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `hr_clothes`
--
ALTER TABLE `hr_clothes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `hr_documents`
--
ALTER TABLE `hr_documents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `hr_employee_benefits`
--
ALTER TABLE `hr_employee_benefits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`,`benefit_code`),
  ADD KEY `document` (`benefit_code`),
  ADD KEY `periodicity` (`periodicity`);

--
-- Indexes for table `hr_employee_benefits_by_month`
--
ALTER TABLE `hr_employee_benefits_by_month`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_employee_year_month` (`employee_id`,`year`,`month`),
  ADD KEY `hr_employee_benefits_by_month_ibfk_2` (`benefit_code`);

--
-- Indexes for table `hr_employee_category`
--
ALTER TABLE `hr_employee_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `categoy_code` (`category_code`),
  ADD KEY `hr_employee_category_ibfk_1` (`employee_id`);

--
-- Indexes for table `hr_employee_civil_status`
--
ALTER TABLE `hr_employee_civil_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id_2` (`employee_id`,`civil_status`),
  ADD KEY `benefit_code` (`civil_status`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `hr_employee_clothes`
--
ALTER TABLE `hr_employee_clothes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_sizes_clothes_id` (`employee_sizes_clothes_id`);

--
-- Indexes for table `hr_employee_documents`
--
ALTER TABLE `hr_employee_documents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`,`document`),
  ADD KEY `document` (`document`);

--
-- Indexes for table `hr_employee_family_dependents`
--
ALTER TABLE `hr_employee_family_dependents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `hr_employee_fines`
--
ALTER TABLE `hr_employee_fines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `hr_employee_salary_ibfk_1` (`employee_id`),
  ADD KEY `hr_employee_fines_category_code` (`category_code`);

--
-- Indexes for table `hr_employee_money_advance`
--
ALTER TABLE `hr_employee_money_advance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `hr_employee_salary_ibfk_1` (`employee_id`);

--
-- Indexes for table `hr_employee_nationality`
--
ALTER TABLE `hr_employee_nationality`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`,`nationality`),
  ADD KEY `hr_employee_benefices_ibfk_2` (`employee_id`),
  ADD KEY `nationality` (`nationality`);

--
-- Indexes for table `hr_employee_payroll_items`
--
ALTER TABLE `hr_employee_payroll_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `hr_employee_salary`
--
ALTER TABLE `hr_employee_salary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `hr_employee_salary_ibfk_1` (`employee_id`);

--
-- Indexes for table `hr_employee_sizes_clothes`
--
ALTER TABLE `hr_employee_sizes_clothes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`,`clothes_code`),
  ADD KEY `clothes_code` (`clothes_code`);

--
-- Indexes for table `hr_employee_worked_days`
--
ALTER TABLE `hr_employee_worked_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `hr_employee_worked_days_project_id` (`project_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `hr_employee_worked_days_formule`
--
ALTER TABLE `hr_employee_worked_days_formule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`,`month`,`year`,`column`);

--
-- Indexes for table `hr_employee_work_status`
--
ALTER TABLE `hr_employee_work_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `benefit_code` (`work_status_code`),
  ADD KEY `hr_employee_benefices_ibfk_2` (`employee_id`);

--
-- Indexes for table `hr_fines_categories`
--
ALTER TABLE `hr_fines_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_code` (`category_code`);

--
-- Indexes for table `hr_payroll`
--
ALTER TABLE `hr_payroll`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `hr_payroll_status` (`status`);

--
-- Indexes for table `hr_payroll_by_month`
--
ALTER TABLE `hr_payroll_by_month`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id_2` (`employee_id`,`month`,`year`,`column`);

--
-- Indexes for table `hr_payroll_items`
--
ALTER TABLE `hr_payroll_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `hr_payroll_lines`
--
ALTER TABLE `hr_payroll_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`payroll_id`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `hr_payroll_status`
--
ALTER TABLE `hr_payroll_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `hr_worked_days_status`
--
ALTER TABLE `hr_worked_days_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `hr_work_status`
--
ALTER TABLE `hr_work_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hr_benefits`
--
ALTER TABLE `hr_benefits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `hr_benefit_periodicity`
--
ALTER TABLE `hr_benefit_periodicity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hr_categories`
--
ALTER TABLE `hr_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hr_civil_status`
--
ALTER TABLE `hr_civil_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `hr_clothes`
--
ALTER TABLE `hr_clothes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `hr_documents`
--
ALTER TABLE `hr_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `hr_employee_benefits`
--
ALTER TABLE `hr_employee_benefits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `hr_employee_benefits_by_month`
--
ALTER TABLE `hr_employee_benefits_by_month`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;

--
-- AUTO_INCREMENT for table `hr_employee_category`
--
ALTER TABLE `hr_employee_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `hr_employee_civil_status`
--
ALTER TABLE `hr_employee_civil_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `hr_employee_clothes`
--
ALTER TABLE `hr_employee_clothes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_employee_documents`
--
ALTER TABLE `hr_employee_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hr_employee_family_dependents`
--
ALTER TABLE `hr_employee_family_dependents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_employee_fines`
--
ALTER TABLE `hr_employee_fines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `hr_employee_money_advance`
--
ALTER TABLE `hr_employee_money_advance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `hr_employee_nationality`
--
ALTER TABLE `hr_employee_nationality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hr_employee_payroll_items`
--
ALTER TABLE `hr_employee_payroll_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `hr_employee_salary`
--
ALTER TABLE `hr_employee_salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `hr_employee_sizes_clothes`
--
ALTER TABLE `hr_employee_sizes_clothes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `hr_employee_worked_days`
--
ALTER TABLE `hr_employee_worked_days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1527;

--
-- AUTO_INCREMENT for table `hr_employee_worked_days_formule`
--
ALTER TABLE `hr_employee_worked_days_formule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;

--
-- AUTO_INCREMENT for table `hr_employee_work_status`
--
ALTER TABLE `hr_employee_work_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `hr_fines_categories`
--
ALTER TABLE `hr_fines_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `hr_payroll`
--
ALTER TABLE `hr_payroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT for table `hr_payroll_by_month`
--
ALTER TABLE `hr_payroll_by_month`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1911;

--
-- AUTO_INCREMENT for table `hr_payroll_items`
--
ALTER TABLE `hr_payroll_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1595;

--
-- AUTO_INCREMENT for table `hr_payroll_lines`
--
ALTER TABLE `hr_payroll_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `hr_payroll_status`
--
ALTER TABLE `hr_payroll_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hr_worked_days_status`
--
ALTER TABLE `hr_worked_days_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hr_work_status`
--
ALTER TABLE `hr_work_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hr_employee_benefits`
--
ALTER TABLE `hr_employee_benefits`
  ADD CONSTRAINT `hr_employee_benefits_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_employee_benefits_ibfk_2` FOREIGN KEY (`benefit_code`) REFERENCES `hr_benefits` (`code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_employee_benefits_ibfk_3` FOREIGN KEY (`periodicity`) REFERENCES `hr_benefit_periodicity` (`code`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_employee_benefits_by_month`
--
ALTER TABLE `hr_employee_benefits_by_month`
  ADD CONSTRAINT `hr_employee_benefits_by_month_benefit_code` FOREIGN KEY (`benefit_code`) REFERENCES `hr_benefits` (`code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_employee_benefits_by_month_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_employee_category`
--
ALTER TABLE `hr_employee_category`
  ADD CONSTRAINT `hr_employee_category_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_employee_category_ibfk_2` FOREIGN KEY (`category_code`) REFERENCES `hr_categories` (`code`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_employee_civil_status`
--
ALTER TABLE `hr_employee_civil_status`
  ADD CONSTRAINT `hr_employee_civil_status_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_employee_civil_status_ibfk_2` FOREIGN KEY (`civil_status`) REFERENCES `hr_civil_status` (`code`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_employee_clothes`
--
ALTER TABLE `hr_employee_clothes`
  ADD CONSTRAINT `hr_employee_clothes_ibfk_1` FOREIGN KEY (`employee_sizes_clothes_id`) REFERENCES `hr_employee_sizes_clothes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_employee_documents`
--
ALTER TABLE `hr_employee_documents`
  ADD CONSTRAINT `hr_employee_documents_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_employee_documents_ibfk_2` FOREIGN KEY (`document`) REFERENCES `hr_documents` (`code`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_employee_family_dependents`
--
ALTER TABLE `hr_employee_family_dependents`
  ADD CONSTRAINT `hr_employee_family_dependents_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_employee_fines`
--
ALTER TABLE `hr_employee_fines`
  ADD CONSTRAINT `hr_employee_fines_category_code` FOREIGN KEY (`category_code`) REFERENCES `hr_fines_categories` (`category_code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_employee_fines_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_employee_money_advance`
--
ALTER TABLE `hr_employee_money_advance`
  ADD CONSTRAINT `hr_employee_money_advance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_employee_nationality`
--
ALTER TABLE `hr_employee_nationality`
  ADD CONSTRAINT `hr_employee_nationality_ibfk_1` FOREIGN KEY (`nationality`) REFERENCES `countries` (`countryCode`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_employee_nationality_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_employee_payroll_items`
--
ALTER TABLE `hr_employee_payroll_items`
  ADD CONSTRAINT `hr_employee_payroll_items_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_employee_payroll_items_ibfk_2` FOREIGN KEY (`code`) REFERENCES `hr_payroll_items` (`code`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_employee_salary`
--
ALTER TABLE `hr_employee_salary`
  ADD CONSTRAINT `hr_employee_salary_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_employee_sizes_clothes`
--
ALTER TABLE `hr_employee_sizes_clothes`
  ADD CONSTRAINT `hr_employee_sizes_clothes_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_employee_sizes_clothes_ibfk_2` FOREIGN KEY (`clothes_code`) REFERENCES `hr_clothes` (`code`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_employee_worked_days`
--
ALTER TABLE `hr_employee_worked_days`
  ADD CONSTRAINT `hr_employee_worked_days_employe_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_employee_worked_days_ibfk_1` FOREIGN KEY (`status`) REFERENCES `hr_worked_days_status` (`code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_employee_worked_days_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_employee_worked_days_formule`
--
ALTER TABLE `hr_employee_worked_days_formule`
  ADD CONSTRAINT `hr_employee_worked_days_formule_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_employee_work_status`
--
ALTER TABLE `hr_employee_work_status`
  ADD CONSTRAINT `hr_employee_work_status_ibfk_1` FOREIGN KEY (`work_status_code`) REFERENCES `hr_work_status` (`code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_employee_work_status_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_payroll`
--
ALTER TABLE `hr_payroll`
  ADD CONSTRAINT `hr_payroll_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_payroll_status` FOREIGN KEY (`status`) REFERENCES `hr_payroll_status` (`code`);

--
-- Constraints for table `hr_payroll_by_month`
--
ALTER TABLE `hr_payroll_by_month`
  ADD CONSTRAINT `hr_payroll_by_month_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hr_payroll_lines`
--
ALTER TABLE `hr_payroll_lines`
  ADD CONSTRAINT `hr_payroll_lines_code` FOREIGN KEY (`code`) REFERENCES `hr_payroll_items` (`code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_payroll_lines_payroll_id` FOREIGN KEY (`payroll_id`) REFERENCES `hr_payroll` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
