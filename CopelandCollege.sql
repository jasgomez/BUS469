Create database if not exists CopelandCollege;

use CopelandCollege;

-- More information in the tables might need to be added or removed but unsure.
-- Would need to fill in the information for each table. The info can be dummy data.
-- Need to create class table to link students with the courses they register for

-- grade_report table created.
create table grade_report (
letterGrade varchar(1) not null,
numericGrade double not null,
studentID varchar(10) not null,
sectionID varchar(5) not null
);

-- Faculty table created.
create table faculty (
facultyID varchar(5) primary key not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
phonenum varchar(25) not null,
deptID varchar(1)
);

-- Department table created.
create table department (
deptID varchar(10) primary key not null,
name varchar(45) not null,
Location varchar(25) not null
);

-- Student table created. 
create table student (
studentID varchar(10) primary key not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
phonenum varchar(15) not null,
deptID varchar(1) not null
);

-- Course table created.
create table course (
courseID varchar(10) primary key not null,
courseName varchar(50) not null,
semester varchar(25) not null,
deptID varchar(25) not null
);

-- Class Room table created.
create table classRm (
classrmID varchar(15) not null,
sectionCode varchar(3)
);


-- Gym table created.
create table gym (
studentID varchar(10),
check_in varchar(7),
check_out varchar(7)
);


-- Section for classes
create table section (
sectionID varchar(5) primary key not null,
courseID varchar(10) not null,
semster varchar(25) not null,
year varchar(10) not null,
sectionCode varchar(3) not null,
facultyID varchar(5) not null
);

