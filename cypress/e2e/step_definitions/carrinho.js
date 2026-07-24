import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";

Given("que estou na página inicial da loja", () => {
  cy.visit("/");
});

When("eu clico no botão {string} de um produto", (textoBotao) => {
  cy.contains("button", textoBotao).first().click();
});

Then("devo ver a mensagem {string}", (mensagem) => {
  cy.get("#alert-container").should("be.visible").and("contain.text", mensagem);
});