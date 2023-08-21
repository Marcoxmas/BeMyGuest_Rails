Feature: Contacting the owner of a house

  Scenario: Contacting the owner via email
    Given there is a house with an owner
    And I am logged in as another user
    And I have a house of my own
    When I am on the house details page
    And I click on the "Contatta l'host" link
    Then I should see "L'Host è stato contattato con successo"
