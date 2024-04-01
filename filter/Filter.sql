CREATE TABLE IF NOT EXISTS student(
    id integer,
    age integer,
    lives_on_campus boolean
)

insert into student VALUES
(1,15,true),
(2,16,false),
(3,12,true),
(4,19,false),
(5,14,true),
(6,19,false),
(7,13,true);


INSERT into student VALUES(8,13,true)

select * FROM student;


--GIVE A COUNT OF STUDENT WHO LIVES IN CAMPUS

SELECT * FROM student WHERE lives_on_campus=TRUE


--GIVE A COUNT OF STUDENT WHO LIVES OF CAMPUS

SELECT * FROM STUDENT WHERE lives_on_campus=FALSE;

--GIVE A COUNT OF STUDENT WHO LIVES OF CAMPUS AND -
--WHO LIVES ON CAMPUS INRESPECTIVE OF AGE

select lives_on_campus,count(lives_on_campus) from student GROUP BY lives_on_campus;


--give seprate count of student between age group 10-20 and age 21-30 who live off 
--campus and who lives on campus

select lives_on_campus ,count(*) from student GROUP BY lives_on_campus,age having student.age between 0 and 15;

--FILTER is functionally similar to the CASE statement, but makes the SQL a bit more readable:
--living on campus age between 0 and 15 and count age between 15 to 20 
select lives_on_campus,count(*) filter(where age between 0 and 15),
count(*) filter(where age between 15 and 20)
from student
GROUP BY lives_on_campus;