#encoding: UTF-8
#language: pt

Funcionalidade: Menu Veículos adicionar veiculos

Contexto: Usuário acesso a plataforma pelo Login/Senha e se encontra no menu principal

Funcionalidade: Inclusão de veículo

  Cenário: Preencher todos os dados do veículo com informações válidas
    Dado que o usuário está na tela de "Incluir veículo"
    E o usuário preenche os seguintes dados:
      | Campo                 | Valor              |
      | Marca                 | Toyota            |
      | Modelo                | Corolla           |
      | Ano Fabricação        | 2020              |
      | Ano Modelo            | 2020              |
      | Versão                | XL                 |
      | Portas                | 4                 |
      | Cor                   | Preto             |
      | Combustível           | Gasolina          |
      | Câmbio                | Automático        |
      | Condição do Veículo   | Usado             |
      | Quilometragem         | 15000             |
      | Placa                 | yvt-6565          |
      | Chassi                | A2B3C4D5E6F7G8H9J |
      | Blindado              | Não               |
      | Preço                 | 50000             |
    Quando o usuário clicar em "CONFIRMAR"
    Então o sistema deve exibir a mensagem de sucesso "Veículo incluído com sucesso"

  Cenário: Tentativa de inclusão de veículo com campos obrigatórios não preenchidos
    Dado que o usuário está na tela de "Incluir veículo"
    E o usuário tenta submeter o formulário sem preencher os campos obrigatórios
    Quando clicar no botão "CONFIRMAR"
    Então o sistema deve exibir uma mensagem de erro acima, indicando quais os campos obrigatórios devem ser preenchidos

Funcionalidade: Inclusão de informações opcionais do veículo

  Cenário: Seleção de itens opcionais do veículo
    Dado que o usuário está na tela de "Incluir veículo"
    E o usuário seleciona várias opções no campo " 2. Informações complementares"
    Quando clica no botão "CONFIRMAR"
    Então o sistema deve salvar os itens opcionais selecionados 
    E exibir a mensagem "Sucesso"

  Cenário: Validar formato da placa do veículo com Sucesso
    Dado que o usuário está na página de cadastro de veículo
    E o usuário preenche a placa com "abc1234"
    Quando o usuário clicar em "CONFIRMAR"
    Então o sistema deve salvar a placa do veiculo

  Cenário: Erro ao Validar formato da placa do veículo
    Dado que o usuário está na página de cadastro de veículo
    E o usuário preenche a placa com "abc"
    Quando o usuário clicar em "CONFIRMAR"
    Então o sistema deve mostrar uma mensagem de erro "Placa do Veículo: Preenchimento obrigatório."

 X Cenário: Erro ao validar comprimento do chassi do veículo
    Dado que o usuário está na página de cadastro de veículo
    E o usuário preenche o chassi com "gdsfsfsfsf"
    Quando o usuário clicar em "CONFIRMAR"
    Então o sistema deve mostrar uma mensagem de erro "Chassi deve ter 17 caracteres"

   Cenário: Validar comprimento do chassi do veículo com Sucesso
    Dado que o usuário está na página de cadastro de veículo
    E o usuário preenche o chassi com "com 17 caracteres"
    Quando o usuário clicar em "CONFIRMAR"
    Então o sistema deve salvar o chassi do veiculo

  Cenário: Erro ao validar quilometragem do veículo
    Dado que o usuário está na página de cadastro de veículo
    E o usuário preenche a quilometragem como "10k"
    Quando o usuário clica em "CONFIRMAR"
    Então o sistema deve mostrar uma mensagem de erro "O valor '10 k' não é válido para Quilometragem."

  Cenário: Validar Quilometragem do veículo com Sucesso
    Dado que o usuário está na página de cadastro de veículo
    E o usuário preenche a quilometragem como "12365"
    Quando o usuário clica em "CONFIRMAR"
    Então o sistema deve salvar a quilometragem do veiculo

Funcionalidade: Inclusão de vídeo para o veículo

  Cenário: Adicionar um link de vídeo na inclusão do veículo
    Dado que o usuário está na tela de "Incluir veículo"
    E o usuário adiciona um link válido no campo "Link do Vídeo (Youtube)"
    Quando clicar no botão "CONFIRMAR"
    Então o sistema deve salvar o link do vídeo 
    E exibir a mensagem "Sucesso"

Funcionalidade: Inclusão de fotos do veículo

  Cenário: Adicionar fotos ao cadastro do veículo
    Dado que o usuário está na tela de "Incluir veículo"
    E o usuário faz o upload de fotos no campo "5. Fotos"
    Quando clicar no botão "CONFIRMAR"
    Então o sistema deve salvar as fotos 
    E exibir a mensagem "Sucesso"

   Cenário: Realizar exclusão da imagem
    Dado que o usuário está na tela de "Incluir veículo"
    E o usuário faz o upload de fotos no campo "5. Fotos"
    Quando clicar no (X) de exclusão de imagem
    Então o sistema exclui a imagem
    E o campo preenchido antes, fica vazio

 X Cenário: Inclusão de arquivo que não é uma imagem no campo de upload de fotos
    Dado que o usuário está na tela de "Incluir veículo"
    Quando o usuário tenta fazer o upload de um arquivo .PDF no campo "5. Fotos"
    And clica no botão "Incluir"
    Então o sistema não carregará o arquivo 
    E o sistema deve exibir uma mensagem de erro "Formato de arquivo inválido. Somente imagens são permitidas"

Funcionalidade: Responsividade ao acessar a plataforma

 X Cenário: Usuário acessa a tela de inclusão de veículo em um dispositivo móvel
    Dado que o usuário acessa a tela de "Incluir veículo" em um dispositivo com resolução de 412x915 (iPhone 6/7/8 & Samsung Galaxy)
    E o usuário tenta preencher os campos e enviar o formulário
    Então todos os elementos devem ser exibidos corretamente
    E o formulário deve ser submetido sem problemas

  Cenário: Usuário acessa a tela de inclusão de veículo em um dispositivo desktop
    Dado que o usuário acessa a tela de "Incluir veículo" em um dispositivo desktop com monitor com resolução baixa
    E o usuário tenta preencher os campos e enviar o formulário
    Então todos os elementos devem ser exibidos corretamente
    E o formulário deve ser submetido sem problemas