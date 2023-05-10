--PROJECT ONE
-- Find all animals whose name ends in "mon"
SELECT * from animals WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019
SELECT name from animals WHERE date_of_birth >= '2016,01,01'::date AND date_of_birth <= '2019,12,31';

-- List the name of all animals that are neutered and have less than 3 escape attempts
SELECT name from animals WHERE neutered is TRUE AND escape_attempt < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu"
SELECT date_of_birth from animals WHERE name IN ('Agumon','Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempt from animals WHERE weight_kg > 10.5;

-- Find all animals that are neutered
SELECT * from animals WHERE neutered is TRUE;

-- Find all animals not named Gabumon
SELECT * from animals WHERE name NOT IN ('Gabumon');

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

--PROJECT TWO
BEGIN; -- Start the transaction
-- Update the column
UPDATE animal
SET species = 'unspecified';
-- Check the updated values
SELECT * FROM animal;
ROLLBACK; -- Rollback the transaction

--2
-- setting the species column to digimon for all animals that have a name ending in mon
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
--setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

--3
--Deleting the entire table then rolling back the action 
BEGIN WORK; 
DELETE FROM animals;
SELECT * from animals;
ROLLBACK WORK;

--4
-- begin transaction
BEGIN ; 
-- Delete all animals born after Jan 1st, 2022
DELETE FROM animals WHERE date_of_birth > '2022,01,01'::date;
-- Create a savepoint for the transaction
SAVEPOINT FirstSave; 
-- Update all animals' weight to be their weight multiplied by -1
update animals SET weight_kg = weight_kg * -1;
-- Rollback to the savepoint
ROLLBACK TO FirstSave;
-- Update all animals' weights that are negative to be their weight multiplied by -1
update animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
-- Commit transaction;
COMMIT WORK;

--/queries/
-- How many animals are there?
SELECT COUNT(*) FROM animals; 
-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, SUM(escape_attempts) AS total_escape_attempts
FROM animals
GROUP BY neutered;
-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg) AS min_weight, Max(weight_kg) AS max_weight 
FROM animals
GROUP By species; 
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) AS total_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990,01,01'::date AND '2000,12,31'
GROUP By species; 


--PROJECT 3
-- What animals belong to Melody Pond?
SELECT * FROM animals JOIN owners ON owners.id = animals.owner_id AND owners.fullname='Melody Pond'; 
-- List of all animals that are pokemon (their type is Pokemon).
SELECT * FROM animals JOIN species ON species.id = animals.species_id AND species.name='Pokemon';
-- List all owners and their animals, remember to include those that don't own any animal.
SELECT fullname , name From owners Left JOIN animals ON animals.owner_id=owners.id;
-- How many animals are there per species?
SELECT species.name , COUNT(animals.name) AS Animals_Count From species JOIN animals ON species.id=animals.species_id GROUP BY species.name; 
-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name, owners.fullname  from animals  JOIN owners  ON (animals.owner_id=owners.id AND owners.fullname = 'Jennifer Orwell') JOIN species ON (animals.species_id=species.id AND species.name='Digimon'); 
-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT owners.fullname, animals.name FROM owners JOIN animals ON animals.owner_id=owners.id AND animals.escape_attempt = 0 WHERE owners.fullname = 'Dean Winchester';
-- Who owns the most animals?
SELECT owners.fullname , COUNT(animals.name) AS Animals_Count From owners JOIN animals ON owners.id=animals.owner_id GROUP BY owners.fullname ORDER BY Animals_Count DESC; 
