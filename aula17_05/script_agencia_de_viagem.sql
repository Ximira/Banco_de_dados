/*
Exercicio
1) Desenvolver um banco de dados para uma agencia de viagem
	1.1) Listar as entidades
		Cliente
		Pacote *
		Funcionario
		Transporte
		Hospedagem
		Caixa
	1.2) Desenvolver Modelo de Dados (MER)
	1.3) Criar script (manual)
	1.4) Executar script
	1.5) Inserir 2 registros emcada tabela
	1.6) Atualizar telefone do Id_Cliente 1
	1.7) Selecionar
		1.7.1 Selecionar nome_cliente, valor com o maior valor do pacote
		1.7.2 Selecionar a soma de valores no caixa
		1.7.3 Selecionar nome_cliente, nome_funcionario agrupando funcionarios por cliente
		1.7.4 Selecionar a media de de calores de pacote
*/

CREATE DATABASE DB_AGENCIA
GO
USE DB_AGENCIA
GO

CREATE TABLE TB_CLIENTE (
	Id_Cliente INTEGER IDENTITY PRIMARY KEY,
	Nome_Cliente VARCHAR(100) NOT NULL,
	Telefone_Cliente VARCHAR(20) NOT NULL,
	Email_Cliente VARCHAR(60) NOT NULL
)

CREATE TABLE TB_FUNCIONARIO (
	Id_Funcionario INTEGER IDENTITY PRIMARY KEY,
	Nome_Funcionario VARCHAR(100) NOT NULL,
	Matricula_Funcionario INTEGER NOT NULL
)

CREATE TABLE TB_TRANSPORTE (
	Id_Tranporte INTEGER IDENTITY PRIMARY KEY,
	Tipo_Transporte VARCHAR(30) NOT NULL
)

CREATE TABLE TB_HOSPEDAGEM (
	Id_Hospedagem INTEGER IDENTITY PRIMARY KEY,
	Tipo_Hospedagem VARCHAR(30) NOT NULL
)

CREATE TABLE TB_PACOTE (
	Id_Pacote INTEGER IDENTITY PRIMARY KEY,
	Destino_Pacote VARCHAR(30) NOT NULL,
	Data_Ida_Pacote DATE NOT NULL,
	Data_Volta_Pacote DATE,
	Valor_Pacote DECIMAL(10, 2) NOT NULL,
	Id_Cliente INTEGER NOT NULL REFERENCES TB_CLIENTE(Id_Cliente),
	Id_Funcionario INTEGER NOT NULL REFERENCES TB_FUNCIONARIO(Id_Funcionario),
	Id_Tranporte INTEGER NOT NULL REFERENCES TB_TRANSPORTE(Id_Tranporte),
	Id_Hospedagem INTEGER NOT NULL REFERENCES TB_HOSPEDAGEM(Id_Hospedagem)
)

CREATE TABLE TB_CAIXA (
	Id_Caixa INTEGER IDENTITY PRIMARY KEY,
	Data_Caixa DATETIME NOT NULL,
	Forma_Pagamento_Caixa VARCHAR(20) NOT NULL,
	Valor_Caixa DECIMAL(10, 2) NOT NULL,
	Id_Pacote INTEGER NOT NULL REFERENCES TB_PACOTE(Id_Pacote)
)
GO

-- DROP DATABASE DB_AGENCIA
-- GO

ALTER TABLE TB_CAIXA
ALTER COLUMN Forma_Pagamento_Caixa VARCHAR(25) NULL
GO

ALTER TABLE TB_PACOTE
ALTER COLUMN Data_Ida_Pacote DATETIME NOT NULL
ALTER TABLE TB_PACOTE
ALTER COLUMN Data_Volta_Pacote DATETIME
GO

