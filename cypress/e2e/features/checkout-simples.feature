# language: pt
Funcionalidade: Checkout Simples
  Como um cliente da loja
  Quero finalizar minha compra preenchendo os dados de entrega e pagamento
  Para receber a confirmação do meu pedido

  Cenário: Finalizar pedido com sucesso preenchendo todos os campos obrigatórios
    Dado que tenho um produto no carrinho
    Quando eu preencho Nome, Sobrenome, Endereço, Número e CEP com dados válidos
    E eu seleciono a forma de pagamento "Pix"
    E eu marco a opção de aceite dos Termos e Condições
    E eu clico em "Finalizar Pedido"
    Então devo ver a mensagem "Obrigado pelo seu pedido"
    E o status do pedido deve ser "Pagamento aprovado"