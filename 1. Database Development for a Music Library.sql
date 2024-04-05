-- Objective:
-- The aim of this assignment is to apply foundational knowledge of Data Definition Language (DDL) to create,
--  modify, and manage a music library database. This involves establishing table structures, defining 
--  relationships, and ensuring data integrity for storing information about albums, artists, and genres.

-- Task 1: SQL Table Creation

--     Problem Statement: You need to create tables named Albums, Genre, and Artists that will store 
--     information about music. The Albums table should include columns for album ID, title, artist ID, 
--     genre ID, release year, and total tracks. You have to decide what data should be included in the Genre and Artist tables.
--     Expected Outcome: Tables are successfully created through DDL statements.

CREATE TABLE Albums(
    album_ID INT AUTO_INCREMENT PRIMARY KEY,
    album_title VARCHAR(250) NOT NULL,
    artist_ID INT NOT NULL,
    genre_ID INT NOT NULL,
    release_year DATE NOT NULL,
    total_tracks INT
);

CREATE TABLE Genre(
    genre_ID INT AUTO_INCREMENT PRIMARY KEY,
    genre_title VARCHAR (100) NOT NULL
); 

CREATE TABLE Artists(
    artist_ID INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL
);


-- Task 2: SQL Alteration

--     Problem Statement: After creating the Albums table, you realize that you need to add a column 
--     for the album's total duration in minutes.
--     Expected Outcome: The Albums table is successfully modified to include a new column duration 
--     for the total duration of the album.

ALTER TABLE Albums 
ADD total_dur_min INT NOT NULL;

-- Task 3: SQL Foreign Key Establishment

--     Problem Statement: Establish a relationship between the Albums table and the Artists and Genre 
--     tables (assuming the Artists and Genre tables exist with an id column). Ensure that each album 
--     is linked to an existing artist and genre in the Artists and Genre table respectively.
--     Expected Outcome: Foreign key constraints are successfully added to the Albums table ensuring 
--     referential integrity between the tables.

ALTER TABLE Albums ADD CONSTRAINT fk_artist_ID FOREIGN KEY (artist_ID) REFERENCES Artists(artist_ID);
ALTER TABLE Albums ADD CONSTRAINT fk_genre_ID FOREIGN KEY (genre_ID) REFERENCES Genre(genre_ID);