PRAGMA foreign_keys = ON;

INSERT INTO Estacionamento (idEstacionamento, Nome, Logradouro, Complemento, Capacidade) VALUES
  (1, 'Estacionamento Central', 'Rua Augusta, 1200', 'Subsolo 1', 80);

INSERT INTO Funcionario (idFuncionario, Nome, CPF) VALUES
  (1, 'Roberto Almeida', '158.813.998-03'),
  (2, 'Sandra Oliveira', '698.797.309-17'),
  (3, 'Marcelo Ferreira', '114.170.753-50'),
  (4, 'Juliana Castro', '645.568.151-77');

INSERT INTO Cliente (idCliente, Nome, CPF_CNPJ) VALUES
  (1, 'Ana Souza', '884.472.940-72'),
  (2, 'Bruno Lima', '557.616.987-57'),
  (3, 'Carla Mendes', '168.976.846-00'),
  (4, 'Diego Rocha', '978.809.320-54'),
  (5, 'Transportes Alfa Ltda', '81.967.273/0001-01'),
  (6, 'Felipe Costa', '177.848.648-76');

INSERT INTO Veiculo (PlacaVeiculo, idCliente, cod_modelo) VALUES
  ('KCP2E75', 1, 60),
  ('XWR8S46', 2, 74),
  ('XME0L85', 5, 22),
  ('RAC0R74', 1, 20),
  ('GNA1N09', 6, 67),
  ('GKJ0B19', 5, 27),
  ('SPU0K40', 1, 56),
  ('WBU4Y96', 4, 44),
  ('RDR8J57', 6, 59),
  ('SMD3P18', 2, 30),
  ('XTZ7N55', 4, 9),
  ('FPS1X34', 6, 52),
  ('VVS2U28', NULL, 5),
  ('KTP6E66', NULL, 26),
  ('SVE9Z64', NULL, 42),
  ('UCW3H15', NULL, 69),
  ('GJZ7R65', NULL, 12);

INSERT INTO Tarifa (idTarifa, ValorHora, DataInicio, DataFim) VALUES
  (1, 8.0, '2024-01-01', '2024-12-31'),
  (2, 10.0, '2025-01-01', '2025-12-31'),
  (3, 12.0, '2026-01-01', NULL);

INSERT INTO LojaConveniada (idLojaConveniada, Nome) VALUES
  (1, 'Mercado Bom Preço'),
  (2, 'Farmácia Saúde Total'),
  (3, 'Padaria Pão Quente'),
  (4, 'Livraria Páginas');

INSERT INTO Contrato (idContrato, idCliente, PlacaVeiculo, DataInicio, DataFim, ValorMensal) VALUES
  (1, 1, 'KCP2E75', '2026-07-01', '2026-09-30', 300.0),
  (2, 1, 'KCP2E75', '2026-10-01', NULL, 320.0),
  (3, 2, 'XWR8S46', '2026-09-01', '2027-08-31', 350.0),
  (4, 5, 'XME0L85', '2026-10-01', NULL, 290.0);

INSERT INTO Mensalidade (idContrato, Competencia, Vencimento, DataPagamento) VALUES
  (1, '2026-07', '2026-07-10', '2026-07-14'),
  (1, '2026-08', '2026-08-10', '2026-08-07'),
  (1, '2026-09', '2026-09-10', '2026-09-09'),
  (2, '2026-10', '2026-10-10', '2026-10-14'),
  (2, '2026-11', '2026-11-10', NULL),
  (3, '2026-09', '2026-09-10', '2026-09-12'),
  (3, '2026-10', '2026-10-10', NULL),
  (3, '2026-11', '2026-11-10', NULL),
  (4, '2026-10', '2026-10-10', '2026-10-09'),
  (4, '2026-11', '2026-11-10', NULL);

