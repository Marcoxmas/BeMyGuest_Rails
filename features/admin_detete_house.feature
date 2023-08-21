Feature: Deleting a house as an admin user

  Scenario: Deleting a house as an admin
    Given there is a house with an owner
    And I am logged in as an admin user
    When I am on the owner's profile page
    And I click on one "Elimina come admin" button
    Then I should see "House was successfully deleted"
