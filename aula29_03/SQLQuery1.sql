CREATE DATABASE BD_ESCOLA
GO

USE BD_ESCOLA
GO

CREATE TABLE MENSALIDADE(
	id INTEGER IDENTITY PRIMARY KEY,
	valor DECIMAL(7,2) NOT NULL,
	desconto DECIMAL(5,2) NULL,
	status_mensalidade CHAR(1) NOT NULL
)
GO

CREATE TABLE CURSO(
	id INTEGER IDENTITY PRIMARY KEY,
	nome VARCHAR(30) NOT NULL,
	duracao VARCHAR(20) NOT NULL,
	status_curso CHAR(1) NOT NULL,
	id_mensal INTEGER NOT NULL REFERENCES MENSALIDADE(id)
)
GO

CREATE TABLE ALUNO(
	id INTEGER IDENTITY PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	telefone VARCHAR(20) NOT NULL,
	email VARCHAR(60) NOT NULL,
	status_aluno CHAR(1) NOT NULL,
	id_curso INTEGER NOT NULL REFERENCES CURSO(id)
)
GO

INSERT INTO MENSALIDADE(valor, desconto, status_mensalidade) VALUES 
(1000.00, 10.00, 'A'),
(1500.00, 15.00, 'A'),
(800.00, 8.00, 'I')
GO

SELECT id, valor, desconto, status_mensalidade FROM MENSALIDADE
GO

INSERT INTO CURSO VALUES 
('ADS', '3 anos', 'A', 4), 
('GE', '3 anos', 'A', 5),
('LO', '3 anos', 'A', 6)
GO

SELECT * FROM CURSO
GO

INSERT INTO ALUNO VALUES
('Ronald', '(11)5555-8888', 'ronald@mail.com', 'A', 6),
('Renan', '(11)8888-8888', 'renan@mail.com', 'A', 7),
('Antonio', '(11)2222-8888', 'antonio@mail.com', 'A', 8)
GO

SELECT * FROM ALUNO
GO

-- Exercícios
-- 1) Selecione Nome do aluno, Nome do curso, Valor Mensalidade onde id = 2

SELECT 
	ALUNO.nome AS aluno,
	CURSO.nome AS curso,
	MENSALIDADE.valor AS mensalidade
FROM 
	ALUNO, CURSO, MENSALIDADE
WHERE
	ALUNO.id = 3
	AND ALUNO.id_curso = CURSO.id 
	AND CURSO.id_mensal = MENSALIDADE.id
GO

-- 2) Selecionar Nome do aluno, telefone, curso, duração, valor da
-- mensalidade, valor desconto para todos os alunos
-- Obs. em ordem alfabetica
SELECT 
	ALUNO.nome AS aluno,
	ALUNO.telefone AS telefone,
	CURSO.nome AS curso,
	CURSO.duracao AS duracao,
	MENSALIDADE.valor AS mensalidade,
	MENSALIDADE.desconto AS desconto
FROM 
	ALUNO, CURSO, MENSALIDADE
WHERE
	ALUNO.id_curso = CURSO.id 
	AND CURSO.id_mensal = MENSALIDADE.id
ORDER BY
	aluno
GO
