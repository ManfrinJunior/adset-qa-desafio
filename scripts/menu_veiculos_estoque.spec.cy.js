
describe('AdSet', () => {

  const selectorsList = {
    usernameField: "[name='Email']",
    passwordField: "[type='password']",
    loginButton: "[type='submit']",
    sectionTitleTopBar: "[for='filtro_estoque']",
    wrongCredentialAlert: '.field-validation-error',
    recoverPassword: '#loginBtn',
    includeTitleTopBar: '.heading h3',
    markCar: '.marca',
    modelCar: '.modelo'

  }

  const userData = {
    userSucess: {
      username: 'qa@adset.com.br',
      password: '9PK6#E8m'
    },
  }



  it.only('Menu - Veiculos Estoque ', () => {
    cy.visit('https://www.adset.com.br/Integrador/Home/Index');
    cy.get(selectorsList.usernameField).type(userData.userSucess.username);
    cy.get(selectorsList.passwordField).type(userData.userSucess.password);
    cy.get(selectorsList.loginButton).click();
    cy.location('pathname').should('equal', '/Integrador/Home/Principal');
    cy.get(selectorsList.sectionTitleTopBar).contains('Estoque');
    cy.contains('Veículos').trigger('mouseover');
    cy.get("[href='/Integrador/Veiculo/Cadastro?PageCall=VeiculoAvulso_Index']").should('be.visible').click();
    cy.get('.notExpand');
    cy.get('body').trigger('mousemove').click(0, 0);
    cy.get(selectorsList.includeTitleTopBar).contains('Incluir');

    // 1. Dados do veículo

    cy.get(selectorsList.markCar).click();
    cy.get('.select2-with-searchbox > .select2-results').contains('AUDI').click();
    cy.get('.select2-with-searchbox > .select2-results').should('exist');

    cy.wait(1000);
    cy.get('.modelo > .row-fluid > .select2-container > .select2-choice > span')
      .click();
    cy.get(':nth-child(6) > .select2-result-label')
      .contains('A3').click();

    cy.get(':nth-child(1) > :nth-child(3) > .row-fluid > .select2-container > .select2-choice > div > b').click();
    cy.get('select#AnoFabricacao').select('2024', { force: true });

    cy.get('.versao .select2-choice').click({ force: true });

    cy.get('#Km').type('10000');
  
    cy.get('#Placa').type('tes-1234');
    
    cy.get('#Chassi').type('8BvL1y3pKfw7A4508');

    cy.get('#Valor').type('100.000,00')

    // 2. Informações complementares

    cy.get('.span11 > :nth-child(1) > label').click();
    cy.get('.span11 > :nth-child(9) > label').click();
    cy.get(':nth-child(3) > :nth-child(30) > label').click();

     // Informações
     cy.get('#Informacoes').type('Teste de escrita para venda de carro');

     // Video
     cy.get('#Video').type('iqg0M5PvdpM');


    //  3. Itens de série e opcionais

    cy.get(':nth-child(1) > :nth-child(11) > label').click();
    cy.get(':nth-child(1) > :nth-child(19) > label').click();
    cy.get(':nth-child(3) > :nth-child(30) > label').click();
    cy.get(':nth-child(3) > :nth-child(30) > label').click();

    //  4. Itens de série e opcionais
    cy.get('.button-file > .nostyle').click();

   //cy.get('.buttons-form > .btn-warning').click();
   
  })
})