-- Week 2 Assignment: SQL One to Many Relationships
-- 1. 1. Videos table. Create one table to keep track of the videos. This table should include a unique ID, the title of the
-- video, the length in minutes, and the URL. Populate the table with at least three related videos from YouTube or
-- other publicly available resources.

CREATE DATABASE Video_Tables;

CREATE TABLE videos (
	ID INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    length_in_minutes VARCHAR(255) NOT NULL,
    URL VARCHAR(255) NOT NULL,
    UNIQUE(ID)
);

INSERT INTO videos (ID, title, length_in_minutes, URL) VALUES (1, "MySQL Tutorial for Beginners [Full Course]", 190, "https://www.youtube.com/watch?v=7S_tz1z_5bA&t=1271s");
INSERT INTO videos (ID, title, length_in_minutes, URL) VALUES (2, "CS50 2022 - Lecture 7 - SQL", 161, "hhttps://www.youtube.com/watch?v=zrCLRC3Ci1c");
INSERT INTO videos (ID, title, length_in_minutes, URL) VALUES (3, "Intermediate SQL Tutorial | Having Clause", 3, "https://www.youtube.com/watch?v=tYBOMw7Ob8E");
INSERT INTO videos (ID, title, length_in_minutes, URL) VALUES (4, "Advanced SQL Tutorial | Subqueries", 8, "https://www.youtube.com/watch?v=m1KcNV-Zhmc");

SELECT * FROM videos;

CREATE TABLE reviewers (
	ID INT NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    rating INT,
    review VARCHAR(255) NOT NULL
);

INSERT INTO reviewers (ID, user_name, rating, review) VALUES (1, "Olivia", 5, "Awesome video!");
INSERT INTO reviewers (ID, user_name, rating, review) VALUES (1, "Emma", 5, "Great video!");
INSERT INTO reviewers (ID, user_name, rating, review) VALUES (2, "Leo", 3, "Video was confusing!");
INSERT INTO reviewers (ID, user_name, rating, review) VALUES (2, "Frank", 5, "Very comphresive lecture!");
INSERT INTO reviewers (ID, user_name, rating, review) VALUES (3, "Jenna", 5, "Great information!");
INSERT INTO reviewers (ID, user_name, rating, review) VALUES (3, "Ray", 5, "Short and concise!");
INSERT INTO reviewers (ID, user_name, rating, review) VALUES (4, "Tom", 2, "I am stil convfused!");
INSERT INTO reviewers (ID, user_name, rating, review) VALUES (4, "Cindy", 5, "Loved it!");

SELECT * FROM reviewers;

SELECT * 
FROM videos v
JOIN reviewers r
On v.ID = r.ID;
	
    