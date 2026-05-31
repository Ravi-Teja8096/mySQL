-- 1. MATH FUNCTIONS
-- ABS() – Returns Absolute Value
-- use sakila;
-- Find absolute difference between rental_id and inventory_id
SELECT rental_id,
       inventory_id,
       ABS(rental_id - inventory_id) AS absolute_difference
FROM rental
LIMIT 10;
-- CEIL() / CEILING() – Round Up
-- Round up payment amounts
SELECT payment_id,
       amount,
       CEIL(amount) AS rounded_up
FROM payment
LIMIT 10;
-- ROUND() – Round to Specified Decimals
SELECT payment_id,
       amount,
       ROUND(amount,1) AS rounded_amount
FROM payment
LIMIT 10;
-- POWER() – Raises Number to Power
SELECT payment_id,
       POWER(amount,2) AS square_amount
FROM payment
LIMIT 10;
-- SQRT() – Square Root
SELECT payment_id,
       amount,
       SQRT(amount) AS square_root
FROM payment
LIMIT 10;
-- RAND() – Random Number
-- SELECT RAND() AS random_number;
--  TRUNCATE() – Truncate Decimal Places
SELECT payment_id,
       amount,
       TRUNCATE(amount,1) AS truncated_amount
FROM payment
LIMIT 10;
-- 2. DATE & TIME FUNCTIONS
-- NOW() – Current Date and Time
-- SELECT NOW() AS current_datetime;
-- CURDATE() – Current Date
-- SELECT CURDATE() AS current_date;
-- CURTIME() – Current Time
-- SELECT CURTIME() AS current_time;
-- YEAR()
SELECT rental_id,
       rental_date,
       YEAR(rental_date) AS rental_year
FROM rental
LIMIT 10;
-- MONTH()
SELECT rental_id,
       rental_date,
       MONTH(rental_date) AS rental_month
FROM rental
LIMIT 10;
-- MONTHNAME()
SELECT rental_id,
       rental_date,
       MONTHNAME(rental_date) AS month_name
FROM rental
LIMIT 10;
-- DAY()
SELECT rental_id,
       rental_date,
       DAY(rental_date) AS day_number
FROM rental
LIMIT 10;
-- DAYNAME()
SELECT rental_id,
       rental_date,
       DAYNAME(rental_date) AS day_name
FROM rental
LIMIT 10;
-- WEEKDAY()
SELECT rental_id,
       rental_date,
       WEEKDAY(rental_date) AS weekday_number
FROM rental
LIMIT 10;
-- DATE()
SELECT rental_id,
       DATE(rental_date) AS rental_only_date
FROM rental
LIMIT 10;
-- TIME()
-- SELECT rental_id,
--        TIME(rental_date) AS rental_only_time
-- FROM rental
-- LIMIT 10;
-- DATEDIFF() – Difference Between Dates
SELECT rental_id,
       rental_date,
       return_date,
       DATEDIFF(return_date, rental_date) AS days_rented
FROM rental
WHERE return_date IS NOT NULL
LIMIT 10;
-- DATE_ADD()
SELECT rental_id,
       rental_date,
       DATE_ADD(rental_date, INTERVAL 7 DAY) AS due_date
FROM rental
LIMIT 10;
-- DATE_SUB()
SELECT rental_id,
       rental_date,
       DATE_SUB(rental_date, INTERVAL 5 DAY) AS previous_date
FROM rental
LIMIT 10;
-- TIMESTAMPDIFF()
SELECT rental_id,
       rental_date,
       return_date,
       TIMESTAMPDIFF(DAY, rental_date, return_date) AS rental_days
FROM rental
WHERE return_date IS NOT NULL
LIMIT 10;
-- EXTRACT()
SELECT rental_id,
       rental_date,
       EXTRACT(YEAR FROM rental_date) AS rental_year
FROM rental
LIMIT 10;
-- DATE_FORMAT()
SELECT rental_id,
       DATE_FORMAT(rental_date,'%d-%m-%Y') AS formatted_date
FROM rental
LIMIT 10;
-- 3. SINGLE ROW SUBQUERIES
-- Find Film with Maximum Rental Rate
SELECT title, rental_rate
FROM film
WHERE rental_rate =
(
    SELECT MAX(rental_rate)
    FROM film
);
-- Find Customer Who Paid Highest Amount
SELECT customer_id,
       first_name,
       last_name
FROM customer
WHERE customer_id =
(
    SELECT customer_id
    FROM payment
    ORDER BY amount DESC
    LIMIT 1
);
-- Films Longer Than Average Length
SELECT title, length
FROM film
WHERE length >
(
    SELECT AVG(length)
    FROM film
);
-- Customers From Same City as Customer 1
SELECT first_name, last_name
FROM customer
WHERE address_id IN
(
    SELECT address_id
    FROM customer
    WHERE customer_id = 1
);
-- 4. MULTI-ROW SUBQUERIES
-- Films Available In Inventory
SELECT title
FROM film
WHERE film_id IN
(
    SELECT film_id
    FROM inventory
);
-- Customers Who Made Payments Above $10
SELECT first_name, last_name
FROM customer
WHERE customer_id IN
(
    SELECT customer_id
    FROM payment
    WHERE amount > 10
);
-- Films Not Present In Inventory
SELECT title
FROM film
WHERE film_id NOT IN
(
    SELECT film_id
    FROM inventory
);
-- Actors Appearing In More Than One Film
SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
    SELECT actor_id
    FROM film_actor
    GROUP BY actor_id
    HAVING COUNT(film_id) > 1
);
-- 5. CORRELATED SUBQUERIES
-- Films Longer Than Average Length Of Their Rating Category
SELECT title,
       rating,
       length
FROM film f1
WHERE length >
(
    SELECT AVG(length)
    FROM film f2
    WHERE f1.rating = f2.rating
);
-- Customers Who Paid More Than Their Own Average Payment
SELECT customer_id,
       amount
FROM payment p1
WHERE amount >
(
    SELECT AVG(amount)
    FROM payment p2
    WHERE p1.customer_id = p2.customer_id
);
-- Actors In More Films Than Average Actor
SELECT actor_id,
       first_name,
       last_name
FROM actor a
WHERE
(
    SELECT COUNT(*)
    FROM film_actor fa
    WHERE fa.actor_id = a.actor_id
    
)
>
(
    SELECT AVG(film_count)
    FROM
    (
        SELECT COUNT(*) AS film_count
        FROM film_actor
        GROUP BY actor_id
    ) avg_table
);
-- 6. PRACTICE QUESTIONS
-- 1. Find films whose rental rate is higher than average rental rate.

-- 2. Find customers who paid more than average payment.

-- 3. Find films with maximum length.

-- 4. Find actors who acted in more than 30 films.

-- 5. Find rentals made in the month of May.

-- 6. Find total rentals per year.

-- 7. Find payment records from the current month.

-- 8. Find films whose replacement cost is above average.

-- 9. Find customers who never made a payment.

-- 10. Find films available in more than 5 inventory stores.