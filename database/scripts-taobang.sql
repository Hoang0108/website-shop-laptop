create  database shoplaptop;
use shoplaptop;
create table Categories
(
	id int primary key not null auto_increment,
    name varchar(250) not null
);
create table product(
	id int primary key not null auto_increment,
    name varchar(255) not null,
    image varchar(255),
    price double,
    title varchar(255) ,
    description varchar(500),
    CategoryId int not null,
    sellId int not null,
    foreign key (CategoryId) references Categories(id)
);
create table Account(
	id int primary key not null auto_increment,
    user varchar(255) not null unique,
    pass varchar(255) not null,
    isSell int NULL,
	isAdmin int NULL
);