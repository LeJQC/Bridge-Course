-- Assignment: SQL Select and Aggregations
-- Jian Quan Chen


-- 1. Which destination in the flights database is the furthest distance away, based on information in the flights table.
-- Show the SQL query(s) that support your conclusion.
-- HNL
SELECT dest FROM flights
ORDER BY distance DESC
LIMIT 1;


-- 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have
-- the most number of seats? Show the SQL statement(s) that support your result.
-- There are engines 1, 2, 3, and 4 in the planes table. 
-- Aircraft with the most seats. For engine 1: N201AA, for engine 2: N10156, for engine 3: N854NW, for engine 4: N281AT
SELECT tailnum, engines, MAX(seats) FROM planes
GROUP BY engines;


-- 3. Show the total number of flights.
-- 857 flights 
SELECT count(flight) FROM flights;


-- 4. Show the total number of flights by airline (carrier).
SELECT carrier, count(carrier) FROM flights
GROUP BY carrier;


-- 5. Show all of the airlines, ordered by number of flights in descending order.
SELECT carrier, count(carrier) AS total_flights FROM flights
GROUP BY carrier
ORDER BY total_flights DESC;


-- 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
SELECT carrier, count(carrier) AS total_flights FROM flights
GROUP BY carrier
ORDER BY total_flights DESC
LIMIT 5;

-- 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
-- flights in descending order.
SELECT carrier, count(distance) FROM flights
WHERE distance >= 1000 
GROUP BY carrier 
ORDER BY count(distance) DESC
LIMIT 5;


-- 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and
-- write down both the question, and the query that answers the question.
-- What is the average distance of a UA flight?
SELECT avg(distance) FROM flights
WHERE carrier = "UA"

