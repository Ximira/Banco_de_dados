INSERT INTO TB_CLIENTE (
	Nome_Cliente, Telefone_Cliente, Email_Cliente
) VALUES (
	'Jose Silva',
	'1155587894',
	'jose@silva.com'
), (
	'Maria Oliveira',
	'2178945664',
	'maria@oliveira.com'
)
GO

INSERT INTO TB_FUNCIONARIO (
	Nome_Funcionario, Matricula_Funcionario
) VALUES ('Marcos Santos', 100), ('Juliana Silva', 101)
GO

INSERT INTO TB_TRANSPORTE (
	Tipo_Transporte
) VALUES ('Aviao'), ('Onibus'), ('Cruzeiro')
GO

INSERT INTO TB_HOSPEDAGEM (
	Tipo_Hospedagem) VALUES ('Hotel'), ('Casa alugada'), ('Apartamento')
GO

INSERT INTO TB_PACOTE (
	Destino_Pacote,
	Data_Ida_Pacote,
	Data_Volta_Pacote,
	Valor_Pacote,
	Id_Cliente,
	Id_Funcionario,
	Id_Tranporte,
	Id_Hospedagem
) VALUES (
	'Orlando',
	'01/12/2017 10:00:00',
	'01/01/2018 10:00:00',
	10000.00,
	1,
	1,
	1,
	1
), (
	'Toronto',
	'25/01/2019 12:25:54',
	NULL,
	25000.00,
	2,
	2,
	2,
	1
)
GO

INSERT INTO TB_CAIXA (
	Data_Caixa, Forma_Pagamento_Caixa, Valor_Caixa, Id_Pacote
) VALUES (
	'24/05/2017 10:30:56',
	'Credito',
	10000.00,
	1
), (
	'25/05/2017 10:30:56',
	'Debito',
	25000.00,
	2
)
GO

SELECT * FROM TB_CLIENTE
GO
SELECT * FROM TB_FUNCIONARIO
GO
SELECT * FROM TB_TRANSPORTE
GO
SELECT * FROM TB_HOSPEDAGEM
GO
SELECT * FROM TB_PACOTE
GO
SELECT * FROM TB_CAIXA
GO

UPDATE TB_CLIENTE 
SET Telefone_Cliente = '(11)3333-4444', Nome_Cliente = 'Maria Vicente' 
WHERE Id_Cliente = 1
GO

-- 1.7.1 Selecionar nome_cliente, valor com o maior valor do pacote

CREATE VIEW V_CLIENTE_MAIOR_VALOR 
AS
SELECT TB_CLIENTE.Nome_Cliente, TB_PACOTE.Valor_Pacote 
FROM TB_CLIENTE, TB_PACOTE
WHERE TB_CLIENTE.Id_Cliente = TB_PACOTE.Id_Cliente
AND TB_PACOTE.Valor_Pacote = (SELECT MAX(TB_PACOTE.Valor_Pacote) FROM TB_PACOTE)
GO

SELECT * FROM V_CLIENTE_MAIOR_VALOR 
GO

-- 1.7.2 Selecionar a soma de valores no caixa
CREATE VIEW V_VALOR_TOTAL_CAIXA
AS
SELECT SUM(TB_CAIXA.Valor_Caixa) AS Valor_Caixa FROM TB_CAIXA
GO

SELECT * FROM V_VALOR_TOTAL_CAIXA
GO

-- 1.7.3 Selecionar nome_cliente, nome_funcionario agrupando funcionarios por cliente

SELECT T1.Nome_Cliente, T2.Nome_Funcionario 
FROM TB_CLIENTE T1,TB_FUNCIONARIO T2, TB_PACOTE T3
WHERE T3.Id_Cliente = T1.Id_Cliente
AND T3.Id_Funcionario = T2.Id_Funcionario
GROUP BY T1.Nome_Cliente, T2.Nome_Funcionario
GO

--1.7.4 Selecionar a media de de calores de pacote

SELECT AVG(Valor_Caixa) FROM TB_CAIXA
GO