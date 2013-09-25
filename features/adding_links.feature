Feature: Adding links
  In order to remember a webpage
  As a user
  I want to save a link

  Scenario: When there are no links
    Given I have just opened the application
    When I fill in "url" with "http://www.google.co.uk"
    And I fill in "title" with "Google UK"
    And I press "Add link"
    Then I should see a link to "http://www.google.co.uk"