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


INSERT INTO users (username) VALUES('Hitesh'),('Hari'),('Amar Deep'),('Chand Deep'),('Mohan'),('Shivam'),('Lalla')

SELECT * FROM USERS

Drop table USERS

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

--find All photos with details which user upload which photo

select u.userName,p.url from users u,photos p where u.id=p.user_id

--diffent way of write same query

select userName,url from photos Join users On users.id=photos.user_id

->Foregin Key Constarints Around Insertion
-------------------------------------------------------------------
3 Possibilty we considers 
-------------------------------------------------------------------
1 -> we insert a phots that is tied to a user that EXISTS ✅
2 -> we insert a photos that refers to user that doesn't ❌ 'get error'
3 -> we insert a photos that isn't tied to any users -> null data insert in the user_id 


->Foregin Key Constarints Around Deletion--
-------------------------------------------------------------------
  what happens if you try to delete a user when a photo is still refrencing it
-------------------------------------------------------------------
  on Delete Restrict
                Throw an error

    on Delete No Action
                Throw an error
    
    On Delete CasCade
                Delete the Photo Tooo

    On Delete Set null
                Set the user_id of the photo to null

    On Delete Set Default
                set the user_id of the photo to a default value,if one is provided
-------------------------------------------------------------------
Drop table photos
 
->Add Delete caseCade Constarints
-------------------------------------------------------------------
CREATE TABLE photos(
    id serial primary key,
    url varchar(250),
    user_id Integer REFERENCES USERS(ID) ON DELETE CASCADE
)
-------------------------------------------------------------------
INSERT into photos(url,user_id)
values
('https://one.jpg',4),
('https//img2.jpg',4),
('https//img3.jpg',1),
('https//img4.jpg',2),
('https//img5.jpg',3)

select * from photos

important:after set on delete cascade you can delete user data which
is EXISTS in photos table on this time photos record delete as well
-------------------------------------------------------------------
Important:delete from users where id=1;
 now you can check photos table user_id data will delete also

 ->Add Delete Set null Constarints
-------------------------------------------------------------------
 CREATE TABLE photos(
    id serial primary key,
    url varchar(250),
    user_id Integer REFERENCES USERS(ID) ON DELETE SET NULL
)
-------------------------------------------------------------------

INSERT into photos(url,user_id)
values
('https://one.jpg',4),
('https//img2.jpg',4),
('https//img4.jpg',2),
('https//img5.jpg',3)
-------------------------------------------------------------------
select * from photos
-------------------------------------------------------------------

delete from users where id=4;
-------------------------------------------------------------------
importanta:-> when we delete the id=4 from user table in photos table in user_id column value is =4 now set to be null 
because we put on delete Set Null constarints on photos tables;
this case use when you want to delete the users but not want his posts this posts are usefull 
------------------------------------------------------------------- 

:->now I am create Commnets table which is related with users and photos tbles as well
------------------------------------------------------------------- -------------------------

create TABLE comments (
    ID serial,
    user_id Integer REFERENCES users(id),
    photo_id Integer REFERENCES Photos(id),
    comment varchar(500) 
)


select * from comments

