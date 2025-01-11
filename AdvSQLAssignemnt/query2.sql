-- We want to find out how many of each category of film MAE HOFFMAN has starred in.

-- So return a table with category_name and the count of the number_of_films that MAE was in that category.

-- Your query should return every category even if MAE has been in no films in that category

-- Order by the category name in descending order.
SELECT c.name AS category_name, SUM(
	CASE WHEN a.first_name = 'MAE' AND a.last_name = 'HOFFMAN' THEN 1 ELSE 0
	END
) AS number_of_films
FROM category c

LEFT JOIN film_category fc ON c.category_id = fc.category_id
LEFT JOIN film f ON fc.film_id = f.film_id
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
LEFT JOIN actor a ON fa.actor_id = a.actor_id

GROUP BY c.name
ORDER BY c.name DESC;