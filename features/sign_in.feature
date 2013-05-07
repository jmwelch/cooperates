Feature: Sign In
  In order to sign in
  A visitor
  Should authenticate by login form
  
  Scenario: Visitor signs in
    Given I am on the root page
    And I fill in "Email" with "pan@era.com"
    And I fill in "Password" with "panera"
    When I press "Sign in"
    Then page should have notice message "Signed in successfully."