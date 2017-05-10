-- 1) Selecionar nome funcionario, numero de placa para todos os carros estacionados. Obs. Ordenar por placa;
SELECT 
	TB_FUNCIONARIO.Nome_Funcionario, 
	TB_VAGA.Numero_Vaga, 
	TB_VEICULO.Placa_VEICULO
FROM 
	TB_FUNCIONARIO, 
	TB_VAGA, 
	TB_VEICULO, 
	TB_TICKET,
	TB_CLIENTE
WHERE 
	TB_FUNCIONARIO.Id_Funcionario = TB_TICKET.Id_Funcionario
AND TB_TICKET.Id_VEICULO = TB_VEICULO.Id_Veiculo
AND TB_VAGA.Id_Vaga = TB_TICKET.Id_Vaga
ORDER BY Placa_Veiculo

-- 2) Selecionar nome cliente, valor caixa, forma de pagamento para todos os clientes. Obs. Ordenar por forma de pagamento;
SELECT 
	TB_CLIENTE.Nome_Cliente,
	TB_CAIXA.Valor_Caixa,
	TB_CAIXA.Forma_Pagto_Caixa
FROM 
	TB_CLIENTE,
	TB_CAIXA,
	TB_TICKET
WHERE
	TB_CLIENTE.Id_Cliente = TB_TICKET.Id_Cliente
AND TB_TICKET.Id_Ticket = TB_CAIXA.Id_Ticket
ORDER BY TB_CAIXA.Forma_Pagto_Caixa

--3) Selecionar nome.cliente, modelo.carro, placa.cliente com maior valor pago caixa;
SELECT 
	TB_CLIENTE.Nome_Cliente, 
	TB_VEICULO.Modelo_Veiculo, 
	TB_VEICULO.Placa_Veiculo,
	TB_CAIXA.Valor_Caixa
FROM 
	TB_CLIENTE, 
	TB_VEICULO, 
	TB_CAIXA,
	TB_TICKET
WHERE
	TB_CLIENTE.Id_Cliente = TB_TICKET.Id_Cliente
AND TB_TICKET.Id_Veiculo = TB_VEICULO.Id_Veiculo
AND TB_TICKET.Id_Ticket = TB_CAIXA.Id_Ticket
AND TB_CAIXA.Valor_Caixa = (SELECT MAX(TB_CAIXA.Valor_Caixa) FROM TB_CAIXA) 

-- 4) Selecionar nome funcionario que emitiu o maior nº de tickets;
-- funções : select max/min/avg(valor.caixa) from TB_caixa

SELECT COUNT(TB_TICKET.Id_Funcionario)
FROM TB_TICKET, TB_FUNCIONARIO
WHERE TB_FUNCIONARIO.Id_Funcionario = TB_TICKET.Id_Funcionario
AND

SELECT * FROM TB_FUNCIONARIO
GO

INSERT INTO TB_CAIXA (Data_Caixa, Valor_Caixa, Forma_Pagto_Caixa, Id_Ticket)
VALUES ('10/05/2017 11:00:00', '30.00', 'Cartao de credito', 2)
GO

INSERT INTO TB_FUNCIONARIO(
	Nome_Funcionario, Cargo_Funcionario, Matricula_Funcionario, Status_Funcionario) VALUES
('Daniel Santos', 'Manobrista', 3333, 'A'),
('Carlos Fereira', 'Manobrista', 4444, 'A')

INSERT INTO TB_CLIENTE(
	Nome_Cliente, Carteira_Cliente, Telefone_Cliente, Email_Cliente, Tipo_Cliente, Status_Cliente) VALUES
('Hector Ferreira', '8974-21', '(11)5648-9872', '@gmail.com', 'Mensalista', 'A'),
('Paulo Oliveira', '7359-54', '(11)5379-9154', '@gmail.com', 'Mensalista', 'A'),
('Maria Jose', '2134-65', '(11)4569-8794', '@gmail.com', 'Mensalista', 'A')
