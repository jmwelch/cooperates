Feature: Registration
  In order to register
  A visitor
  Should hit Sign up
  
  Scenario: Visitor registers
    Given I am on the root page
    When I click "Sign up"
    And I fill in "Username" with "panera"
    And I fill in "user_email2" with "pan@era.com"
    And I fill in "user_password2" with "panera"
    And I fill in "user_password_confirmation" with "panera"
    And I select "restaurant" from "user_user_type"
    When I press "Sign up"
    Then page should have notice message "Welcome! You have signed up successfully."