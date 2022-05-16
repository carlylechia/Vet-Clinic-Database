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
SELECT vets.name AS vet_name, specializations.species_id AS specialty, visits.animal_id AS animals_visited, animals.species_id, COUNT(animals.species_id) AS unspecialized_visits FROM vets LEFT JOIN specializations ON specializations.vet_id = vets.id JOIN visits ON visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id WHERE specializations.species_id IS NULL OR specializations.species_id <> animals.species_id AND vets.name NOT LIKE 'Stephanie Mendez' GROUP BY vets.name, specializations.species_id, visits.animal_id, animals.species_id ORDER BY unspecialized_visits;
--     vet_name     | specialty | animals_visited | species_id | unspecialized_visits 
-- -----------------+-----------+-----------------+------------+----------------------
--  William Tatcher |         1 |               6 |          2 |                    1
--  William Tatcher |         1 |               1 |          2 |                    1
--  Jack Harkness   |         2 |               5 |          1 |                    1
--  Maisy Smith     |           |               6 |          2 |                    2
--  Maisy Smith     |           |               3 |          1 |                    3
--  Maisy Smith     |           |               9 |          2 |                    4
SELECT species.name AS expected_specialty FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(DISTINCT animals.name) DESC LIMIT 1;
--  expected_specialty 
-- --------------------
--  Digimon

explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;
-- Finalize Aggregate  (cost=170348.29..170348.30 rows=1 width=8) (actual time=1000.501..1003.884 rows=1 loops=1)
--    ->  Gather  (cost=170348.08..170348.29 rows=2 width=8) (actual time=1000.251..1003.862 rows=3 loops=1)
--          Workers Planned: 2
--          Workers Launched: 2
--          ->  Partial Aggregate  (cost=169348.08..169348.09 rows=1 width=8) (actual time=981.041..981.043 rows=1 loops=3)
--                ->  Parallel Seq Scan on visits  (cost=0.00..167854.46 rows=597446 width=0) (actual time=0.082..917.412 rows=479238 loops=3)
--                      Filter: (animal_id = 4)
--                      Rows Removed by Filter: 4792380
--  Planning Time: 0.070 ms
--  Execution Time: 1003.925 ms
CREATE INDEX idx_animal_id ON visits(animal_id);
ANALYZE;
explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;
-- Finalize Aggregate  (cost=24255.56..24255.56 rows=1 width=8) (actual time=118.215..119.605 rows=1 loops=1)
--    ->  Gather  (cost=24255.34..24255.55 rows=2 width=8) (actual time=118.048..119.596 rows=3 loops=1)
--          Workers Planned: 2
--          Workers Launched: 2
--          ->  Partial Aggregate  (cost=23255.34..23255.35 rows=1 width=8) (actual time=107.662..107.662 rows=1 loops=3)
--                ->  Parallel Index Only Scan using idx_animal_id on visits  (cost=0.43..21750.19 rows=602062 width=0) (actual time=0.151..70.470 rows=479238 loops=3)
--                      Index Cond: (animal_id = 4)
--                      Heap Fetches: 0
--  Planning Time: 0.389 ms
--  Execution Time: 119.881 ms
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
-- Seq Scan on visits  (cost=0.00..283171.65 rows=3877274 width=12) (actual time=1.745..1251.164 rows=3953717 loops=1)
--    Filter: (vet_id = 2)
--    Rows Removed by Filter: 11861135
--  Planning Time: 0.101 ms
--  Execution Time: 1463.933 ms
CREATE INDEX idx_vet_id_asc ON visits (vet_id ASC);
ANALYZE;
EXPLAIN ANALYZE SELECT * FROM visits WHERE vet_id = 2;
-- Finalize Aggregate  (cost=63890.91..63890.92 rows=1 width=8) (actual time=314.925..318.087 rows=1 loops=1)
--    ->  Gather  (cost=63890.70..63890.91 rows=2 width=8) (actual time=314.693..318.078 rows=3 loops=1)
--          Workers Planned: 2
--          Workers Launched: 2
--          ->  Partial Aggregate  (cost=62890.70..62890.71 rows=1 width=8) (actual time=302.808..302.809 rows=1 loops=3)
--                ->  Parallel Index Only Scan using idx_vet_id_asc on visits  (cost=0.43..58820.02 rows=1628271 width=0) (actual time=0.064..187.248 rows=1317906 loops=3)
--                      Index Cond: (vet_id = 2)
--                      Heap Fetches: 0
--  Planning Time: 0.096 ms
--  Execution Time: 320.371 ms
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
--  Gather  (cost=1000.00..142496.07 rows=4 width=43) (actual time=9.378..3144.924 rows=4 loops=1)
--    Workers Planned: 2
--    Workers Launched: 2
--    ->  Parallel Seq Scan on owners  (cost=0.00..141495.67 rows=2 width=43) (actual time=1831.858..3133.374 rows=1 loops=3)
--          Filter: ((email)::text = 'owner_18327@mail.com'::text)
--          Rows Removed by Filter: 3333334
--  Planning Time: 2.373 ms
--  Execution Time: 3144.978 ms
CREATE INDEX idx_email ON owners (email);
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
-- Index Scan using idx_email on owners  (cost=0.43..20.44 rows=4 width=43) (actual time=2.942..2.997 rows=4 loops=1)
--    Index Cond: ((email)::text = 'owner_18327@mail.com'::text)
--  Planning Time: 0.597 ms
--  Execution Time: 3.018 ms
