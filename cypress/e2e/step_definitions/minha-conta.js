import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";

Given("que eu tenho uma conta cadastrada", function () {
  const email = `teste_${Date.now()}@example.com`;
  const password = "Password123!";

  cy.request("POST", "/api/users", {
    name: "John Doe",
    email: email,
    password: password,
    isAdmin: false,
  }).then(() => {
    cy.wrap(email).as("email");
    cy.wrap(password).as("password");
  });
});

When("eu faço login com essa conta", function () {
  cy.visit("/login.html");
  cy.get("#email").type(this.email);
  cy.get("#password").type(this.password);
  cy.contains("button", "Entrar").click();
});

Then("devo ver a tela {string} com meu nome", (tela) => {
  cy.contains(tela.toUpperCase()).should("be.visible");
  cy.contains("Olá,").should("be.visible");
});