create table studentCourse (
studentID varchar(10) not null,
sectionID varchar(5) not null,
sectionCode varchar(3) not null
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
("ART 1A", "Drawing I", "Fall2020", "1"),
("ART 1B", "Drawing II", "Fall2020", "1"),
("ART 2A", "Life Drawing I", "Fall2020", "1"),
("ART 2B", "Life Drawing II", "Fall2020", "1"),
("ART 3A", "Beginning Design: Design and Color", "Fall2020", "1"),
("ART 3B", "Beginning Design: 3-Dimensionial Form", "Fall2020", "1"),
("ART 5A", "Ceramics: Hand Building", "Fall2020", "1"),
("ART 5B", "Ceramics: Wheel Forming", "Fall2020", "1"),
("ART 7A", "Painting I", "Fall2020", "1"),
("ART 7B", "Painting II", "Fall2020", "1"),
("ART 8A", "Watercolor I", "Fall2020", "1"),
("ART 8B", "Watercolor II", "Fall2020", "1"),
-- Business courses
("ACCT 1A", "Financial Accounting", "Fall2020", "2"),
("ACCT 1B", "Managerial Accounting", "Fall2020", "2"),
("BUS 1", "Introduction to Business", "Fall2020", "2"),
("BUS 3", "Business Communications", "Fall2020", "2"),
("BUS 5", "Business Statistics", "Fall2020", "2"),
("BUS 8", "Business Information Systems", "Fall2020", "2"),
("BUS 10", "Business Law", "Fall2020", "2"),
("ECON 1A", "Introduction to Macroeconomics", "Fall2020", "2"),
("ECON 1B", "Introduction to Microoeconomics", "Fall2020", "2"),
-- Health Sciences Courses
("HS 3", "Personal Health", "Fall2020", "3"),
("HS 5", "Stress Management", "Fall2020", "3"),
("HS 6", "Health and Physical Fitness", "Fall2020", "3"),
("HS 10", "Environmental Health", "Fall2020", "3"),
-- Humanities 

-- Math Courses
("MATH 2", "Precalculus Algebra", "Fall2020", "5"),
("MATH 3", "Precalculus Trigonometry", "Fall2020", "5"),
("MATH 4", "Precalculus Algebra and Trigonometry", "Fall2020", "5"),
("MATH 5A", "Analytic Geometry and Calculus I", "Fall2020", "5"),
("MATH 5B", "Analytic Geometry and Calculus II", "Fall2020", "5"),
("MATH 5C", "Analytic Geometry and Calculus III", "Fall2020", "5"),
("MATH 6", "Intoduction to Linear Algebra", "Fall2020", "5"),
("MATH 7", "Intoduction to Differential Equations", "Fall2020", "5"),
-- Engineering
("ENGR 1A", "Surveying", "Fall2020", "6"),
("ENGR 3", "How Things Work", "Fall2020", "6"),
("ENGR 5", "Engineering as a Profession", "Fall2020", "6"),
("ENGR 10", "Engineering Communication", "Fall2020", "6"),
("ENGR 12", "Machining Processes", "Fall2020", "6"),
("ENGR 15", "Circuits", "Fall2020", "6"),
-- Science 

-- Technology
("CS 11", "Introduction to Programming Concepts and Methodology, C++", "Fall2020", "8"),
("CS 12J", "Introduction to Programming Concepts and Methodology, Java", "Fall2020", "8"),
("CS 19", "C++ Programming", "Fall2020", "8"),
("CS 20J", "Java Programming", "Fall2020", "8"),
("CIS 15", "Cloud Programming with Python", "Fall2020", "8"),
("CIS 31", "Perl Programming in a UNIX Environment", "Fall2020", "8"),
("CIS 32", "Introduction to Internet Programming", "Fall2020", "8");

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
("16805", "Luis", "Foster", "3667574244", "8"),
("10160", "Mary", "Jane", "2192893518", "1"),
("59603", "Charles", "Brown", "7453282710", "2"),
("19698", "Susan", "Taylor", "5463732122", "5"),
("57221", "Betty", "White", "3406441211", "8"),
("70356", "Nancy", "Martinez", "2476005158", "3");

-- Adds sections
-- sectionID(5), courseID(10), semster(25), year(10), facultyID
insert into section
values
-- Art
("01", "ART 1A", "Fall", "2020", "890", "25744"),
("02", "ART 1B", "Fall", "2020", "158", "25744"),
("03", "ART 2A", "Fall", "2020", "271", "25744"),
("05", "ART 2B", "Fall", "2020", "091", "25744"),
("04", "ART 3A", "Fall", "2020", "075", "25744"),
("01", "ART 3B", "Fall", "2020", "125", "25744"),
("66", "ART 5A", "Fall", "2020", "874", "25744"),
("10", "ART 5B", "Fall", "2020", "131", "10160"),
("55", "ART 7A", "Fall", "2020", "164", "10160"),
("04", "ART 7B", "Fall", "2020", "522", "10160"),
("01", "ART 8A", "Fall", "2020", "329", "10160"),
("03", "ART 8B", "Fall", "2020", "287", "10160"),
-- Business
("04", "ACCT 1A", "Fall", "2020", "152", "91153"),
("01", "ACCT 1B", "Fall", "2020", "157", "91153"),
("03", "BUS 1", "Fall", "2020", "814", "91153"),
("01", "BUS 3", "Fall", "2020", "422", "91153"),
("05", "BUS 8", "Fall", "2020", "786", "91153"),
-- Math
("02", "MATH 2", "Fall", "2020", "670", "34067"),
("04", "MATH 3", "Fall", "2020", "928", "34067"),
("55", "MATH 5A", "Fall", "2020", "023", "34067"),
("03", "MATH 5B", "Fall", "2020", "453", "34067"),
("05", "MATH 5C", "Fall", "2020", "407", "19698"),
("01", "MATH 6", "Fall", "2020", "034", "19698"),
("02", "MATH 7", "Fall", "2020", "365", "19698"),
-- Health Science
("02", "HS 3", "Fall", "2020", "080", "75757"),
("07", "HS 6", "Fall", "2020", "328", "75757"),
("08", "HS 10", "Fall", "2020", "320", "75757"),
-- Egineering
("03", "ENGR 3", "Fall", "2020", "231", "35992"),
("88", "ENGR 5", "Fall", "2020", "586", "35992"),
("01", "ENGR 1A", "Fall", "2020", "733", "35992"),
("02", "ENGR 10", "Fall", "2020", "991", "35992"),
("03", "ENGR 12", "Fall", "2020", "418", "35992"),
("01", "ENGR 15", "Fall", "2020", "923", "35992"),
-- Technology
("01", "CS 11", "Fall", "2020", "433", "16805"),
("02", "CS 19", "Fall", "2020", "439", "16805"),
("04", "CS 12J", "Fall", "2020", "822", "16805"),
("08", "CIS 15", "Fall", "2020", "774", "16805"),
("03", "CIS 31", "Fall", "2020", "767", "57221"),
("05", "CIS 32", "Fall", "2020", "882", "57221");

insert into classrm
value
("101", "890"),
("102", "271"),
("103", "075"),
("105", "874"),
("208", "814"),
("210", "786"),
("302", "080"),
("208", "422"),
("306", "320"),
("305", "328"),
("201", "152"),
("202", "157"),
("602", "231"),
("802", "433"),
("803", "439"),
("802", "822"),
("805", "774"),
("602", "586"),
("502", "670"),
("503", "928"),
("505", "023");

insert into grade_report
value 
("B", 3, "59743685", "890"),
("A", 4, "59743685", "271"),
("B", 3, "59743685", "670"),
("C", 2, "84563597", "433"),
("B", 3, "84563597", "928"),
("B", 3, "64521975", "928"),
("A", 4, "64521975", "439"),
("C", 2, "64521975", "152"),
("B", 3, "82581125", "231"),
("A", 4, "82581125", "586"),
("C", 2, "04172019", "822"),
("D", 1, "04172019", "774"),
("B", 3, "34734082", "774"),
("B", 3, "56172064", "164"),
("A", 4, "56172064", "522"),
("B", 3, "56172064", "329"),
("A", 4, "40507528", "822"),
("A", 4, "40507528", "034");

insert into gym
value
("82581125", "10 AM", "12 PM"),
("56279486", "8 AM", "10 AM"),
("84563597", "6 PM", "8 PM"),
("56172064", "10 AM", "1 PM"),
("40507528", "4 PM", "6 PM"),
("34734082", "12 PM", "2 PM"),
("86140702", "10 AM", "11 AM"),
("16823392", "1 PM", "2 PM"),
("64521975", "12 PM", "2 PM");