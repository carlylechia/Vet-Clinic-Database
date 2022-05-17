/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer, name varchar(50), date_of_birth date, escape_attempts integer, neutered boolean, weight_kg decimal
);

ALTER TABLE animals ADD species varchar(50);

CREATE TABLE owners(id integer GENERATED ALWAYS AS IDENTITY, full_name varchar(100), age integer, PRIMARY KEY (ID));
CREATE TABLE species(id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY, name varchar(50));
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id integer;
ALTER TABLE animals ADD CONSTRAINT FK_animalspecies FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD owner_id integer;
ALTER TABLE animals ADD CONSTRAINT FK_animalowners FOREIGN KEY(owner_id) REFERENCES owners(id);

CREATE TABLE vets(id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, name VARCHAR(100), age INT, date_of_graduation date);
CREATE TABLE specializations(vet_id INT, species_id INT, FOREIGN KEY(vet_id) REFERENCES vets(id), FOREIGN KEY(species_id) REFERENCES species(id));
CREATE TABLE visits(animal_id integer, vet_id integer, visit_date date, FOREIGN KEY(animal_id) REFERENCES animals(id), FOREIGN KEY(vet_id) REFERENCES vets(id));

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
-- Add an index on the animal_id culumn in the visits table to optimize performance.
CREATE INDEX idx_animal_id ON visits(animal_id);
-- Add an index on the vet_id culumn in the visits table to optimize performance.
CREATE INDEX idx_vet_id_asc ON visits (vet_id ASC);
-- Add an index on the email culumn in the owners table to optimize performance.
CREATE INDEX idx_email ON owners (email);
