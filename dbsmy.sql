-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `idusuario` INT NOT NULL,
  `puntaje` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `compra` VARCHAR(45) NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`juego`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`juego` (
  `idjuego` INT NOT NULL,
  `tamanio` INT NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`idjuego`),
  INDEX `fk_juego_usuario_idx` (`usuario_idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_juego_usuario`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `mydb`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`flor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`flor` (
  `idflor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `cantidad` INT NOT NULL DEFAULT 0,
  `color` VARCHAR(45) NOT NULL,
  `ocasion` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `juego_idjuego` INT NOT NULL,
  PRIMARY KEY (`idflor`),
  INDEX `fk_flor_juego1_idx` (`juego_idjuego` ASC) VISIBLE,
  CONSTRAINT `fk_flor_juego1`
    FOREIGN KEY (`juego_idjuego`)
    REFERENCES `mydb`.`juego` (`idjuego`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario_has_flor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario_has_flor` (
  `usuario_idusuario` INT NOT NULL,
  `flor_idflor` INT NOT NULL,
  PRIMARY KEY (`usuario_idusuario`, `flor_idflor`),
  INDEX `fk_usuario_has_flor_flor1_idx` (`flor_idflor` ASC) VISIBLE,
  INDEX `fk_usuario_has_flor_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_flor_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `mydb`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_flor_flor1`
    FOREIGN KEY (`flor_idflor`)
    REFERENCES `mydb`.`flor` (`idflor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pago` (
  `idPagos` INT NOT NULL,
  `monto` DOUBLE NOT NULL,
  `tarjeta` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  `cvv` VARCHAR(45) NOT NULL,
  `` VARCHAR(45) NULL,
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`idPagos`),
  INDEX `fk_Pagos_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_Pagos_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `mydb`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orden` (
  `idorden` INT NOT NULL,
  `monto` VARCHAR(45) NOT NULL,
  `flor_idflor` INT NOT NULL,
  PRIMARY KEY (`idorden`),
  INDEX `fk_orden_flor1_idx` (`flor_idflor` ASC) VISIBLE,
  CONSTRAINT `fk_orden_flor1`
    FOREIGN KEY (`flor_idflor`)
    REFERENCES `mydb`.`flor` (`idflor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
