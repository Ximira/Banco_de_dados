1)Selecionar nome funcionario, numero de placa 
p/ todos os carros estacionados. Obs. Ordenar por placa;
2) Selecionar nome cliente, valor caixa, forma de
pagamento p/ todos os clientes. Obs. Ordenar por forma de pagamento;
3) Selecionar nome.cliente, modelo.carro, placa.cliente 
com maior valor pago caixa;
4) Selecionar nome funcionario que emitiu o maior nº de tickets;

funções : select max/min/avg(valor.caixa) from TB_caixa

/* 1)
select TB_FUNCIONARIO.Nome_Funcionario, TB_VAGA.Numero_Vaga, TB_VEICULO.Placa_VEICULO
from TB_FUNCIONARIO, TB_VAGA, TB_VEICULO, TB_TICKET
where TB_FUNCIONARIO.Id_Funcionario = TB_TICKET.Id_Funcionario
AND	  TB_TICKET.Id_VAGA = TB_VAGA.Id_Vaga
AND	  TB_TICKET.Id_VEICULO = TB_VEICULO.Id_Veiculo
order by Placa_Veiculo
 2)
select TB_CLIENTE.Nome_Cliente, TB_CAIXA.Valor_Caixa, TB_CAIXA.Forma_Pagto_Caixa
from TB_CLIENTE, TB_CAIXA, TB_TICKET
where TB_CLIENTE.Id_Cliente = TB_TICKET.Id_Cliente
AND	  TB_TICKET.Id_Ticket = TB_CAIXA.Id_Caixa

order by TB_CAIXA.Forma_Pagto_Caixa

*/
