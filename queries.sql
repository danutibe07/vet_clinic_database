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
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';

--3
--Deleting the entire table then rolling back the action 
BEGIN; -- Start the transaction

-- Delete the "animals" table
DROP TABLE IF EXISTS animals;

-- Rollback the transaction
ROLLBACK;

