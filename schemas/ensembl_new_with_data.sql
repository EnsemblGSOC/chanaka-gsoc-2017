-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2017 at 05:15 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ensembl_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `genome`
--

CREATE TABLE `genome` (
  `genome_id` int(11) NOT NULL,
  `genome_species` varchar(100) NOT NULL,
  `genome_assembly` varchar(100) NOT NULL,
  `genome_strain` tinyint(1) NOT NULL,
  `species_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genome`
--

INSERT INTO `genome` (`genome_id`, `genome_species`, `genome_assembly`, `genome_strain`, `species_id`) VALUES
(1, 'homo_sapiens', 'GRCh38', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `location_type` enum('mysql','uri') NOT NULL,
  `location_object_type` varchar(100) DEFAULT NULL,
  `location_species` varchar(100) DEFAULT NULL,
  `location_dbtype` varchar(100) DEFAULT NULL,
  `location_uri` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `location_type`, `location_object_type`, `location_species`, `location_dbtype`, `location_uri`) VALUES
(1, 'mysql', 'gene', 'homo_sapiens', 'core', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `location_has_location_logic_names`
--

CREATE TABLE `location_has_location_logic_names` (
  `lln_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location_has_location_logic_names`
--

INSERT INTO `location_has_location_logic_names` (`lln_id`, `location_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `location_logic_name`
--

CREATE TABLE `location_logic_name` (
  `lln_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location_logic_name`
--

INSERT INTO `location_logic_name` (`lln_id`, `name`) VALUES
(1, 'ensembl');

-- --------------------------------------------------------

--
-- Table structure for table `release`
--

CREATE TABLE `release` (
  `release_id` int(11) NOT NULL,
  `release_division` enum('ensembl','plants','bacteria','protists','fungi','metazoa') NOT NULL,
  `release_version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `release`
--

INSERT INTO `release` (`release_id`, `release_division`, `release_version`) VALUES
(1, 'ensembl', 89);

-- --------------------------------------------------------

--
-- Table structure for table `species`
--

CREATE TABLE `species` (
  `species_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `species`
--

INSERT INTO `species` (`species_id`, `name`) VALUES
(1, 'homo_sapiens');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `track_id` int(11) NOT NULL,
  `version` varchar(6) NOT NULL,
  `short_name` varchar(50) NOT NULL,
  `long_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `genome_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `track_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`track_id`, `version`, `short_name`, `long_name`, `description`, `genome_id`, `location_id`, `track_type_id`) VALUES
(1, '1.0.0', 'Genes (Comprehensive set from GENCODE 26)', 'GENCODE 26 Comprehensive gene set', 'Mitochondrial gene models imported from <a rel=\\"external\\" href=\\"http:\\/\\/www.ncbi.nlm.nih.gov\\/genbank\\/\\">Genbank<\\/a>.', 1, 1, 1),
(2, '1.0.0', 'Genes (Comprehensive set from GENCODE 26)', 'GENCODE 26 Comprehensive gene set', 'Annotation for this gene includes both automatic annotation from Ensembl and <a rel=\\"external\\" href=\\"http:\\/\\/vega.sanger.ac.uk\\/index.html\\">Havana<\\/a> manual curation, see <a href=\\"\\/info\\/genome\\/genebuild\\/genome_annotation.html\\" class=\\"cp-external\\">article<\\/a>.', 1, 1, 1),
(3, '1.0.0', 'Genes (Comprehensive set from GENCODE 26)', 'GENCODE 26 Comprehensive gene set', 'Manual annotation (determined on a case-by-case basis) from the <a rel=\\"external\\" href=\\"http:\\/\\/www.sanger.ac.uk\\/research\\/projects\\/vertebrategenome\\/havana\\/\\">Havana<\\/a> project.', 1, 1, 1),
(4, '1.0.0', 'Genes (Comprehensive set from GENCODE 26)', 'GENCODE 26 Comprehensive gene set', 'Annotation produced by the Ensembl <a href=\\"\\/info\\/genome\\/genebuild\\/genome_annotation.html\\" class=\\"cp-external\\">genebuild<\\/a>.', 1, 1, 1),
(5, '1.0.0', 'Genes (Comprehensive set from GENCODE 26)', 'GENCODE 26 Comprehensive gene set', 'Immunoglobulin (Ig) and T-cell receptor (TcR) annotation imported from the manually curated IG gene set from the <a rel=\\"external\\" href=\\"http:\\/\\/www.sanger.ac.uk\\/research\\/projects\\/vertebrategenome\\/havana\\/\\">Havana<\\/a> project.', 1, 1, 1),
(6, '1.0.0', 'Genes (Comprehensive set from GENCODE 26)', 'GENCODE 26 Comprehensive gene set', 'Immunoglobulin (Ig) and T-cell receptor (TcR) annotation from Ensembl and Havana. Havana annotation was imported from the Havana project''s manually curated IG gene set. Ensembl annotation was imported from the <a rel=\\"external\\" href=\\"http:\\/\\/nar.oxfordjournals.org\\/content\\/33\\/suppl_1\\/D593.full?maxtoshow=&HITS=10&hits=10&RESULTFORMAT=1&author1=Lefranc&andorexacttitle=and&andorexacttitleabs=and&andorexactfulltext=and&searchid=1&FIRSTINDEX=0&sortspec=relevance&resourcetype=HWCIT\\">IMGT<\\/a> database using <a rel=\\"external\\" href=\\"http:\\/\\/www.biomedcentral.com\\/1471-2105\\/6\\/31\\">Exonerate<\\/a>. Click <a rel=\\"external\\" href=\\"\\/info\\/genome\\/genebuild\\/ig_tcr.html\\">here<\\/a> for more details about the Ensembl annotation.', 1, 1, 1),
(7, '1.0.0', 'Genes (Comprehensive set from GENCODE 26)', 'GENCODE 26 Comprehensive gene set', 'Non-coding RNAs (ncRNAs) predicted using sequences from <arel=\\"external\\" href=\\"http:\\/\\/rfam.xfam.org\\/\\">RFAM<\\/a> and <arel=\\"external\\" href=\\"http:\\/\\/www.mirbase.org\\/\\">miRBase<\\/a>. See <a href=\\"\\/info\\/genome\\/genebuild\\/ncrna.html\\" class=\\"cp-external\\">article<\\/a>.', 1, 1, 1),
(8, '1.0.0', 'Genes (Comprehensive set from GENCODE 26)', 'GENCODE 26 Comprehensive gene set', 'Long intergenic non-coding RNAs (lincRNAs) containing both Ensembl lincRNA transcripts annotated by the <a href=\\"\\/info\\/genome\\/genebuild\\/ncrna.html\\" class=\\"cp-external\\">Ensembl lincRNA annotation pipeline<\\/a> and non-coding transcripts from <a rel=\\"external\\" href=\\"http:\\/\\/vega.sanger.ac.uk\\/index.html\\">Havana<\\/a> manual curation.', 1, 1, 1),
(9, '1.0.0', 'Genes (Comprehensive set from GENCODE 26)', 'GENCODE 26 Comprehensive gene set', 'Long intergenic non-coding RNAs (lincRNAs) were annotated by the <a href=\\"\\/info\\/genome\\/genebuild\\/ncrna.html\\" class=\\"cp-external\\">Ensembl lincRNA annotation pipeline<\\/a>.', 1, 1, 1),
(10, '1.0.0', 'Genes (Comprehensive set from GENCODE 26)', 'GENCODE 26 Comprehensive gene set', 'Annotation produced by aligning human cDNA sequences to the genome using <a rel=\\"external\\" href=\\"http:\\/\\/www.biomedcentral.com\\/1471-2105\\/6\\/31\\">Exonerate''s<\\/a> cdna2genome model, which utilises annotation identifying the coding regions of the cDNA sequences, along with protein evidence from <a rel=\\"external\\" href=\\"http:\\/\\/www.uniprot.org\\/\\">UniProtKB<\\/a>, from various species, aligned to the genome using <a rel=\\"external\\" href=\\"http:\\/\\/genome.cshlp.org\\/content\\/14\\/5\\/988.abstract?maxtoshow=&amp%3bHITS=10&amp%3bhits=10&amp%3bRESULTFORMAT=&amp%3bandorexactfulltext=and&amp%3bsearchid=1&amp%3bFIRSTINDEX=0&amp%3bsortspec=relevance&amp%3bvolume=14&amp%3bfirstpage=988&amp%3bresourcetype=HWCIT\\">GeneWise<\\/a>. This annotation is used where there is no manual annotation and annotation could not be projected from the <a rel=\\"external\\" href=\\"http:\\/\\/www.ncbi.nlm.nih.gov\\/projects\\/genome\\/assembly\\/grc\\/info\\/definitions.shtml\\">primary assembly<\\/a>.', 1, 1, 1),
(11, '1.0.0', 'Genes (Comprehensive set from GENCODE 26)', 'GENCODE 26 Comprehensive gene set', 'Manual annotation (determined on a case-by-case basis) from the <a rel=\\"external\\" href=\\"http:\\/\\/www.sanger.ac.uk\\/research\\/projects\\/vertebrategenome\\/havana\\/\\">Havana<\\/a> project, projected to the <a rel=\\"external\\" href=\\"http:\\/\\/www.ncbi.nlm.nih.gov\\/projects\\/genome\\/assembly\\/grc\\/info\\/definitions.shtml\\">alternate locus<\\/a> via a mapping from the <a rel=\\"external\\" href=\\"http:\\/\\/www.ncbi.nlm.nih.gov\\/projects\\/genome\\/assembly\\/grc\\/info\\/definitions.shtml\\">primary assembly<\\/a>.', 1, 1, 1),
(12, '1.0.0', 'Genes (Comprehensive set from GENCODE 26)', 'GENCODE 26 Comprehensive gene set', 'Annotation for this gene includes both automatic annotation from Ensembl and <a rel=\\"external\\" href=\\"http:\\/\\/vega.sanger.ac.uk\\/index.html\\">Havana<\\/a> manual curation, see <a href=\\"\\/info\\/genome\\/genebuild\\/genome_annotation.html\\" class=\\"cp-external\\">article<\\/a>. This was projected to the <a rel=\\"external\\" href=\\"http:\\/\\/www.ncbi.nlm.nih.gov\\/projects\\/genome\\/assembly\\/grc\\/info\\/definitions.shtml\\">alternate locus<\\/a> via a mapping from the <a rel=\\"external\\" href=\\"http:\\/\\/www.ncbi.nlm.nih.gov\\/projects\\/genome\\/assembly\\/grc\\/info\\/definitions.shtml\\">primary assembly<\\/a>.', 1, 1, 1),
(13, '1.0.0', 'Genes (Comprehensive set from GENCODE 26)', 'GENCODE 26 Comprehensive gene set', 'Non-coding RNAs (ncRNAs) predicted using sequences from <arel=\\"external\\" href=\\"http:\\/\\/rfam.xfam.org\\/\\">RFAM<\\/a> and <arel=\\"external\\" href=\\"http:\\/\\/www.mirbase.org\\/\\">miRBase<\\/a>. See <a href=\\"\\/info\\/genome\\/genebuild\\/ncrna.html\\" class=\\"cp-external\\">article<\\/a>. These were projected to the <a rel=\\"external\\" href=\\"http:\\/\\/www.ncbi.nlm.nih.gov\\/projects\\/genome\\/assembly\\/grc\\/info\\/definitions.shtml\\">alternate locus<\\/a> via a mapping from the <a rel=\\"external\\" href=\\"http:\\/\\/www.ncbi.nlm.nih.gov\\/projects\\/genome\\/assembly\\/grc\\/info\\/definitions.shtml\\">primary assembly<\\/a>.', 1, 1, 1),
(14, '1.0.0', 'Genes (Comprehensive set from GENCODE 26)', 'GENCODE 26 Comprehensive gene set', 'Immunoglobulin (Ig) and T-cell receptor (TcR) annotation from Ensembl and Havana. Havana annotation was imported from the Havana project''s manually curated IG gene set. Ensembl annotation was imported from the <a rel=\\"external\\" href=\\"http:\\/\\/nar.oxfordjournals.org\\/content\\/33\\/suppl_1\\/D593.full?maxtoshow=&HITS=10&hits=10&RESULTFORMAT=1&author1=Lefranc&andorexacttitle=and&andorexacttitleabs=and&andorexactfulltext=and&searchid=1&FIRSTINDEX=0&sortspec=relevance&resourcetype=HWCIT\\">IMGT<\\/a> database using <a rel=\\"external\\" href=\\"http:\\/\\/www.biomedcentral.com\\/1471-2105\\/6\\/31\\">Exonerate<\\/a>. Click <a rel=\\"external\\" href=\\"\\/info\\/genome\\/genebuild\\/ig_tcr.html\\">here<\\/a> for more details about the Ensembl annotation. These were projected to the <a rel=\\"external\\" href=\\"http:\\/\\/www.ncbi.nlm.nih.gov\\/projects\\/genome\\/assembly\\/grc\\/info\\/definitions.shtml\\">alternate locus<\\/a> via a mapping from the <a rel=\\"external\\" href=\\"http:\\/\\/www.ncbi.nlm.nih.gov\\/projects\\/genome\\/assembly\\/grc\\/info\\/definitions.shtml\\">primary assembly<\\/a>.', 1, 1, 1),
(15, '1.0.0', 'Genes (Comprehensive set from GENCODE 26)', 'GENCODE 26 Comprehensive gene set', 'Immunoglobulin (Ig) and T-cell receptor (TcR) annotation imported from the manually curated IG gene set from the <a rel=\\"external\\" href=\\"http:\\/\\/www.sanger.ac.uk\\/research\\/projects\\/vertebrategenome\\/havana\\/\\">Havana<\\/a> project, projected to the <a rel=\\"external\\" href=\\"http:\\/\\/www.ncbi.nlm.nih.gov\\/projects\\/genome\\/assembly\\/grc\\/info\\/definitions.shtml\\">alternate locus<\\/a> via a mapping from the <a rel=\\"external\\" href=\\"http:\\/\\/www.ncbi.nlm.nih.gov\\/projects\\/genome\\/assembly\\/grc\\/info\\/definitions.shtml\\">primary assembly<\\/a>.', 1, 1, 1),
(16, '1.0.0', 'Genes (Comprehensive set from GENCODE 26)', 'GENCODE 26 Comprehensive gene set', 'Long intergenic non-coding RNAs (lincRNAs) containing both Ensembl lincRNA transcripts annotated by the <a href=\\"\\/info\\/genome\\/genebuild\\/ncrna.html\\" class=\\"cp-external\\">Ensembl lincRNA annotation pipeline<\\/a> and non-coding transcripts from <a rel=\\"external\\" href=\\"http:\\/\\/vega.sanger.ac.uk\\/index.html\\">Havana<\\/a> manual curation. These were projected to the <a rel=\\"external\\" href=\\"http:\\/\\/www.ncbi.nlm.nih.gov\\/projects\\/genome\\/assembly\\/grc\\/info\\/definitions.shtml\\">alternate locus<\\/a> via a mapping from the <a rel=\\"external\\" href=\\"http:\\/\\/www.ncbi.nlm.nih.gov\\/projects\\/genome\\/assembly\\/grc\\/info\\/definitions.shtml\\">primary assembly<\\/a>.', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `track_has_release`
--

CREATE TABLE `track_has_release` (
  `release_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `track_type`
--

CREATE TABLE `track_type` (
  `track_type_id` int(11) NOT NULL,
  `track_type_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `track_type`
--

INSERT INTO `track_type` (`track_type_id`, `track_type_name`) VALUES
(1, 'gene'),
(2, 'repeats'),
(3, 'dna_alignment'),
(4, 'gc_content');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genome`
--
ALTER TABLE `genome`
  ADD PRIMARY KEY (`genome_id`),
  ADD KEY `species_id` (`species_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `location_has_location_logic_names`
--
ALTER TABLE `location_has_location_logic_names`
  ADD KEY `lln_id` (`lln_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `location_logic_name`
--
ALTER TABLE `location_logic_name`
  ADD PRIMARY KEY (`lln_id`);

--
-- Indexes for table `release`
--
ALTER TABLE `release`
  ADD PRIMARY KEY (`release_id`);

--
-- Indexes for table `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`species_id`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`track_id`),
  ADD KEY `genome_id` (`genome_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `track_type_id` (`track_type_id`);

--
-- Indexes for table `track_has_release`
--
ALTER TABLE `track_has_release`
  ADD KEY `release_id` (`release_id`),
  ADD KEY `track_id` (`track_id`);

--
-- Indexes for table `track_type`
--
ALTER TABLE `track_type`
  ADD PRIMARY KEY (`track_type_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `genome`
--
ALTER TABLE `genome`
  ADD CONSTRAINT `genome_ibfk_1` FOREIGN KEY (`species_id`) REFERENCES `species` (`species_id`);

--
-- Constraints for table `location_has_location_logic_names`
--
ALTER TABLE `location_has_location_logic_names`
  ADD CONSTRAINT `location_has_location_logic_names_ibfk_1` FOREIGN KEY (`lln_id`) REFERENCES `location_logic_name` (`lln_id`),
  ADD CONSTRAINT `location_has_location_logic_names_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`genome_id`) REFERENCES `genome` (`genome_id`),
  ADD CONSTRAINT `track_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `track_ibfk_3` FOREIGN KEY (`track_type_id`) REFERENCES `track_type` (`track_type_id`);

--
-- Constraints for table `track_has_release`
--
ALTER TABLE `track_has_release`
  ADD CONSTRAINT `track_has_release_ibfk_1` FOREIGN KEY (`release_id`) REFERENCES `release` (`release_id`),
  ADD CONSTRAINT `track_has_release_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
