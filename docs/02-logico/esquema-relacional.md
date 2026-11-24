# Esquema relacional

`PK` é chave primária e `FK` é chave estrangeira.

- **Marca** (cod_marca PK, Nome)
- **Modelo** (cod_modelo PK, Nome, Carroceria, cod_marca FK)
- **Cliente** (idCliente PK, Nome, CPF_CNPJ)
- **Veiculo** (PlacaVeiculo PK, idCliente FK, cod_modelo FK)
- **Contrato** (idContrato PK, idCliente FK, PlacaVeiculo FK, DataInicio, DataFim, ValorMensal)
- **Mensalidade** (idContrato PK/FK, Competencia PK, Vencimento, DataPagamento)
- **Estadia** (idEstadia PK, DataEntrada, HoraEntrada, DataSaida, HoraSaida, PlacaVeiculo FK, idLojaConveniada FK, idFuncionario FK)
- **LojaConveniada** (idLojaConveniada PK, Nome)
- **Pagamento** (idPagamento PK, FormaPagamento, ValorPagamento, idFuncionario FK, idEstadia FK)
- **Funcionario** (idFuncionario PK, Nome, CPF)
- **Ocorrencia** (idOcorrencia PK, Data, Hora, Tipo, Descricao, idFuncionario FK, idEstadia FK)
- **Tarifa** (idTarifa PK, ValorHora, DataInicio, DataFim)
- **Estacionamento** (idEstacionamento PK, Nome, Logradouro, Complemento, Capacidade)

No diagrama, `PlacaVeiculo` e `Competencia` aparecem como `INT` porque o brModelo não permite chave primária com `VARCHAR`. As duas são texto.