INSERT INTO Estadia (idEstadia, DataEntrada, HoraEntrada, DataSaida, HoraSaida, PlacaVeiculo, idLojaConveniada, idFuncionario) VALUES
  (1, '2024-03-05', '08:27:00', '2024-03-05', '15:15:00', 'KTP6E66', 1, 1),
  (2, '2025-06-10', '09:41:48', '2025-06-10', '12:22:48', 'RAC0R74', 1, 1),
  (3, '2026-08-27', '08:24:00', '2026-08-27', '10:58:00', 'KCP2E75', 3, 2),
  (4, '2026-09-09', '09:42:00', '2026-09-09', '14:34:00', 'KCP2E75', NULL, 4),
  (5, '2026-10-01', '11:26:00', '2026-10-01', '12:26:00', 'RDR8J57', 1, 1),
  (6, '2026-10-04', '08:56:12', '2026-10-04', '15:57:12', 'XWR8S46', NULL, 3),
  (7, '2026-10-08', '09:33:00', '2026-10-08', '14:33:00', 'GNA1N09', NULL, 3),
  (8, '2026-10-09', '13:24:12', '2026-10-09', '19:23:12', 'SPU0K40', NULL, 2),
  (9, '2026-10-15', '09:11:35', '2026-10-15', '14:08:35', 'FPS1X34', 3, 1),
  (10, '2026-10-20', '08:43:35', '2026-10-20', '12:56:35', 'SMD3P18', NULL, 3),
  (11, '2026-10-22', '15:48:48', '2026-10-22', '16:48:48', 'SPU0K40', 3, 3),
  (12, '2026-10-23', '13:56:00', '2026-10-23', '16:44:00', 'SVE9Z64', NULL, 3),
  (13, '2026-10-23', '14:35:12', '2026-10-23', '20:16:12', 'GNA1N09', 1, 3),
  (14, '2026-10-27', '14:57:00', '2026-10-27', '22:24:00', 'RAC0R74', NULL, 3),
  (15, '2026-10-30', '08:43:00', '2026-10-30', '16:01:00', 'GJZ7R65', 1, 3),
  (16, '2026-10-31', '15:50:35', '2026-10-31', '17:59:35', 'XWR8S46', NULL, 3),
  (17, '2026-11-03', '13:18:12', '2026-11-03', '17:44:12', 'KCP2E75', 1, 2),
  (18, '2026-11-03', '13:50:00', '2026-11-03', '16:50:00', 'VVS2U28', 3, 2),
  (19, '2026-11-04', '09:32:00', '2026-11-04', '13:11:00', 'RDR8J57', 2, 1),
  (20, '2026-11-04', '10:35:00', '2026-11-04', '11:57:00', 'VVS2U28', NULL, 1),
  (21, '2026-11-04', '11:08:48', '2026-11-04', '11:37:48', 'UCW3H15', 3, 1),
  (22, '2026-11-04', '16:19:35', '2026-11-04', '19:53:35', 'GKJ0B19', NULL, 1),
  (23, '2026-11-07', '08:18:00', '2026-11-07', '09:10:00', 'XTZ7N55', 3, 2),
  (24, '2026-11-08', '16:02:12', '2026-11-08', '21:26:12', 'GKJ0B19', 3, 3),
  (25, '2026-11-10', '14:03:00', '2026-11-10', '17:47:00', 'KTP6E66', NULL, 2),
  (26, '2026-11-13', '13:56:00', '2026-11-13', '14:24:00', 'UCW3H15', 2, 2),
  (27, '2026-11-15', '10:35:00', '2026-11-15', '14:06:00', 'SVE9Z64', NULL, 3),
  (28, '2026-11-16', '07:22:00', '2026-11-16', '12:35:00', 'XME0L85', NULL, 3),
  (29, '2026-11-16', '08:19:12', '2026-11-16', '08:49:12', 'WBU4Y96', 3, 3),
  (30, '2026-11-23', '10:10:00', NULL, NULL, 'RAC0R74', 1, 3),
  (31, '2026-11-23', '12:35:00', NULL, NULL, 'XME0L85', NULL, 3),
  (32, '2026-11-23', '13:12:48', NULL, NULL, 'VVS2U28', 2, 1),
  (33, '2026-11-23', '15:18:00', NULL, NULL, 'SVE9Z64', NULL, 2);

INSERT INTO Pagamento (idPagamento, FormaPagamento, ValorPagamento, idFuncionario, idEstadia) VALUES
  (1, 'Dinheiro', 56.0, 1, 1),
  (2, 'Crédito', 30.0, 2, 2),
  (3, 'Débito', 12.0, 3, 5),
  (4, 'PIX', 60.0, 2, 7),
  (5, 'PIX', 72.0, 3, 8),
  (6, 'Crédito', 60.0, 1, 9),
  (7, 'Dinheiro', 60.0, 3, 10),
  (8, 'Débito', 12.0, 3, 11),
  (9, 'PIX', 36.0, 2, 12),
  (10, 'Dinheiro', 72.0, 1, 13),
  (11, 'Crédito', 96.0, 3, 14),
  (12, 'Débito', 96.0, 4, 15),
  (13, 'Débito', 36.0, 3, 18),
  (14, 'PIX', 48.0, 3, 19),
  (15, 'Crédito', 24.0, 1, 20),
  (16, 'Dinheiro', 12.0, 3, 21),
  (17, 'Crédito', 48.0, 3, 22),
  (18, 'Dinheiro', 12.0, 4, 23),
  (19, 'Débito', 72.0, 3, 24),
  (20, 'PIX', 48.0, 1, 25),
  (21, 'Crédito', 12.0, 3, 26),
  (22, 'Débito', 48.0, 2, 27),
  (23, 'PIX', 12.0, 2, 29);

