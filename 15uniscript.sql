-- MySQL Script generated by MySQL Workbench
-- Wed Jan 11 05:51:14 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema UniversityGangDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema UniversityGangDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `UniversityGangDB` DEFAULT CHARACTER SET latin1 ;
USE `UniversityGangDB` ;

-- -----------------------------------------------------
-- Table `UniversityGangDB`.`Academic_rank`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversityGangDB`.`Academic_rank` (
  `Academic_rank_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Academic_rank_title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Academic_rank_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `UniversityGangDB`.`Gender`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversityGangDB`.`Gender` (
  `Gender_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Gender_identity` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Gender_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `UniversityGangDB`.`Degree_level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversityGangDB`.`Degree_level` (
  `Degree_level_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Degree_level_title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Degree_level_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `UniversityGangDB`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversityGangDB`.`Students` (
  `Student_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Student_name` VARCHAR(45) NOT NULL,
  `Student_surname` VARCHAR(45) NOT NULL,
  `Student_email` VARCHAR(45) NOT NULL,
  `age` INT(11) NOT NULL,
  `Gender_Gender_id` INT(11) NOT NULL,
  `Degree_level_Degree_level_id` INT(11) NOT NULL,
  PRIMARY KEY (`Student_id`),
  INDEX `fk_Students_Gender1_idx` (`Gender_Gender_id` ASC) VISIBLE,
  INDEX `fk_Students_Degree_level1_idx` (`Degree_level_Degree_level_id` ASC) VISIBLE,
  CONSTRAINT `fk_Students_Gender1`
    FOREIGN KEY (`Gender_Gender_id`)
    REFERENCES `UniversityGangDB`.`Gender` (`Gender_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_Degree_level1`
    FOREIGN KEY (`Degree_level_Degree_level_id`)
    REFERENCES `UniversityGangDB`.`Degree_level` (`Degree_level_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `UniversityGangDB`.`Module`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversityGangDB`.`Module` (
  `Module_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Module_title` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Module_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `UniversityGangDB`.`Campus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversityGangDB`.`Campus` (
  `Campus_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Campus_name` VARCHAR(45) NOT NULL,
  `Campus_location` VARCHAR(255) NOT NULL,
  `Meeting_rooms_Meeting_room_id` INT(11) NOT NULL,
  PRIMARY KEY (`Campus_id`),
  INDEX `fk_Campus_Meeting_rooms1_idx` (`Meeting_rooms_Meeting_room_id` ASC) VISIBLE,
  CONSTRAINT `fk_Campus_Meeting_rooms1`
    FOREIGN KEY (`Meeting_rooms_Meeting_room_id`)
    REFERENCES `UniversityGangDB`.`Meeting_rooms` (`Meeting_room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `UniversityGangDB`.`Meeting_rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversityGangDB`.`Meeting_rooms` (
  `Meeting_room_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Meeting_room_type` VARCHAR(45) NOT NULL,
  `Campus_Campus_id` INT(11) NOT NULL,
  PRIMARY KEY (`Meeting_room_id`),
  INDEX `fk_Meeting_rooms_Campus1_idx` (`Campus_Campus_id` ASC) VISIBLE,
  CONSTRAINT `fk_Meeting_rooms_Campus1`
    FOREIGN KEY (`Campus_Campus_id`)
    REFERENCES `UniversityGangDB`.`Campus` (`Campus_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `UniversityGangDB`.`Lecturers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversityGangDB`.`Lecturers` (
  `Lecturer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `age` INT(11) NOT NULL,
  `Academic_rank_Academic_rank_id` INT(11) NOT NULL,
  `Gender_Gender_id` INT(11) NOT NULL,
  PRIMARY KEY (`Lecturer_id`),
  INDEX `fk_Lecturers_Academic_rank1_idx` (`Academic_rank_Academic_rank_id` ASC) VISIBLE,
  INDEX `fk_Lecturers_Gender1_idx` (`Gender_Gender_id` ASC) VISIBLE,
  CONSTRAINT `fk_Lecturers_Academic_rank1`
    FOREIGN KEY (`Academic_rank_Academic_rank_id`)
    REFERENCES `UniversityGangDB`.`Academic_rank` (`Academic_rank_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lecturers_Gender1`
    FOREIGN KEY (`Gender_Gender_id`)
    REFERENCES `UniversityGangDB`.`Gender` (`Gender_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `UniversityGangDB`.`Session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversityGangDB`.`Session` (
  `Session_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Session_date` DATE NOT NULL,
  `Session_time` DATETIME NOT NULL,
  `Module_Module_id` INT(11) NOT NULL,
  `Meeting_rooms_Meeting_room_id` INT(11) NOT NULL,
  `Lecturers_Lecturer_id` INT(11) NOT NULL,
  `Students_Student_id` INT(11) NOT NULL,
  PRIMARY KEY (`Session_id`),
  INDEX `fk_Session_Module1_idx` (`Module_Module_id` ASC) VISIBLE,
  INDEX `fk_Session_Meeting_rooms1_idx` (`Meeting_rooms_Meeting_room_id` ASC) VISIBLE,
  INDEX `fk_Session_Lecturers1_idx` (`Lecturers_Lecturer_id` ASC) VISIBLE,
  INDEX `fk_Session_Students1_idx` (`Students_Student_id` ASC) VISIBLE,
  CONSTRAINT `fk_Session_Module1`
    FOREIGN KEY (`Module_Module_id`)
    REFERENCES `UniversityGangDB`.`Module` (`Module_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Session_Meeting_rooms1`
    FOREIGN KEY (`Meeting_rooms_Meeting_room_id`)
    REFERENCES `UniversityGangDB`.`Meeting_rooms` (`Meeting_room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Session_Lecturers1`
    FOREIGN KEY (`Lecturers_Lecturer_id`)
    REFERENCES `UniversityGangDB`.`Lecturers` (`Lecturer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Session_Students1`
    FOREIGN KEY (`Students_Student_id`)
    REFERENCES `UniversityGangDB`.`Students` (`Student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `UniversityGangDB`.`Attendance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversityGangDB`.`Attendance` (
  `student_id` INT(11) NOT NULL,
  `session_id` INT(11) NOT NULL,
  `Attendance_record` BIT(1) NOT NULL,
  PRIMARY KEY (`student_id`, `session_id`),
  INDEX `session_id_idx` (`session_id` ASC) VISIBLE,
  CONSTRAINT `student_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `UniversityGangDB`.`Students` (`Student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `session_id`
    FOREIGN KEY (`session_id`)
    REFERENCES `UniversityGangDB`.`Session` (`Session_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `UniversityGangDB`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversityGangDB`.`Course` (
  `Course_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Course_title` VARCHAR(255) NOT NULL,
  `Module_Module_id` INT(11) NOT NULL,
  `Degree_level_Degree_level_id` INT(11) NOT NULL,
  PRIMARY KEY (`Course_id`),
  INDEX `fk_Course_Module1_idx` (`Module_Module_id` ASC) VISIBLE,
  INDEX `fk_Course_Degree_level1_idx` (`Degree_level_Degree_level_id` ASC) VISIBLE,
  CONSTRAINT `fk_Course_Module1`
    FOREIGN KEY (`Module_Module_id`)
    REFERENCES `UniversityGangDB`.`Module` (`Module_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_Degree_level1`
    FOREIGN KEY (`Degree_level_Degree_level_id`)
    REFERENCES `UniversityGangDB`.`Degree_level` (`Degree_level_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `UniversityGangDB`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversityGangDB`.`Department` (
  `Department_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Department_title` VARCHAR(45) NOT NULL,
  `Course_Course_id` INT(11) NOT NULL,
  PRIMARY KEY (`Department_id`),
  INDEX `fk_Department_Course1_idx` (`Course_Course_id` ASC) VISIBLE,
  CONSTRAINT `fk_Department_Course1`
    FOREIGN KEY (`Course_Course_id`)
    REFERENCES `UniversityGangDB`.`Course` (`Course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `UniversityGangDB`.`School`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversityGangDB`.`School` (
  `School_id` INT(11) NOT NULL AUTO_INCREMENT,
  `School_name` VARCHAR(255) NOT NULL,
  `Department_Department_id` INT(11) NOT NULL,
  `Campus_Campus_id` INT(11) NOT NULL,
  PRIMARY KEY (`School_id`),
  INDEX `fk_School_Department1_idx` (`Department_Department_id` ASC) VISIBLE,
  INDEX `fk_School_Campus1_idx` (`Campus_Campus_id` ASC) VISIBLE,
  CONSTRAINT `fk_School_Department1`
    FOREIGN KEY (`Department_Department_id`)
    REFERENCES `UniversityGangDB`.`Department` (`Department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_School_Campus1`
    FOREIGN KEY (`Campus_Campus_id`)
    REFERENCES `UniversityGangDB`.`Campus` (`Campus_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `UniversityGangDB`.`University`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversityGangDB`.`University` (
  `University_id` INT(11) NOT NULL AUTO_INCREMENT,
  `University_title` VARCHAR(255) NOT NULL,
  `University_address` VARCHAR(255) NOT NULL,
  `University_email` VARCHAR(45) NOT NULL,
  `Rectors_Rector_id` INT(11) NOT NULL,
  `School_School_id` INT(11) NOT NULL,
  `Campus_Campus_id` INT(11) NOT NULL,
  PRIMARY KEY (`University_id`),
  INDEX `fk_University_Rectors_idx` (`Rectors_Rector_id` ASC) VISIBLE,
  INDEX `fk_University_School1_idx` (`School_School_id` ASC) VISIBLE,
  INDEX `fk_University_Campus1_idx` (`Campus_Campus_id` ASC) VISIBLE,
  CONSTRAINT `fk_University_Rectors`
    FOREIGN KEY (`Rectors_Rector_id`)
    REFERENCES `UniversityGangDB`.`Rectors` (`Rector_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_University_School1`
    FOREIGN KEY (`School_School_id`)
    REFERENCES `UniversityGangDB`.`School` (`School_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_University_Campus1`
    FOREIGN KEY (`Campus_Campus_id`)
    REFERENCES `UniversityGangDB`.`Campus` (`Campus_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `UniversityGangDB`.`Rectors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversityGangDB`.`Rectors` (
  `Rector_id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `age` INT(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phonenumber` INT(11) NOT NULL,
  `University_University_id` INT(11) NOT NULL,
  `Gender_Gender_id` INT(11) NOT NULL,
  PRIMARY KEY (`Rector_id`),
  INDEX `fk_Rectors_University1_idx` (`University_University_id` ASC) VISIBLE,
  INDEX `fk_Rectors_Gender1_idx` (`Gender_Gender_id` ASC) VISIBLE,
  CONSTRAINT `fk_Rectors_University1`
    FOREIGN KEY (`University_University_id`)
    REFERENCES `UniversityGangDB`.`University` (`University_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rectors_Gender1`
    FOREIGN KEY (`Gender_Gender_id`)
    REFERENCES `UniversityGangDB`.`Gender` (`Gender_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `UniversityGangDB`.`Semester`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversityGangDB`.`Semester` (
  `Semester_id` INT(6) NOT NULL AUTO_INCREMENT,
  `Semester_year` INT(11) NOT NULL,
  `Semester_code` INT(11) NOT NULL,
  `Module_Module_id` INT(11) NOT NULL,
  `Course_Course_id` INT(11) NOT NULL,
  PRIMARY KEY (`Semester_id`),
  INDEX `fk_Semester_Module1_idx` (`Module_Module_id` ASC) VISIBLE,
  INDEX `fk_Semester_Course1_idx` (`Course_Course_id` ASC) VISIBLE,
  CONSTRAINT `fk_Semester_Module1`
    FOREIGN KEY (`Module_Module_id`)
    REFERENCES `UniversityGangDB`.`Module` (`Module_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Semester_Course1`
    FOREIGN KEY (`Course_Course_id`)
    REFERENCES `UniversityGangDB`.`Course` (`Course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
