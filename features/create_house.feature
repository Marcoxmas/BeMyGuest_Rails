Feature: Add a house and view details

  Background:
    Given there is a user with email "user@example.com" and password "password"

  Scenario: User adds a house and views details
    Given I am logged in as "user@example.com"
    When I visit the new house page
    And I fill in the house details
    And I click the "Conferma e invia" button
    Then I should see the message "House was successfully created."
