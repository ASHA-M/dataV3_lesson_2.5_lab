USE sakila;
#Select all the actors with the first name ‘Scarlett’.
SELECT * 
FROM sakila.actor 
where first_name = 'Scarlett';

#How many films (movies) are available for rent?
SELECT COUNT(film_id) 
FROM sakila.inventory;

#How many films have been rented?
SELECT COUNT(rental_id) 
FROM sakila.rental;

#What is the shortest duration? Call it min_duration?
SELECT MIN(length) AS min_duration
FROM sakila.film;

#What is the longest movie duration? Call it max_duration?
SELECT MAX(length) AS max_duration
FROM sakila.film;

#What's the average movie duration expressed in format (hours, minutes)?
SELECT AVG(length/60) 
FROM sakila.film;

#How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name)
FROM sakila.actor;

#Since how many days has the company been operating (check DATEDIFF() function)?
SELECT rental_date 
FROM sakila.rental
ORDER BY rental_date DESC;

SELECT rental_date 
FROM sakila.rental
ORDER BY rental_date ASC;

SELECT datediff('2006-02-14 15:16:03', '2005-05-24 22:53:30');

#Show rental info with additional columns month and weekday. Get 20 results.

SELECT *, LEFT(rental_date, 4) as year, SUBSTRING(rental_date, 6, 2) as month
FROM sakila.rental
LIMIT 20;

# Add an additional column day_type with values 'weekend' and 'workday' 
# depending on the rental day of the week.
SELECT *, 
CASE 
WHEN weekday(rental_date) between 0 and 5 then 'Workday'
ELSE 'weekend'
END AS day_of_week
from sakila.rental;


# Get release years.
SELECT release_year 
FROM sakila.film;

# Get all films with ARMAGEDDON in the title.
SELECT *
FROM sakila.film
WHERE
    title LIKE '%ARMAGEDDON%';

# Get all films which title ends with APOLLO.
SELECT *
FROM sakila.film
WHERE
    title LIKE '%APOLLO';


# Get 10 the longest films.
SELECT *
FROM sakila.film
ORDER BY length DESC
LIMIT 10;


# How many films include Behind the Scenes content?
SELECT * 
FROM sakila.film
WHERE special_features like '%Behind the Scenes%';