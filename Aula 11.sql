# A quantidade de aluguéis por mês e loja
SELECT COUNT(r.rental_id) AS qt_alugueis, MONTH(r.rental_date) AS per_month, c.store_id as per_store
	FROM sakila.rental AS r
		INNER JOIN sakila.customer as c
        GROUP BY per_month, per_store
        ORDER BY per_month;
        
# O valor total pago por mês em toda a rede
SELECT SUM(p.amount) as valor_pg, EXTRACT(MONTH FROM p.payment_date) as mes_pg
	FROM sakila.payment as p
    GROUP BY mes_pg;

# A quantidade de aluguel por semana entre maio e junho de 2005, qual foi a melhor?
# A semana 6 foi a melhor com 1.531 aluguéis
SELECT 
	COUNT(rental_id) AS alugueis, 
	DATE_FORMAT(return_date, "%Y-%M") AS mes_filtrado,
    ROW_NUMBER() OVER (ORDER BY WEEK(return_date)) AS semana_filtrada
 FROM sakila.rental
 WHERE return_date BETWEEN '2005-05-01' AND '2005-06-30'
 GROUP BY WEEK(return_date), mes_filtrado
 ORDER BY alugueis DESC;
 

# Quem são os consumidores que alugaram 2 ou mais vezes em maio de 2005?
# Diferença de tempo entre os alugueis para cada uma das lojas
# Calcule o tempo médio entre os aluguéis por loja

WITH base AS (
SELECT r.customer_id, r.rental_id, DATEDIFF(r.return_date, r.rental_date) AS time_diff, c.store_id
FROM sakila.rental r
INNER JOIN sakila.customer c
	ON r.customer_id = c.customer_id
WHERE r.return_date BETWEEN '2005-05-01' AND '2005-05-31'
AND EXISTS (
    SELECT 1
    FROM sakila.rental r2
    WHERE r2.customer_id = r.customer_id
    AND r2.rental_id <> r.rental_id
    AND r2.return_date BETWEEN '2005-05-01' AND '2005-05-31')
)

SELECT store_id, COUNT(rental_id), AVG(time_diff) AS tempo_medio
	FROM base
	GROUP BY store_id;

#Quais filmes disponíveis tem a classificacao pg e pg13?
WITH base_classificados as ( 
SELECT inventory_id, rating, f.film_id, f.title
FROM sakila.film f 
INNER JOIN sakila.inventory i ON f.film_id = i.film_id
WHERE rating = "PG" OR "PG-13"          
)

SELECT rating, title
	FROM base_classificados b
    INNER JOIN sakila.rental r ON b.inventory_id = r.inventory_id
WHERE return_date IS NOT NULL
GROUP BY title, rating
    