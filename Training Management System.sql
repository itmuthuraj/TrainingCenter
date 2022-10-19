create database tcms;
use tcms;
show tables;
CREATE TABLE Course (
    courseId VARCHAR(15) PRIMARY KEY,
    courseName VARCHAR(10),
    courseDescription VARCHAR(100),
    fees DOUBLE
);

SELECT 
    *
FROM
    Course;
set sql_safe_updates =0;


DELIMITER $$
create procedure courseid(IN cname varchar(10), out cid varchar(15))
begin
set cid = concat('SMI_', upper(cname));
end $$

call courseid("java", @cid);
insert into Course values(@cid, "java", "jafdanadf;oaj", 123);
select * from Course;
select * from batch;

CREATE TABLE Batch (
    batchId VARCHAR(15) PRIMARY KEY,
    batchName VARCHAR(15),
    batchStartDate VARCHAR(10),
    courseId VARCHAR(15),
    FOREIGN KEY (courseId)
        REFERENCES Course(courseId)
);

DELIMITER $$
create procedure batchs(IN bdate varchar(10), in cid varchar(15),  out bid varchar(10), out bname varchar(15))
begin
declare w varchar(10);
declare variable varchar(15);
declare mon varchar(2);
declare yer varchar(5);
declare dates varchar(8);
declare num int;
declare var varchar(6);
declare i int;

select max(batchId) into variable from Batch where courseId = cid;

if variable is not null then
set i = substring_index(variable, 'B', -1);
set w = substring_index(cid, '_',-1);
set var = substring(w, 1, 2);
set dates= substring_index(bdate,'/' ,-2);
set yer= substring_index(dates, '/',-1);
set yer = substring(yer, 3,2);
set mon = substring_index(dates,'/',1);
set num = i+1;
set bid = concat(var, mon, yer, 'B', num);
set bname = concat(w, '_Batch_', num);

elseif variable is null then
set w = substring_index(cid, '_',-1);
set var = substring(w, 1, 2);
set dates= substring_index(bdate,'/' ,-2);
set yer= substring_index(dates, '/',-1);
set yer = substring(yer, 3,2);
set mon = substring_index(dates,'/',1);
set num = 0;
set num = num + 1;
set bid = concat(var, mon, yer, 'B', num);
set bname = concat(w, '_Batch_', num);
end if;
end $$

call batchs("12/01/2022",'SMI_JAVA', @bid, @bname);
insert into Batch values(@bid, @bname, "12/01/2023",'SMI_JAVA');
select * from Batch;

CREATE TABLE Topic (
    topicId INT AUTO_INCREMENT PRIMARY KEY,
    courseId VARCHAR(15),
    FOREIGN KEY (courseId)
        REFERENCES Course (courseId),
    topicName VARCHAR(25),
    duration VARCHAR(10),
    topicDescription VARCHAR(100)
);

CREATE TABLE StudentEnquiry (
    studentEnquiryId INT AUTO_INCREMENT PRIMARY KEY,
    studentName VARCHAR(25),
    studentAddress VARCHAR(30),
    mailId VARCHAR(25),
    studentMobile VARCHAR(10),
    dateOfBirth VARCHAR(10),
    gender VARCHAR(10),
    batchId varchar(15),
    foreign key (batchId) 
    references Batch(batchId),
    studentQualification VARCHAR(10),
    department VARCHAR(15),
    yearofPassing VARCHAR(4),
    institute VARCHAR(50)
);

insert into StudentEnquiry(studentName, studentMobile, dateOfBirth, batchId) values ("Janet", "9092248485","30/10/1999", "JA1222B1");
 select * from StudentEnquiry

delimiter $$
create trigger studentlogin
after insert on StudentEnquiry for each row
begin
declare a varchar(10);
declare b varchar(5);
declare s varchar(4);
declare t varchar(4);
declare num int;
declare variable varchar(15);
declare uid varchar(15);
declare upd varchar(8);
declare lid varchar(8);
declare y varchar(8);

select max(loginId) into variable from Login where userRole="student";
if variable is not null then 
set a = substring_index(new.batchId, 'B',-1);
set b = substring(new.batchId, 1,1);
set num = substring_index(variable, 'D',-1);
set num = num +1;
set uid = concat('B', a,b, 'SD',num);

set s = substring_index(new.dateOfBirth, '/',-1);
set t = substring(new.studentMobile, 7,4);
set upd = concat(t, s);
set lid = concat('SD',num);

elseif variable is null then
set a = substring_index(new.batchId, 'B',-1);
set b = substring(new.batchId, 1,1);
set num = 0;
set num = num +1;
set uid = concat('B', a, b, 'SD', num);
set s = substring_index(new.dateOfBirth, '/',-1);
set t = substring(new.studentMobile, 7,4);
set upd = concat(t, s);
set lid = concat('SD',num);
end if;
insert into Login(loginId, userId, userPassword, userRole) values (lid, uid, upd, "student");
select loginId into y from Login where userId =  uid;
insert into StudentEnrolment (studentEnquiryId , loginId) values (new.studentEnquiryId, y);
end $$

