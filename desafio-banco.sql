-- 1
SELECT * FROM movie;

-- 2
INSERT INTO language VALUES (null, 'BR', 'Português(Brasil)');

-- 3
INSERT INTO production_company VALUES (2850, 'Lereby Produções');

-- 4
INSERT INTO movie(movie_id, title, release_date, overview, popularity, runtime, revenue) VALUES(
    null,
    'O Auto da Compadecida',
    2000-09-15,
    'As aventuras de João Grilo e Chicó, dois nordestinos pobres que vivem de golpes para sobreviver. Eles estão sempre enganando o povo de um pequeno vilarejo, inclusive o temido cangaceiro Severino de Aracaju, que os persegue pela região.',
    2.157166,
    157,
    11496994
);

INSERT INTO movie_company VALUE (459489, 2850);

INSERT INTO movie_languages VALUE (459489, 24702, 1);

INSERT INTO movie_genre VALUE (459489, 35);

-- 5
UPDATE language SET language_name = "desconhecido" where language_id = 24701;

-- 6
SELECT * FROM person WHERE person_name LIKE "%lee%";
-- validando quantidade de retornos da linha anterior
SELECT count(person_name) FROM person WHERE person_name LIKE "%lee%";

-- 7
SELECT * FROM movie WHERE runtime > 130;
-- validando quantidade de retornos da linha anterior... tem mais que os 388?!
SELECT count(runtime) FROM movie WHERE runtime > 130;

-- 8
SELECT movie.title AS "Filme", production_company.company_name AS "Produtora" FROM movie
    INNER JOIN movie_company ON movie.movie_id = movie_company.movie_id
    INNER JOIN production_company ON movie_company.company_id = production_company.company_id;

-- 9
SELECT movie.title AS "Filme - Fantasia" FROM movie
    INNER JOIN movie_genres ON movie.movie_id = movie_genres.movie_id
    INNER JOIN genre ON movie_genres.genre_id = genre.genre_id
    WHERE genre.genre_id = 14;
-- validando quantidade de retornos da linha anterior
SELECT count(movie.title) FROM movie
    INNER JOIN movie_genres ON movie.movie_id = movie_genres.movie_id
    INNER JOIN genre ON movie_genres.genre_id = genre.genre_id
    WHERE genre.genre_id = 14;

-- 10
SELECT * FROM movie WHERE revenue = (SELECT max(revenue) FROM movie);

-- 11
SELECT * FROM movie WHERE release_date < "1950-00-00";
-- validando quantidade de retornos da linha anterior
SELECT count(movie_id) FROM movie WHERE release_date < "1950-00-00";

-- 12
SELECT character_name AS "Personagens", person.person_name AS "Interpretado por" FROM movie_cast
    INNER JOIN person ON movie_cast.person_id = person.person_id
    WHERE person_name = "Tom Hanks";
-- validando quantidade de retornos da linha anterior
SELECT count(character_name) FROM movie_cast
    INNER JOIN person ON movie_cast.person_id = person.person_id
    WHERE person_name = "Tom Hanks";