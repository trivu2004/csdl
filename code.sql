-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Doductai_ps28620_asm1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Doductai_ps28620_asm1` ;

-- -----------------------------------------------------
-- Schema Doductai_ps28620_asm1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Doductai_ps28620_asm1` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `Doductai_ps28620_asm1` ;

-- -----------------------------------------------------
-- Table `LOAIHANG`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LOAIHANG` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `LOAIHANG` (
  `MaLoai` CHAR(5) NOT NULL,
  `TenLoai` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`MaLoai`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `HANGHOA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HANGHOA` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `HANGHOA` (
  `MaHH` VARCHAR(5) NOT NULL,
  `TenHH` VARCHAR(50) NOT NULL,
  `DVT` VARCHAR(20) NOT NULL,
  `DonGia` DOUBLE NULL,
  `MaLoai` CHAR(5) NOT NULL,
  PRIMARY KEY (`MaHH`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `CUAHANG`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CUAHANG` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `CUAHANG` (
  `MaCH` CHAR(5) NOT NULL,
  `TenCH` VARCHAR(50) NOT NULL,
  `DiaChi` VARCHAR(50) NULL,
  `SoDT` VARCHAR(15) NULL,
  `Email` VARCHAR(50) NULL,
  `NguoiDD` VARCHAR(50) NULL,
  PRIMARY KEY (`MaCH`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PHIEUXUAT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PHIEUXUAT` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `PHIEUXUAT` (
  `SoPhieu` CHAR(5) NOT NULL,
  `NgayLap` DATE NOT NULL,
  `NgayXuat` DATE NOT NULL,
  `MaCH` CHAR(5) NOT NULL,
  PRIMARY KEY (`SoPhieu`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `CTPHIEUXUAT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CTPHIEUXUAT` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `CTPHIEUXUAT` (
  `SoLuong` INT NOT NULL,
  `GhiChu` VARCHAR(50) NULL,
  `MaHH` VARCHAR(5) NOT NULL,
  `SoPhieu` CHAR(5) NOT NULL)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
