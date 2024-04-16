--DataBase design Process

1-what kind of thing are we stroing 
2-what properties does this thing have
3-what type of data does each of those properties conatin

we should create a table called cities storing the list of cities
the table should have columns of name country,population,area each city has these propertie
Each columns should indicate the type of data that it is going to store-
--name string
--country string
--population number
--
--area number

CREATE table cities(
name varchar(50),
country varchar(50),
population integer,
area integer
);

INSERT INTO cities (name,country,population,area)VALUES
('Tokyo','Japan',38505000,8223),
('Delhi','India',28125000,2240),
('Shanghai','China',22125000,4015),
('Sao Paulo','Brazil',20935000,3043);

SELECT * FROM cities

--FIND DENSITY OF CITY
population/area

SELECT name,population/area PersonperKM from cities;

SELECT name,area from cities WHERE AREA>4000;

select name,area from cities where area BETWEEN 3000 and 4000

select * from cities where name in ('Tokyo','Delhi')