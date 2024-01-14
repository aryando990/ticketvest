-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Jan 2024 pada 10.20
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `annprint`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `chat`
--

CREATE TABLE `chat` (
  `id_pesan` bigint(20) UNSIGNED NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `pesan` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `chat`
--

INSERT INTO `chat` (`id_pesan`, `from_id`, `to_id`, `pesan`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'halo admin', 'on read', '2022-11-03 16:02:30', '2022-11-03 18:59:55'),
(2, 3, 1, 'admin tolong', 'on read', '2022-11-03 16:23:31', '2022-11-03 18:51:06'),
(3, 3, 1, 'tes', 'on read', '2022-11-03 16:31:32', '2022-11-03 18:51:06'),
(4, 3, 1, 'mang', 'on read', '2022-11-03 16:59:31', '2022-11-03 18:51:06'),
(5, 4, 1, 'bang', 'on read', '2022-11-03 17:16:10', '2022-11-03 18:50:58'),
(12, 1, 4, 'hai monica', 'on read', '2022-11-03 17:57:01', '2022-11-18 14:28:11'),
(13, 1, 3, 'iya rizki i love you', 'on read', '2022-11-03 18:03:16', '2022-11-03 19:06:08'),
(14, 3, 1, 'bang minta tolong', 'on read', '2022-11-03 18:18:42', '2022-11-03 18:51:06'),
(15, 1, 2, 'iya ada apa', 'off read', '2022-11-03 18:24:36', '2022-11-03 18:24:36'),
(16, 3, 1, 'kenapa pesanan saya blum di antar ?', 'on read', '2022-11-03 18:34:09', '2022-11-03 18:51:06'),
(17, 1, 4, 'bang saya menangis', 'on read', '2022-11-03 18:35:01', '2022-11-18 14:28:11'),
(18, 1, 3, 'baik mohon d tunggu', 'on read', '2022-11-03 18:35:35', '2022-11-03 19:06:08'),
(19, 1, 4, 'kenapa menangis', 'on read', '2022-11-03 18:50:57', '2022-11-18 14:28:11'),
(20, 6, 1, 'HALO', 'on read', '2023-12-24 09:30:24', '2023-12-24 19:38:00'),
(21, 1, 6, 'iya halo', 'on read', '2023-12-24 19:38:00', '2023-12-27 09:48:01'),
(22, 6, 1, 'halo sayang', 'off read', '2023-12-27 09:48:00', '2023-12-27 09:48:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `jenis_kategori` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `jenis_kategori`, `created_at`, `updated_at`) VALUES
(1, 'Tiket', '2022-11-03 19:44:29', '2022-11-03 19:44:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` bigint(20) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `keranjang`
--

INSERT INTO `keranjang` (`id_keranjang`, `id_user`, `id_produk`, `total`, `created_at`, `updated_at`) VALUES
(12, 6, 4, 6, '2023-12-24 21:18:46', '2023-12-24 21:18:46'),
(16, 6, 10, 6, '2023-12-25 11:47:52', '2023-12-25 11:47:52'),
(18, 6, 7, 6, '2023-12-25 13:33:10', '2023-12-25 13:33:10'),
(21, 6, 9, 12, '2023-12-25 19:33:14', '2023-12-25 19:33:14'),
(22, 6, 9, 6, '2023-12-27 06:22:50', '2023-12-27 06:22:50'),
(25, 6, 12, 6, '2023-12-27 09:01:55', '2023-12-27 09:01:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` bigint(20) UNSIGNED NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `komentar_produk` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `komentar`
--

INSERT INTO `komentar` (`id_komentar`, `id_pesanan`, `id_user`, `id_produk`, `komentar_produk`, `created_at`, `updated_at`) VALUES
(1, 3, 4, 2, 'Produk Memuaskan Sekali', '2022-11-03 20:20:14', '2022-11-03 20:20:14'),
(2, 2, 3, 4, 'Produk Memuaskan Sekali', '2022-11-03 20:20:50', '2022-11-03 20:20:50'),
(3, 1, 2, 3, 'Produk Memuaskan Sekali', '2022-11-03 20:21:01', '2022-11-03 20:21:01'),
(4, 4, 5, 5, 'Produk Memuaskan Sekali', '2022-11-17 13:24:05', '2022-11-17 13:24:05'),
(5, 1, 4, 2, 'Produk Memuaskan Sekali', '2022-11-20 09:48:30', '2022-11-20 09:48:30'),
(6, 3, 6, 3, 'keren sekalii', '2023-12-25 06:27:40', '2023-12-25 06:27:40'),
(7, 6, 6, 8, 'Produk Memuaskan Sekali', '2023-12-25 11:59:33', '2023-12-25 11:59:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(14, '2014_10_12_000000_create_users_table', 1),
(15, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(16, '2022_10_15_135218_create_kategori_table', 1),
(17, '2022_10_15_153539_create_variasi_table', 1),
(18, '2022_10_15_191158_create_sablon_table', 1),
(19, '2022_10_16_105812_create_produk_table', 1),
(20, '2022_10_17_091741_create_produknon_table', 1),
(21, '2022_10_26_214800_create_keranjang_table', 1),
(22, '2022_10_28_162803_create_user_alamat_table', 1),
(24, '2022_10_31_174230_create_rekening_table', 1),
(25, '2022_11_02_141155_create_komentar_table', 1),
(26, '2022_11_03_151758_create_chat_table', 1),
(30, '2022_10_29_000910_create_pesanan_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` bigint(20) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `id_alamat` int(11) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `variasi` varchar(255) DEFAULT NULL,
  `variasi_harga` varchar(255) DEFAULT NULL,
  `variasi_total` bigint(20) DEFAULT NULL,
  `sablon` varchar(255) DEFAULT NULL,
  `sablon_harga` varchar(255) DEFAULT NULL,
  `sablon_total` bigint(20) DEFAULT NULL,
  `note_sablon_variasi` text DEFAULT NULL,
  `bayar` bigint(20) DEFAULT NULL,
  `ongkir` bigint(20) DEFAULT NULL,
  `total_bayar` bigint(20) DEFAULT NULL,
  `bukti_bayar` text DEFAULT NULL,
  `no_resi` text DEFAULT NULL,
  `desain` text DEFAULT NULL,
  `request_user` text DEFAULT NULL,
  `total_dp` bigint(20) DEFAULT NULL,
  `bukti_bayar_dp` text DEFAULT NULL,
  `bukti_bayar_dp_lunas` text DEFAULT NULL,
  `dp_status` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tipe_pembayaran` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `id_user`, `id_produk`, `quantity`, `id_alamat`, `id_kota`, `variasi`, `variasi_harga`, `variasi_total`, `sablon`, `sablon_harga`, `sablon_total`, `note_sablon_variasi`, `bayar`, `ongkir`, `total_bayar`, `bukti_bayar`, `no_resi`, `desain`, `request_user`, `total_dp`, `bukti_bayar_dp`, `bukti_bayar_dp_lunas`, `dp_status`, `status`, `tipe_pembayaran`, `created_at`, `updated_at`) VALUES
(1, 4, 2, 7, 3, 399, NULL, NULL, 0, NULL, NULL, 0, NULL, 595000, 10000, 605000, NULL, '123456789', NULL, NULL, NULL, 'bukti_bayar.jpeg', 'jne.jpeg', 'lunas', 'selesai', 'dp', '2022-11-18 16:47:25', '2022-11-20 09:48:30'),
(2, 2, 5, 6, 1, 62, NULL, NULL, 0, NULL, NULL, 0, NULL, 780000, 38000, 818000, 'bukti_bayar.jpeg', '56789', NULL, NULL, NULL, NULL, NULL, NULL, 'Barang Dalam Pengiriman', 'lunas', '2022-11-18 21:46:03', '2023-12-24 20:59:07'),
(3, 6, 3, 6, 5, 445, NULL, NULL, 0, NULL, NULL, 0, NULL, 450000, 12000, 462000, 'tiara.jpg', '123', NULL, NULL, NULL, NULL, NULL, NULL, 'selesai', 'lunas', '2023-12-24 19:05:48', '2023-12-25 06:27:40'),
(4, 6, 1, 6, 5, 445, 'ukuran 3xl,', '10000,', 10000, 'glow phosper,', '7000,', 7000, 'dfghjk', 450000, 12000, 479000, 'Starboy.jpg', '456', NULL, NULL, NULL, NULL, NULL, NULL, 'Barang Dalam Pengiriman', 'lunas', '2023-12-25 06:20:34', '2023-12-25 06:24:45'),
(5, 6, 2, 6, 5, 445, NULL, NULL, 0, NULL, NULL, 0, NULL, 510000, 12000, 522000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'menunggu pembayaran', NULL, '2023-12-25 06:28:38', '2023-12-25 06:28:38'),
(6, 6, 8, 6, 5, 445, NULL, NULL, 0, NULL, NULL, 0, NULL, 1200000, 12000, 1212000, 'pamungkas.jpg', 'P006', NULL, NULL, NULL, NULL, NULL, NULL, 'selesai', 'lunas', '2023-12-25 11:25:08', '2023-12-25 11:59:33'),
(7, 6, 9, 6, 5, 445, NULL, NULL, 0, NULL, NULL, 0, NULL, 1200000, 12000, 1212000, 'taher.jpg', 'P007', NULL, NULL, NULL, NULL, NULL, NULL, 'Barang Dalam Pengiriman', 'lunas', '2023-12-25 11:49:36', '2023-12-27 06:29:53'),
(8, 6, 8, 6, 5, 445, NULL, NULL, 0, NULL, NULL, 0, NULL, 1200000, 12000, 1212000, 'concerts _ wanderland 2017 ; LANY.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pesanan Di Terima', 'lunas', '2023-12-25 19:32:16', '2023-12-27 07:20:14'),
(9, 6, 13, 12, 5, 445, NULL, NULL, 0, NULL, NULL, 0, NULL, 14400000, 24000, 14424000, 'bca.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pesanan Di Terima', 'lunas', '2023-12-27 08:39:10', '2023-12-27 09:11:12'),
(10, 6, 14, 6, 5, 445, NULL, NULL, 0, NULL, NULL, 0, NULL, 6000000, 12000, 6012000, '2.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pesanan Di Tolak', 'lunas', '2023-12-27 08:40:37', '2023-12-27 09:44:28'),
(11, 6, 7, 6, 5, 445, NULL, NULL, 0, NULL, NULL, 0, NULL, 1500000, 12000, 1512000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'menunggu pembayaran', NULL, '2023-12-27 09:02:35', '2023-12-27 09:02:35'),
(12, 6, 13, 12, 5, 445, NULL, NULL, 0, NULL, NULL, 0, NULL, 14400000, 24000, 14424000, 'bca.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pesanan Di Terima', 'lunas', '2023-12-27 09:42:38', '2023-12-27 09:44:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` bigint(20) UNSIGNED NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `kategori` int(11) NOT NULL,
  `harga_produk1` varchar(255) DEFAULT NULL,
  `harga_produk2` varchar(255) DEFAULT NULL,
  `harga_produk3` varchar(255) DEFAULT NULL,
  `harga_produk4` varchar(255) DEFAULT NULL,
  `harga_produk5` varchar(255) DEFAULT NULL,
  `foto_produk1` varchar(255) DEFAULT NULL,
  `foto_produk2` varchar(255) DEFAULT NULL,
  `foto_produk3` varchar(255) DEFAULT NULL,
  `foto_produk4` varchar(255) DEFAULT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `kategori`, `harga_produk1`, `harga_produk2`, `harga_produk3`, `harga_produk4`, `harga_produk5`, `foto_produk1`, `foto_produk2`, `foto_produk3`, `foto_produk4`, `deskripsi`, `created_at`, `updated_at`) VALUES
(7, 'Hati Tertulus', 1, ' 250000', ' 500000', ' 700000', ' 1000000', ' 1300000', 'tulus.jpg', NULL, NULL, NULL, '<p>hati yang tak penah menyarah akan ke adaan</p>', '2023-12-25 07:52:20', '2023-12-25 07:52:20'),
(8, 'Pamungkas', 1, ' 200000', ' 450000', ' 700000', ' 1000000', ' 1200000', 'pamungkas.jpg', 'p2.jpg', NULL, NULL, '<p>melepaskan sesuatu orang yang kita sayang adalah cinta paling tertingi</p>', '2023-12-25 07:55:26', '2023-12-27 08:04:14'),
(9, 'aldi taher', 1, ' 200000', ' 400000', ' 600000', ' 1000000', ' 1500000', 'taher.jpg', NULL, NULL, NULL, '<p>jatuh cinta paling tinggi adalah melepas orang paling di sayang</p>', '2023-12-25 11:32:20', '2023-12-25 11:32:20'),
(11, 'rich brian', 1, ' 700000', ' 1000000', ' 1500000', ' 2000000', ' 2500000', 'rich.jpg', NULL, NULL, NULL, '<p>Rich Brian, yang nama aslinya Brian Imanuel Soewarno, adalah seorang rapper, penyanyi, dan penulis lagu asal Indonesia. Ia mendapatkan pengakuan internasional melalui singel debutnya \"Dat $tick\" pada tahun 2016, yang menjadi viral di platform media sosial. Lahir pada tanggal 3 September 1999 di Jakarta, Indonesia, Rich Brian memulai karirnya dengan membuat video komedi di YouTube sebelum beralih ke dunia musik. Ia merilis album debutnya yang berjudul \"Amen\" pada tahun 2018, yang mendapatkan ulasan positif dan mencapai peringkat ke-18 di tangga album US Billboard 200</p>', '2023-12-25 11:55:15', '2023-12-25 11:55:15'),
(12, 'Olivia Rodrigo', 1, ' 800000', ' 900000', ' 1300000', ' 1600000', ' 1800000', 'Olivia Rodrigo.jpg', 'olivia.jpg', NULL, NULL, '<p>Olivia Rodrigo adalah seorang penyanyi, penulis lagu, dan aktris asal Amerika Serikat. Ia lahir pada tanggal 20 Februari 2003. Olivia Rodrigo mendapatkan popularitas melalui perannya sebagai Nini Salazar-Roberts dalam serial Disney+ berjudul \"High School Musical: The Musical: The Series\".</p>', '2023-12-27 07:06:53', '2023-12-27 07:14:38'),
(13, 'Rex Orange County', 1, ' 1000000', ' 1200000', ' 1350000', ' 1500000', ' 1800000', 'rex.jpg', 'orange.jpg', 'county.jpg', NULL, '<p>Rex Orange County adalah seorang penyanyi-penulis lagu asal Inggris. Nama aslinya adalah Alexander O\'Connor, dan ia lahir pada tanggal 4 Mei 1998. Rex Orange County dikenal karena gaya musiknya yang campuran antara pop, indie, dan R&amp;B. Ia merilis album debutnya yang berjudul \"bcos u will never b free\" pada tahun 2016, dan album keduanya yang berjudul \"Apricot Princess\" pada tahun 2017. Salah satu lagunya yang terkenal adalah \"Loving Is Easy\" yang dirilis pada tahun 2017.&nbsp;</p>', '2023-12-27 07:08:48', '2023-12-27 07:15:25'),
(14, 'James Arthur', 1, ' 1000000', ' 1300000', ' 1550000', ' 1800000', ' 2000000', 'James.jpg', 'james1.jpg', NULL, NULL, '<p>James Arthur adalah seorang penyanyi dan penulis lagu asal Inggris. Ia lahir pada tanggal 2 Maret 1988 di Middlesbrough, Inggris. James Arthur pertama kali dikenal setelah memenangkan kompetisi X Factor Inggris pada tahun 2012. Setelah itu, ia merilis lagu debutnya yang berjudul \"Impossible\", yang menjadi hit di seluruh dunia dan mendapatkan sertifikasi platinum di berbagai negara. James Arthur terkenal dengan suaranya yang kuat dan emosional, serta kemampuannya dalam menulis lagu-lagu yang menggugah perasaan. Ia telah merilis beberapa album, termasuk \"James Arthur\" (2013), \"Back from the Edge\" (2016), dan \"You\" (2019). Beberapa lagunya yang populer antara lain \"Say You Won\'t Let Go\", \"Can I Be Him\", dan \"Empty Space\". Selain itu, James Arthur juga dikenal karena keterlibatannya dalam kampanye-kampanye sosial, termasuk kampanye anti-bullying dan kampanye kesehatan mental.</p>', '2023-12-27 07:12:25', '2023-12-27 07:12:25'),
(15, 'Neck Deep', 1, ' 900000', ' 1400000', ' 1900000', ' 2400000', ' 2900000', 'Neck.jpg', 'nd.jpg', 'deep.jpg', NULL, '<p>Neck Deep adalah band pop punk asal Wales, Inggris. Band ini terdiri dari Ben Barlow sebagai vokalis, Matt West dan Sam Bowden pada gitar, Fil Thorpe-Evans pada bass, dan Dani Washington pada drum. Neck Deep dibentuk pada tahun 2012 dan sejak itu telah merilis beberapa album studio yang sukses seperti \"Life\'s Not Out to Get You\" pada tahun 2015 dan \"The Peace and the Panic\" pada tahun 2017. Musik Neck Deep terkenal karena campuran antara melodi pop punk yang ceria dengan lirik-lirik yang penuh dengan emosi dan pengalaman hidup. Lagu-lagu mereka sering membahas tentang hubungan, kecemasan, dan perjuangan hidup. Neck Deep telah menjadi salah satu band pop punk yang paling populer di dunia dan terus memperoleh penggemar baru dengan karya-karya mereka yang berkualitas.</p>', '2023-12-27 07:18:54', '2023-12-27 07:18:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produknon`
--

CREATE TABLE `produknon` (
  `id_produknon` bigint(20) UNSIGNED NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `kategori` int(11) NOT NULL,
  `harga_produk` varchar(255) DEFAULT NULL,
  `foto_produk1` varchar(255) DEFAULT NULL,
  `foto_produk2` varchar(255) DEFAULT NULL,
  `foto_produk3` varchar(255) DEFAULT NULL,
  `foto_produk4` varchar(255) DEFAULT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening`
--

CREATE TABLE `rekening` (
  `id_rekening` bigint(20) UNSIGNED NOT NULL,
  `nama_rek` varchar(255) NOT NULL,
  `no_rek` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rekening`
--

INSERT INTO `rekening` (`id_rekening`, `nama_rek`, `no_rek`, `created_at`, `updated_at`) VALUES
(1, 'BNI', '19671920', '2022-11-03 20:37:29', '2022-11-03 20:37:29'),
(2, 'BCA', '1134567890', '2023-12-25 04:59:16', '2023-12-25 04:59:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sablon`
--

CREATE TABLE `sablon` (
  `id_sablon` bigint(20) UNSIGNED NOT NULL,
  `jenis_sablon` varchar(255) NOT NULL,
  `harga_sablon` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sablon`
--

INSERT INTO `sablon` (`id_sablon`, `jenis_sablon`, `harga_sablon`, `created_at`, `updated_at`) VALUES
(1, '+ warna', ' 5000', '2022-11-03 19:42:22', '2022-11-03 19:42:22'),
(2, 'glow phosper', ' 7000', '2022-11-03 19:42:38', '2022-11-03 19:42:38'),
(3, 'sparasi warna', ' 10000', '2022-11-03 19:42:53', '2022-11-03 19:42:53'),
(4, 'metalic silver', ' 5000', '2022-11-03 19:43:06', '2022-11-03 19:43:06'),
(5, 'metalic gold', ' 5000', '2022-11-03 19:43:17', '2022-11-03 19:43:17'),
(6, 'foam/timbul', ' 15000', '2022-11-03 19:43:32', '2022-11-03 19:43:32'),
(7, 'foil paper a4', ' 15000', '2022-11-03 19:43:45', '2022-11-03 19:43:45'),
(8, '+ area sablon a2', ' 5000', '2022-11-03 19:43:59', '2022-11-03 19:43:59'),
(9, 'tabrak samping', ' 7000', '2022-11-03 19:44:09', '2022-11-03 19:44:09'),
(10, 'discharge', ' 10000', '2022-11-03 19:44:20', '2022-11-03 19:44:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `foto_profile` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `email_verified_at`, `password`, `tipe`, `foto_profile`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', NULL, '$2y$10$FFSCSdlm.F5zWMJSB9Y7ge3b2dFxgwjSH25EysK6UimSIFIA/cjb.', 'admin', NULL, NULL, '2022-11-03 16:01:16', '2022-11-03 19:02:54'),
(2, 'elsa', 'elsa@gmail.com', NULL, '$2y$10$elSkwXHq6iNNxs70qpp6Te407aeoo1tibeN7K7AGxHyTll0aAeokS', 'pembeli', NULL, NULL, '2022-11-03 16:02:04', '2022-11-03 17:08:50'),
(3, 'rizki ratih', 'rizkiratih@gmail.com', NULL, '$2y$10$q1BMwVRawYcCXzpWWqMMG.4HIXeCF1bCoQft8I/2VNa.o/3yMirGW', 'pembeli', NULL, NULL, '2022-11-03 16:23:15', '2022-11-03 18:08:21'),
(4, 'monica', 'monica@gmail.com', NULL, '$2y$10$xZoKxmG1RRvVlamZWkUKc.qEsANI7A63l/UpQ7sf.MdNnD6X98OKC', 'pembeli', NULL, NULL, '2022-11-03 17:15:57', '2022-11-03 17:15:57'),
(5, 'monica', 'rista@gmail.com', NULL, '$2y$10$CxioPoJsuucpueaT5.D/DeVFe3RNBMv.wU0Zpx7gRry9bn7jhJGgC', 'pembeli', NULL, NULL, '2022-11-17 13:20:33', '2022-11-17 13:20:33'),
(6, 'Angel', 'Angelia@Gmail.com', NULL, '$2y$10$yMFwW.Ny8tIlBXFGlS9XWOEee3Msj/0AlRckNGUIV7WN10exPvdXm', 'pembeli', 'IMG_20230425_212032_388.webp', NULL, '2023-12-24 06:50:53', '2023-12-24 09:29:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_alamat`
--

CREATE TABLE `user_alamat` (
  `id_user_alamat` bigint(20) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `nama_penerima` varchar(255) NOT NULL,
  `id_provinsi` int(11) NOT NULL,
  `nama_prov` varchar(255) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `nama_kota` varchar(255) NOT NULL,
  `kode_pos` varchar(255) DEFAULT NULL,
  `alamat` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user_alamat`
--

INSERT INTO `user_alamat` (`id_user_alamat`, `id_user`, `no_telp`, `nama_penerima`, `id_provinsi`, `nama_prov`, `id_kota`, `nama_kota`, `kode_pos`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 2, '081218113193', 'elsa', 4, 'Bengkulu', 62, 'Bengkulu', '30151', 'jl. sudirman n031', '2022-11-03 19:52:56', '2022-11-03 19:52:56'),
(2, 3, '0812237293', 'rizki ratih purwasih', 33, 'Sumatera Selatan', 327, 'Palembang', '30151', 'jl. soak simpur no a7', '2022-11-03 19:56:31', '2022-11-03 19:56:31'),
(3, 4, '082128293829', 'monica', 10, 'Jawa Tengah', 399, 'Semarang', '30151', 'jl. pandanaran', '2022-11-03 20:12:34', '2022-11-03 20:12:34'),
(4, 5, '081118113193', 'monica', 8, 'Jambi', 156, 'Jambi', '30151', 'jl. jend sudirman', '2022-11-17 13:21:53', '2022-11-17 13:21:53'),
(5, 6, '3456789', 'Angelia', 10, 'Jawa Tengah', 445, 'Surakarta (Solo)', '4567', 'solo', '2023-12-24 19:04:52', '2023-12-24 19:04:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `variasi`
--

CREATE TABLE `variasi` (
  `id_variasi` bigint(20) UNSIGNED NOT NULL,
  `jenis_variasi` varchar(255) NOT NULL,
  `harga_variasi` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `variasi`
--

INSERT INTO `variasi` (`id_variasi`, `jenis_variasi`, `harga_variasi`, `created_at`, `updated_at`) VALUES
(1, 'Festival', ' 0', '2022-11-03 19:39:47', '2022-11-03 19:39:47'),
(2, 'Reguler', '0', '2022-11-03 19:39:58', '2022-11-03 19:39:58'),
(3, 'VIP', '0', '2022-11-03 19:40:11', '2022-11-03 19:40:11'),
(4, 'VVIP', '0', '2022-11-03 19:40:22', '2022-11-03 19:40:22'),
(5, 'VVIP 1', '0', '2022-11-03 19:40:33', '2022-11-03 19:40:33');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `produknon`
--
ALTER TABLE `produknon`
  ADD PRIMARY KEY (`id_produknon`);

--
-- Indeks untuk tabel `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`id_rekening`);

--
-- Indeks untuk tabel `sablon`
--
ALTER TABLE `sablon`
  ADD PRIMARY KEY (`id_sablon`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `user_alamat`
--
ALTER TABLE `user_alamat`
  ADD PRIMARY KEY (`id_user_alamat`);

--
-- Indeks untuk tabel `variasi`
--
ALTER TABLE `variasi`
  ADD PRIMARY KEY (`id_variasi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `chat`
--
ALTER TABLE `chat`
  MODIFY `id_pesan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `produknon`
--
ALTER TABLE `produknon`
  MODIFY `id_produknon` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rekening`
--
ALTER TABLE `rekening`
  MODIFY `id_rekening` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `sablon`
--
ALTER TABLE `sablon`
  MODIFY `id_sablon` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user_alamat`
--
ALTER TABLE `user_alamat`
  MODIFY `id_user_alamat` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `variasi`
--
ALTER TABLE `variasi`
  MODIFY `id_variasi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
