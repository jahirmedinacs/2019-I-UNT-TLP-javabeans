-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema registroNotas
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `registroNotas` ;

-- -----------------------------------------------------
-- Schema registroNotas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `registroNotas` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `registroNotas` ;

-- -----------------------------------------------------
-- Table `registroNotas`.`curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroNotas`.`curso` ;

CREATE TABLE IF NOT EXISTS `registroNotas`.`curso` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `n_horas` INT(11) NOT NULL,
  `creditos` INT(2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `registroNotas`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroNotas`.`usuario` ;

CREATE TABLE IF NOT EXISTS `registroNotas`.`usuario` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `codigo` INT(11) NOT NULL,
  `primerapellido` VARCHAR(45) NOT NULL,
  `segundoapellido` VARCHAR(45) NULL DEFAULT NULL,
  `segundonombre` VARCHAR(45) NULL DEFAULT NULL,
  `nacimiento` DATE NOT NULL,
  `tipo` INT(1) NOT NULL,
  `userid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `registroNotas`.`matricula`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroNotas`.`matricula` ;

CREATE TABLE IF NOT EXISTS `registroNotas`.`matricula` (
  `fecha` DATE NULL DEFAULT NULL,
  `vence` DATE NULL DEFAULT NULL,
  `activo` TINYINT(1) NULL DEFAULT NULL,
  `expulsado` TINYINT(1) NULL DEFAULT NULL,
  `curso_id` INT(11) NOT NULL,
  `usuario_id` INT(11) NOT NULL,
  INDEX `fk_matricula_curso1_idx` (`curso_id` ASC) VISIBLE,
  INDEX `fk_matricula_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_matricula_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `registroNotas`.`curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matricula_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `registroNotas`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `registroNotas`.`nota`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroNotas`.`nota` ;

CREATE TABLE IF NOT EXISTS `registroNotas`.`nota` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `notas` INT(11) NOT NULL,
  `primerarevision` TINYINT(1) NULL DEFAULT NULL,
  `segundaversion` TINYINT(1) NULL DEFAULT NULL,
  `parcial` TINYINT(1) NULL DEFAULT NULL,
  `final` TINYINT(1) NULL DEFAULT NULL,
  `promocional` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `registroNotas`.`registro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroNotas`.`registro` ;

CREATE TABLE IF NOT EXISTS `registroNotas`.`registro` (
  `fecha` DATE NOT NULL,
  `observacion` TEXT NULL DEFAULT NULL,
  `curso_id` INT(11) NOT NULL,
  `nota_id` INT(11) NOT NULL,
  INDEX `fk_registro_curso1_idx` (`curso_id` ASC) VISIBLE,
  INDEX `fk_registro_nota1_idx` (`nota_id` ASC) VISIBLE,
  CONSTRAINT `fk_registro_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `registroNotas`.`curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registro_nota1`
    FOREIGN KEY (`nota_id`)
    REFERENCES `registroNotas`.`nota` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `registroNotas`.`registroGeneral`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroNotas`.`registroGeneral` ;

CREATE TABLE IF NOT EXISTS `registroNotas`.`registroGeneral` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `curso_id` INT(11) NOT NULL,
  `nota_id` INT(11) NOT NULL,
  `usuario_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `registroGeneral_curso` (`curso_id` ASC) VISIBLE,
  INDEX `registroGeneral_nota` (`nota_id` ASC) VISIBLE,
  INDEX `registroGeneral_usuario` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `registroGeneral_curso`
    FOREIGN KEY (`curso_id`)
    REFERENCES `registroNotas`.`curso` (`id`),
  CONSTRAINT `registroGeneral_nota`
    FOREIGN KEY (`nota_id`)
    REFERENCES `registroNotas`.`nota` (`id`),
  CONSTRAINT `registroGeneral_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `registroNotas`.`usuario` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `registroNotas`.`reporte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroNotas`.`reporte` ;

CREATE TABLE IF NOT EXISTS `registroNotas`.`reporte` (
  `observacion` VARCHAR(45) NULL DEFAULT NULL,
  `fechaconsulta` VARCHAR(45) NULL DEFAULT NULL,
  `nota_id` INT(11) NOT NULL,
  `usuario_id` INT(11) NOT NULL,
  INDEX `fk_reporte_nota1_idx` (`nota_id` ASC) VISIBLE,
  INDEX `fk_reporte_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_reporte_nota1`
    FOREIGN KEY (`nota_id`)
    REFERENCES `registroNotas`.`nota` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reporte_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `registroNotas`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO curso(id, nombre, n_horas, creditos) VALUES
	(1, 'Algebra Lineal', 72, 4),
    (2, 'Matematica Discreta', 72, 4),
    (3, 'Computacion Logica', 72, 4);
INSERT INTO usuario(id, nombre, codigo, primerapellido, segundoapellido, segundonombre, nacimiento, tipo, userid) VALUES
	(0001, 'Carlos', 1012700315,'Rodriguez','Lujan','Alberto','1994-04-27', 1, 'lujan'),
    (0002, 'Emerson', 1012700415, 'Salinas','Grados','Jhosep', '1995-04-03', 1, 'salinas'),
    (0003, 'Alexander', 1012700515,'Miranda','Robles','Celso','1996-06-04', 2, 'miranda'),
    (0004, 'Jahir', 000000000,'Medina','Lopez','Gilberh','1994-04-27', 3, 'jahirmedinacs');
INSERT INTO matricula(curso_id, usuario_id, fecha, vence, activo, expulsado) VALUES
	(1,0001,'2015-08-15','2015-12-15', 1,0),
    (2,0001,'2015-08-15','2015-12-15', 1,0),
    (2,0002,'2015-08-16','2015-12-15', 1,0),
    (3,0003,'2018-08-20','2015-12-15', 1,0);
INSERT INTO nota(id, notas, primerarevision, segundaversion, parcial, final, promocional) VALUES
	(001,5, 1, 1, 1, 1, 1),
    (002,5, 1,0, 1, 1, 1),
    (003,5,0,0, 1, 1, 1),
    (004,5, 1,0, 1, 1, 1);
INSERT INTO registro(curso_id, nota_id, fecha, observacion) VALUES
	(1,001,'2015-12-07','Muy Buenas Calificaciones'),
    (2,002,'2015-12-06','Buenas Calificaciones'),
    (2,003,'2015-12-04','Pudo Mejorar'),
    (3,004,'2015-12-05','Buenas Calificaciones');
INSERT INTO reporte(nota_id, usuario_id, observacion, fechaconsulta) VALUES
	(001,0001,'Excelente','2015-11-12'),
    (002,0001,'Bueno','2015-11-28'),
    (003,0002,'Malo','2015-12-02'),
    (004,0003,'Bueno','2015-11-05');
INSERT INTO registroGeneral(id, curso_id, nota_id, usuario_id) VALUES
	  (1,1,001,0001),
    (2,2,002,0001),
    (3,2,003,0002),
    (4,3,004,0003);