CREATE TABLE pets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  owner_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE --****let the database know that our owner_id references the id of the users table.
);
--Adding ON DELETE CASCADE to a foreign key ensures that the row will be deleted when the thing it is referencing is deleted.

CREATE TABLE users (
  id SERIAL PRIMARY KEY, --SERIAL is not a real type, just a convenience for creating a unique INTEGER column
  -- id INTEGER PRIMARY KEY NOT NULL, -- number
  name VARCHAR(255) NOT NULL, -- string
  birth_year SMALLINT NOT NULL, -- smaller number
  member_since TIMESTAMP NOT NULL DEFAULT Now() -- *****time stamp
);

INSERT INTO users (id, name, birth_year, member_since)  --without DEFAULT NOW() in create table
VALUES (1, 'Susan Hudson', 2000, Now()); --without DEFAULT NOW() in create table

INSERT INTO users (name, birth_year) --with DEFAULT NOW() in create table
VALUES ('Susan Hudson', 2000),
('Malloy Jenkins', 1000);

--Alter the member_since column to include the new default value.
ALTER TABLE users 
ALTER COLUMN member_since 
SET DEFAULT Now();

ALTER TABLE users
ADD COLUMN name VARCHAR(255), 
ADD COLUMN  birth_year SMALLINT, 
ADD COLUMN  member_since TIMESTAMP;

--ALTER TABLE statement to modify the structure of a table:
--https://www.postgresqltutorial.com/postgresql-alter-table/

ALTER TABLE table_name 
ADD COLUMN column_name datatype column_constraint;

ALTER TABLE table_name 
DROP COLUMN column_name;

ALTER TABLE table_name 
RENAME COLUMN column_name 
TO new_column_name;

DROP TABLE users;

DROP TABLE users CASCADE; 
--CASCADE make sure that all records from other tables that depend on the table will also be deleted

DROP TABLE IF EXISTS users CASCADE;
--make sure the table exists before dropping

DELETE FROM users WHERE id = 1;
--Always include a WHERE clause when deleting.

--The UPDATE and DELETE are the most dangerous queries because they change or remove data.
--Never write an UPDATE or DELETE query without a WHERE clause.
UPDATE CUSTOMERS
SET ADDRESS = 'Pune'
WHERE ID = 6;

UPDATE CUSTOMERS
SET ADDRESS = 'Pune', SALARY = 1000.00;


DROP TABLE your_table_name_here IF EXISTS CASCADE;
--To run a schema file against a database, make sure you are in the correct directory first. For example, here is how you would run the command from your project's root directory:

\i migrations/01_schema.sql

-- make sure all of the tables exist in the database \dt.


SELECT users.id as id, 
--Show all reservations for a user.
