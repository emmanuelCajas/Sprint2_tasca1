-- MySQL Script generated by MySQL Workbench
-- Sun Mar 19 08:10:50 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Youtube
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Youtube` ;

-- -----------------------------------------------------
-- Schema Youtube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Youtube` DEFAULT CHARACTER SET utf8 ;
USE `Youtube` ;

-- -----------------------------------------------------
-- Table `Youtube`.`Canal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`Canal` (
  `id_canal` INT NOT NULL,
  `nombre_canal` VARCHAR(45) NULL,
  `descripcion_canal` TEXT NULL,
  `fecha_creacion` DATE NULL,
  PRIMARY KEY (`id_canal`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Youtube`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`Usuario` (
  `id_usuario` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `nombre_usuario` VARCHAR(45) NULL,
  `fecha_nac` DATE NULL,
  `sexo` CHAR NULL,
  `pais` VARCHAR(45) NULL,
  `cod_postal` VARCHAR(45) NULL,
  `Canal_id_canal` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_Usuario_Canal1_idx` (`Canal_id_canal` ASC) ,
  CONSTRAINT `fk_Usuario_Canal1`
    FOREIGN KEY (`Canal_id_canal`)
    REFERENCES `Youtube`.`Canal` (`id_canal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Youtube`.`Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`Video` (
  `id_video` INT NOT NULL,
  `titulo_video` VARCHAR(45) NULL,
  `descripcion_video` TEXT NULL,
  `tamanio_video` VARCHAR(45) NULL,
  `nombre_archivo` VARCHAR(45) NULL,
  `duracion_video` VARCHAR(45) NULL,
  `thumbail` VARCHAR(45) NULL,
  `num_reproduciiones` BIGINT NULL,
  `num_likes` INT NULL,
  `num_dislikes` INT NULL,
  `estado` ENUM('publico', 'oculto', 'privado') NULL,
  `Etiqueta_id_etiqueta` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_video`),
  INDEX `fk_Video_Usuario1_idx` (`id_usuario` ASC) ,
  CONSTRAINT `fk_Video_Usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `Youtube`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Youtube`.`Etiqueta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`Etiqueta` (
  `id_etiqueta` INT NOT NULL,
  `nombre_etiqueta` VARCHAR(45) NOT NULL,
  `Video_id_video` INT NOT NULL,
  PRIMARY KEY (`id_etiqueta`),
  INDEX `fk_Etiqueta_Video1_idx` (`Video_id_video` ASC) ,
  CONSTRAINT `fk_Etiqueta_Video1`
    FOREIGN KEY (`Video_id_video`)
    REFERENCES `Youtube`.`Video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Youtube`.`Suscripcion_canales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`Suscripcion_canales` (
  `Usuario_id_usuario` INT NOT NULL,
  `Canal_id_canal` INT NOT NULL,
  PRIMARY KEY (`Usuario_id_usuario`, `Canal_id_canal`),
  INDEX `fk_Usuario_has_Canal_Canal1_idx` (`Canal_id_canal` ASC) ,
  INDEX `fk_Usuario_has_Canal_Usuario1_idx` (`Usuario_id_usuario` ASC) ,
  CONSTRAINT `fk_Usuario_has_Canal_Usuario1`
    FOREIGN KEY (`Usuario_id_usuario`)
    REFERENCES `Youtube`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Canal_Canal1`
    FOREIGN KEY (`Canal_id_canal`)
    REFERENCES `Youtube`.`Canal` (`id_canal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Youtube`.`Playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`Playlist` (
  `id_playlist` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `fecha_creacion` DATE NULL,
  `estado` ENUM('publica', 'privada'),
  `Usuario_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_playlist`),
  INDEX `fk_Playlist_Usuario1_idx` (`Usuario_id_usuario` ASC) ,
  CONSTRAINT `fk_Playlist_Usuario1`
    FOREIGN KEY (`Usuario_id_usuario`)
    REFERENCES `Youtube`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Youtube`.`Playlist_has_Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`Playlist_has_Video` (
  `Playlist_id_playlist` INT NOT NULL,
  `Video_id_video` INT NOT NULL,
  PRIMARY KEY (`Playlist_id_playlist`, `Video_id_video`),
  INDEX `fk_Playlist_has_Video_Video1_idx` (`Video_id_video` ASC) ,
  INDEX `fk_Playlist_has_Video_Playlist1_idx` (`Playlist_id_playlist` ASC) ,
  CONSTRAINT `fk_Playlist_has_Video_Playlist1`
    FOREIGN KEY (`Playlist_id_playlist`)
    REFERENCES `Youtube`.`Playlist` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Playlist_has_Video_Video1`
    FOREIGN KEY (`Video_id_video`)
    REFERENCES `Youtube`.`Video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Youtube`.`Comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`Comentarios` (
  `id_comentarios` INT NOT NULL,
  `texto_comentario` TEXT NULL,
  `fecha_hora` DATETIME NULL,
  `Video_id_video` INT NOT NULL,
  `Usuario_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_comentarios`, `Video_id_video`, `Usuario_id_usuario`),
  INDEX `fk_Comentarios_Video1_idx` (`Video_id_video` ASC) ,
  INDEX `fk_Comentarios_Usuario1_idx` (`Usuario_id_usuario` ASC) ,
  CONSTRAINT `fk_Comentarios_Video1`
    FOREIGN KEY (`Video_id_video`)
    REFERENCES `Youtube`.`Video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentarios_Usuario1`
    FOREIGN KEY (`Usuario_id_usuario`)
    REFERENCES `Youtube`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Youtube`.`reaccion_comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`reaccion_comentarios` (
  `Usuario_id_usuario` INT NOT NULL,
  `Comentarios_id_comentarios` INT NOT NULL,
  `fecha_hora` DATETIME NOT NULL,
  `like_dislike` ENUM('like', 'dislike') NOT NULL,
  PRIMARY KEY (`Usuario_id_usuario`, `Comentarios_id_comentarios`),
  INDEX `fk_Usuario_has_Comentarios_Comentarios1_idx` (`Comentarios_id_comentarios` ASC) ,
  INDEX `fk_Usuario_has_Comentarios_Usuario1_idx` (`Usuario_id_usuario` ASC) ,
  CONSTRAINT `fk_Usuario_has_Comentarios_Usuario1`
    FOREIGN KEY (`Usuario_id_usuario`)
    REFERENCES `Youtube`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Comentarios_Comentarios1`
    FOREIGN KEY (`Comentarios_id_comentarios`)
    REFERENCES `Youtube`.`Comentarios` (`id_comentarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Youtube`.`reaccion_videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`reaccion_videos` (
  `Usuario_id_usuario` INT NOT NULL,
  `Video_id_video` INT NOT NULL,
  `fecha_hora` DATETIME NULL,
  PRIMARY KEY (`Usuario_id_usuario`, `Video_id_video`),
  INDEX `fk_Usuario_has_Video_Video1_idx` (`Video_id_video` ASC) ,
  INDEX `fk_Usuario_has_Video_Usuario1_idx` (`Usuario_id_usuario` ASC) ,
  CONSTRAINT `fk_Usuario_has_Video_Usuario1`
    FOREIGN KEY (`Usuario_id_usuario`)
    REFERENCES `Youtube`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Video_Video1`
    FOREIGN KEY (`Video_id_video`)
    REFERENCES `Youtube`.`Video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
