-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Feb 2026 pada 23.07
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dwijaya`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barangs`
--

CREATE TABLE `barangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `barang_category_id` bigint(20) UNSIGNED NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `total_harga_beli` double NOT NULL DEFAULT 0,
  `hpp` double NOT NULL,
  `hp` double NOT NULL,
  `h1` double NOT NULL,
  `h2` double NOT NULL,
  `h3` double NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `total_stok_beli` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `barangs`
--

INSERT INTO `barangs` (`id`, `barang_category_id`, `kode_barang`, `no_urut`, `nama`, `satuan`, `total_harga_beli`, `hpp`, `hp`, `h1`, `h2`, `h3`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`, `total_stok_beli`) VALUES
(1, 1, 'ANT1006', 1006, 'ANTENA REMOTE NIKITA - 850/1C=10BJ', 'PCS', 0, 100000, 86860, 92000, 96000, 97500, 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL, 0),
(2, 2, 'BL1002', 1002, 'BLENDER COSMOS CB 190', 'PCS', 0, 228918, 233590, 247000, 252000, 254500, 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_categories`
--

CREATE TABLE `barang_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `alias` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `barang_categories`
--

INSERT INTO `barang_categories` (`id`, `alias`, `nama`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ANT', 'ANTENA', 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL),
(2, 'BL', 'BLENDER', 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL);

-- --------------------------------------------------------

CREATE TABLE `cabangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `alias` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cabangs`
--

INSERT INTO `cabangs` (`id`, `alias`, `nama`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'DJ', 'UD. DWIJAYA', 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL),
(2, 'TJ', 'UD. TRIJAYA', 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL);

-- --------------------------------------------------------

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `kota` varchar(255) DEFAULT NULL,
  `term_of_payment` varchar(255) NOT NULL,
  `rekomendasi_harga` varchar(255) NOT NULL,
  `limit` double NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `exp_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = exp dibayar toko, 2 = exp_dibayar fifty-fifty, 3, exp dibayar dj'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `nama`, `alamat`, `no_telepon`, `kota`, `term_of_payment`, `rekomendasi_harga`, `limit`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`, `exp_type`) VALUES
(1, 'IKTIAR FARADHIS 2', 'JL RAYA PRENDUAN', '031-3769446', 'SUMENEP', '1 Bulan (+30)', 'H3', 0, 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL, 1),
(2, 'ADI JAYA EL/E', 'JL RAYA DLANGU', '08533566559', 'MOJOKERTO', '1 Bulan (+30)', 'H3', 0, 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `gudangs`
--

CREATE TABLE `gudangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `gudangs`
--

INSERT INTO `gudangs` (`id`, `nama`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'UTAMA', 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL),
(2, 'RETUR', 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL),
(3, 'SERVICE', 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL),
(4, 'TOKO', 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_details`
--

CREATE TABLE `penjualan_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `penjualan_header_id` bigint(20) UNSIGNED NOT NULL,
  `barang_id` bigint(20) UNSIGNED NOT NULL,
  `gudang_id` bigint(20) UNSIGNED NOT NULL,
  `harga` double NOT NULL,
  `jumlah` int(11) NOT NULL,
  `diskon` int(11) NOT NULL,
  `subtotal` double NOT NULL DEFAULT 0,
  `hpp` double NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `penjualan_details`
--

INSERT INTO `penjualan_details` (`id`, `penjualan_header_id`, `barang_id`, `gudang_id`, `harga`, `jumlah`, `diskon`, `subtotal`, `hpp`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 100000, 10, 0, 1000000, 100000, 2, 2, NULL, '2026-02-24 22:06:17', '2026-02-24 22:07:08', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_headers`
--

CREATE TABLE `penjualan_headers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cabang_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `sales_id` bigint(20) UNSIGNED NOT NULL,
  `user_kirim_id` bigint(20) UNSIGNED DEFAULT NULL,
  `alias_cabang` varchar(255) NOT NULL DEFAULT 'DJ',
  `no_invoice` int(11) NOT NULL,
  `tanggal_invoice` date NOT NULL,
  `tanggal_jatuh_tempo_invoice` date NOT NULL,
  `tanggal_kirim` datetime DEFAULT NULL,
  `total` double NOT NULL DEFAULT 0,
  `total_ongkir` double NOT NULL DEFAULT 0,
  `payment` varchar(255) NOT NULL DEFAULT 'UNPAID',
  `keterangan` text DEFAULT NULL,
  `status_penjualan` tinyint(4) NOT NULL DEFAULT 1,
  `status_kirim` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `kota_created_in` varchar(255) DEFAULT NULL,
  `total_hpp` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `penjualan_headers`
--

INSERT INTO `penjualan_headers` (`id`, `cabang_id`, `customer_id`, `sales_id`, `user_kirim_id`, `alias_cabang`, `no_invoice`, `tanggal_invoice`, `tanggal_jatuh_tempo_invoice`, `tanggal_kirim`, `total`, `total_ongkir`, `payment`, `keterangan`, `status_penjualan`, `status_kirim`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`, `ip_address`, `kota_created_in`, `total_hpp`) VALUES
(1, 1, 2, 1, 2, 'DJ', 202602001, '2026-02-25', '2026-02-25', '2026-02-25 05:07:08', 1000000, 0, 'UNPAID', NULL, 2, 2, 2, 2, NULL, '2026-02-24 22:05:57', '2026-02-24 22:07:08', NULL, NULL, NULL, 1000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `kota` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'foreign ke user id tipe sales'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`id`, `nama`, `alamat`, `no_telepon`, `kota`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`, `user_id`) VALUES
(1, 'ANDI A', 'GRESIK', '081330748599', 'GRESIK', 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL, 5),
(2, 'ANDI B', 'GRESIK', '081330748599', 'GRESIK', 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL, 5),
(3, 'ROFIQ A', 'JL TANAH MERAH INDAH SAYUR VII NO 8', '081357259021', 'SURABAYA', 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL, 6),
(4, 'ROFIQ B', 'JL TANAH MERAH INDAH SAYUR VII NO 8', '081357259021', 'SURABAYA', 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL, 6),
(5, 'HUDA A', 'JL Merdeka No 1', '081357259021', 'SURABAYA', 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL, 7),
(6, 'HUDA B', 'JL Merdeka No 1', '081357259021', 'SURABAYA', 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL, 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stoks`
--

CREATE TABLE `stoks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `barang_id` bigint(20) UNSIGNED NOT NULL,
  `gudang_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `jumlah` int(11) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `stoks`
--

INSERT INTO `stoks` (`id`, `barang_id`, `gudang_id`, `jumlah`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 90, 1, 2, NULL, '2026-02-24 22:03:55', '2026-02-24 22:07:08', NULL),
(2, 2, 1, 100, 1, 2, NULL, '2026-02-24 22:03:55', '2026-02-24 22:06:49', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status_aktif` tinyint(4) NOT NULL DEFAULT 1,
  `hak_akses` tinyint(4) NOT NULL DEFAULT 2 COMMENT '1 = owner, 2 = admin, 3 = sales',
  `last_login` varchar(255) NOT NULL DEFAULT '-',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `imei` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `status_aktif`, `hak_akses`, `last_login`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`, `imei`) VALUES
(1, 'ARKAS', '$2y$10$oqF4C0jONLZQkmUA2O8hi.KPYdxjl5j.KZo5bOYagsjW20.l9BUsK', 1, 1, '-', 1, 1, NULL, '2026-02-24 22:03:54', '2026-02-24 22:03:54', NULL, NULL),
(2, 'YOSUA', '$2y$10$oqF4C0jONLZQkmUA2O8hi.KPYdxjl5j.KZo5bOYagsjW20.l9BUsK', 1, 1, '-', 1, 1, NULL, '2026-02-24 22:03:54', '2026-02-24 22:05:22', NULL, NULL),
(3, 'SUPRI', '$2y$10$oqF4C0jONLZQkmUA2O8hi.KPYdxjl5j.KZo5bOYagsjW20.l9BUsK', 1, 2, '-', 1, 1, NULL, '2026-02-24 22:03:54', '2026-02-24 22:03:54', NULL, '123456'),
(4, 'AWIKNAWAWI', '$2y$10$oqF4C0jONLZQkmUA2O8hi.KPYdxjl5j.KZo5bOYagsjW20.l9BUsK', 1, 2, '-', 1, 1, NULL, '2026-02-24 22:03:54', '2026-02-24 22:03:54', NULL, '123456'),
(5, 'ANDI', '$2y$10$oqF4C0jONLZQkmUA2O8hi.KPYdxjl5j.KZo5bOYagsjW20.l9BUsK', 1, 3, '-', 1, 1, NULL, '2026-02-24 22:03:54', '2026-02-24 22:03:54', NULL, '123456'),
(6, 'HUDA', '$2y$10$oqF4C0jONLZQkmUA2O8hi.KPYdxjl5j.KZo5bOYagsjW20.l9BUsK', 1, 3, '-', 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL, '123456'),
(7, 'ROFIQ', '$2y$10$oqF4C0jONLZQkmUA2O8hi.KPYdxjl5j.KZo5bOYagsjW20.l9BUsK', 1, 3, '-', 1, 1, NULL, '2026-02-24 22:03:55', '2026-02-24 22:03:55', NULL, '123456');

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barangs`
--
ALTER TABLE `barangs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `barang_categories`
--
ALTER TABLE `barang_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cabangs`
--
ALTER TABLE `cabangs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `gudangs`
--
ALTER TABLE `gudangs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penjualan_details`
--
ALTER TABLE `penjualan_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penjualan_headers`
--
ALTER TABLE `penjualan_headers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `penjualan_headers_no_invoice_unique` (`no_invoice`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stoks`
--
ALTER TABLE `stoks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);