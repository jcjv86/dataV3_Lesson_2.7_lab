-- Lab | SQL Join (Part I)


USE sakila;

/* 1
How many films are there for each of the categories in the category table. Use appropriate join to write this query.
*/
SELECT c.name, count(f.film_id) AS number_films FROM film_category AS f
JOIN category AS c
ON f.category_id = c.category_id
GROUP BY c.name
ORDER BY number_films DESC;

/* 2
Display the total amount rung up by each staff member in August of 2005.
*/
SELECT s.first_name, s.last_name, SUM(amount) AS total_amount FROM staff AS s
JOIN payment AS p
ON s.staff_id = p.staff_id
WHERE p.payment_date LIKE ('2005-08%')
GROUP BY p.staff_id
ORDER BY s.last_name ASC;

/* 3
Which actor has appeared in the most films?
*/
SELECT a.first_name, a.last_name, fa.actor_id, count(fa.film_id) AS number_films FROM film_actor AS fa
JOIN actor AS a
ON fa.actor_id = a.actor_id
GROUP BY fa.actor_id
ORDER BY number_films DESC
LIMIT 1;

/* 4
Most active customer (the customer that has rented the most number of films)
*/
SELECT count(c.customer_id) AS number_rents, c.customer_id, c.first_name, c.last_name FROM rental AS r
JOIN customer AS c
ON r.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY number_rents DESC
LIMIT 1;

/* 5
Display the first and last names, as well as the address, of each staff member.
*/
SELECT s.first_name, s.last_name, ad.address FROM staff AS s
JOIN address AS ad
ON s.address_id = ad.address_id;


/* 6
List each film and the number of actors who are listed for that film.
*/
SELECT count(fa.actor_id) AS number_actors, fa.film_id, f.title from film_actor as fa
JOIN film AS f
ON fa.film_id = f.film_id
GROUP BY film_id
ORDER BY number_actors DESC;

/* 7
Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
*/
-- Alphabetical ascending order
SELECT c.last_name, sum(p.amount) AS total_amount FROM payment AS p
JOIN customer AS c
ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name ASC;

-- Alphabetical descending order
SELECT c.last_name, sum(p.amount) AS total_amount FROM payment AS p
JOIN customer AS c
ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name DESC;

/* 8
List number of films per category.
*/
SELECT c.name, count(f.film_id) AS number_films FROM film_category AS f
JOIN category AS c
ON f.category_id = c.category_id
GROUP BY c.name
ORDER BY number_films DESC;