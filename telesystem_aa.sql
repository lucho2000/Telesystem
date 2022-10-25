-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema telesystem_aa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema telesystem_aa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `telesystem_aa` DEFAULT CHARACTER SET utf8 ;
USE `telesystem_aa` ;

-- -----------------------------------------------------
-- Table `telesystem_aa`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`Roles` (
  `idRoles` INT NOT NULL AUTO_INCREMENT,
  `nombreRol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRoles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`CategoriaPUCP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`CategoriaPUCP` (
  `idCategoriaPUCP` INT NOT NULL AUTO_INCREMENT,
  `nombreCategoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoriaPUCP`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`Usuarios` (
  `codigo` VARCHAR(8) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(8) NOT NULL,
  `validaUsuario` TINYINT NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nickname` VARCHAR(6) NULL,
  `celular` VARCHAR(9) NULL,
  `foto_perfil` LONGBLOB NULL,
  `idRoles` INT NOT NULL,
  `idCategoriaPUCP` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_Usuarios_Roles_idx` (`idRoles` ASC) VISIBLE,
  INDEX `fk_Usuarios_CategoriaPUCP1_idx` (`idCategoriaPUCP` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_Roles`
    FOREIGN KEY (`idRoles`)
    REFERENCES `telesystem_aa`.`Roles` (`idRoles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_CategoriaPUCP1`
    FOREIGN KEY (`idCategoriaPUCP`)
    REFERENCES `telesystem_aa`.`CategoriaPUCP` (`idCategoriaPUCP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`TipoIncidencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`TipoIncidencia` (
  `idTipoIncidencia` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `icono` LONGBLOB NULL,
  `descripcion_otros` TEXT NULL,
  PRIMARY KEY (`idTipoIncidencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`NivelUrgencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`NivelUrgencia` (
  `idNivelUrgencia` INT NOT NULL AUTO_INCREMENT,
  `nivel` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idNivelUrgencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`EstadoIncidencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`EstadoIncidencia` (
  `idEstadoIncidencia` INT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstadoIncidencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`Incidencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`Incidencia` (
  `idIncidencia` INT NOT NULL AUTO_INCREMENT,
  `fecha` VARCHAR(20) NOT NULL,
  `nombreIncidencia` VARCHAR(45) NOT NULL,
  `zonaPUCP` TINYTEXT NOT NULL,
  `latitud` DOUBLE NOT NULL,
  `longitud` DOUBLE NOT NULL,
  `validaIncidencia` TINYINT NOT NULL,
  `descripcion` TEXT NOT NULL,
  `contadorReabierto` INT NULL,
  `idTipoIncidencia` INT NOT NULL,
  `idNivelUrgencia` INT NOT NULL,
  `idEstadoIncidencia` INT NOT NULL,
  `codigoUsuario` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`idIncidencia`),
  INDEX `fk_Incidencia_TipoIncidencia1_idx` (`idTipoIncidencia` ASC) VISIBLE,
  INDEX `fk_Incidencia_NivelUrgencia1_idx` (`idNivelUrgencia` ASC) VISIBLE,
  INDEX `fk_Incidencia_table11_idx` (`idEstadoIncidencia` ASC) VISIBLE,
  INDEX `fk_Incidencia_Usuarios1_idx` (`codigoUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Incidencia_TipoIncidencia1`
    FOREIGN KEY (`idTipoIncidencia`)
    REFERENCES `telesystem_aa`.`TipoIncidencia` (`idTipoIncidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencia_NivelUrgencia1`
    FOREIGN KEY (`idNivelUrgencia`)
    REFERENCES `telesystem_aa`.`NivelUrgencia` (`idNivelUrgencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencia_table11`
    FOREIGN KEY (`idEstadoIncidencia`)
    REFERENCES `telesystem_aa`.`EstadoIncidencia` (`idEstadoIncidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencia_Usuarios1`
    FOREIGN KEY (`codigoUsuario`)
    REFERENCES `telesystem_aa`.`Usuarios` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`IncidenciasDestacadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`IncidenciasDestacadas` (
  `idIncidenciaDestacadas` INT NOT NULL AUTO_INCREMENT,
  `contadorDestacado` INT NOT NULL,
  `idIncidencia` INT NOT NULL,
  PRIMARY KEY (`idIncidenciaDestacadas`),
  INDEX `fk_IncidenciaDestacadas_Incidencia1_idx` (`idIncidencia` ASC) VISIBLE,
  CONSTRAINT `fk_IncidenciaDestacadas_Incidencia1`
    FOREIGN KEY (`idIncidencia`)
    REFERENCES `telesystem_aa`.`Incidencia` (`idIncidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`Usuarios_has_IncidenciaDestacadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`Usuarios_has_IncidenciaDestacadas` (
  `codigoUsuario` VARCHAR(8) NOT NULL,
  `idIncidenciaDestacadas` INT NOT NULL,
  PRIMARY KEY (`codigoUsuario`, `idIncidenciaDestacadas`),
  INDEX `fk_Usuarios_has_IncidenciaDestacadas_IncidenciaDestacadas1_idx` (`idIncidenciaDestacadas` ASC) VISIBLE,
  INDEX `fk_Usuarios_has_IncidenciaDestacadas_Usuarios1_idx` (`codigoUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_has_IncidenciaDestacadas_Usuarios1`
    FOREIGN KEY (`codigoUsuario`)
    REFERENCES `telesystem_aa`.`Usuarios` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_has_IncidenciaDestacadas_IncidenciaDestacadas1`
    FOREIGN KEY (`idIncidenciaDestacadas`)
    REFERENCES `telesystem_aa`.`IncidenciasDestacadas` (`idIncidenciaDestacadas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`Fotos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`Fotos` (
  `idFotos` INT NOT NULL AUTO_INCREMENT,
  `fotoIncidencia` LONGBLOB NOT NULL,
  `idIncidencia` INT NOT NULL,
  PRIMARY KEY (`idFotos`),
  INDEX `fk_Fotos_Incidencia1_idx` (`idIncidencia` ASC) VISIBLE,
  CONSTRAINT `fk_Fotos_Incidencia1`
    FOREIGN KEY (`idIncidencia`)
    REFERENCES `telesystem_aa`.`Incidencia` (`idIncidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`Comentario` (
  `idComentario` INT NOT NULL AUTO_INCREMENT,
  `comentarios` VARCHAR(45) NULL,
  `fecha` VARCHAR(45) NULL,
  `codigoUsuario` VARCHAR(8) NOT NULL,
  `idIncidencia` INT NOT NULL,
  PRIMARY KEY (`idComentario`),
  INDEX `fk_Comentario_Usuarios1_idx` (`codigoUsuario` ASC) VISIBLE,
  INDEX `fk_Comentario_Incidencia1_idx` (`idIncidencia` ASC) VISIBLE,
  CONSTRAINT `fk_Comentario_Usuarios1`
    FOREIGN KEY (`codigoUsuario`)
    REFERENCES `telesystem_aa`.`Usuarios` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentario_Incidencia1`
    FOREIGN KEY (`idIncidencia`)
    REFERENCES `telesystem_aa`.`Incidencia` (`idIncidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`RegistroAdmin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`RegistroAdmin` (
  `idRegistroAdmin` INT NOT NULL AUTO_INCREMENT,
  `nombreAdmin` VARCHAR(45) NOT NULL,
  `passwordAdmin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRegistroAdmin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`MasterTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`MasterTable` (
  `codigo` VARCHAR(8) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


insert into TipoIncidencia(tipo) 
		values ("Accidente"),
			("Reporte de robos"),
            ("Infraestuctura en mal estado"),
            ("Objetos perdidos"),
            ("Ambulancia PUCP"),
            ("Otros");
update TipoIncidencia set tipo="Infraestructura en mal estado" where idTipoIncidencia=3;

insert into NivelUrgencia (nivel) values ("Leve"), ("Moderado"), ("Critico");
insert into EstadoIncidencia (estado) values ("En proceso"),
																	("Registrado"),
																	("Atendido"),
                                                                    ("Resuelto");
insert into Roles (nombreRol) values ("Usuario PUCP"),("Seguridad");

insert into CategoriaPUCP(nombreCategoria) values ("Alumno"),("Administrativo"),("Jefe de practica"),("Profesor"),("Egresado");

insert into Usuarios (codigo, nombre, apellido, DNI, validaUsuario, password, nickname, idRoles, idCategoriaPUCP)
					values (20201696, "Leonardo", "Abanto", 12345678, true, "clashroyale123","Ubuntu",1,1),
                    (19905060,"Jorge","Gonzales",87654321, true,"tele1000", "master",1,4);
                    
insert into Incidencia (fecha,nombreIncidencia,zonaPUCP, latitud, longitud, validaIncidencia, descripcion,
						 contadorReabierto, idTipoIncidencia, idNivelUrgencia, idEstadoIncidencia,
                         codigoUsuario)
                         values (now(),"Explosion en KILO", "Pabellon A",-12.073157,-77.081164,true,"Fuga de gas ocurrido en la mañana, previo al abrir al local",
                         0,1,3,1,20201696),
                         (now(),"Accidente de semana de Ingenieria","Cancha de minas",-12.072249,-77.081994,true,"Lesion de alumno en evento",0,1,2,1,19905060);
			 
insert into incidenciasdestacadas (idIncidenciasDestacadas,contadorDestacado,idIncidencia) values (1,0,1),(2,0,2);
