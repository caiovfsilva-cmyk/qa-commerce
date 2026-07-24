# language: pt
Funcionalidade: Validação de Campos Obrigatórios no Checkout
  Como um cliente da loja
  Quero ser avisado quando esquecer de preencher um campo obrigatório
  Para poder corrigir antes de finalizar a compra

  Cenário: Tentar finalizar o pedido sem preencher nenhum campo
    Dado que tenho um produto no carrinho e estou na tela de Checkout
    Quando eu clico em "Finalizar Pedido" sem preencher nenhum campo
    Então devo ver a mensagem "Este campo é obrigatório." abaixo do campo "Nome"
    E devo ver a mensagem "Este campo é obrigatório." abaixo do campo "Sobrenome"
    E devo ver a mensagem "Este campo é obrigatório." abaixo do campo "Endereço"
    E devo ver a mensagem "Este campo é obrigatório." abaixo do campo "Número"
    E devo ver a mensagem "Este campo é obrigatório." abaixo do campo "CEP"
    E devo ver a mensagem "O CEP deve ter 8 caracteres." abaixo do campo "CEP"
    E devo ver a mensagem "Este campo é obrigatório." abaixo da opção "Forma de pagamento"
    E devo ver a mensagem "Este campo é obrigatório." abaixo do campo "Termos e Condições"

  Esquema do Cenário: Validar campo obrigatório individualmente
    Dado que tenho um produto no carrinho e estou na tela de Checkout
    Quando eu preencho todos os campos obrigatórios exceto "<campo>"
    E eu clico em "Finalizar Pedido"
    Então devo ver a mensagem "Este campo é obrigatório." abaixo do campo "<campo>"

    Exemplos:
      | campo     |
      | Nome      |
      | Sobrenome |
      | Endereço  |
      | Número    |
      | CEP       |