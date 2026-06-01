-- use sakila
-- -- KEYS IN MYSQL
-- -- PRIMARY KEY

-- -- A Primary Key uniquely identifies each record in a table.

-- -- View Primary Key Information
-- -- SHOW KEYS
-- -- FROM customer
-- -- WHERE Key_name = 'PRIMARY';
-- -- Example
SELECT customer_id,
       first_name,
       last_name
FROM customer
LIMIT 10;
-- FOREIGN KEY

-- Foreign Keys establish relationships between tables.

-- Find Foreign Keys in Rental Table
-- SELECT TABLE_NAME,
--        COLUMN_NAME,
--        CONSTRAINT_NAME,
--        REFERENCED_TABLE_NAME,
--        REFERENCED_COLUMN_NAME
-- FROM information_schema.KEY_COLUMN_USAGE
-- WHERE TABLE_SCHEMA = 'sakila'
-- AND TABLE_NAME = 'rental'
-- AND REFERENCED_TABLE_NAME IS NOT NULL;
-- Example Relationship
SELECT r.rental_id,
       c.customer_id,
       c.first_name
FROM rental r
JOIN customer c
ON r.customer_id = c.customer_id
LIMIT 10;
-- UNIQUE KEY
-- View Unique Indexes
-- SHOW INDEX
-- FROM customer;
-- Example
SELECT email,
       COUNT(*) AS total
FROM customer
GROUP BY email
HAVING COUNT(*) > 1;
-- 2. INDEXES

-- Indexes improve query performance by reducing full table scans.

-- Show Existing Indexes
-- SHOW INDEXES
-- FROM customer;
-- Create Index
-- CREATE INDEX idx_customer_lastname
-- ON customer(last_name);
-- Verify Index
-- SHOW INDEXES
-- FROM customer;
-- Drop Index
-- DROP INDEX idx_customer_lastname
-- ON customer;
-- Composite Index
-- CREATE INDEX idx_customer_name
-- ON customer(first_name,last_name);
-- Query Using Composite Index
-- SELECT *
-- FROM customer
-- WHERE first_name='MARY'
-- AND last_name='SMITH';
-- 3. EXPLAIN STATEMENT

-- Used to analyze query execution plans.

-- Explain Query
-- EXPLAIN
-- SELECT *
-- FROM customer
-- WHERE customer_id = 5;
-- Explain Join
-- EXPLAIN
-- SELECT c.first_name,
--        c.last_name,
--        r.rental_id
-- FROM customer c
-- JOIN rental r
-- ON c.customer_id = r.customer_id;
-- Explain Aggregate Query
-- EXPLAIN
-- SELECT customer_id,
--        COUNT(*)
-- FROM rental
-- GROUP BY customer_id;
-- 4. QUERY OPTIMIZATION TECHNIQUES
-- Avoid SELECT *
-- Poor Practice
-- SELECT *
-- FROM customer;
-- Better Practice
-- SELECT customer_id,
--        first_name,
--        last_name
-- FROM customer;
-- Use WHERE Clause Efficiently
-- Less Efficient
-- SELECT *
-- FROM payment
-- WHERE YEAR(payment_date)=2005;
-- Better
SELECT *
FROM payment
WHERE payment_date
BETWEEN '2005-01-01'
AND '2005-12-31';
-- Use LIMIT
SELECT *
FROM rental
LIMIT 20;
-- Avoid Functions on Indexed Columns
-- Poor Practice
-- SELECT *
-- FROM payment
-- WHERE MONTH(payment_date)=5;
-- Better Practice
-- SELECT *
-- FROM payment
-- WHERE payment_date >= '2005-05-01'
-- AND payment_date < '2005-06-01';
-- 5. BUILT-IN INFORMATION FUNCTIONS
-- DATABASE()
-- SELECT DATABASE() AS current_database;
-- USER()
-- SELECT USER() AS current_user;
-- VERSION()
-- SELECT VERSION() AS mysql_version;
-- CONNECTION_ID()
-- SELECT CONNECTION_ID() AS session_id;
-- CURRENT_USER()
-- SELECT CURRENT_USER() AS logged_user;
-- 6. ANALYZING TABLES
SHOW TABLE STATUS
-- SHOW TABLE STATUS
FROM sakila;
-- Analyze Customer Table
ANALYZE TABLE customer;
-- Optimize Table
OPTIMIZE TABLE payment;
-- Check Table
CHECK TABLE rental;
-- 7. PERFORMANCE-RELATED AGGREGATE FUNCTIONS
-- COUNT()
SELECT COUNT(*) AS total_customers
FROM customer;
-- SUM()
SELECT SUM(amount) AS total_revenue
FROM payment;
-- AVG()
SELECT AVG(amount) AS average_payment
FROM payment;
-- MAX()
SELECT MAX(amount) AS highest_payment
FROM payment;
-- MIN()
SELECT MIN(amount) AS lowest_payment
FROM payment;
-- 8. GROUP BY OPTIMIZATION EXAMPLES
-- Rentals Per Customer
SELECT customer_id,
       COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id;
