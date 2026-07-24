import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";

When("eu envio um POST para {string} com um e-mail novo", function (path) {
  const email = `api_${Date.now()}@example.com`;
  cy.wrap(email).as("email");

  cy.request({
    method: "POST",
    url: path,
    body: { name: "API Teste", email: email, password: "Password123!", isAdmin: false },
  }).then((response) => {
    cy.wrap(response).as("response");
  });
});

Given("que já existe um usuário cadastrado", function () {
  const email = `dup_${Date.now()}@example.com`;
  cy.wrap(email).as("email");

  cy.request("POST", "/api/users", {
    name: "Usuário Duplicado",
    email: email,
    password: "Password123!",
    isAdmin: false,
  });
});

When("eu envio um POST para {string} com o mesmo e-mail", function (path) {
  cy.request({
    method: "POST",
    url: path,
    body: { name: "Usuário Duplicado", email: this.email, password: "Password123!", isAdmin: false },
    failOnStatusCode: false,
  }).then((response) => {
    cy.wrap(response).as("response");
  });
});

When("eu envio um GET para {string} com limit igual a 5", function (path) {
  cy.request(`${path}?page=1&limit=5`).then((response) => {
    cy.wrap(response).as("response");
  });
});

Then("o status code deve ser {int}", function (codigo) {
  expect(this.response.status).to.eq(codigo);
});

Then("o status code não deve ser {int}", function (codigo) {
  expect(this.response.status).to.not.eq(codigo);
});

Then("o corpo da resposta deve conter um id de usuário criado", function () {
  expect(this.response.body).to.have.property("id");
  expect(this.response.body.id).to.be.a("number");
});

Then("devo receber no máximo {int} produtos", function (max) {
  expect(this.response.body.products.length).to.be.at.most(max);
});

Then("o campo {string} deve ser igual a {int}", function (campo, valor) {
  expect(this.response.body[campo]).to.eq(valor);
});