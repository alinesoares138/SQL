-- os 5 primeiros filmes mais alugados, classificando por quantidade de locações
WITH rental_counts AS (
    SELECT 
        f.film_id, 
        f.title, 
        COUNT(r.rental_id) AS rental_count,
        ROW_NUMBER() OVER (ORDER BY COUNT(r.rental_id) DESC) AS ranking
    FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY f.film_id, f.title
)
SELECT * 
FROM rental_counts 
WHERE ranking <= 5;

-- lista os filmes alugados por eles, incluindo clientes que não têm aluguéis.
SELECT 
    c.first_name,
    c.last_name,
    f.title,
    p.amount AS rental_amount,
    ROW_NUMBER() OVER (ORDER BY SUM(p.amount) DESC) AS ranking
FROM customer c
-- LEFT JOIN: Garante que todos os clientes sejam listados, mesmo aqueles que não fizeram aluguéis
LEFT JOIN rental r ON c.customer_id = r.customer_id
-- INNER JOIN: Filtra apenas os aluguéis que têm um pagamento associado
INNER JOIN payment p ON r.rental_id = p.rental_id
-- INNER JOIN: Relaciona os filmes com os aluguéis
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
GROUP BY c.customer_id, f.film_id, p.amount
ORDER BY ranking;
