CREATE TABLE animals (
    id int GENERATED ALWAYS AS IDENTITY,
    name string(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal,
    primary key(id)
);