Legenda:
Negrito é chave primária, * é chave estrangeira

Marca (**cod_marca**, Nome)
Modelo (**cod_modelo**, Nome, Carroceria, cod_marca*)
Cliente (**idCliente**, Nome, CPF_CNPJ)
Veiculo (**PlacaVeiculo**, idCliente*, cod_modelo*)
Contrato (**idContrato**, idCliente*, PlacaVeiculo*, DataInicio, DataFim, ValorMensal)
Mensalidade (**idContrato***, **Competencia**, Vencimento, DataPagamento)
Estadia (**idEstadia**, DataEntrada, HoraEntrada, DataSaida, HoraSaida, PlacaVeiculo*, idLojaConveniada*, idFuncionario*)
LojaConveniada (**idLojaConveniada**, Nome)
Pagamento (**idPagamento**, FormaPagamento, ValorPagamento, idFuncionario*, idEstadia*)
Funcionario (**idFuncionario**, Nome, CPF)
Ocorrencia (**idOcorrencia**, Data, Hora, Tipo, Descricao, idFuncionario*, idEstadia*)
Tarifa (**idTarifa**, ValorHora, DataInicio, DataFim)
Estacionamento (**idEstacionamento**, Nome, Logradouro, Complemento, Capacidade)
