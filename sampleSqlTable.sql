-- Create Tables
create table `employees`(
id int primary key auto_increment,
first_name varchar(45) not null,
last_name varchar(45) not null
);

create table `categories`(
id int primary key auto_increment,
name varchar(45) not null
);

create table `products`(
id int primary key auto_increment,
name varchar(45) not null,
category_id int not null
);

-- Insert Data in Tables
insert into employees
values (1, "Petyo", "Kazanov");

insert into employees
values (2, "Gosho", "Marmaladov");

insert into employees
values (3, "Vankata", "Petkov");

-- Alter Table
alter table `employees`
add middle_name varchar(45) not null;

-- Adding Constraints
alter table `products` 
add foreign key (category_id) references categories(id);

-- Modifying Columns
alter table `employees`
modify middle_name varchar(100);
