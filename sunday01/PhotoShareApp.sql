--table--
--users
--photos
--comments
--likes
 --Prfile for a user 
 --users have followers and can follow other users
 --user can like a photo 
 --list of comments each craeted by a user

relationship one -to- many
---------------------------------
One User has many Photos

Many-to-one relationship
---------------------------------
A Photo has one user

another one One-to-many relationship
-------------------------------------
A phots has many comments

many-to-One relationship
-------------------------------------
A comments has one Photo

this phots sharing app only one to many and many to one relationship
-------------------------------------------------------------------------
there is two other important relationship:many to many and one to one
-------------------------------------------------------------------------

one to one relationship
-------------------------------
Boat = caption(at one time)
company = ceo
capitol = country
TeamIndia = Caption

Many to many relationship
---------------------------------
Students= classes  
Tasks=Engineers
Players=Cricket Match
Movie=Actor/actress


--KEys in Sql
Primary Key--Uniquely identifies this record in this table
Foregin Key- we give phtos table a column user_id which is mean which phots is belong to which user

PhotosDBTable                            userTable
ID, url,    user_id                  Id     userName    Email
----------------------------------------------------------------------------
1   abc.com     3                      1    sangeet
2   abc.com     2                      2    sangeta
3   abc.com     1                      3    prbaht

user_id is Foregin key.

comments have one Photo:comments table should get a Foregin key column pointing at the photo each comment begolongs to
comments have one user:-comments table should get a Foregin key column pointing at the user each comment belong to

the "Many" side of the releationship gets the Foregin key columns

photos->Coments,coments,comests in coments table has Foregin key column pointing at photos

user-> coments,coments,coments in comments get the Foregin key column pointing at user

comments db look like this-----

id      text       user_id      photo_id
------------------------------------------------------------
1       nice pic    2              1
2       cool        1              3
3       like it     3              2


Primary key                                                 Foregin Keys
Each Row in every table has one primary Key                 Rows only have this if they belong to another record
No other row in the same table can have the same VALUE      many rows in the same table can have the same Foregin key
Will never change                                           will change if the relationship changes



create table users(
    id serial PRIMARY KEY,
    username varchar(100)
)

INSERT INTO users (username) VALUES('PRABHAT'),('ANKIT'),('AMAN'),('AKASH'),('PAWAN'),('SAMEER'),('MAYANK')


SELECT * FROM USERS


CREATE TABLE photos(
    id serial primary key,
    url varchar(250),
    user_id Integer REFERENCES USERS(ID)
)

INSERT into photos(url,user_id)
values
('https://one.jpg',4),
('https//img2.jpg',4),
('https//img3.jpg',1),
('https//img4.jpg',2),
('https//img5.jpg',3)

select * from photos