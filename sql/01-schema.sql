PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Ocorrencia;
DROP TABLE IF EXISTS Pagamento;
DROP TABLE IF EXISTS Estadia;
DROP TABLE IF EXISTS Mensalidade;
DROP TABLE IF EXISTS Contrato;
DROP TABLE IF EXISTS LojaConveniada;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Estacionamento;
DROP TABLE IF EXISTS Tarifa;
DROP TABLE IF EXISTS Veiculo;
DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente (
  idCliente INTEGER PRIMARY KEY,
  Nome TEXT NOT NULL,
  CPF_CNPJ TEXT NOT NULL UNIQUE
);

CREATE TABLE Veiculo (
  PlacaVeiculo TEXT NOT NULL PRIMARY KEY CHECK (length(PlacaVeiculo) = 7),
  idCliente INTEGER,
  cod_modelo INTEGER NOT NULL,
  FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente),
  FOREIGN KEY (cod_modelo) REFERENCES modelo (cod_modelo)
);

CREATE TABLE Tarifa (
  idTarifa INTEGER PRIMARY KEY,
  ValorHora NUMERIC NOT NULL CHECK (ValorHora > 0),
  DataInicio TEXT NOT NULL UNIQUE,
  DataFim TEXT,
  CHECK (DataFim IS NULL OR DataFim >= DataInicio)
);

CREATE TABLE Estacionamento (
  idEstacionamento INTEGER PRIMARY KEY,
  Nome TEXT NOT NULL,
  Logradouro TEXT NOT NULL,
  Complemento TEXT,
  Capacidade INTEGER NOT NULL CHECK (Capacidade > 0)
);

CREATE TABLE Funcionario (
  idFuncionario INTEGER PRIMARY KEY,
  Nome TEXT NOT NULL,
  CPF TEXT NOT NULL UNIQUE
);

CREATE TABLE LojaConveniada (
  idLojaConveniada INTEGER PRIMARY KEY,
  Nome TEXT NOT NULL UNIQUE
);

CREATE TABLE Contrato (
  idContrato INTEGER PRIMARY KEY,
  idCliente INTEGER NOT NULL,
  PlacaVeiculo TEXT NOT NULL,
  DataInicio TEXT NOT NULL,
  DataFim TEXT,
  ValorMensal NUMERIC NOT NULL CHECK (ValorMensal > 0),
  CHECK (DataFim IS NULL OR DataFim >= DataInicio),
  FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente),
  FOREIGN KEY (PlacaVeiculo) REFERENCES Veiculo (PlacaVeiculo)
);

CREATE TABLE Mensalidade (
  idContrato INTEGER NOT NULL,
  Competencia TEXT NOT NULL CHECK (length(Competencia) = 7 AND substr(Competencia, 5, 1) = '-'),
  Vencimento TEXT NOT NULL,
  DataPagamento TEXT,
  PRIMARY KEY (idContrato, Competencia),
  FOREIGN KEY (idContrato) REFERENCES Contrato (idContrato)
);

CREATE TABLE Estadia (
  idEstadia INTEGER PRIMARY KEY,
  DataEntrada TEXT NOT NULL DEFAULT (date('now', 'localtime')),
  HoraEntrada TEXT NOT NULL DEFAULT (time('now', 'localtime')),
  DataSaida TEXT,
  HoraSaida TEXT,
  PlacaVeiculo TEXT NOT NULL,
  idLojaConveniada INTEGER,
  idFuncionario INTEGER NOT NULL,
  CHECK ((DataSaida IS NULL) = (HoraSaida IS NULL)),
  CHECK (DataSaida IS NULL OR DataSaida || ' ' || HoraSaida > DataEntrada || ' ' || HoraEntrada),
  FOREIGN KEY (PlacaVeiculo) REFERENCES Veiculo (PlacaVeiculo),
  FOREIGN KEY (idLojaConveniada) REFERENCES LojaConveniada (idLojaConveniada),
  FOREIGN KEY (idFuncionario) REFERENCES Funcionario (idFuncionario)
);

CREATE TABLE Pagamento (
  idPagamento INTEGER PRIMARY KEY,
  FormaPagamento TEXT NOT NULL CHECK (FormaPagamento IN ('Dinheiro', 'Débito', 'Crédito', 'PIX')),
  ValorPagamento NUMERIC NOT NULL CHECK (ValorPagamento >= 0),
  idFuncionario INTEGER NOT NULL,
  idEstadia INTEGER NOT NULL UNIQUE,
  FOREIGN KEY (idFuncionario) REFERENCES Funcionario (idFuncionario),
  FOREIGN KEY (idEstadia) REFERENCES Estadia (idEstadia)
);

CREATE TABLE Ocorrencia (
  idOcorrencia INTEGER PRIMARY KEY,
  Data TEXT NOT NULL DEFAULT (date('now', 'localtime')),
  Hora TEXT NOT NULL DEFAULT (time('now', 'localtime')),
  Descricao TEXT NOT NULL,
  Tipo TEXT NOT NULL DEFAULT 'Outros',
  idFuncionario INTEGER NOT NULL,
  idEstadia INTEGER NOT NULL,
  FOREIGN KEY (idFuncionario) REFERENCES Funcionario (idFuncionario),
  FOREIGN KEY (idEstadia) REFERENCES Estadia (idEstadia)
);

CREATE INDEX idx_estadia_placa ON Estadia (PlacaVeiculo, DataEntrada);
CREATE INDEX idx_estadia_aberta ON Estadia (PlacaVeiculo) WHERE DataSaida IS NULL;
