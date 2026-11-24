# Modelo conceitual

Diagrama entidade-relacionamento (DER) do banco de dados de controle de estacionamento, feito no brModelo.

## Cardinalidades

- `(0,1)`: opcional, no máximo um
- `(1,1)`: obrigatório, exatamente um
- `(0,n)`: opcional, vários

## Entidades

- **Marca** (IdMarca, Nome) e **Modelo** (IdModelo, Nome, Carroceria): vêm da base fornecida.
- **Veículo** (PlacaVeiculo)
- **Cliente** (IdCliente, Nome, CPF_CNPJ_Cliente)
- **Contrato** (IdContrato, DataInicio, DataFim, ValorMensal)
- **Mensalidade** (Competencia, Vencimento, DataPagamento): entidade fraca de Contrato.
- **Estadia** (IdEstadia, DataEntrada, HoraEntrada, DataSaida, HoraSaida)
- **LojaConveniada** (IdLojaConveniada, Nome)
- **Pagamento** (IdPagamento, FormaPagamento, ValorPagamento)
- **Funcionário** (IdFuncionario, Nome, CPF_Funcionario)
- **Ocorrência** (IdOcorrencia, Data, Hora, Tipo, Descricao)
- **Tarifa** (IdTarifa, ValorHora, DataInicio, DataFim)
- **Estacionamento** (IdEstacionamento, Nome, Endereço, Capacidade): o Endereço é um atributo composto (Logradouro e Complemento).

## Relacionamentos

- **Fabrica:** Marca (0,n) — Modelo (1,1)
- **Possui:** Modelo (0,n) — Veículo (1,1)
- **Pertence:** Veículo (0,1) — Cliente (0,n). O veículo pode não ter cliente.
- **Vincula:** Contrato (1,1) — Veículo (0,n)
- **Assina:** Contrato (1,1) — Cliente (0,n)
- **Paga:** Contrato (0,n) — Mensalidade (1,1)
- **Realiza:** Veículo (0,n) — Estadia (1,1)
- **Convenia:** Estadia (0,1) — LojaConveniada (0,n). A estadia tem no máximo uma loja.
- **Gera:** Pagamento (1,1) — Estadia (0,1). Estadias de mensalistas e em aberto não têm pagamento.
- **Recebe:** Pagamento (1,1) — Funcionário (0,n)
- **Registra (estadia):** Estadia (1,1) — Funcionário (0,n)
- **Registra (ocorrência):** Ocorrência (1,1) — Funcionário (0,n)
- **Envolve:** Estadia (0,n) — Ocorrência (1,1)

## Observações

- A Mensalidade é entidade fraca: só existe dentro de um contrato e é identificada pelo contrato mais a competência (mês e ano).
- Tarifa e Estacionamento não têm relacionamento. O estacionamento é único, e a tarifa de cada estadia é a que estava vigente na data de entrada.
- O tipo da estadia (rotativa ou mensalista), o valor devido e as vagas livres não são guardados: são calculados por consulta.
