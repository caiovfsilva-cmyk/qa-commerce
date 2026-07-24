# language: pt
Funcionalidade: Minha Conta
  Como um cliente cadastrado
  Quero acessar minha conta
  Para ver meus dados e o status do meu último pedido

  Cenário: Login e acesso à área Minha Conta
    Dado que eu tenho uma conta cadastrada
    Quando eu faço login com essa conta
    Então devo ver a tela "Minha Conta" com meu nome