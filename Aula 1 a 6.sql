-- soma do valor gasto por categoria de filme, categorizando as categorias de filmes em três grupos de acordo com a soma do valor gasto, e ordenando os resultados pelo valor gasto e pela categoria.
SELECT 
    c.category_id,
    cat.name AS category_name,
    SUM(p.amount) AS total_spent,
    CASE
        WHEN SUM(p.amount) < 100 THEN 'Baixo Gasto'
        WHEN SUM(p.amount) BETWEEN 100 AND 500 THEN 'Gasto Médio'
        ELSE 'Alto Gasto'
    END AS spending_category
FROM category cat
-- INNER JOIN: Relaciona as categorias aos filmes
INNER JOIN film f ON cat.category_id = f.category_id
-- INNER JOIN: Relaciona os filmes aos aluguéis
INNER JOIN inventory i ON f.film_id = i.film_id
-- INNER JOIN: Relaciona os aluguéis aos pagamentos
INNER JOIN rental r ON i.inventory_id = r.inventory_id
INNER JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.category_id, cat.name
ORDER BY total_spent DESC, category_name ASC;
