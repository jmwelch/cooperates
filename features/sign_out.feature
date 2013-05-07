Feature: Sign Out
  In order to sign out
  A authenticated visitor
  Should log out using the Logout link
  
  Scenario: Visitor signs in
  Given I am a new, authenticated user
  When I click "Logout"
  Then page should have notice message "Signed out successfully."