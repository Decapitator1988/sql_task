
CREATE TABLE IF NOT EXISTS GROUPS(
GROUP_ID SERIAL primary key,
NAME VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS COURSES(
COURSE_ID SERIAL PRIMARY KEY,
NAME VARCHAR(255) NOT NULL,
DESCRIPTION VARCHAR(500)
);


CREATE TABLE IF NOT EXISTS STUDENTS(
STUDENT_ID SERIAL PRIMARY KEY,
GROUP_ID INT,
FIRST_NAME VARCHAR(255) NOT NULL,
LAST_NAME VARCHAR(255) NOT NULL,
FOREIGN KEY (GROUP_ID) REFERENCES GROUPS(GROUP_ID)
);


insert into courses (description, name) values('Algebra','MATH');
insert into courses (description, name) values  ('Rock music', 'Music');
insert into courses (description, name) values ('Theiretical physycs', 'Physics');

insert into groups (name) values ('SR-01');
insert into groups (name) values ('SR-02');
insert into groups (name) values('SR-03');


insert into students (first_name, group_id, last_name) values ('Freddy', 1 ,'Mercury');
insert into students (first_name, group_id, last_name) values('Tom', 2, 'Yorke');
insert into students (first_name, group_id, last_name) values('James', 3, 'Hatfield');
insert into students (first_name, group_id, last_name) values('Stephen', 1, 'Hawking');
insert into students (first_name, group_id, last_name) values('Albert ', 2, 'Einstein');
insert into students (first_name, group_id, last_name) values('Neils', 1, 'Bor');
insert into students (first_name, group_id, last_name) values ('Alfred', 2, 'Newton');
insert into students (first_name, group_id, last_name) values('Serge ', 1, 'Tankian');
insert into students (first_name, group_id, last_name) values ('Bruce', 1 , 'Dickinson');
insert into students (first_name, group_id, last_name) values ('John', 2 , 'Nash');
insert into students (first_name, group_id, last_name) values ('Daron', 3, 'Malakian');
insert into students (first_name, group_id, last_name) values ('David', 3, 'Gilmore');
insert into students (first_name, group_id, last_name) values ('Ellis', 3, 'Cooper');
insert into students (first_name, group_id, last_name) values('Ozzy', 3, 'Osbourne');


--#1
select * from groups
where (select count(*) from students where students.group_id=groups.group_id) <10;

#2
--delete from  students  where group_id = (select group_id from groups where name='SR-01');

#3
CREATE TABLE IF NOT EXISTS students_courses(
STUDENT_ID INT NOT NULL,
COURSES_ID INT NOT NULL,
PRIMARY KEY (STUDENT_ID, COURSES_ID),
FOREIGN KEY (STUDENT_ID) REFERENCES students(student_id),
FOREIGN KEY (COURSES_ID) REFERENCES courses(course_id)
);

insert into students_courses (student_id, courses_id) values (1, 2);
insert into students_courses (student_id, courses_id) values (2, 2);
insert into students_courses (student_id, courses_id) values (3, 2);
insert into students_courses (student_id, courses_id) values (4, 3);
insert into students_courses (student_id, courses_id) values (5, 3);
insert into students_courses (student_id, courses_id) values (6, 3);
insert into students_courses (student_id, courses_id) values (7, 3);
insert into students_courses (student_id, courses_id) values (8, 2);
insert into students_courses (student_id, courses_id) values (9, 2);
insert into students_courses (student_id, courses_id) values (10, 1);
insert into students_courses (student_id, courses_id) values (11, 2);
insert into students_courses (student_id, courses_id) values (12, 2);
insert into students_courses (student_id, courses_id) values (13, 2);

--#4
select  c.name,  s.first_name, s.last_name
from students as s
inner join students_courses as sc
on s.student_id=sc.student_id
inner join courses as c
on c.course_id = sc.courses_id
order by c.name;



