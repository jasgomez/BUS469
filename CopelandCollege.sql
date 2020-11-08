Create database if not exists CopelandCollege;

use CopelandCollege;

-- More information in the tables might need to be added or removed but unsure.
-- Would need to fill in the information for each table. The info can be dummy data.

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
facultyID int(5) not null, -- Dropped from table
studentID int(10) not null -- Dropped from table
);

-- Alterted Department table due to having not needing columns facultyID & studentID. Added location column
alter table department
drop column facultyID, -- Drops facultyID
drop column studentID,  -- Drops studentID
add Location varchar(25) not null; -- Added to department

-- Student table created. 
create table student (
studentID int(8) primary key not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
phonenum varchar(10) not null,
courseID varchar(10) not null, 
parkingID int(5),
deptID varchar(10) not null,
deptID varchar(10)
);

-- Course table created.
create table course (
courseID varchar(10) primary key not null,
courseName varchar(50) not null,
semester varchar(25) not null,
classrmID varchar(15) not null,
facultyID int(5) not null, -- Dropped
studentID int(8) -- Dropped
);

-- Removes facultyID and studentID because they were not needed. Add deptID to references 
alter table course
drop column facultyID, -- Drops facultyID
drop column studentID,  -- Drops studentID
add deptID varchar(25) not null; -- Added to department

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

-- Adds departments id's, name, and location.
insert into department
values (deptID, name, location),
("1", "Art", "100"),
("2", "Business", "200"),
("3", "Health Sciences", "300"),
("4", "Humanities", "400"),
("5", "Math", "500"),
("6", "Engineering", "600"),
("7", "Science", "700"),
("8", "Technology", "800");

insert into course
values (courseID, courseName, semester, classrmID, deptID),
-- Art courses
("ART 1A", "Drawing I", "Fall2020", "101", "1"),
("ART 1B", "Drawing II", "Fall2020", "101", "1"),
("ART 2A", "Life Drawing I", "Fall2020", "102", "1"),
("ART 2B", "Life Drawing II", "Fall2020", "102", "1"),
("ART 3A", "Beginning Design: Design and Color", "Fall2020", "103", "1"),
("ART 3B", "Beginning Design: 3-Dimensionial Form", "Fall2020", "103", "1"),
("ART 5A", "Ceramics: Hand Building", "Fall2020", "105", "1"),
("ART 5B", "Ceramics: Wheel Forming", "Fall2020", "105", "1"),
("ART 7A", "Painting I", "Fall2020", "108", "1"),
("ART 7B", "Painting II", "Fall2020", "108", "1"),
("ART 8A", "Watercolor I", "Fall2020", "109", "1"),
("ART 8B", "Watercolor II", "Fall2020", "109", "1"),
-- Business courses
("ACCT 1A", "Financial Accounting", "Fall2020", "201", "2"),
("ACCT 1B", "Managerial Accounting", "Fall2020", "202", "2"),
("BUS 1", "Introduction to Business", "Fall2020", "208", "2"),
("BUS 3", "Business Communications", "Fall2020", "208", "2"),
("BUS 5", "Business Statistics", "Fall2020", "203", "2"),
("BUS 8", "Business Information Systems", "Fall2020", "210", "2"),
("BUS 10", "Business Law", "Fall2020", "204", "2"),
("ECON 1A", "Introduction to Macroeconomics", "Fall2020", "203", "2"),
("ECON 1B", "Introduction to Microoeconomics", "Fall2020", "205", "2"),
-- Health Sciences Courses
("HS 3", "Personal Health", "Fall2020", "302", "3"),
("HS 5", "Stress Management", "Fall2020", "303", "3"),
("HS 6", "Health and Physical Fitness", "Fall2020", "305", "3"),
("HS 10", "Environmental Health", "Fall2020", "306", "3");
-- Math Courses

insert into student
values (studentID, first_name, last_name, phonenum, courseID, parkingID, deptID, deptID)
-- Values will need to be added.
;

