INSERT INTO ano (ano) VALUES
(2023),
(2024);

INSERT INTO mes (mes_nome, mes_numero) VALUES
('Janeiro', 1),
('Fevereiro', 2),
('Março', 3),
('Abril', 4),
('Maio', 5),
('Junho', 6),
('Julho', 7),
('Agosto', 8),
('Setembro', 9),
('Outubro', 10),
('Novembro', 11),
('Dezembro', 12);

INSERT INTO indices_precos (id_ano, id_mes, ipca, inpc, igp_m) VALUES
(1, 1, 0.53, 0.46, 0.21),   -- Janeiro 2023
(1, 2, 0.84, 0.77, -0.06),  -- Fevereiro 2023
(1, 3, 0.71, 0.64, 0.05),   -- Março 2023
(1, 4, 0.61, 0.53, -0.95),  -- Abril 2023
(1, 5, 0.23, 0.36, -1.84),  -- Maio 2023
(1, 6, -0.08, -0.10, -1.93),-- Junho 2023
(1, 7, 0.12, -0.09, -0.72), -- Julho 2023
(1, 8, 0.23, 0.20, -0.14),  -- Agosto 2023
(1, 9, 0.26, 0.11, 0.37),   -- Setembro 2023
(1, 10, 0.24, 0.12, 0.50),  -- Outubro 2023
(1, 11, 0.28, 0.10, 0.59),  -- Novembro 2023
(1, 12, 0.56, 0.55, 0.74);  -- Dezembro 2023

INSERT INTO indices_precos (id_ano, id_mes, ipca, inpc, igp_m) VALUES
(2, 1, 0.42, 0.57, 0.07),   -- Janeiro 2024
(2, 2, 0.83, 0.81, -0.52),  -- Fevereiro 2024
(2, 3, 0.16, 0.19, -0.47),  -- Março 2024
(2, 4, 0.38, 0.37, 0.31),   -- Abril 2024
(2, 5, 0.46, 0.46, 0.89),   -- Maio 2024
(2, 6, 0.21, 0.25, 0.81),   -- Junho 2024
(2, 7, 0.38, 0.26, 0.61),   -- Julho 2024
(2, 8, -0.02, -0.14, 0.29), -- Agosto 2024
(2, 9, 0.44, 0.48, 0.62),   -- Setembro 2024
(2, 10, 0.56, 0.61, 1.52),  -- Outubro 2024
(2, 11, 0.39, 0.33, 1.30),  -- Novembro 2024
(2, 12, 0.52, 0.48, 0.94);  -- Dezembro 2024

-- Consulta para obter o valor médio do IPCA para 2023
SELECT AVG(ipca) AS media_ipca_2023
FROM indices_precos
WHERE id_ano = 1;

-- Consulta para obter o mês com o maior valor de INPC em 2024
SELECT id_mes, inpc
FROM indices_precos
WHERE id_ano = 2
ORDER BY inpc DESC
LIMIT 1;

-- Consulta para comparar os valores de IPCA, INPC e IGP-M em um mês específico
SELECT id_mes, ipca, inpc, igp_m
FROM indices_precos
WHERE id_ano = 1 AND id_mes = 3;
