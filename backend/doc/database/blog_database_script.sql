-- MySQL Script generated by MySQL Workbench
-- 01/30/18 23:54:33
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 ;
USE `blog` ;

-- -----------------------------------------------------
-- Table `blog`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`article` (
  `id` VARCHAR(36) NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `author` VARCHAR(45) NOT NULL DEFAULT 'SnailTowardThesun',
  `publish_date` DATETIME NOT NULL,
  `content` VARCHAR(500) NULL,
  `path` VARCHAR(1024) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`comment` (
  `id` VARCHAR(36) NOT NULL,
  `author` VARCHAR(500) NOT NULL DEFAULT 'guest',
  `publish_date` DATETIME NOT NULL,
  `content` VARCHAR(1000) NULL,
  `article_id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_comment_article1_idx` (`article_id` ASC),
  CONSTRAINT `fk_comment_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `blog`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`category` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`article_has_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`article_has_category` (
  `article_id` VARCHAR(36) NOT NULL,
  `category_id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`article_id`, `category_id`),
  INDEX `fk_article_has_category_category1_idx` (`category_id` ASC),
  INDEX `fk_article_has_category_article1_idx` (`article_id` ASC),
  CONSTRAINT `fk_article_has_category_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `blog`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `blog`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
