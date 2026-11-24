-- Consulta 1: Quais veículos estão no estacionamento agora (entrada sem saída)? Placa e horário de entrada, do mais antigo ao mais recente.
SELECT PlacaVeiculo, DataEntrada || ' ' || HoraEntrada AS Entrada
FROM Estadia
WHERE DataSaida IS NULL
ORDER BY DataEntrada, HoraEntrada;


-- Consulta 2: Quais veículos cadastrados não têm cliente associado?
SELECT v.PlacaVeiculo, m.nome AS Modelo
FROM Veiculo v
JOIN modelo m ON m.cod_modelo = v.cod_modelo
WHERE v.IdCliente IS NULL
ORDER BY v.PlacaVeiculo;


-- Consulta 3: Quais mensalidades ainda não foram pagas? Contrato, competência e vencimento.
SELECT IdContrato, Competencia, Vencimento
FROM Mensalidade
WHERE DataPagamento IS NULL
ORDER BY Vencimento, IdContrato;


-- Consulta 4: Qual era a tarifa por hora vigente em 05/03/2024?
SELECT ValorHora
FROM Tarifa
WHERE '2024-03-05' BETWEEN DataInicio AND COALESCE(DataFim, '9999-12-31');


-- Consulta 5: Quantas estadias começaram em cada dia?
SELECT DataEntrada AS Dia, COUNT(*) AS Estadias
FROM Estadia
GROUP BY DataEntrada
ORDER BY DataEntrada;

-- Consulta 6: Quanto foi recebido em cada forma de pagamento?
SELECT FormaPagamento, SUM(ValorPagamento) AS TotalRecebido
FROM Pagamento
GROUP BY FormaPagamento
ORDER BY FormaPagamento;


-- Consulta 7: Quantas ocorrências houve de cada tipo?
SELECT Tipo, COUNT(*) AS Quantidade
FROM Ocorrencia
GROUP BY Tipo
ORDER BY Tipo;


-- Consulta 8: Qual a permanência média, em minutos, das estadias encerradas?
SELECT ROUND(AVG((strftime('%s', DataSaida || ' ' || HoraSaida)
                 - strftime('%s', DataEntrada || ' ' || HoraEntrada)) / 60.0), 1) AS PermanenciaMediaMin
FROM Estadia
WHERE DataSaida IS NOT NULL;


-- Consulta 9: Para cada estadia, mostrar a placa, a marca e o modelo do veículo.
SELECT e.IdEstadia, e.PlacaVeiculo, ma.nome AS Marca, mo.nome AS Modelo
FROM Estadia e
JOIN Veiculo v ON v.PlacaVeiculo = e.PlacaVeiculo
JOIN modelo mo ON mo.cod_modelo = v.cod_modelo
JOIN marca ma ON ma.cod_marca = mo.cod_marca
ORDER BY e.IdEstadia;


-- Consulta 10: Listar os contratos com o nome do cliente, a placa e o modelo do veículo.
SELECT c.IdContrato, cl.Nome AS Cliente, c.PlacaVeiculo, mo.nome AS Modelo
FROM Contrato c
JOIN Cliente cl ON cl.IdCliente = c.IdCliente
JOIN Veiculo v ON v.PlacaVeiculo = c.PlacaVeiculo
JOIN modelo mo ON mo.cod_modelo = v.cod_modelo
ORDER BY c.IdContrato;


-- Consulta 11: Quantas estadias cada loja conveniada vinculou, incluindo as lojas sem nenhuma?
SELECT l.idLojaConveniada, l.Nome, COUNT(e.IdEstadia) AS Estadias
FROM LojaConveniada l
LEFT JOIN Estadia e ON e.idLojaConveniada = l.idLojaConveniada
GROUP BY l.idLojaConveniada, l.Nome
ORDER BY l.idLojaConveniada;


-- Consulta 12: Listar as ocorrências com data e hora, tipo, placa do veículo e nome do funcionário que registrou.
SELECT o.Data, o.Hora, o.Tipo, e.PlacaVeiculo, f.Nome AS Funcionario
FROM Ocorrencia o
JOIN Estadia e ON e.IdEstadia = o.IdEstadia
JOIN Funcionario f ON f.IdFuncionario = o.IdFuncionario
ORDER BY o.Data, o.Hora;
a

-- Consulta 13: Quantas vagas estão livres agora?
SELECT es.Capacidade - (SELECT COUNT(*) FROM Estadia WHERE DataSaida IS NULL) AS VagasLivres
FROM Estacionamento es;
-- Resultado (1 linha):
-- VagasLivres
-- 76

-- Consulta 14: Valor devido em cada estadia rotativa encerrada (tarifa vigente na entrada; fração conta como hora cheia).
SELECT e.IdEstadia, e.PlacaVeiculo,
       (secs + 3599) / 3600 AS HorasCobradas,
       ((secs + 3599) / 3600) * t.ValorHora AS ValorDevido
FROM (SELECT *, strftime('%s', DataSaida || ' ' || HoraSaida)
               - strftime('%s', DataEntrada || ' ' || HoraEntrada) AS secs
      FROM Estadia WHERE DataSaida IS NOT NULL) e
JOIN Tarifa t ON e.DataEntrada BETWEEN t.DataInicio AND COALESCE(t.DataFim, '9999-12-31')
WHERE NOT EXISTS (SELECT 1 FROM Contrato c
                  WHERE c.PlacaVeiculo = e.PlacaVeiculo
                    AND e.DataEntrada BETWEEN c.DataInicio AND COALESCE(c.DataFim, '9999-12-31'))
ORDER BY e.IdEstadia;


-- Consulta 15: Classificar cada estadia como rotativa ou de mensalista (contrato vigente na data da entrada).
SELECT e.IdEstadia, e.PlacaVeiculo, e.DataEntrada,
       CASE WHEN EXISTS (SELECT 1 FROM Contrato c
                         WHERE c.PlacaVeiculo = e.PlacaVeiculo
                           AND e.DataEntrada BETWEEN c.DataInicio AND COALESCE(c.DataFim, '9999-12-31'))
            THEN 'Mensalista' ELSE 'Rotativa' END AS Tipo
FROM Estadia e
ORDER BY e.IdEstadia;


-- Consulta 16: Auditoria: quais placas têm mais de uma estadia em aberto? (deve retornar vazio)
SELECT PlacaVeiculo, COUNT(*) AS EmAberto
FROM Estadia
WHERE DataSaida IS NULL
GROUP BY PlacaVeiculo
HAVING COUNT(*) > 1;


-- Consulta 17: Auditoria: quais contratos do mesmo veículo têm períodos sobrepostos? (deve retornar vazio)
SELECT a.PlacaVeiculo, a.IdContrato AS ContratoA, b.IdContrato AS ContratoB
FROM Contrato a
JOIN Contrato b ON b.PlacaVeiculo = a.PlacaVeiculo AND a.IdContrato < b.IdContrato
WHERE a.DataInicio <= COALESCE(b.DataFim, '9999-12-31')
  AND b.DataInicio <= COALESCE(a.DataFim, '9999-12-31');
