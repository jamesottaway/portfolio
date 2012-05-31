@wip
Feature:
  As a photographer
  I want an online portfolio
  So I can sell my photos

  Scenario:
    Given I have a bunch of photos
    When I visit the home page
    Then I should see my photo thumbnails

  Scenario:
    Given I have a photo
    When I view that photo
    Then I should see my photo

  Scenario:
    Given I have a photo
    When I visit the home page
    And I navigate to a category
    Then I should see the photo thumbnails in the category
