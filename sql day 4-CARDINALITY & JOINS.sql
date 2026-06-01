CARDINALITY

Cardinality defines the relationship between tables.

1. One-to-One (1:1)

In Sakila, a strict one-to-one relationship is rare, but conceptually:

-- Example structure (conceptual)

Customer
---------
customer_id (PK)
customer_name

Customer_Profile
----------------
customer_id (PK, FK)
phone
email

-- One customer has one profile.
2. One-to-Many (1:M)

One customer can make many rentals.

SELECT c.customer_id,
       c.first_name,
       c.last_name,
       r.rental_id,
       r.rental_date
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
LIMIT 20;
-- Count Rentals Per Customer
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id,
         c.first_name,
         c.last_name
ORDER BY total_rentals DESC;
-- 3. Many-to-One (M:1)

-- Many rentals belong to one customer.

SELECT r.rental_id,
       r.rental_date,
       c.customer_id,
       c.first_name,
       c.last_name
FROM rental r
JOIN customer c
ON r.customer_id = c.customer_id
LIMIT 20;
-- 4. Many-to-Many (M:M)

-- A film can have many actors and an actor can act in many films.

-- Relationship Table: film_actor

SELECT a.actor_id,
       a.first_name,
       a.last_name,
       f.title
FROM actor a
JOIN film_actor fa
ON a.actor_id = fa.actor_id
JOIN film f
ON fa.film_id = f.film_id
LIMIT 20;
-- Count Films Per Actor
-- JOINS
-- 1. INNER JOIN

-- Returns matching records from both tables.

-- Customer Rentals
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       r.rental_id,
       r.rental_date
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
LIMIT 20;
-- Film Inventory
SELECT f.film_id,
       f.title,
       i.inventory_id
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id
LIMIT 20;
-- 2. LEFT JOIN
-- Returns all records from left table and matching records from right table.
-- Customers With Rentals
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       r.rental_id
FROM customer c
LEFT JOIN rental r
ON c.customer_id = r.customer_id
ORDER BY c.customer_id;
-- Customers Without Rentals
SELECT c.customer_id,
       c.first_name,
       c.last_name
FROM customer c
LEFT JOIN rental r
ON c.customer_id = r.customer_id
WHERE r.rental_id IS NULL;
-- 3. RIGHT JOIN
-- Returns all records from right table and matching records from left table.

SELECT c.customer_id,
       c.first_name,
       c.last_name,
       r.rental_id
FROM customer c
RIGHT JOIN rental r
ON c.customer_id = r.customer_id 
 LIMIT 20;
-- 4. FULL OUTER JOIN
-- MySQL does not support FULL OUTER JOIN directly.
-- Use UNION.

SELECT c.customer_id,
       c.first_name,
       c.last_name,
       r.rental_id
FROM customer c
LEFT JOIN rental r
ON c.customer_id = r.customer_id

UNION

SELECT c.customer_id,
       c.first_name,
       c.last_name,
       r.rental_id
FROM customer c
RIGHT JOIN rental r
ON c.customer_id = r.customer_id;
-- 5. CROSS JOIN
-- Returns Cartesian Product.

SELECT c.first_name,
       s.first_name
FROM customer c
CROSS JOIN staff s
LIMIT 20;
-- Count Rows Produced
SELECT COUNT(*) AS total_rows
FROM customer c
CROSS JOIN staff s;
-- 6. SELF JOIN
-- Join a table with itself.
-- Customers Living In Same Address
SELECT c1.customer_id,
       c1.first_name,
       c2.customer_id,
       c2.first_name,
       c1.address_id
FROM customer c1
JOIN customer c2
ON c1.address_id = c2.address_id
AND c1.customer_id <> c2.customer_id;
-- MULTIPLE TABLE JOINS
-- Customer → Rental → Payment
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       r.rental_id,
       p.amount
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
JOIN payment p
ON r.rental_id = p.rental_id
LIMIT 20;
-- Customer → Address → City
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       a.address,
       ci.city
FROM customer c
JOIN address a
ON c.address_id = a.address_id
JOIN city ci
ON a.city_id = ci.city_id;
-- Film → Category
SELECT f.film_id,
       f.title,
       c.name AS category
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
JOIN category c
ON fc.category_id = c.category_id;
-- Film → Actor
SELECT f.title,
       a.first_name,
       a.last_name
FROM film f
JOIN film_actor fa
ON f.film_id = fa.film_id
JOIN actor a
ON fa.actor_id = a.actor_id
LIMIT 20;
-- JOINS + AGGREGATE FUNCTIONS
-- Total Revenue Per Customer
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       SUM(p.amount) AS total_revenue
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id,
         c.first_name,
         c.last_name
ORDER BY total_revenue DESC;
-- Number Of Films Per Category
SELECT c.name AS category,
       COUNT(fc.film_id) AS total_films
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY total_films DESC;
-- Total Rentals Per Store
SELECT s.store_id,
       COUNT(r.rental_id) AS total_rentals
FROM store s
JOIN inventory i
ON s.store_id = i.store_id
JOIN rental r
ON i.inventory_id = r.inventory_id
GROUP BY s.store_id;
-- PRACTICE QUESTIONS
-- 1. Display all customers and their rentals.

-- 2. Display all films and their categories.

-- 3. Display all actors and films they acted in.

-- 4. Find customers who made the highest number of rentals.

-- 5. Find total revenue generated by each customer.

-- 6. Find total films available in each category.

-- 7. Find customers living in the same city.

-- 8. Find all films that have never been rented.

-- 9. Find actors who acted in more than 20 films.

-- 10. Find the top 10 customers by total payment amount.

-- This Day 4 sheet covers:

-- Cardinality (1:1, 1:M, M:1, M:M)
-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- FULL OUTER JOIN (using UNION)
-- CROSS JOIN
-- SELF JOIN
-- Multi-table joins
-- JOINs with Aggregate Functions
-- Interview-style practice questions using the Sakila database.