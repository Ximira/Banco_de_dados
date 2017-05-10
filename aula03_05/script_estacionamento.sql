use BD_ESTACIONAMENTO
go
/*
1)Selecionar nome funcionario, numero de placa 
p/ todos os carros estacionados. Obs. Ordenar por placa;
2) Selecionar nome cliente, valor caixa, forma de
pagamento p/ todos os clientes. Obs. Ordenar por forma de 
pagamento;
3) Selecionar nome.cliente, modelo.carro, placa.cliente 
com maior valor pago caixa;
4) Selecionar nome funcionario que emitiu o maior nº de ticket's;

funções : select max/min/avg(valor.caixa) from TB_caixa
GETDATE()
upper('')
lower('')
rtrim
ltrim

 1)*/ 
select TB_FUNCIONARIO.Nome_Funcionario, 
TB_VAGA.Numero_Vaga, 
TB_VEICULO.Placa_VEICULO
from TB_FUNCIONARIO, TB_VAGA, TB_VEICULO, TB_TICKET
where TB_FUNCIONARIO.Id_Funcionario = TB_TICKET.Id_Funcionario
AND	  TB_TICKET.Id_VAGA = TB_VAGA.Id_Vaga
AND	  TB_TICKET.Id_VEICULO = TB_VEICULO.Id_Veiculo
order by Placa_Veiculo


select	T1.Nome_Funcionario, 
		T2.Numero_Vaga, 
		T3.Placa_VEICULO
from	TB_FUNCIONARIO T1, 
		TB_VAGA T2, 
		TB_VEICULO T3, 
		TB_TICKET T4
where	T1.Id_Funcionario = T4.Id_Funcionario
AND		T4.Id_VAGA = T2.Id_Vaga
AND		T4.Id_VEICULO = T3.Id_Veiculo
order by T3.Placa_Veiculo

/* 2)*/
select	T1.Nome_Cliente, 
		T2.Valor_Caixa, 
		T2.Forma_Pagto_Caixa
from	TB_CLIENTE T1, 
		TB_CAIXA T2, 
		TB_TICKET T3
where T1.Id_Cliente = T3.Id_Cliente
AND	  T3.Id_Ticket = T2.Id_Caixa

order by T2.Forma_Pagto_Caixa

select * from TB_CLIENTE

/*3)*/
select 
	T1.Nome_Cliente, 
	T2.Modelo_Veiculo, 
	T2.Placa_Veiculo,
	T4.Valor_Caixa
from	TB_CLIENTE T1, 
		TB_VEICULO T2, 
		TB_TICKET T3, 
		TB_CAIXA T4
where T1.Id_Cliente = T3.Id_Cliente
and	  T3.Id_Veiculo = T2.Id_Veiculo
and T3.Id_Ticket = T4.Id_Ticket
/*and T4.Valor_Caixa = ( select max(T5.Valor_Caixa) from TB_CAIXA T5 )
*/and T4.Valor_Caixa IN ( select max(T5.Valor_Caixa) from TB_CAIXA T5 )
/*in = mais de um valor maximo(caso se repita, o = é pra um só)*/
go

select * from TB_CAIXA
/*4) Fazer e entregar na próxima aula*/

select count(*) from TB_TICKET



select upper(substring(nome_cliente,4,2))
+upper(substring(nome_cliente,1,2)) from TB_CLIENTE


select sum(Valor_Caixa) from TB_CAIXA