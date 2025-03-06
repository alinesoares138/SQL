-- Plano de acesso: Responsável do banco (root), Administrador do dia a dia (operacional) e COnsultores externos (leitores)

USE pricingInflation;
SELECT User, Host FROM mysql.user;

CREATE ROLE 'operacional';
GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'operacional';

CREATE USER 'enila'@'%' IDENTIFIED BY 'senha_segura';
GRANT 'operacional' TO 'enila'@'%';

CREATE ROLE 'consulta';
GRANT SELECT ON *.* TO 'consulta';

CREATE USER 'leitor'@'%' IDENTIFIED BY 'senha_segura';
GRANT 'consulta' TO 'enila'@'%';