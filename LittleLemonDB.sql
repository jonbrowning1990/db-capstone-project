-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `BookingSlot` TIME NOT NULL,
  `TableNo` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_customers_idx` (`CustomerID` ASC),
  CONSTRAINT `fk_customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `MenuItemsID` INT NOT NULL,
  `ItemName` VARCHAR(45) NOT NULL,
  `CourseName` VARCHAR(45) NOT NULL,
  `Price` DECIMAL NOT NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuID` INT NOT NULL,
  `MenuItemsID` INT NOT NULL,
  `Cuisine` VARCHAR(45) NOT NULL,
  `MenuName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`, `MenuItemsID`),
  INDEX `fk_menuitems_idx` (`MenuItemsID` ASC),
  CONSTRAINT `fk_menuitems`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`MenuItemsID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Employees` (
  `EmployeeID` INT NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Salary` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `MenuID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `Cost` DECIMAL NOT NULL,
  `EmployeeID` INT NOT NULL,
  `DeliveryStatus` VARCHAR(45) NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_menu_idx` (`MenuID` ASC),
  INDEX `fk_employee_idx` (`EmployeeID` ASC),
  CONSTRAINT `fk_menu`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_employee`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `LittleLemonDB`.`Employees` (`EmployeeID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
