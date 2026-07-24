# language: pt
Funcionalidade: API de Usuários e Produtos

    Cenário: Criar usuário com sucesso
    Quando eu envio um POST para "/api/users" com um e-mail novo
    Então o status code deve ser 201
    E o corpo da resposta deve conter um id de usuário criado

  Cenário: Não deve permitir cadastro com e-mail duplicado
    Dado que já existe um usuário cadastrado
    Quando eu envio um POST para "/api/users" com o mesmo e-mail
    Então o status code não deve ser 201

    Cenário: Listar produtos respeitando o limite da paginação
    Quando eu envio um GET para "/api/produtos" com limit igual a 5
    Então o status code deve ser 200
    E devo receber no máximo 5 produtos
    E o campo "currentPage" deve ser igual a 1