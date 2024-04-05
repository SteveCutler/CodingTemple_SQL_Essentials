-- Objective:
-- This assignment is centered around Data Manipulation Language (DML) operations in a fitness 
-- center database. You will be working on inserting, updating, and deleting data related to gym 
-- members, trainers, and workout sessions, emphasizing the practical application of SQL DML commands in a real-world scenario.

-- Members Table Structure:

-- had to add members table for code to run properly
CREATE TABLE Members (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT,
    trainer_id INT,
    FOREIGN KEY (trainer_id) REFERENCES Trainers(id)
);

-- WorkoutSessions Table Structure

CREATE TABLE WorkoutSessions (
    session_id INT PRIMARY KEY,
    member_id INT,
    session_date DATE,
    session_time VARCHAR(50),
    activity VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

CREATE TABLE Trainers (
    id INT PRIMARY KEY,
    trainer_first_name VARCHAR(50) NOT NULL,
    trainer_last_name VARCHAR(50) NOT NULL,
);
-- Task 1: SQL Data Insertion

--     Problem Statement: Your task is to populate the Members and WorkoutSessions tables with relevant data. 
--     This will involve inserting records into both tables while ensuring data integrity and consistency.
--     Expected Outcome: New member records are successfully added to the Members table with their respective details.

INSERT INTO Trainers (id, trainer_first_name, trainer_last_name)
VALUES (1, "Eric","Bronstein"),
		(2, "Sara","Toffer"),
        (3, "Bill", "Baxter");
        
INSERT INTO Members (id, name, age, trainer_id)
VALUE (1, "Terrence Malick", 34, 2),
	(2,"Nestor Almendros", 56, 3),
    (3, "Wim Wenders", 73, 1);
        
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity)
VALUES (1, 3, "2024-12-12", "10:00AM", "swimming"),
		(2, 1, "2023-04-28", "2:00PM", "weight lifting"),
        (3, 2, "2024-11-17", "7:00AM", "running");


-- Task 2: SQL Data Update

--     Problem Statement: Update the workout session time for a specific member. Assume member 'Jane Doe' has 
--     changed her workout session from morning to evening.
--     Expected Outcome: The WorkoutSessions table is successfully updated to reflect the new session time for Jane Doe.


INSERT INTO Members (id, name, age, trainer_id)
VALUE (4, "Jane Doe", 23, 1);

INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity)
VALUES (4, 4, "2024-01-23", "10:00PM", "stationary bike");


UPDATE WorkoutSessions
SET session_time = "10:00AM"
WHERE member_id = 4;


-- Task 3: SQL Data Deletion

--     Problem Statement: Remove data of a member who has canceled their gym membership. Assume member 'John Smith' 
--     has canceled his membership.
--     Expected Outcome: John Smith's record is successfully removed from the Members table, reflecting his cancellation
--      of the gym membership.

INSERT INTO Members (id, name, age, trainer_id)
VALUE (5, "John Smith", 44, 2);

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Members
WHERE name = "John Smith";
SET SQL_SAFE_UPDATES = 1;
