-- 10 clientes que mais gastaram
CREATE TEMPORARY TABLE top_clientes AS
SELECT customer_id, SUM(amount) AS total_gasto
FROM payment
GROUP BY customer_id
ORDER BY total_gasto DESC
LIMIT 10;

SELECT * FROM top_clientes;

-- filmes que têm a maior duração em cada categoria
SELECT f.title, f.length, f.category_id
FROM film f
WHERE f.length = (
    SELECT MAX(length) 
    FROM film 
    WHERE category_id = f.category_id
);
