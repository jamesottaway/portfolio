Feature:
  As a photographer
  I want an online portfolio
  So I can sell my photos

  @wip
  Scenario:
    Given I have a bunch of photos
    When I visit the home page
    Then I should see my photos

  @wip
  Scenario:
    Given I have a photo
    When I view that photo
    Then I should see my photo

  @wip
  Scenario:
    Given I have a category
    When I visit the home page
    Then I should see the category

  @wip
  Scenario:
    Given I have a category
    And I have a photo in that category
    When I visit the home page
    And I navigate to the category
    Then I should see my photo
