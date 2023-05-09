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
