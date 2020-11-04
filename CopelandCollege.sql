Create database if not exists CopelandCollege;

use CopelandCollege;

-- More information in the tables might need to be added but unsure.
-- Would need to fill in the information for each table. The info can be dummy data.
-- More tables also might need to be added but for now I think it is a good start 11/4

-- Parking table created.
create table parking (
parkingID int(5) primary key not null
);

-- Faculty table created.
create table faculty (
facultyID int(5) primary key not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
phonenum varchar(25) not null
);

-- Department table created.
create table department (
deptID varchar(10) primary key not null,
name varchar(45) not null,
facultyID int(5) not null,
studentID int(10) not null
);

-- Student table created. 
create table student (
studentID int(8) primary key not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
phonenum varchar(10) not null,
courseID varchar(10) not null, 
parkingID int(5),
deptID varchar(10) not null,
bookID varchar(10)
);

-- Course table created.
create table course (
courseID varchar(10) primary key not null,
courseName varchar(50) not null,
semester varchar(25) not null,
classrmID varchar(15) not null,
facultyID int(5) not null,
studentID int(8)
);

-- Class Room table created.
create table classRm (
classrmID varchar(15) primary key not null,
courseID varchar(10),
classrm_name varchar(25) not null
);

-- Gym table created.
create table gym (
facultyID int(5),
studentID int(8)
);
