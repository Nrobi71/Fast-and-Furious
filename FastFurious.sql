/* FASTandFURIOUS SQL 
DATE CREATED: 04-22-2022*/

/* Create the Cast table */
CREATE TABLE MEMBER (
  member_id INTEGER PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  occupation VARCHAR(100)
);

/* Create the Car table */
CREATE TABLE CAR (
  car_id INTEGER PRIMARY KEY,
  car_make VARCHAR(60),
  car_model VARCHAR(60),
);

/* Create the Movie table */
CREATE TABLE MOVIE (
  movie_id INTEGER PRIMARY KEY,
  movie_name VARCHAR(30),
  year_made YEAR NOT NULL
);

/* Create the Location table */
CREATE TABLE LOCATION (
  location_id INTEGER PRIMARY KEY,
  country VARCHAR(30),
  city VARCHAR(60),
);

/* Add car_id foreign key */
ALTER TABLE MEMBER
  ADD car_id INTEGER,
  ADD FOREIGN KEY(car_id) REFERENCES CAR(car_id);

/* Add car_id and location_id foreign keys */
ALTER TABLE MOVIE
  ADD car_id INTEGER,
  ADD location_id INTEGER,
  ADD FOREIGN KEY(car_id) REFERENCES CAR(car_id),
  ADD FOREIGN KEY(location_id) REFERENCES LOCATION(location_id);
  
/* Insert three rows of fabricated data for the Character table */
INSERT INTO MEMBER(member_id, first_name, last_name, occupation)
VALUES(1, "Brian", "O'Conner", "EX FBI Agent"),
(2, "Dominic", "Toretto", "Mechanic"),
(3, "Han", "Lue", "Fugitive");

/* Insert three rows of fabricated data for the Car table */
INSERT INTO CAR(car_id, car_make, car_model)
VALUES(1, "Nissan", "Skyline GT-R R34"),
(2, "Dodge", "Charger"),
(4, "Mazda", "RX-7");

/* Insert three rows of fabricated data for the Movie table */
INSERT INTO MOVIE(movie_id, movie_name, year_made)
VALUES(1, "Fast and Furious", 2001),
(2, "Fast Five", 2011),
(4, "Tokyo Drift", 2006);

/* Insert three rows of fabricated data for the Location table */
INSERT INTO LOCATION(location_id, country, city)
VALUES(1, "USA", "Los Angeles"),
(2, "Brazil", "Rio"),
(3, "Japan", "Tokyo");

/* Update the Employee table by setting the shop_id for each employee */
UPDATE MEMBER
SET car_id = 1 WHERE member_id = 1;
UPDATE MEMBER
SET car_id = 2 WHERE member_id = 2;
UPDATE MEMBER
SET car_id = 3 WHERE member_id = 3;


/* Update the Movie table by setting the car_id and the location_id for each movie */
UPDATE MOVIE
SET car_id = 1, location_id = 1 WHERE movie_id = 1;
UPDATE MOVIE
SET car_id = 2, location_id = 2 WHERE movie_id = 2;
UPDATE MOVIE
SET car_id = 3, location_id = 3 WHERE movie_id = 3;

/* Create a view from the Character table to concatenate character names into character_full_name attribute*/
CREATE VIEW concat_names AS
SELECT CONCAT(first_name, ' ', last_name) AS character_full_name, member_id, car_id
FROM MEMBER
WHERE first_name IS NOT NULL AND last_name IS NOT NULL;

/* Create an index on the movie_name field */
CREATE INDEX movie_index
ON MOVIE (movie_name);

/* Create a SFW query for Location table */
SELECT * FROM LOCATION
WHERE country = 'Toykyo'