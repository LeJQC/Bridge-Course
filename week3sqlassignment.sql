-- Week 3 SQL Assignment: Project: Building a Relational Database Management System
-- Jian Quan Chen

CREATE DATABASE KEYCARD;
USE KEYCARD;

CREATE TABLE Users (
	user_id INT,
    user_name VARCHAR(255) NOT NULL,
    group_id INT,
    PRIMARY KEY (user_id)
);

CREATE TABLE Groups_info (
	group_id INT,
    group_name VARCHAR(255),
    PRIMARY KEY (group_id)
);

CREATE TABLE Rooms (
	room_id INT,
    room_name VARCHAR(255),
    PRIMARY KEY (room_id)
);

CREATE TABLE Group_room (
	group_id INT,
    room_id INT,
    PRIMARY KEY (group_id, room_id),
    FOREIGN KEY (group_id) REFERENCES Groups_info(group_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

INSERT INTO Users (user_id, user_name, group_id) VALUES
  (1, 'Modesto', 1),
  (2, 'Ayine', 1),
  (3, 'Christopher', 2),
  (4, 'Cheong woo', 2),
  (5, 'Saulat', 3),
  (6, 'Heidy', NULL);

SELECT * FROM Users;

INSERT INTO Groups_info (group_id, group_name) VALUES
	(1, 'I.T.'),
	(2, 'Sales'),
	(3, 'Administration'),
	(4, 'Operations');

SELECT * FROM Groups_info;

INSERT INTO Rooms (room_id, room_name) VALUES
	(1, '101'),
	(2, '102'),
	(3, 'Auditorium A'),
	(4, 'Auditorium B');
    
SELECT * FROM Rooms;

INSERT INTO Group_room (group_id, room_id) VALUES
	(1, 1),
    (1, 2),
    (2, 2),
    (2, 3);

SELECT * FROM Group_room;

-- All groups, and the users in each group. A group should appear even if there are no users assigned to the group.

SELECT group_name, user_name 
FROM Groups_info g
LEFT JOIN Users u
	ON g.group_id = u.group_id;
    
-- All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been assigned to them

SELECT room_name, group_name 
FROM Rooms r
LEFT JOIN Group_room gr
	ON r.room_id = gr.room_id
LEFT JOIN Groups_info g
	on gr.group_id = g.group_id;

-- • A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted alphabetically by user, then by group, then by room.

SELECT user_name, group_name, room_name
FROM Users u
LEFT JOIN Groups_info g
	ON u.group_id = g.group_id
LEFT JOIN Group_room gr
	ON gr.group_id = g.group_id
LEFT JOIN Rooms r
	ON gr.room_id = r.room_id
ORDER BY u.user_name, g.group_name ,r.room_name;
    


    