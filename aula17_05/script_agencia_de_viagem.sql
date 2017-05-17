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
USE DB_AGENCIA
GO

CREATE TABLE TB_CLIENTE (
	Id_Cliente INTEGER IDENTITY PRIMARY KEY,
) GO

CREATE TABLE TB_PACOTE (
	Id_Pacote INTEGER IDENTITY PRIMARY KEY,
) GO

CREATE TABLE TB_FUNCIONARIO (
	Id_Funcionario INTEGER IDENTITY PRIMARY KEY,
) GO

CREATE TABLE TB_TRANSPORTE (
	Id_Tranporte INTEGER IDENTITY PRIMARY KEY,
) GO

CREATE TABLE TB_HOSPEDAGEM (
	Id_Hospedagem INTEGER IDENTITY PRIMARY KEY,
) GO

CREATE TABLE TB_CAIXA (
	Id_Caixa INTEGER IDENTITY PRIMARY KEY,
) GO