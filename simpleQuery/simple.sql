INSERT INTO employee(id,ename,email) VALUES(4,'Ankit','Ankit@gmail.com'),(5,'Mayank','Mayank@gmail.com');

SELECT * FROM employee;


--information schema.tables contains all tables 
select * FROM INFORMATION_SCHEMA.tables where table_schema='information_schema';

----for check table constraints

select * from INFORMATION_SCHEMA.check_constraints;

---check colums in which table its used

select * from information_schema.columns where COLUMN_name='ename';

