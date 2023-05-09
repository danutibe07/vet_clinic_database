--PROJECT ONE
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Agumon','2020-02-03',true,10.23,0);
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Gabumon','2018-11-15',true,8,0);
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Pikachu','2021-01-07',false,15.04,0);
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Devimon','2017-05-12',true,11,0);

--PROJECT TWO
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Charmander','2020-02-08',false,-11,0);
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Plantmon',);
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Squirtle','1993-04-02',false,-12.13,3);
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Angemon','2005-06-12',true,-45,1);
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Boarmon','2018-06-07',true,20.4,7);
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Blossom','1998-10-13',false,17,3);
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Ditto','2022-05-14',true,22,4);

--PROJECT THREE
INSERT INTO owners (fullname,age) VALUES ('Sam Smith', 34);
INSERT INTO owners (fullname,age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (fullname,age) VALUES ('Bob', 45);
INSERT INTO owners (fullname,age) VALUES ('Melody Pond', 77);
INSERT INTO owners (fullname,age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (fullname,age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name,age) VALUES ('Pokemon');
INSERT INTO species (name,age) VALUES ('Digimon');

update animals SET species_id = 1 WHERE name NOT LIKE '%mon'; 
update animals SET species_id = 2 WHERE name LIKE '%mon';

update animals SET owner_id = 1 WHERE name = 'Agumon'; 
update animals SET owner_id = 2 WHERE (name = 'Gabumon' OR name = 'Pikachu'); 
update animals SET owner_id = 3 WHERE (name = 'Devimon' OR name = 'Plantmon'); 
update animals SET owner_id = 4 WHERE (name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom'); 
update animals SET owner_id = 5 WHERE (name = 'Angemon' OR name = 'Boarmon'); 

