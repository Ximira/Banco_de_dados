-- Cria banco de dados bercario
CREATE DATABASE BD_BERCARIO
GO

-- Ativa BD_BERCARIO
USE BD_BERCARIO
GO

-- Cria tabelas
CREATE TABLE TB_MAE(
	Id_Mae INTEGER IDENTITY PRIMARY KEY,
	Nome_Mae VARCHAR(40) NOT NULL, 
	Endereco_Mae VARCHAR(100) NOT NULL, 
	Telefone_Mae VARCHAR(20) NOT NULL, 
	Dt_Nascto_Mae DATETIME NOT NULL
)
GO

CREATE TABLE TB_MEDICO(
	Id_Medico INTEGER IDENTITY PRIMARY KEY,
	Crm_Medico VARCHAR(20) NOT NULL, 
	Nome_Medico VARCHAR(40) NOT NULL, 
	Telefone_Medico VARCHAR(20) NOT NULL, 
	Especialidade_Medico VARCHAR(50) NOT NULL
)
GO

CREATE TABLE TB_BEBE(
	Id_Bebe INTEGER IDENTITY PRIMARY KEY,
	Nome_Bebe VARCHAR(40) NOT NULL,
	Data_Nascto_Bebe DATETIME NOT NULL,
	Peso_Bebe DECIMAL(5,2) NOT NULL,
	Altura_Bebe DECIMAL(5,2) NOT NULL,
	Id_Mae INTEGER NOT NULL REFERENCES TB_MAE(Id_Mae),
	Id_Medico INTEGER NOT NULL REFERENCES TB_MEDICO(Id_Medico)
)
GO

-- Inserir dados
INSERT INTO TB_MAE VALUES (
	'Maria Silva',
	'Rua das Rosas N 45 ap 23 centro SP',
	'1155549687',
	'01/01/1990 00:00:00'
),(	
	'Marta Suplicy',
	'Av Ibirapuera n 597 ap 159',
	'1155571236',
	'05/11/1970 11:30:26'
)
GO

-- Selecionar dados
SELECT * FROM TB_MAE
GO

INSERT INTO TB_MEDICO VALUES(
	'12345678998756423',
	'Dr Jose Ramos',
	'11978469512',
	'Pediatria'
),(
	'98765432109789564',
	'Dra Luisa Silva',
	'11945678123',
	'Pediatria'
)
GO

SELECT * FROM TB_MEDICO
GO

INSERT INTO TB_BEBE VALUES(
	'Supla',
	'03/05/1963 12:30:00',
	3.20,
	0.50,
	2,
	1
),(
	'Ariovaldo',
	'05/08/1995 19:45:58',
	2.40,
	0.45,
	1,
	2
)
GO

SELECT * FROM TB_BEBE
GO

-- Atualizar telefone
UPDATE TB_MAE 
	SET Telefone_Mae = '1144443333',
	Endereco_Mae = 'Rua São Vicente, 43 - centro - sp'
	WHERE Id_Mae = 2
GO

-- Remover uma linha
DELETE FROM TB_MAE WHERE Id_Mae = 2
GO

-- Exercicios
-- 1) Selecionar nome mae, nome, bebe, nome medico 
-- para todas as maes,
-- OBS: Ordenado por nome mae