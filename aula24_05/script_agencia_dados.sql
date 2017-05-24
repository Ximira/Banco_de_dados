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