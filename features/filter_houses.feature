Feature: Filtering houses by availability dates

  Scenario: User filters houses by availability dates
    Given there are houses with different availability dates
    When I am on the search results page
    And I select a start date and an end date for availability
    And I click on the "Cerca" button
    Then I should see only the houses that are available within the selected dates
    And I should not see houses that are not available within the selected dates