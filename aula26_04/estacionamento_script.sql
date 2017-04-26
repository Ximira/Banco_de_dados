-- Criar Banco de dados
CREATE DATABASE BD_ESTACIONAMENTO
GO

-- Usa BD_ESTACIONAMENTO
USE BD_ESTACIONAMENTO
GO

-- Cria Tabelas
CREATE TABLE TB_CLIENTE(
	Id_Cliente INTEGER IDENTITY PRIMARY KEY,
	Nome_Cliente VARCHAR(50) NOT NULL,
	Carteira_Cliente VARCHAR(11) NOT NULL,
	Telefone_Cliente VARCHAR(20) NOT NULL,
	Email_Cliente VARCHAR(50) NOT NULL,
	Tipo_Cliente VARCHAR(20) NOT NULL,
	Status_Cliente CHAR(1) NOT NULL
)
GO

CREATE TABLE TB_VEICULO(
	Id_Veiculo INTEGER IDENTITY PRIMARY KEY,
	Placa_Veiculo VARCHAR(10) NOT NULL,
	Cor_Veiculo VARCHAR(11) NOT NULL,
	Modelo_Veiculo VARCHAR(15) NOT NULL,
	Tipo_Veiculo VARCHAR(10) NOT NULL,
	Status_Veiculo CHAR(1) NOT NULL
)
GO

CREATE TABLE TB_FUNCIONARIO(
	Id_Funcionario INTEGER IDENTITY PRIMARY KEY,
	Nome_Funcionario VARCHAR(50) NOT NULL,
	Cargo_Funcionario VARCHAR(10) NOT NULL,
	Matricula_Funcionario VARCHAR(15) NOT NULL,
	Status_Funcionario CHAR(1) NOT NULL
)
GO

CREATE TABLE TB_VAGA(
	Id_Vaga INTEGER IDENTITY PRIMARY KEY,
	Numero_Vaga INTEGER NOT NULL,
	Tipo_Vaga VARCHAR(20) NOT NULL,
	Status_Vaga CHAR(1) NOT NULL
)
GO

CREATE TABLE TB_TICKET(
	Id_Ticket INTEGER IDENTITY PRIMARY KEY,
	Data_Entrada_Ticket DATETIME NOT NULL,
	Data_Saida_Ticket DATETIME NOT NULL,
	Valor_Ticket DECIMAL(6, 2) NOT NULL,
	Status_Ticket CHAR(1) NOT NULL,
	Id_Cliente INTEGER NOT NULL REFERENCES TB_CLIENTE(Id_Cliente),
	Id_Funcionario INTEGER NOT NULL REFERENCES TB_FUNCIONARIO(Id_Funcionario),
	Id_Vaga INTEGER NOT NULL REFERENCES TB_VAGA(Id_Vaga),
	Id_Veiculo INTEGER NOT NULL REFERENCES TB_VEICULO(Id_Veiculo)
)
GO

CREATE TABLE TB_CAIXA(
	Id_Caixa INTEGER IDENTITY PRIMARY KEY,
	Data_Caixa DATETIME NOT NULL,
	Valor_Caixa DECIMAL(6, 2) NOT NULL,
	Forma_Pagto_Caixa VARCHAR(20) NOT NULL,
	Id_Ticket INTEGER NOT NULL REFERENCES TB_TICKET(Id_Ticket)
)
GO

-- Inserir dados
INSERT INTO TB_CLIENTE
VALUES
('Vicente Mario','5647-12','(11)2222-3333','vm@gmail.com','Mensalista','A'),
('Mario Vitor','7777-12','(11)99999-3333','mv@gmail.com','Mensalista','A')
GO

-- Selecionar dados
SELECT * FROM TB_CLIENTE
GO

INSERT INTO TB_FUNCIONARIO
VALUES
('Kátia Rosa','Atendente','1111','A'),
('Pedro Rosa','Manobrista','2222','A')
GO

SELECT * FROM TB_FUNCIONARIO
GO

INSERT INTO TB_VAGA
VALUES
(12,'Coberta','A'),
(22,'Descoberta','A')
GO

SELECT * FROM TB_VAGA
GO

INSERT INTO TB_VEICULO
VALUES
('XCV9933','Branca','Gol','Passeio','A'),
('ECD3377','Vermelha','Golf','Passeio','A')
GO

SELECT * FROM TB_VEICULO
GO

-- Alterar estrutura de dados de uma tabela
ALTER TABLE TB_TICKET
ALTER COLUMN Data_Saida_Ticket DATETIME NULL
GO

-- Alterar estrutura de tabela para adicionar uma coluna
CREATE TABLE TESTE
(ID_TESTE INT PRIMARY KEY)
GO

ALTER TABLE TESTE
ADD NOME_TESTE VARCHAR(10) NULL
GO

SP_HELP TESTE
GO
ALTER TABLE TB_TICKET
ALTER COLUMN Valor_Ticket DECIMAL(6,2) NULL
GO

INSERT INTO TB_TICKET
VALUES
('26/04/2017 08:30:30',NULL,NULL,'A',1,2,1,2),
('26/04/2017 10:30:30',NULL,NULL,'A',2,1,2,1)
GO

SELECT * FROM TB_TICKET
GO

-- Deletar dados de forma física
DELETE FROM TB_TICKET
WHERE Id_Ticket > 3
GO

-- Deletar dados de forma lógica
UPDATE TB_TICKET
SET Status_Ticket = 'I'
WHERE Id_Ticket IN (4,5)
GO

INSERT INTO TB_CAIXA
VALUES
('27/04/2017 09:30:00','20.00','Dinheiro',2),
('27/04/2017 11:00:00','20.00','Cartão Débito',3)
GO

SELECT * FROM TB_CAIXA
GO

-- Exercícios
-- 1) Selecionar nome cliente, nome funcionario, placa veículo, modelo
--    veículo, número vaga, tipo vaga, valor caixa para todos os clientes.
--    Obs.: em ordem alfabética de nome cliente
SELECT	T1.Nome_Cliente,
		T2.Nome_Funcionario,
		T3.Placa_Veiculo,
		T3.Modelo_Veiculo,
		T4.Numero_Vaga,
		T4.Tipo_Vaga,
		T5.Valor_Caixa
FROM	TB_CLIENTE T1,
		TB_FUNCIONARIO T2,
		TB_VEICULO T3,
		TB_VAGA T4,
		TB_CAIXA T5,
		TB_TICKET T6
WHERE	T1.Id_Cliente = T6.Id_Cliente
AND		T6.Id_Funcionario = T2.Id_Funcionario
AND		T6.Id_Veiculo = T3.Id_Veiculo
AND		T6.Id_Vaga = T4.Id_Vaga
AND		T6.Id_Ticket = T5.Id_Ticket
ORDER BY T1.Nome_Cliente ASC
GO



--Exercicio 2
--Selecionar nome funcionário, placa veiculo, modelo veiculo,
-- nome cliente onde função funcionario = 'manobrista'.






