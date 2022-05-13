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

SELECT A1.name, A1.owner_id FROM animals A1 WHERE A1.owner_id = 4;
--     name    | owner_id 
-- ------------+----------
--  Blossom    |        4
--  Charmander |        4
--  Squirtle   |        4

SELECT animals.name, species.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
--    name    |  name   
-- ------------+---------
--  Pikachu    | Pokemon
--  Blossom    | Pokemon
--  Charmander | Pokemon
--  Squirtle   | Pokemon
--  Ditto      | Pokemon
SELECT owners.full_name, animals.name FROM owners LEFT OUTER JOIN animals ON owners.id = animals.owner_id;
--     full_name    |    name    
-- -----------------+------------
--  Sam Smith       | Agumon
--  Jennifer Orwell | Gabumon
--  Jennifer Orwell | Pikachu
--  Bob             | Plantmon
--  Bob             | Devimon
--  Melody Pond     | Squirtle
--  Melody Pond     | Charmander
--  Melody Pond     | Blossom
--  Dean Winchester | Angemon
--  Dean Winchester | Boarmon
--  Jodie Whittaker | 
SELECT species.name, COUNT(animals.name) FROM animals RIGHT JOIN species ON animals.species_id = species.id GROUP BY species.name;
--   name   | count 
-- ---------+-------
--  Pokemon |     5
--  Digimon |     6
SELECT animals.name, species.name FROM animals INNER JOIN species ON animals.species_id=species.id WHERE animals.owner_id = 2 AND animals.species_id = 2;
--   name   |  name   
-- ---------+---------
--  Gabumon | Digimon
SELECT owners.full_name, animals.name, animals.escape_attempts FROM owners LEFT JOIN animals ON owners.id = animals.owner_id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
--  full_name | name | escape_attempts 
-- -----------+------+-----------------
SELECT owners.full_name, COUNT(animals.name) FROM owners JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT DESC;
--     full_name    | count 
-- -----------------+-------
--  Melody Pond     |     3
--  Dean Winchester |     2
--  Bob             |     2
--  Jennifer Orwell |     2
--  Sam Smith       |     1

SELECT animals.name, visits.visit_date FROM animals INNER JOIN visits ON animals.id = visits.animal_id WHERE visits.vet_id = 1 ORDER BY visits.visit_date DESC;
--    name   | visit_date 
-- ----------+------------
--  Blossom  | 2021-01-11
--  Plantmon | 2020-08-10
--  Agumon   | 2020-05-24
SELECT COUNT(animal_id) FROM visits WHERE vet_id = 3;
--  count 
-- -------
--      4
SELECT vets.name, specializations.species_id FROM vets LEFT JOIN specializations ON vets.id = specializations.vet_id;
--        name       | species_id 
-- ------------------+------------
--  William Tatcher  |          1
--  Stephanie Mendez |          2
--  Stephanie Mendez |          1
--  Jack Harkness    |          2
--  Maisy Smith      |           
SELECT animals.name, visits.visit_date FROM animals JOIN visits ON animals.id = visits.animal_id WHERE visits.vet_id = 3 AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';
--   name   | visit_date 
-- ---------+------------
--  Agumon  | 2020-07-22
--  Blossom | 2020-05-24
SELECT animals.name, COUNT(visits.animal_id) FROM animals LEFT JOIN visits ON animals.id = visits.animal_id GROUP BY animals.name ORDER BY COUNT DESC;
--     name    | count 
-- ------------+-------
--  Boarmon    |     4
--  Plantmon   |     3
--  Pikachu    |     3
--  Blossom    |     2
--  Agumon     |     2
--  Angemon    |     2
--  Devimon    |     1
--  Charmander |     1
--  Squirtle   |     1
--  Gabumon    |     1
--  Ditto      |     0
SELECT animals.name, visits.visit_date FROM animals INNER JOIN visits ON animals.id = visits.animal_id WHERE visits.vet_id = 2 ORDER BY visits.visit_date ASC;
--    name   | visit_date 
-- ----------+------------
--  Boarmon  | 2019-01-24
--  Boarmon  | 2019-05-15
--  Plantmon | 2019-12-21
--  Pikachu  | 2020-01-05
--  Boarmon  | 2020-02-27
--  Pikachu  | 2020-03-08
--  Pikachu  | 2020-05-14
--  Boarmon  | 2020-08-03
--  Plantmon | 2021-04-07
SELECT * FROM visits ORDER BY visit_date DESC;
--  animal_id | vet_id | visit_date 
-- -----------+--------+------------
--          4 |      3 | 2021-05-04
--          6 |      2 | 2021-04-07
--          5 |      4 | 2021-02-24
--          2 |      4 | 2021-02-02
--         10 |      1 | 2021-01-11
--          8 |      4 | 2020-11-04
--          8 |      4 | 2020-10-03
--          6 |      1 | 2020-08-10
--          9 |      2 | 2020-08-03
--          1 |      3 | 2020-07-22
--          1 |      1 | 2020-05-24
--         10 |      3 | 2020-05-24
--          3 |      2 | 2020-05-14
--          3 |      2 | 2020-03-08
--          9 |      2 | 2020-02-27
--          3 |      2 | 2020-01-05
--          6 |      2 | 2019-12-21
--          7 |      3 | 2019-09-29
--          9 |      2 | 2019-05-15
--          9 |      2 | 2019-01-24
SELECT vets.name, COUNT(vets.name) AS num_of_visits FROM vets LEFT JOIN specializations ON vets.id = specializations.vet_id JOIN visits ON vets.id = visits.vet_id WHERE specializations.species_id IS NULL GROUP BY vets.name ORDER BY COUNT(vets.name) DESC;

SELECT species.name AS expected_specialty FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(DISTINCT animals.name) DESC LIMIT 1;
--  expected_specialty 
-- --------------------
--  Digimon
