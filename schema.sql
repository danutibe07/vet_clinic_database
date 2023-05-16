-- PROJECT ONE
CREATE TABLE animals (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal,
    primary key(id)
);


-- PROJECT TWO
ALTER TABLE animals ADD COLUMN species varchar(100);

--PROJECT THREE
--CREATING THE OWNERS TABLE
CREATE TABLE owners (
    id int GENERATED ALWAYS AS IDENTITY,
    fullname varchar(100),
    age varchar(100),
    primary key(id)
);
--CREATING THE SPECIES TABLE
CREATE TABLE species (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    primary key(id)
);

--Deleting the species column
ALTER TABLE animals
DROP COLUMN species;

-- Add column species_id as a foreign key referencing the species table to the animals table
ALTER TABLE animals
ADD COLUMN species_id INT,
ADD CONSTRAINT fk_animals_species
FOREIGN KEY (species_id) REFERENCES species(id);

-- Add column owner_id as a foreign key referencing the owners table to the animals table
ALTER TABLE animals
ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_animals_owners
FOREIGN KEY (owner_id) REFERENCES owners(id);

--PROJECT FOUR
--CREATING THE VETS TABLE
CREATE TABLE vets (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    age int,
    date_of_graduation date,
    primary key(id)
);

-- Create table specializations
CREATE TABLE specializations (
  id int GENERATED ALWAYS AS IDENTITY,
  species_id int REFERENCES species(id),
  vets_id int REFERENCES vets(id),
  primary key(id)
);

-- Create table visits
CREATE TABLE visits (
  id int GENERATED ALWAYS AS IDENTITY,
  animals_id int REFERENCES animals(id),
  vets_id int REFERENCES vets(id),
  visit_date date,
  primary key(id)
);