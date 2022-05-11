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
