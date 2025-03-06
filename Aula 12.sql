-- Tabela de Ano
CREATE DATABASE pricingInflation;
CREATE TABLE ano (
    id_ano INT PRIMARY KEY AUTO_INCREMENT,
    ano INT NOT NULL UNIQUE
);

-- Tabela de Mês
CREATE TABLE mes (
    id_mes INT PRIMARY KEY AUTO_INCREMENT,
    mes_nome VARCHAR(20) NOT NULL,
    mes_numero INT NOT NULL
);

-- Tabela de Índices de Preços (IPCA, INPC, IGP-M)
CREATE TABLE indices_precos (
    id_indice INT PRIMARY KEY AUTO_INCREMENT,
    id_ano INT,
    id_mes INT,
    ipca FLOAT,
    inpc FLOAT,
    igp_m FLOAT,
    FOREIGN KEY (id_ano) REFERENCES ano(id_ano),
    FOREIGN KEY (id_mes) REFERENCES mes(id_mes)
);
