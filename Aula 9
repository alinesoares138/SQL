/* lista em ordem decrescente, os filmes mais alugados */

SELECT FILM_ID, COUNT(FILM_ID) AS FREQUENCIA_FILM
FROM (SELECT * 
		FROM SAKILA.RENTAL 
		WHERE RENTAL_DATE IS NOT NULL) AS T1
        INNER JOIN SAKILA.INVENTORY AS T2
        ON T1.INVENTORY_ID = T2.INVENTORY_ID
        GROUP BY FILM_ID
        ORDER BY FREQUENCIA_FILM DESC;

/* lista em ordem decrescente as unidades de filmes disponíveis*/

SELECT film_id, COUNT(inventory_id) AS UNIDADES_DISPONÍVEIS
	FROM sakila.inventory
WHERE EXISTS (SELECT * 
				FROM sakila.rental 
			WHERE RETURN_DATE IS NULL)
GROUP BY film_id
ORDER BY UNIDADES_DISPONÍVEIS DESC;

/* usando subconsultas e os resultados 1 e 2, 
responda: os mais alugados possuem mais unidades disponívei? SIM!*/

WITH table1 AS
(SELECT FILM_ID, COUNT(FILM_ID) AS FREQUENCIA_FILM
FROM (SELECT * 
		FROM SAKILA.RENTAL 
		WHERE RENTAL_DATE IS NOT NULL) AS T1
        INNER JOIN SAKILA.INVENTORY AS T2
        ON T1.INVENTORY_ID = T2.INVENTORY_ID
        GROUP BY FILM_ID
        ORDER BY FREQUENCIA_FILM DESC
),

table2 AS 
(
SELECT film_id, COUNT(inventory_id) AS UNIDADES_DISPONÍVEIS
	FROM sakila.inventory
WHERE EXISTS (SELECT * 
				FROM sakila.rental 
			WHERE RETURN_DATE IS NULL)
GROUP BY film_id
ORDER BY UNIDADES_DISPONÍVEIS DESC
)

SELECT DISTINCT table1.film_id, table1.FREQUENCIA_FILM, table2.UNIDADES_DISPONÍVEIS
	FROM table1, table2
ORDER BY UNIDADES_DISPONÍVEIS DESC;

/* usando a visualização sales_by_film_category, adicione: 
1) valor medio de aluguel dos filmes por categoria; */

SELECT AVG(amount) as valor_medio
	FROM sakila.payment;
/*

2) valor medio do custo de reposição dos filmes por categoria;
*/
SELECT film_id, avg(replacement_cost) as custo_medio
	FROM sakila.film
    GROUP BY film_id;
/*
3) total de vendas por categoria da loja 1 e 3
*/
SELECT COUNT(rental_id) as vendas, store_id
	FROM sakila.store
    INNER JOIN sakila.rental
    GROUP BY store_id
    ;
/*
4) total de titulos disponíveis por categoria
*/

SELECT COUNT(DISTINCT film_id) as titulos_disponiveis
	FROM sakila.inventory
    INNER JOIN sakila.rental
		ON film_id
        WHERE return_date IS NOT NULL;

