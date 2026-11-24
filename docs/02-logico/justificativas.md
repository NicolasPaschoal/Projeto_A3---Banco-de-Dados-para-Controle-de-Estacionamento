# Justificativas

- **Relacionamentos:** todos são 1:N ou 1:1 opcional, e viraram chave estrangeira no lado "N". Não há N:N.
- **Gera (Pagamento e Estadia):** virou `idEstadia` em `Pagamento`, que é única, porque a estadia tem no máximo um pagamento.
- **Opcionais:** `Veiculo.idCliente` e `Estadia.idLojaConveniada` podem ficar vazios, porque o veículo pode não ter cliente e a estadia pode não ter loja.
- **Entidade fraca:** a `Mensalidade` tem chave composta (`idContrato` e `Competencia`), porque só existe dentro de um contrato.
- **Atributo composto:** o `Endereço` do estacionamento virou as colunas `Logradouro` e `Complemento`.
- **3FN:** o valor da mensalidade não é guardado, porque já está no contrato. O tipo da estadia, o valor devido e as vagas livres são calculados por consulta.
- **Cliente no veículo e no contrato:** os dois ficam, porque são coisas diferentes: o cliente atual do veículo e o titular do contrato.
- **Tarifa e Estacionamento** não têm chave estrangeira: o estacionamento é único e a tarifa de uma estadia é a vigente na data de entrada.
- **Nomes:** `IdMarca` e `IdModelo` viraram `cod_marca` e `cod_modelo` (base fornecida), e `CPF_Funcionario` e `CPF_CNPJ_Cliente` viraram `CPF` e `CPF_CNPJ`.
