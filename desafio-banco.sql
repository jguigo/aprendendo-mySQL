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