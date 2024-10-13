#encoding: UTF-8
#language: pt

Funcionalidade: Login de acesso na plataforma

  Cenário: Usuário realiza login com e-mail e senha corretos
    Dado que o usuário está na tela de login
    E o usuário preenche o campo de e-mail com "usuario@exemplo.com"
    E preenche o campo de senha com "senha123"
    Quando clicar no botão "ENTRAR"
    Então o usuário deve ser redirecionado para a página inicial
    E a mensagem de boas-vindas "Bem-vindo, usuário!" deve ser exibida

  Cenário: Usuário tenta login com e-mail incorreto
    Dado que o usuário está na tela de login
    E o usuário preenche o campo de e-mail com "email_incorreto@exemplo.com"
    E preenche o campo de senha com "senha123"
    Quando clicar no botão "ENTRAR"
    Então o sistema deve exibir a mensagem de erro "O e-mail e/ou a senha digitada está incorreta."
    E o usuário deve permanecer na tela de login

  Cenário: Usuário tenta login com senha incorreta
    Dado que o usuário está na tela de login
    E o usuário preenche o campo de e-mail com "usuario@exemplo.com"
    E preenche o campo de senha com "senha_errada"
    Quando clicar no botão "ENTRAR"
    Então o sistema deve exibir a mensagem de erro "O e-mail e/ou a senha digitada está incorreta."
    E o usuário deve permanecer na tela de login

  Cenário: Usuário solicita recuperação de senha
    Dado que o usuário está na tela de login
    Quando o usuário clica no link "Esqueceu sua senha?"
    Então o sistema deve redirecionar o usuário para a página de recuperação de senha

  Cenário: Usuário realiza login com a opção "Mantenha-me conectado"
    Dado que o usuário está na tela de login
    E o usuário preenche o campo de e-mail com "usuario@exemplo.com"
    E preenche o campo de senha com "senha123"
    E marca a opção "Mantenha-me conectado"
    Quando clica no botão "ENTRAR"
    Então o usuário deve ser redirecionado para a página inicial
    E a sessão do usuário deve permanecer ativa mesmo após o fechamento do navegador

  Cenário: Usuário tenta realizar login sem preencher todos os campos
    Dado que o usuário está na tela de login
    E o usuário não preenche o campo de e-mail
    E não preenche o campo de senha
    Quando clicar no botão "ENTRAR"
    Então o sistema deve exibir a mensagem de erro para E-mail"Por favor, digite seu e-mail."
    E mensagem de erro para Senha "Por favor, digite a sua senha."

  Cenário: Usuário realiza login sem marcar a opção "Mantenha-me conectado"
    Dado que o usuário está na tela de login
    E o usuário preenche o campo de e-mail com "usuario@exemplo.com"
    E preenche o campo de senha com "senha123"
    E não marca a opção "Mantenha-me conectado"
    Quando clicar no botão "ENTRAR"
    Então o usuário deve ser redirecionado para a página inicial
    E a sessão do usuário deve ser encerrada após o fechamento do navegador


Funcionalidade: Expiração de sessão

  Cenário: Sessão expira após um período de inatividade
    Dado que o usuário está autenticado e logado no sistema
    Quando o usuário não interage com o sistema por alguns minutos
    Então o sistema deve expirar a sessão do usuário
    E o usuário deve ser redirecionado para a tela de login com a mensagem "Sua sessão expirou, por favor faça login novamente"
