SELECT Title, SUM(amount) as gross
FROM film
INNER JOIN inventory using(film_id)
INNER JOIN rental using(inventory_id)
INNER JOIN payment using(rental_id)
GROUP by Title
ORDER BY SUM(amount) DESC
LIMIT 1;

SELECT City
FROM city
INNER JOIN address USING(city_id)
INNER JOIN customer USING(address_id)
INNER JOIN payment USING(customer_id)
GROUP BY City
ORDER BY SUM(AMOUNT) DESC;

SELECT Name, COUNT(Name) AS Rental_count
FROM category
INNER JOIN film_category USING(category_id)
INNER JOIN film USING(film_id)
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING (inventory_id)
GROUP BY Name
ORDER BY Rental_count DESC;

SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS Customer_name
FROM category
INNER JOIN film_category USING(CATEGORY_ID)
INNER JOIN film USING(FILM_ID)
INNER JOIN inventory USING (film_id)
INNER JOIN rental USING(INVENTORY_ID)
INNER JOIN customer USING(CUSTOMER_ID)
WHERE Name = "sci-fi"
GROUP BY Customer_name
HAVING COUNT(RENTAL_ID) > 2
ORDER BY Customer_name;

SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS Customer_name
FROM customer
INNER JOIN rental USING(Customer_id)
INNER JOIN address USING(ADDRESS_ID)
INNER JOIN city USING(CITY_ID)
WHERE City = "Arlington"
GROUP BY Customer_name
HAVING COUNT(rental_id) >= 1;

SELECT country, COUNT(rental_id) AS Rental_count
FROM country
INNER JOIN city USING(COUNTRY_ID)
INNER JOIN address USING(CITY_ID)
INNER JOIN customer USING(ADDRESS_ID)
INNER JOIN rental USING(CUSTOMER_ID)
GROUP BY country
ORDER BY country;