-- Revenue Per Customer
SELECT customer_id,
       SUM(amount) AS revenue
FROM payment
GROUP BY customer_id
ORDER BY revenue DESC;
-- Revenue Per Store
SELECT staff_id,
       SUM(amount) AS revenue
FROM payment
GROUP BY staff_id;
-- 9. HAVING OPTIMIZATION
-- Customers With More Than 30 Rentals
SELECT customer_id,
       COUNT(*) AS rentals
FROM rental
GROUP BY customer_id
HAVING COUNT(*) > 30;
-- Customers With Revenue Greater Than $150
SELECT customer_id,
       SUM(amount) AS total_revenue
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 150;
-- 10. SUBQUERY VS JOIN OPTIMIZATION
-- Subquery Version
SELECT first_name,
       last_name
FROM customer
WHERE customer_id IN
(
    SELECT customer_id
    FROM payment
    WHERE amount > 10
);
-- Join Version (Usually Faster)
SELECT DISTINCT c.first_name,
                c.last_name
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
WHERE p.amount > 10;
-- 11. QUERY TUNING EXAMPLES
-- Find Top Revenue Customers
SELECT customer_id,
       SUM(amount) AS total_revenue
FROM payment
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;
-- Most Rented Films
SELECT f.title,
       COUNT(*) AS rental_count
FROM film f
JOIN inventory i
ON f.film_id = i.film_id
JOIN rental r
ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 10;
-- Top Performing Categories
SELECT c.name,
       COUNT(*) AS rentals
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN inventory i
ON fc.film_id = i.film_id
JOIN rental r
ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY rentals DESC;
-- 12. INDEX USAGE EXAMPLES
-- Search Customer By Email
-- EXPLAIN
-- SELECT *
-- FROM customer
-- WHERE email='MARY.SMITH@sakilacustomer.org';
-- Search Customer By Last Name
-- EXPLAIN
-- SELECT *
-- FROM customer
-- WHERE last_name='SMITH';
-- Search Film By Rating
-- EXPLAIN
-- SELECT *
-- FROM film
-- WHERE rating='PG';
-- PRACTICE QUESTIONS
-- -- 1. Display all indexes on the customer table.

-- -- 2. Create an index on customer email.

-- -- 3. Analyze execution plan of rental table queries.

-- -- 4. Find top 5 customers by revenue.

-- -- 5. Compare subquery and join performance.

-- -- 6. Find films rented more than 50 times.

-- -- 7. Find categories generating highest rentals.

-- -- 8. Create composite index on first_name and last_name.

-- -- 9. Find customers with more than 40 rentals.

-- -- 10. Show all foreign key relationships in Sakila.
-- Important Interview Concepts
-- Topic	Purpose
-- PRIMARY KEY	Uniquely identifies records
-- FOREIGN KEY	Maintains relationships
-- UNIQUE KEY	Prevents duplicate values
-- INDEX	Improves search performance
-- COMPOSITE INDEX	Index on multiple columns
-- EXPLAIN	Shows query execution plan
-- ANALYZE TABLE	Updates optimizer statistics
-- OPTIMIZE TABLE	Reorganizes table storage
-- HAVING	Filters grouped data
-- LIMIT	Reduces result set size
-- JOIN vs SUBQUERY	JOINs are often more efficient

-- This Day 6 module covers Indexes, Keys, Query Optimization, EXPLAIN Plans, Performance Tuning Techniques, Aggregate Functions, and Real-Time Sakila Database Examples commonly discussed in SQL interviews and database administration tasks.