INSERT INTO comments (comment, user_id, photo_id)
VALUES
  ('Quo velit iusto ducimus quos a incidunt nesciunt facilis.', 2, 4),
        ('Non est totam.', 5, 5),
        ('Fuga et iste beatae.', 3, 3),
        ('Molestias tempore est.', 1, 5),
        ('Est voluptatum voluptatem voluptatem est ullam quod quia in.', 1, 5),
        ('Aut et similique porro ullam.', 1, 3),
        ('Fugiat cupiditate consequatur sit magni at non ad omnis.', 1, 2),
        ('Accusantium illo maiores et sed maiores quod natus.', 2, 5),
        ('Perferendis cumque eligendi.', 1, 2),
        ('Nihil quo voluptatem placeat.', 5, 5),
        ('Rerum dolor sunt sint.', 5, 2),
        ('Id corrupti tenetur similique reprehenderit qui sint qui nulla tenetur.', 2, 1),
        ('Maiores quo quia.', 1, 5),
        ('Culpa perferendis qui perferendis eligendi officia neque ex.', 1, 4),
        ('Reprehenderit voluptates rerum qui veritatis ut.', 1, 1),
        ('Aut ipsum porro deserunt maiores sit.', 5, 3),
        ('Aut qui eum eos soluta pariatur.', 1, 1),
        ('Praesentium tempora rerum necessitatibus aut.', 4, 3),
        ('Magni error voluptas veniam ipsum enim.', 4, 2),
        ('Et maiores libero quod aliquam sit voluptas.', 2, 3),
        ('Eius ab occaecati quae eos aut enim rem.', 5, 4),
        ('Et sit occaecati.', 4, 3),
        ('Illum omnis et excepturi totam eum omnis.', 1, 5),
        ('Nemo nihil rerum alias vel.', 5, 1),
        ('Voluptas ab eius.', 5, 1),
        ('Dolor soluta quisquam voluptatibus delectus.', 3, 5),
        ('Consequatur neque beatae.', 4, 5),
        ('Aliquid vel voluptatem.', 4, 5),
        ('Maiores nulla ea non autem.', 4, 5),
        ('Enim doloremque delectus.', 1, 4),
        ('Facere vel assumenda.', 2, 5),
        ('Fugiat dignissimos dolorum iusto fugit voluptas et.', 2, 1),
        ('Sed cumque in et.', 1, 3),
        ('Doloribus temporibus hic eveniet temporibus corrupti et voluptatem et sint.', 5, 4),
        ('Quia dolorem officia explicabo quae.', 3, 1),
        ('Ullam ad laborum totam veniam.', 1, 2),
        ('Et rerum voluptas et corporis rem in hic.', 2, 3),
        ('Tempora quas facere.', 3, 1),
        ('Rem autem corporis earum necessitatibus dolores explicabo iste quo.', 5, 5),
        ('Animi aperiam repellendus in aut eum consequatur quos.', 1, 2),
        ('Enim esse magni.', 4, 3),
        ('Saepe cumque qui pariatur.', 4, 4),
        ('Sit dolorem ipsam nisi.', 4, 1),
        ('Dolorem veniam nisi quidem.', 2, 5),
        ('Porro illum perferendis nemo libero voluptatibus vel.', 3, 3),
        ('Dicta enim rerum culpa a quo molestiae nam repudiandae at.', 2, 4),
        ('Consequatur magnam autem voluptas deserunt.', 5, 1),
        ('Incidunt cum delectus sunt tenetur et.', 4, 3),
        ('Non vel eveniet sed molestiae tempora.', 2, 1),
        ('Ad placeat repellat et veniam ea asperiores.', 5, 1),
        ('Eum aut magni sint.', 3, 1),
        ('Aperiam voluptates quis velit explicabo ipsam vero eum.', 1, 3),
        ('Error nesciunt blanditiis quae quis et tempora velit repellat sint.', 2, 4),
        ('Blanditiis saepe dolorem enim eos sed ea.', 1, 2),
        ('Ab veritatis est.', 2, 2),
        ('Vitae voluptatem voluptates vel nam.', 3, 1),
        ('Neque aspernatur est non ad vitae nisi ut nobis enim.', 4, 3),
        ('Debitis ut amet.', 4, 2),
        ('Pariatur beatae nihil cum molestiae provident vel.', 4, 4),
        ('Aperiam sunt aliquam illum impedit.', 1, 4),
        ('Aut laudantium necessitatibus harum eaque.', 5, 3),
        ('Debitis voluptatum nesciunt quisquam voluptatibus fugiat nostrum sed dolore quasi.', 3, 2),
        ('Praesentium velit voluptatem distinctio ut voluptatum at aut.', 2, 2),
        ('Voluptates nihil voluptatum quia maiores dolorum molestias occaecati.', 1, 4),
        ('Quisquam modi labore.', 3, 2),
        ('Fugit quia perferendis magni doloremque dicta officia dignissimos ut necessitatibus.', 1, 4),
        ('Tempora ipsam aut placeat ducimus ut exercitationem quis provident.', 5, 3),
        ('Expedita ducimus cum quibusdam.', 5, 1),
        ('In voluptates doloribus aut ut libero possimus adipisci iste.', 3, 2),
        ('Sit qui est sed accusantium quidem id voluptatum id.', 1, 5),
        ('Libero eius quo consequatur laudantium reiciendis reiciendis aliquid nemo.', 1, 2),
        ('Officia qui reprehenderit ut accusamus qui voluptatum at.', 2, 2),
        ('Ad similique quo.', 4, 1),
        ('Commodi culpa aut nobis qui illum deserunt reiciendis.', 2, 3),
        ('Tenetur quam aut rerum doloribus est ipsa autem.', 4, 2),
        ('Est accusamus aut nisi sit aut id non natus assumenda.', 2, 4),
        ('Et sit et vel quos recusandae quo qui.', 1, 3),
        ('Velit nihil voluptatem et sed.', 4, 4),
        ('Sunt vitae expedita fugiat occaecati.', 1, 3),
        ('Consequatur quod et ipsam in dolorem.', 4, 2),
        ('Magnam voluptatum molestias vitae voluptatibus beatae nostrum sunt.', 3, 5),
        ('Alias praesentium ut voluptatem alias praesentium tempora voluptas debitis.', 2, 5),
        ('Ipsam cumque aut consectetur mollitia vel quod voluptates provident suscipit.', 3, 5),
        ('Ad dignissimos quia aut commodi vel ut nisi.', 3, 3),
        ('Fugit ut architecto doloremque neque quis.', 4, 5),
        ('Repudiandae et voluptas aut in excepturi.', 5, 3),
        ('Aperiam voluptatem animi.', 5, 1),
        ('Et mollitia vel soluta fugiat.', 4, 1),
        ('Ut nemo voluptas voluptatem voluptas.', 5, 2),
        ('At aut quidem voluptatibus rem.', 5, 1),
        ('Temporibus voluptates iure fuga alias minus eius.', 2, 3),
        ('Non autem laboriosam consectetur officiis aut excepturi nobis commodi.', 4, 3),
        ('Esse voluptatem sed deserunt ipsum eaque maxime rerum qui.', 5, 5),
        ('Debitis ipsam ut pariatur molestiae ut qui aut reiciendis.', 4, 4),
        ('Illo atque nihil et quod consequatur neque pariatur delectus.', 3, 3),
        ('Qui et hic accusantium odio quis necessitatibus et magni.', 4, 2),
        ('Debitis repellendus inventore omnis est facere aliquam.', 3, 3),
        ('Occaecati eos possimus deleniti itaque aliquam accusamus.', 3, 4),
        ('Molestiae officia architecto eius nesciunt.', 5, 4),
        ('Minima dolorem reiciendis excepturi culpa sapiente eos deserunt ut.', 3, 3);


