-- Criação do banco de dados
CREATE DATABASE rh_analise;

-- Seleciona o banco de dados criado
USE rh_analise;

CREATE TABLE departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nome_departamento VARCHAR(100) NOT NULL
);

CREATE TABLE cargos (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    cargo VARCHAR(100) NOT NULL,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_admissao DATE NOT NULL,
    data_desmissao DATE,
    id_cargo INT,
    FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo)
);

CREATE TABLE salarios (
    id_salario INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT,
    salario DECIMAL(10, 2) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

CREATE TABLE motivos_demissao (
    id_demissao INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT,
    motivo VARCHAR(255) NOT NULL
);

-- Inserção de dados nas tabelas

INSERT INTO departamentos (nome_departamento) VALUES
('Recursos Humanos'),
('Tecnologia'),
('Financeiro'),
('Marketing');

INSERT INTO cargos (cargo, id_departamento) VALUES
('Analista de RH', 1),
('Desenvolvedor', 2),
('Contador', 3),
('Coordenador de Marketing', 4);

INSERT INTO funcionarios (nome, data_admissao, id_cargo) VALUES
('João Silva', '2022-01-15', 1),
('Maria Souza', '2020-06-10', 2),
('Carlos Pereira', '2021-03-22', 3),
('Fernanda Costa', '2019-07-30', 4),
('Roberta Lima', '2022-02-28', 1),
('Pedro Oliveira', '2021-05-10', 2),
('Juliana Rocha', '2019-08-05', 3),
('Paulo Fernandes', '2020-11-20', 4),
('Tatiane Martins', '2021-10-15', 2),
('Lucas Almeida', '2022-04-25', 3);

-- Inserção de salários
INSERT INTO salarios (id_funcionario, salario, data_inicio, data_fim) VALUES
(1, 3000.00, '2022-01-15', NULL),
(2, 5000.00, '2020-06-10', '2023-06-10'),
(3, 4000.00, '2021-03-22', NULL),
(4, 4500.00, '2019-07-30', '2022-07-30'),
(5, 3200.00, '2022-02-28', NULL),
(6, 6000.00, '2021-05-10', NULL),
(7, 4200.00, '2019-08-05', NULL),
(8, 4600.00, '2020-11-20', '2021-11-20'),
(9, 5800.00, '2021-10-15', NULL),
(10, 3900.00, '2022-04-25', NULL);

-- Inserção de motivos de demissão
INSERT INTO motivos_demissao (motivo) VALUES
('Desempenho insatisfatório'),
('Reestruturação organizacional'),
('Problemas de saúde'),
('Motivos pessoais');

-- Inserção de registros de desligamento de funcionários
UPDATE funcionarios SET data_desmissao = '2023-06-10' WHERE id_funcionario = 2;
UPDATE funcionarios SET data_desmissao = '2021-11-20' WHERE id_funcionario = 8;