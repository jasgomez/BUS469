Create database if not exists CopelandCollege;

use CopelandCollege;

-- More information in the tables might need to be added or removed but unsure.
-- Would need to fill in the information for each table. The info can be dummy data.
-- Need to create class table to link students with the courses they register for

-- Parking table created.
create table parking (
parkingID int(5) primary key not null
);

-- Faculty table created.
create table faculty (
facultyID varchar(5) primary key not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
phonenum varchar(25) not null
);

-- Add deptID to faculty
alter table faculty
add column deptID varchar(1);

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
studentID varchar(10) primary key not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
phonenum varchar(15) not null,
courseID varchar(10), -- Dropped 
parkingID int(5), -- Dropped
deptID varchar(1) not null,
bookID varchar(10) -- Dropped
);

-- Drop courseID, parkingID, and bookID from students in favor of creating new tables for normalization
alter table student

drop column courseID,
drop column parkingID,
drop column bookID;

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
values  -- (deptID, name, location)
("1", "Art", "100"),
("2", "Business", "200"),
("3", "Health Sciences", "300"),
("4", "Humanities", "400"),
("5", "Math", "500"),
("6", "Engineering", "600"),
("7", "Science", "700"),
("8", "Technology", "800");

-- add couress
insert into course
values  -- (courseID, courseName, semester, classrmID, deptID)
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

-- Add students
insert into student (studentID, first_name, last_name, phonenum, deptID)
values 
("59743685", "John", "Adams", "5497854268", "5"),
("84563597", "Hector", "Sanchez", "5497862159", "2"),
("64521975", "Elizabeth", "Miller", "7584523684", "6"),
("25852072", "William", "Brown", "8783930631", "3"),
("56279486", "Sam", "Kind", "1823926268", "1"),
("31994947", "Emma", "Reed", "9184506939", "8"),
("25796555", "Aron", "Powell", "9177878161", "7"),
("93383663", "Oliver", "Baker", "9538308252", "2"),
("29293935", "Isabella", "Lopez", "3438127019", "1"),
("64773499", "Mia", "Davis", "9762084827", "4"),
("78237958", "James", "Moore", "5492950350", "8"),
("04172019", "Ava", "White", "8343505433", "3"),
("34734082", "Bruce", "Lee", "2823631050", "7"),
("82581125", "Javier", "Martinez", "6358784101", "1"),
("16823392", "Benjamin", "Thomas", "3319324623", "2"),
("86140702", "Evelyn", "Thomas", "4682721444", "5"),
("50299271", "Sophia", "Ramirez", "2306662555", "6"),
("90370071", "Lucas", "Walker", "4430575573", "3"),
("57139453", "Emily", "Clark", "5851168223", "5"),
("97882509", "Liam", "Young", "4668930675", "7"),
("40507528", "Scarlett", "Flores", "9615188214", "4"),
("56172064", "Riley", "Turner", "9604676151", "1");

-- Add faculty
insert into faculty
values
("91153", "Grace", "Diaz", "6875079089", "2"),
("25744", "Lucy", "Cruz", "6373991895", "1"),
("72492", "Alex", "Cooper", "4187692455", "3"),
("75757", "Leo", "Watson", "2400765025", "4"),
("34067", "Alice", "Alvarez", "4526670406", "5"),
("62433", "Roman", "Gray", "7026479974", "7"),
("35992", "Jose", "Castillo", "2706017154", "6"),
("16805", "Luis", "Foster", "3667574244", "8");