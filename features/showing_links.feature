Feature: Showing links
  In order to save myself from having to remember a lot of crap
  As a user
  I want to be able to see previously saved links

  Scenario: When there are no links
    Given I am on the homepage
    Then I should see "Welcome to Bookmark Manager"
    And there should be no links

  Scenario: When there are no links (less declarative)
    Given I have just opened the application
    When I take a look at the application
    Then there should be no links