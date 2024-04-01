--Index are pointers of heap (heap is contain actual data) exmaple like book index are stores adddress of data

CREATE table IF NOT EXISTS foo(id integer, name TEXT)

--pg class table is sysytem table which is store address of table and information about table
select relfilenode from pg_class where relname like '%student%'

--tables (heap)
--select whole table must be a sequential scan
--select a specific data student id=10 is not a sequential scan

explain select * from student
  --"QUERY PLAN": "Seq Scan on student  (cost=0.00..32.00 rows=2200 width=9)"

 explain select * from student where age=19
--  "QUERY PLAN": "Seq Scan on student  (cost=0.00..37.50 rows=11 width=9)"

--
insert into foo VALUES(1,'Alex');

insert into foo VALUES(2,'BOB');

select * from foo;
----In PostgreSQL, the ctid field is a unique column that identifies the location of a tuple
--- within a table. It consists of two values: the block number, and the tuple index within the block.
--- The first digit of the ctid value represents the page number, 
----and the second digit represents the tuple number. 
SELECT ctid,* from foo;

select ctid,* from student

--if you find name=alex need to scan each and every page and look of the tuple in the page 
--this is costlty process (cost)

--index 
--index are entry point for tables 
--index used to locate the tuples in the tables
--the sole reason to have an index is performance
--index is stored seprately from the table's main storage (postgresql Heap)
--More storage required to store the index along with orignal table

--this is single column index
CREATE INDEX foo_idx ON Foo(id);

select name from foo where id=2

explain select name from foo where id=2

--when you create index on table thats table is lock, no deletion and no updation is performe in tble
--postgress is solve is problem -- CONCURRENTLY OPTION CREATE THE INDEX WITHOUT LOCKING THE TABLE

insert into foo VALUES(3,'John');


explain SELECT * FROM STUDENT WHERE AGE=13
--Seq Scan on student  (cost=0.00..37.50 rows=11 width=9)

CREATE INDEX IDX_BTREE_AGE ON STUDENT USING BTREE(AGE);



explain SELECT * FROM STUDENT WHERE AGE=13

--Seq Scan on student  (cost=0.00..1.10 rows=1 width=9)


