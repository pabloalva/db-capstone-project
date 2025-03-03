-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menuItems` (
  `MenuItemID` INT NOT NULL,
  `Main` VARCHAR(45) NULL,
  `Starter` VARCHAR(45) NULL,
  `Dessert` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menu` (
  `MenuID` INT NOT NULL,
  `MenuItemID` INT NULL,
  `Name` VARCHAR(45) NULL,
  `Type` VARCHAR(45) NULL,
  `Price` DECIMAL NULL,
  `Cuisine` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `menuItems_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `menuItems`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `LittleLemonDB`.`menuItems` (`MenuItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Client` (
  `ClientID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Phone` INT NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`ClientID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`orders` (
  `OrderID` INT NOT NULL,
  `MenuID` INT NULL,
  `ClientID` INT NULL,
  `TotalCost` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `menus_idx` (`MenuID` ASC) VISIBLE,
  INDEX `client_idx` (`ClientID` ASC) VISIBLE,
  CONSTRAINT `menus`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `client`
    FOREIGN KEY (`ClientID`)
    REFERENCES `LittleLemonDB`.`Client` (`ClientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Title` VARCHAR(45) NULL,
  `Address` VARCHAR(255) NULL,
  `Phone` INT NULL,
  `Email` VARCHAR(45) NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL,
  `Date` DATETIME NULL,
  `ClientID` INT NULL,
  `StaffID` INT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `client_idx` (`ClientID` ASC) VISIBLE,
  INDEX `staff_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `client`
    FOREIGN KEY (`ClientID`)
    REFERENCES `LittleLemonDB`.`Client` (`ClientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staff`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDB`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
