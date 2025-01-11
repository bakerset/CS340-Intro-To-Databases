-- Find the first_name and last_name of all actors who have never been in an Animation film.
-- Order by the actor_id in ascending order.

-- Put your query for q4 here
SELECT a.actor_id,
       a.first_name,
       a.last_name
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id
LEFT JOIN film_category fc ON f.film_id = fc.film_id
LEFT JOIN category c ON fc.category_id = c.category_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING SUM(CASE WHEN c.name = 'Animation' THEN 1 ELSE 0 END) = 0
ORDER BY a.actor_id ASC;