-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db` DEFAULT CHARACTER SET latin1 ;
USE `db` ;

-- -----------------------------------------------------
-- Table `db`.`sector`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`sector` (
  `id` INT(11) NOT NULL COMMENT '',
  `name` VARCHAR(250) NOT NULL COMMENT '',
  `parent` INT(11) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `agreed` TINYINT(1) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  UNIQUE INDEX `name_UNIQUE` (`name` ASC)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db`.`sector_has_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`sector_has_user` (
  `user_id` INT(11) NOT NULL COMMENT '',
  `sector_id` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`user_id`, `sector_id`)  COMMENT '',
  INDEX `fk_category_has_user_user1_idx` (`user_id` ASC)  COMMENT '',
  INDEX `fk_sector_has_user_sector1_idx` (`sector_id` ASC)  COMMENT '',
  CONSTRAINT `fk_category_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sector_has_user_sector1`
    FOREIGN KEY (`sector_id`)
    REFERENCES `db`.`sector` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




INSERT INTO `db`.`sector` (`id`, `name`) VALUES ('1', 'Manufacturing');

INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('19', '&nbsp;&nbsp;&nbsp;&nbsp;Construction materials', '1');

INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('18', '&nbsp;&nbsp;&nbsp;&nbsp;Electronics and Optics', '1');

INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('6', '&nbsp;&nbsp;&nbsp;&nbsp;Food and Beverage', '1');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('342', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bakery &amp; confectionery products', '6');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('43', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Beverages', '6');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('42', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fish &amp; fish products', '6');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('40', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Meat &amp; meat products', '6');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('39', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Milk &amp; dairy products', '6');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('437', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other', '6');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('378', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sweets &amp; snack food', '6');

INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('13', '&nbsp;&nbsp;&nbsp;&nbsp;Furniture', '1');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('389', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bathroom/sauna', '13');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('385', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bedroom', '13');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('390', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Children’s room', '13');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('98', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kitchen', '13');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('101', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Living room', '13');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('392', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Office', '13');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('394', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other (Furniture)', '13');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('341', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Outdoor', '13');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('99', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Project furniture', '13');

INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('12', '&nbsp;&nbsp;&nbsp;&nbsp;Machinery', '1');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('94', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Machinery components', '12');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('91', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Machinery equipment/tools', '12');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('224', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Manufacture of machinery', '12');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('97', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Maritime', '12');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('271', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Aluminium and steel workboats', '97');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('269', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Boat/Yacht building', '97');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('230', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ship repair and conversion', '97');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('93', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Metal structures', '12');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('508', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other', '12');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('227', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Repair and maintenance service', '12');

INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('11', '&nbsp;&nbsp;&nbsp;&nbsp;Metalworking', '1');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('67', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Construction of metal structures', '11');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('263', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Houses and buildings', '11');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('267', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Metal products', '11');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('542', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Metal works', '11');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('75', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CNC-machining', '542');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('62', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Forgings, Fasteners', '542');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('69', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gas, Plasma, Laser cutting', '542');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('66', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MIG, TIG, Aluminum welding', '542');

INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('9', '&nbsp;&nbsp;&nbsp;&nbsp;Plastic and Rubber', '1');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('54', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Packaging', '9');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('556', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plastic goods', '9');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('559', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plastic processing technology', '9');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('55', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Blowing', '559');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('57', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Moulding', '559');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('53', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plastics welding and processing', '559');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('560', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plastic profiles', '9');

INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('5', '&nbsp;&nbsp;&nbsp;&nbsp;Printing', '1');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('148', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Advertising', '5');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('150', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Book/Periodicals printing', '5');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('145', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Labelling and packaging printing', '5');

INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('7', '&nbsp;&nbsp;&nbsp;&nbsp;Textile and Clothing', '1');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('44', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Clothing', '7');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('45', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Textile', '7');

INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('8', '&nbsp;&nbsp;&nbsp;&nbsp;Wood', '1');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('337', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other (Wood)', '8');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('51', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wooden building materials', '8');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('47', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wooden houses', '8');

INSERT INTO `db`.`sector` (`id`, `name`) VALUES ('3', 'Other');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('37', '&nbsp;&nbsp;&nbsp;&nbsp;Creative industries', '3');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('29', '&nbsp;&nbsp;&nbsp;&nbsp;Energy technology', '3');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('33', '&nbsp;&nbsp;&nbsp;&nbsp;Environment', '3');

INSERT INTO `db`.`sector` (`id`, `name`) VALUES ('2', 'Service');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('25', '&nbsp;&nbsp;&nbsp;&nbsp;Business services', '2');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('35', '&nbsp;&nbsp;&nbsp;&nbsp;Engineering', '2');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('28', '&nbsp;&nbsp;&nbsp;&nbsp;Information Technology and Telecommunications', '2');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('581', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Data processing, Web portals, E-marketing', '28');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('576', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Programming, Consultancy', '28');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('121', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Software, Hardware', '28');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('122', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Telecommunications', '28');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('22', '&nbsp;&nbsp;&nbsp;&nbsp;Tourism', '2');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('141', '&nbsp;&nbsp;&nbsp;&nbsp;Translation services', '2');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('21', '&nbsp;&nbsp;&nbsp;&nbsp;Transport and Logistics', '2');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('111', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Air', '21');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('114', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rail', '21');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('112', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Road', '21');
INSERT INTO `db`.`sector` (`id`, `name`, `parent`) VALUES ('113', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Water', '21');