INSERT INTO Ocorrencia (idOcorrencia, Data, Hora, Tipo, Descricao, idEstadia, idFuncionario) VALUES
  (1, '2024-03-05', '09:00:47', 'Alarme disparado', 'Alarme tocou por uns cinco minutos; nada foi levado.', 1, 4),
  (2, '2024-03-05', '10:02:27', 'Objeto esquecido', 'Cliente voltou para buscar um celular esquecido no carro.', 1, 1),
  (3, '2025-06-10', '12:15:25', 'Alarme disparado', 'Veículo ao lado bateu a porta e acionou o alarme.', 2, 3),
  (4, '2026-09-09', '12:45:24', 'Perda de ticket', 'Ticket molhado e ilegível; entrada confirmada pela placa.', 4, 4),
  (5, '2026-10-01', '11:59:58', 'Pagamento recusado', 'Débito sem saldo; pagamento refeito via PIX.', 5, 3),
  (6, '2026-10-09', '13:45:40', 'Arranhão', 'Amassado leve na lateral direita; o cliente disse que já existia.', 8, 2),
  (7, '2026-10-09', '14:31:11', 'Objeto esquecido', 'Capacete esquecido no porta-malas aberto; devolvido na saída.', 8, 3),
  (8, '2026-10-15', '09:22:17', 'Alarme disparado', 'Alarme soou sem motivo aparente; porta conferida pelo funcionário.', 9, 2),
  (9, '2026-10-15', '13:53:48', 'Pagamento recusado', 'Cliente tentou pagar com cheque e foi orientado a usar outra forma.', 9, 3),
  (10, '2026-10-20', '11:36:39', 'Veículo mal estacionado', 'Carro estacionado em vaga de moto; foi deslocado com o cliente.', 10, 3),
  (11, '2026-10-22', '16:27:44', 'Arranhão', 'Cliente apontou risco no capô e pediu registro.', 11, 2),
  (12, '2026-10-23', '14:42:25', 'Veículo mal estacionado', 'Veículo bloqueando a saída de outro cliente; motorista chamado.', 13, 1),
  (13, '2026-10-23', '17:36:24', 'Perda de ticket', 'Cliente não achou o comprovante de entrada e apresentou o CRLV.', 13, 2),
  (14, '2026-10-27', '16:50:42', 'Pagamento recusado', 'Cartão recusado duas vezes; pago com PIX.', 14, 2),
  (15, '2026-10-27', '17:46:59', 'Objeto esquecido', 'Óculos encontrados no chão da vaga e entregues à portaria.', 14, 1),
  (16, '2026-10-30', '12:31:45', 'Veículo mal estacionado', 'Veículo muito perto da coluna, dificultando abrir a porta.', 15, 2),
  (17, '2026-10-31', '15:55:26', 'Arranhão', 'Retrovisor com marca de arranhão, registrado com fotos.', 16, 3),
  (18, '2026-11-03', '14:03:08', 'Pagamento recusado', 'Máquina de cartão sem sinal; cobrança feita em dinheiro.', 18, 2),
  (19, '2026-11-04', '11:21:39', 'Alarme disparado', 'Sirene disparou quando passou o carrinho de limpeza; sem danos.', 21, 3),
  (20, '2026-11-04', '11:32:15', 'Pagamento recusado', 'Cartão de crédito recusado; cliente pagou em dinheiro.', 21, 3),
  (21, '2026-11-04', '12:53:29', 'Veículo mal estacionado', 'Veículo ocupando duas vagas; funcionário pediu que reposicionasse.', 19, 2),
  (22, '2026-11-04', '18:31:34', 'Veículo mal estacionado', 'Carro parado sobre a faixa de pedestres do subsolo.', 22, 3),
  (23, '2026-11-07', '08:41:19', 'Pagamento recusado', 'Erro na máquina; pagamento refeito depois de reiniciar.', 23, 3),
  (24, '2026-11-07', '09:02:56', 'Arranhão', 'Risco no para-choque dianteiro percebido na saída; foram tiradas fotos.', 23, 4),
  (25, '2026-11-10', '14:09:56', 'Perda de ticket', 'Ticket extraviado; hora de entrada conferida pelo sistema.', 25, 4),
  (26, '2026-11-16', '08:28:51', 'Alarme disparado', 'Alarme disparou depois de queda de energia no andar.', 29, 4),
  (27, '2026-11-16', '08:32:44', 'Perda de ticket', 'Cliente perdeu o ticket; foi conferido o documento do veículo.', 29, 3),
  (28, '2026-11-23', '10:35:59', 'Objeto esquecido', 'Cliente esqueceu a bolsa no banco; guardada na portaria.', 30, 4),
  (29, '2026-11-23', '13:21:15', 'Alarme disparado', 'Alarme do carro disparou no meio da estadia; dono avisado.', 32, 1),
  (30, '2026-11-23', '15:21:12', 'Objeto esquecido', 'Guarda-chuva encontrado ao lado do veículo e guardado.', 33, 3);
