/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT * FROM animals WHERE neutered is true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IS true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

SELECT COUNT(*) FROM animals;
-- 11
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
--  2
SELECT AVG(weight_kg) FROM animals;
-- 16.1363636363636364
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;
--  f        | 1.3333333333333333
--  t        | 3.0000000000000000
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
-- species | max | min 
-- ---------+-----+-----
--  pokemon |  22 |  11
--  digimon |  45 | 5.7
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;
-- species |        avg         
-- ---------+--------------------
--  pokemon | 3.0000000000000000
