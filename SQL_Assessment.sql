create database assessment_database;

create table worker (
    worker_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    salary int,
    joining_date datetime,
    department varchar(50)
);

insert into worker (worker_id, first_name, last_name, salary, joining_date, department) values
(1, 'monika', 'arora', 100000, '2014-02-20 09:00:00', 'hr'),
(2, 'niharika', 'verma', 80000, '2014-06-11 09:00:00', 'admin'),
(3, 'vishal', 'singhal', 300000, '2014-02-20 09:00:00', 'hr'),
(4, 'amitabh', 'singh', 500000, '2014-02-20 09:00:00', 'admin'),
(5, 'vivek', 'bhati', 500000, '2014-06-11 09:00:00', 'admin'),
(6, 'vipul', 'diwan', 200000, '2014-06-11 09:00:00', 'account'),
(7, 'satish', 'kumar', 75000, '2014-01-20 09:00:00', 'account'),
(8, 'geetika', 'chauhan', 90000, '2014-04-11 09:00:00', 'admin');

create table student (
    stdid int primary key,
    stdname varchar(100),
    sex varchar(10),
    percentage int,
    class int,
    sec varchar(5),
    stream varchar(50),
    dob date
);

insert into student (stdid, stdname, sex, percentage, class, sec, stream, dob) values
(1001, 'surekha joshi', 'female', 82, 12, 'a', 'science', '1998-03-08'),
(1002, 'maahi agarwal', 'female', 56, 11, 'c', 'commerce', '2008-11-23'),
(1003, 'sanam verma', 'male', 59, 11, 'c', 'commerce', '2006-06-29'),
(1004, 'ronit kumar', 'male', 63, 11, 'c', 'commerce', '1997-11-05'),
(1005, 'dipesh pulkit', 'male', 78, 11, 'b', 'science', '2003-09-14'),
(1006, 'jahanvi puri', 'female', 60, 11, 'b', 'commerce', '2008-11-07'),
(1007, 'sanam kumar', 'male', 23, 12, 'f', 'commerce', '1998-03-08'),
(1008, 'sahil saras', 'male', 56, 11, 'c', 'commerce', '2008-11-07'),
(1009, 'akshra agarwal', 'female', 72, 12, 'b', 'commerce', '1996-10-01'),
(1010, 'stuti mishra', 'female', 39, 11, 'f', 'science', '2008-11-23'),
(1011, 'harsh agarwal', 'male', 42, 11, 'c', 'science', '1998-03-08'),
(1012, 'nikunj agarwal', 'male', 49, 12, 'c', 'commerce', '1998-06-28'),
(1013, 'akriti saxena', 'female', 89, 12, 'a', 'science', '2008-11-23'),
(1014, 'tani rastogi', 'female', 82, 12, 'a', 'science', '2008-11-23');


#1. order by first_name asc and department desc

select * from worker order by first_name asc, department desc;

#2. details for vipul and satish

select * from worker where first_name in ('vipul', 'satish');

#3. first_name ends with 'h' and has 6 letters

select * from worker where first_name like '%h';

#4. salary between range

select * from worker where salary between 100000 and 500000;

#5.fetch duplicate records

select first_name, last_name, salary, department, count(*) as duplicatecount
from worker
group by first_name, last_name, salary, department
having count(*) > 1;

#6. top 6 records

select * from worker limit 6;

#7. departments with less than 5 people

select department, count(*) as total_workers from worker group by department
having count(*) < 5;

#8. all departments with worker count

select department, count(*) as total_workers
from worker
group by department;

#9. highest salary employee in each department

select w.department, w.first_name, w.last_name, w.salary
from worker w
inner join (
    select department, max(salary) as maxsalary
    from worker
    group by department
) dept_max on w.department = dept_max.department and w.salary = dept_max.maxsalary;

#question 2 queries

#1. display all records

select * from student;

#2. display stdname and dob

select stdname, dob from student;

#3. percentage >= 80

select * from student where percentage >= 80;

#4. stdname, stream, percentage where percentage > 80

select stdname, stream, percentage from student where percentage > 80;

#5. science students with percentage > 75

select * from student where stream = 'science' and percentage > 75;