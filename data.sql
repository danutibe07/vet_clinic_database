--PROJECT ONE
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Agumon','2020-02-03',true,10.23,0);
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Gabumon','2018-11-15',true,8,0);
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Pikachu','2021-01-07',false,15.04,0);
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Devimon','2017-05-12',true,11,0);

--PROJECT TWO
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Charmander','2020-02-08',false,-11,0);
INSERT INTO animals (name,date_of_birth,neutered,weight_kg,escape_attempts) VALUES ('Plantmon','2021-11-15',true,-5.7,2);
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

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

update animals SET species_id = 1 WHERE name NOT LIKE '%mon'; 
update animals SET species_id = 2 WHERE name LIKE '%mon';

update animals SET owner_id = 1 WHERE name = 'Agumon'; 
update animals SET owner_id = 2 WHERE (name = 'Gabumon' OR name = 'Pikachu'); 
update animals SET owner_id = 3 WHERE (name = 'Devimon' OR name = 'Plantmon'); 
update animals SET owner_id = 4 WHERE (name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom'); 
update animals SET owner_id = 5 WHERE (name = 'Angemon' OR name = 'Boarmon'); 

--PROJECT 4
INSERT INTO vets (fullname,age, date_of_graduation) VALUES ('William Tatcher', 45 , '2000-04-23');
INSERT INTO vets (fullname,age, date_of_graduation) VALUES ('Maisy Smith', 26 , '2019-01-17');
INSERT INTO vets (fullname,age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (fullname,age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (species_id, vets_id) VALUES ((SELECT id FROM species WHERE name='Pokemon'),(SELECT id FROM vets WHERE name ='William Tatcher'));
INSERT INTO specializations (species_id, vets_id) VALUES ((SELECT id FROM species WHERE name='Digimon'),(SELECT id FROM vets WHERE name ='Stephanie Mendez'));
INSERT INTO specializations (species_id, vets_id) VALUES ((SELECT id FROM species WHERE name='Pokemon'),(SELECT id FROM vets WHERE name ='Stephanie Mendez'));
INSERT INTO specializations (species_id, vets_id) VALUES ((SELECT id FROM species WHERE name='Digimon'),(SELECT id FROM vets WHERE name ='Jack Harkness'));



-- Agumon visited William Tatcher on May 24th, 2020.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Agumon'),(SELECT id FROM vets WHERE name ='William Tatcher'), ('2020-05-24'));
-- Agumon visited Stephanie Mendez on Jul 22th, 2020.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Agumon'),(SELECT id FROM vets WHERE name ='Stephanie Mendez'), ('2020-07-22'));
-- Gabumon visited Jack Harkness on Feb 2nd, 2021.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Gabumon'),(SELECT id FROM vets WHERE name ='Jack Harkness') , ('2021-02-02'));
-- Pikachu visited Maisy Smith on Jan 5th, 2020.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Pikachu'),(SELECT id FROM vets WHERE name ='Maisy Smith'), ('2020-01-05'));
-- Pikachu visited Maisy Smith on Mar 8th, 2020.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Pikachu'),(SELECT id FROM vets WHERE name ='Maisy Smith'),('2020-03-08'));
-- Pikachu visited Maisy Smith on May 14th, 2020.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Pikachu'),(SELECT id FROM vets WHERE name ='Maisy Smith'),('2020-05-14'));
-- Devimon visited Stephanie Mendez on May 4th, 2021.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Devimon'),(SELECT id FROM vets WHERE name ='Stephanie Mendez'),('2021-05-04'));
-- Charmander visited Jack Harkness on Feb 24th, 2021.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Charmander'),(SELECT id FROM vets WHERE name ='Jack Harkness'), ('2021-02-24'));
-- Plantmon visited Maisy Smith on Dec 21st, 2019.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Plantmon'),(SELECT id FROM vets WHERE name ='Maisy Smith'),('2019-12-21'));
-- Plantmon visited William Tatcher on Aug 10th, 2020.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Plantmon'),(SELECT id FROM vets WHERE name ='William Tatcher') , ('2020-08-10'));
-- Plantmon visited Maisy Smith on Apr 7th, 2021.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Plantmon'),(SELECT id FROM vets WHERE name ='Maisy Smith'),  ('2021-04-07') );
-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Squirtle'),(SELECT id FROM vets WHERE name ='Stephanie Mendez'), ('2019-09-29'));
-- Angemon visited Jack Harkness on Oct 3rd, 2020.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Angemon'),(SELECT id FROM vets WHERE name ='Jack Harkness'), ('2020-10-03'));
-- Angemon visited Jack Harkness on Nov 4th, 2020.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Angemon'),(SELECT id FROM vets WHERE name ='Jack Harkness'),('2020-11-04'));
-- Boarmon visited Maisy Smith on Jan 24th, 2019.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Boarmon'),(SELECT id FROM vets WHERE name ='Maisy Smith'), ('2019-01-24'));
-- Boarmon visited Maisy Smith on May 15th, 2019.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Boarmon'),(SELECT id FROM vets WHERE name ='Maisy Smith'),('2019-05-15'));
-- Boarmon visited Maisy Smith on Feb 27th, 2020.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Boarmon'),(SELECT id FROM vets WHERE name ='Maisy Smith'),('2020-02-27'));
-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Boarmon'),(SELECT id FROM vets WHERE name ='Maisy Smith'), ('2020-08-03'));
-- Blossom visited Stephanie Mendez on May 24th, 2020.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Blossom'),(SELECT id FROM vets WHERE name ='Stephanie Mendez'),('2020-05-24'));
-- Blossom visited William Tatcher on Jan 11th, 2021.
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES ((SELECT id FROM animals WHERE name='Blossom'),(SELECT id FROM vets WHERE name ='William Tatcher'), ('2021-01-11'));


