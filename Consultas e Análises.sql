-- CONSULTAS E ANÁLISES
-- Qual a média salarial por departamento?
SELECT 
    d.id_departamento AS departamento,
    AVG(s.salario) AS salario_medio
FROM salarios s
JOIN funcionarios f ON s.id_funcionario = f.id_funcionario
JOIN cargos c ON f.id_cargo = c.id_cargo
JOIN departamentos d ON c.id_departamento = d.id_departamento
GROUP BY d.id_departamento;

-- Quantos funcionários ocupam cada cargo na Fictícia?
SELECT 
    c.cargo,
    COUNT(f.id_funcionario) AS num_funcionarios
FROM cargos c
LEFT JOIN funcionarios f ON c.id_cargo = f.id_cargo
GROUP BY c.cargo;

-- Quem são os funcionários que recebem acima da média de salários em seu departamento
SELECT 
    f.nome AS funcionario,
    s.salario,
    salario_medio_departamento
FROM funcionarios f
JOIN cargos c ON f.id_cargo = c.id_cargo
JOIN departamentos d ON c.id_departamento = d.id_departamento
JOIN salarios s ON f.id_funcionario = s.id_funcionario
JOIN (
    SELECT 
        d.id_departamento,
        AVG(s.salario) AS salario_medio_departamento
    FROM salarios s
    JOIN funcionarios f ON s.id_funcionario = f.id_funcionario
    JOIN cargos c ON f.id_cargo = c.id_cargo
    JOIN departamentos d ON c.id_departamento = d.id_departamento
    WHERE s.data_fim IS NULL
    GROUP BY d.id_departamento
) AS medias ON d.id_departamento = medias.id_departamento
WHERE s.salario > medias.salario_medio_departamento
AND s.data_fim IS NULL;

-- Quais os motivos de desligamento e quantos funcionários foram desligados por cada motivo
SELECT 
    m.motivo AS motivo_demissao,
    COUNT(f.id_funcionario) AS num_desligamentos
FROM motivos_demissao m
LEFT JOIN funcionarios f ON f.data_desmissao IS NOT NULL
LEFT JOIN salarios s ON f.id_funcionario = s.id_funcionario
WHERE f.data_desmissao IS NOT NULL
GROUP BY m.motivo;


