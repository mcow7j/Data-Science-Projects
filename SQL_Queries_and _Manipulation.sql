
--order of clauses
--SELECT
--FROM
--WHERE
--GROUP BY
--HAVING
--ORDER BY
--LIMIT

-- View Data
SELECT * FROM celebs;

SELECT name AS 'title'
FROM movies;

SELECT DISTINCT years, genre
FROM movies;

-- basic where clause
SELECT *
FROM movies
WHERE year > 2014;

-- like can be used with numeric data as well and is case sensitive
-- % is a wild card, begins or ends with that expression e. A%.
-- _ is a space
-- use \ to search for % or\ e.g \%
SELECT *
FROM movies
WHERE name LIKE 'Se_en';

-- select empty imbd ratings
SELECT name
FROM movies
WHERE imdb_rating IS  NULL;

-- selcts enrties with names staring letters from D to F plus sole entry 'G'
SELECT *
FROM movies
WHERE name BETWEEN 'D' AND 'G';

SELECT *
FROM movies
WHERE year BETWEEN 1970 AND 1979
  AND imdb_rating > 8;

--order by use DESC or ASC
  SELECT name, year
  FROM movies
  ORDER BY name;

-- If logic
  SELECT name,
   CASE
    WHEN genre = 'romance' THEN 'Chill'
    WHEN genre = 'comedy' THEN 'Chill'
    ELSE 'Intense'
   END AS 'Mood'
  FROM movies;


-- create tables
CREATE TABLE celebs (
   id INTEGER,
   name TEXT,
   age INTEGER
);


CREATE TABLE celebs (
   id INTEGER PRIMARY KEY, --unque attrribute
   name TEXT UNIQUE,
   date_of_birth TEXT NOT NULL,
   date_of_death TEXT DEFAULT 'Not Applicable'
);

-- add more rows
INSERT INTO celebs (id, name, age)
VALUES (1, 'Justin Bieber', 22);
VALUES (2, 'Beyonce Knowles', 33);
VALUES (3, 'Jeremy Lin', 26);
VALUES (4, 'Taylor Swift', 26);

-- alter table adds column
ALTER TABLE celebs
ADD COLUMN twitter_handle TEXT;


-- update values in rows
UPDATE celebs
SET twitter_handle = '@taylorswift13'
WHERE id = 4;

-- delte certain amount of rows
DELETE FROM table
WHERE condition
LIMIT 5;
