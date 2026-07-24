# language: pt
Funcionalidade: Adicionar Produto ao Carrinho
  Como um visitante da loja
  Quero adicionar um produto ao carrinho
  Para poder finalizar minha compra futuramente

  Cenário: Adicionar produto ao carrinho com sucesso
    Dado que estou na página inicial da loja
    Quando eu clico no botão "Adicionar ao Carrinho" de um produto
    Então devo ver a mensagem "Produto adicionado ao carrinho!"