Query-
Find all the commnets for the photo with id=3 and with the username of comment author

--select userName,url from photos Join users On users.id=photos.user_id

explain select comment,u.userName from comments c,users u,photos p
where c.user_id=u.id and c.photo_id=p.id and u.id=c.user_id and p.id=3
 
explain select comment,userName from comments join users ON users.id=comments.user_id and photo_id=3;

find the photo with id=10 and get the number of comment attaced to it;

select count(COMMENT) from comments c,users u,photos p
where c.user_id=u.id and c.photo_id=p.id and u.id=c.user_id and p.id=5


select count(COMMENT) from comments c,users u,photos p
where c.user_id=u.id and c.photo_id=p.id and u.id=c.user_id GROUP BY p.id

find the average number of comments per photos

select * from photos

find the user with the most activity



find the photo with the most comments attaced to it;


calcualte the average number of character per comments 


case:- if photos table is contains null value in user_id then join wiil be fails in this case.

Four Type of Join 
-----------------------------------------------
Inner Join
Left Outer Join
Right Outer join
Full Join

1.inner Join
---------------------
SELECT url, username
 FROM photos
 JOIN users ON users.id = photos.user_id //only both side table match data show

Left outer Join
--------------------------
SELECT url, username
 FROM photos
 LEFT JOIN users ON users.id = photos.user_id
--in left join only left table data will show and right table match data will shows and if left data is have extra data comapre to right table show in front null columns in join
 Right Outer Join
------------------------------------
 SELECT url, username
 FROM photos
 RIGHT JOIN users ON users.id = photos.user_id;

Full Join
-------------------------------------
 SELECT url, username
 FROM photos
 FULL JOIN users ON users.id = photos.user_id
 --FULL JOIN creates the result-set by combining results of both LEFT JOIN and RIGHT JOIN. 