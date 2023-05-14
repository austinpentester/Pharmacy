-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2023 at 08:19 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_credentials`
--

CREATE TABLE `admin_credentials` (
  `USERNAME` varchar(50) COLLATE utf16_bin NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `admin_credentials`
--

INSERT INTO `admin_credentials` (`USERNAME`, `PASSWORD`) VALUES
('admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(20) COLLATE utf16_bin NOT NULL,
  `ADDRESS` varchar(100) COLLATE utf16_bin NOT NULL,
  `email_address` varchar(50) COLLATE utf16_bin NOT NULL,
  `password` varchar(50) COLLATE utf16_bin NOT NULL,
  `CONTACT_NUMBER` varchar(30) COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`ID`, `NAME`, `ADDRESS`, `email_address`, `password`, `CONTACT_NUMBER`) VALUES
(19, 'Austin', 'some', 'austin@gmail.com', '1234', '9629765171');

-- --------------------------------------------------------

--
-- Table structure for table `customers_store`
--

CREATE TABLE `customers_store` (
  `id` int(11) NOT NULL,
  `customers_name` varchar(30) NOT NULL,
  `medicine_Name` varchar(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `mrp` int(30) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers_store`
--

INSERT INTO `customers_store` (`id`, `customers_name`, `medicine_Name`, `quantity`, `mrp`, `date`) VALUES
(24, 'Austin', 'action 500', 25, 12, '2023-04-26'),
(25, 'arun', 'feaver', 12, 12, '2023-04-26');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `INVOICE_ID` int(11) NOT NULL,
  `NET_TOTAL` double NOT NULL DEFAULT 0,
  `INVOICE_DATE` date NOT NULL DEFAULT current_timestamp(),
  `CUSTOMER_ID` int(11) NOT NULL,
  `TOTAL_AMOUNT` double NOT NULL,
  `TOTAL_DISCOUNT` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

-- --------------------------------------------------------

--
-- Table structure for table `medicines_stock`
--

CREATE TABLE `medicines_stock` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) COLLATE utf16_bin NOT NULL,
  `BATCH_ID` varchar(20) COLLATE utf16_bin NOT NULL,
  `EXPIRY_DATE` varchar(10) COLLATE utf16_bin NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `MRP` double NOT NULL,
  `RATE` double NOT NULL,
  `Supplier` varchar(30) COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `medicines_stock`
--

INSERT INTO `medicines_stock` (`ID`, `NAME`, `BATCH_ID`, `EXPIRY_DATE`, `QUANTITY`, `MRP`, `RATE`, `Supplier`) VALUES
(15, 'action 500', '123', '12/25', 75, 12, 12, 'tst@gmail.com'),
(16, 'feaver', '452', '14/25', 38, 12, 12, 'clo@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `order_stock`
--

CREATE TABLE `order_stock` (
  `id` int(11) NOT NULL,
  `Medicine_Name` varchar(60) NOT NULL,
  `Quantity` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_stock`
--

INSERT INTO `order_stock` (`id`, `Medicine_Name`, `Quantity`, `user`) VALUES
(4, 'action 500', '10', 'austin@gmail.com'),
(5, 'feaver', '15', 'arun@gmail.com'),
(6, 'med1', '45', 'austin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `SUPPLIER_NAME` varchar(100) COLLATE utf16_bin NOT NULL,
  `INVOICE_NUMBER` int(11) NOT NULL,
  `VOUCHER_NUMBER` int(11) NOT NULL,
  `PURCHASE_DATE` varchar(10) COLLATE utf16_bin NOT NULL,
  `TOTAL_AMOUNT` double NOT NULL,
  `PAYMENT_STATUS` varchar(20) COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) COLLATE utf16_bin NOT NULL,
  `EMAIL` varchar(100) COLLATE utf16_bin NOT NULL,
  `passsword` varchar(30) COLLATE utf16_bin NOT NULL,
  `CONTACT_NUMBER` varchar(10) COLLATE utf16_bin NOT NULL,
  `ADDRESS` varchar(100) COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`ID`, `NAME`, `EMAIL`, `passsword`, `CONTACT_NUMBER`, `ADDRESS`) VALUES
(36, 'tech survey tamil1', 'tst@gmail.com', '123', '9629765171', 'onlinefeff');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_credentials`
--
ALTER TABLE `admin_credentials`
  ADD PRIMARY KEY (`USERNAME`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `customers_store`
--
ALTER TABLE `customers_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`INVOICE_ID`);

--
-- Indexes for table `medicines_stock`
--
ALTER TABLE `medicines_stock`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `BATCH_ID` (`BATCH_ID`);

--
-- Indexes for table `order_stock`
--
ALTER TABLE `order_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`VOUCHER_NUMBER`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `customers_store`
--
ALTER TABLE `customers_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `INVOICE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `medicines_stock`
--
ALTER TABLE `medicines_stock`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_stock`
--
ALTER TABLE `order_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `VOUCHER_NUMBER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
