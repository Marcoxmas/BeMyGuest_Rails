Feature: Deleting a house

  Scenario: Deleting a house
    Given I am logged in as a user
    And I have added a house
    When I visit my profile page
    And I click on the "Elimina casa" button
    Then I should see a confirmation message
    And I should not see the deleted house on my profile page
    And the deleted house should not be in the database