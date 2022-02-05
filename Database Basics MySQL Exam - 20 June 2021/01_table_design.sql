CREATE TABLE `addresses` (
`id` int(11) PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL
);

CREATE TABLE `categories` (
`id` int(11) PRIMARY KEY AUTO_INCREMENT,
`name` varchar(10) not null
);

create table `clients` (
`id` int(11) PRIMARY KEY AUTO_INCREMENT,
`full_name` varchar(50) not null,
`phone_number` varchar(20) not null
);

create table `drivers` (
`id` int(11) PRIMARY KEY AUTO_INCREMENT,
`first_name` varchar(30) not null,
`last_name` varchar(30) not null,
`age` int(11) not null,
`rating` float DEFAULT(5.5)
);

CREATE TABLE `cars` (
`id` int(11) PRIMARY key AUTO_INCREMENT,
`make` varchar(20) not null,
`model` varchar(20),
`year` int(11) not null default(0),
`mileage` int(11) default(0),
`condition` CHAR(1) not null,
`category_id` int(11) not null,
constraint fk_cars_categories
foreign key(`category_id`)
references `categories`(`id`)
);

create table `courses` (
`id` int(11) primary key AUTO_INCREMENT,
`from_address_id` int(11) not null,
`start` DATETIME not null,
`bill` DECIMAL(10, 2) default(10) not null,
`car_id` int(11) not null,
`client_id` int(11) not null,
constraint fk_courses_addresses
foreign key(`from_address_id`)
references `addresses`(`id`),
constraint fk_courses_cars
foreign key(`car_id`)
references `cars`(`id`),
constraint fk_courses_clients
foreign key(`client_id`)
references `clients`(`id`)
);

create table `cars_drivers` (
`car_id` int(11) not null,
`driver_id` int(11) not null,
constraint fk_cd_cars
foreign key(`car_id`)
references `cars`(`id`),
constraint fk_cd_drivers
foreign key(`driver_id`)
references `drivers`(`id`),
constraint pk_cars_drivers
primary key(car_id, driver_id)
);