CREATE TABLE Login (
    loginId varchar(8) PRIMARY KEY,
    userId VARCHAR(15),
    userPassword VARCHAR(8),
    userRole VARCHAR(12)
);

select * from Login;

CREATE TABLE StudentEnrolment (
    studentEnrolmentId INT auto_increment PRIMARY KEY,
    dateOfJoining VARCHAR(10),
    studentEnquiryId INT,
    FOREIGN KEY (studentEnquiryId)
        REFERENCES StudentEnquiry (studentEnquiryId),
    feesPaymentStatus BOOLEAN,
    loginId varchar(8),
    foreign key (loginId)
     references Login(loginId)
);

select * from studentenrolment;

CREATE TABLE Staff (
    staffId INT AUTO_INCREMENT PRIMARY KEY,
    staffName VARCHAR(20),
    mobile VARCHAR(10),
    mailId VARCHAR(25),
    dateOfBirth VARCHAR(10),
    gender VARCHAR(10),
    courseId VARCHAR(15),
    FOREIGN KEY (courseId)
        REFERENCES Course (courseId)
);

insert into Staff (mobile, dateOfBirth) values('123456789',"12/12/1982");
select * from staff;

delimiter $$
create trigger stafflogin
after insert on Staff for each row
begin
declare a varchar(7);
declare s varchar(4);
declare t varchar(4);
declare num int;
declare variable varchar(15);
declare uid varchar(15);
declare upd varchar(8);
declare lid varchar(8);
declare y varchar(8);

select max(loginId) into variable from Login where userRole="Mentor";
if variable is not null then 
set a = substring_index(variable, 'T', -1);
set num = a+1;
set uid = concat('SMIST', num);
set s = substring_index(new.dateOfBirth, '/',-1);
set t = substring(new.mobile, 7,4);
set upd = concat(t,s);
set lid = concat('ST', num);

elseif variable is null then 
set num = 0 ;
set num = num +1;
set uid = concat('SMIST', num);
set s = substring_index(new.dateOfBirth, '/',-1);
set t = substring(new.mobile, 7,4);
set upd = concat(t,s);
set lid = concat('ST', num);
end if;

insert into Login(loginId, userId, userPassword, userRole) values (lid, uid, upd, "mentor");
select loginId into y from Login where userId =  uid;
insert into StaffExperience(staffId , loginId) values (new.staffId, y);

end $$

CREATE TABLE StaffExperience (
    staffExperienceId INT AUTO_INCREMENT PRIMARY KEY,
    staffId INT,
    FOREIGN KEY (staffId)
        REFERENCES Staff (staffId),
    yearOfExperience INT,
    previousCompanyWorked VARCHAR(50),
    staffQualification VARCHAR(10),
	loginId varchar(8),
    foreign key (loginId)
    references Login(loginId)
);

select * from StaffExperience

CREATE TABLE StaffAttendance (
    staffAttendanceId INT AUTO_INCREMENT PRIMARY KEY,
    staffId INT,
    FOREIGN KEY (staffId)
        REFERENCES Staff (staffId),
    staffAttendanceDate VARCHAR(10),
    staffAttendanceState BOOLEAN
);

CREATE TABLE StudentAttendance (
    attendanceId INT AUTO_INCREMENT KEY,
    studentEnrolmentId INT,
    FOREIGN KEY (studentEnrolmentId)
        REFERENCES StudentEnrolment (studentEnrolmentId),
    attendanceDate VARCHAR(10),
    attendanceState BOOLEAN
);

CREATE TABLE DailyClass (
    dailyClassId INT AUTO_INCREMENT PRIMARY KEY,
    batchId varchar(15),
    FOREIGN KEY (batchId)
        REFERENCES Batch (batchId),
    date VARCHAR(10),
    courseId varchar(15),
    foreign key (courseId)
    references Course(courseId),
    topicId INT,
    FOREIGN KEY (topicId)
        REFERENCES Topic (topicId),
	classDate varchar(10), 
    staffId INT,
    FOREIGN KEY (staffId)
        REFERENCES Staff (staffId)
);

CREATE TABLE Test (
    testId INT AUTO_INCREMENT PRIMARY KEY,
    batchId varchar(15),
    FOREIGN KEY (batchId)
        REFERENCES Batch (batchId),
    testDate VARCHAR(10),
    testType VARCHAR(15),
    totalMark DOUBLE
);

CREATE TABLE Mark (
    markId INT AUTO_INCREMENT PRIMARY KEY,
    testId INT,
    FOREIGN KEY (testId)
        REFERENCES Test (testId),
    totalMark DOUBLE,
    markObtained DOUBLE,
    studentEnrolmentId INT,
    FOREIGN KEY (studentEnrolmentId)
        REFERENCES StudentEnrolment (studentEnrolmentId)
);