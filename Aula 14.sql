-- Este procedimento pode ser usado para atualizar mensalmente os índices de inflação (IPCA, INPC e IGP-M) conforme novos dados são divulgados. Ele recebe como parâmetro de entrada o ano e insere os valores para um mês específico.

USE pricingInflation;

DELIMITER $$
CREATE PROCEDURE InserirIndicePreco(
    IN p_ano INT,
    IN p_mes INT,
    IN p_ipca FLOAT,
    IN p_inpc FLOAT,
    IN p_igpm FLOAT
)
BEGIN
    BEGIN
    ROLLBACK;
    END;

START TRANSACTION;
    
    INSERT INTO indices_precos (id_ano, id_mes, ipca, inpc, igp_m)
    VALUES (p_ano, p_mes, p_ipca, p_inpc, p_igpm);

COMMIT;
END $$
DELIMITER ;

-- Esse procedimento pode ser executado mensalmente para atualizar os índices de inflação no banco de dados de forma segura e eficiente.
CALL InserirIndicePreco(2024, 10, 0.56, 0.61, 1.52);
SELECT * FROM indices_precos WHERE id_ano = 2 AND id_mes = 10;
