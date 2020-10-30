Create database if not exists CopelandCollege;

use CopelandCollege;

create table parking (
parkingID int(5) primary key not null
);

create table faculty (
facultyID int(5) primary key not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
phonenum varchar(25) not null
);