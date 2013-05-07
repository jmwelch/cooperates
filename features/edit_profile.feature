Feature: Edit Profile
  In order to edit profile
  A authenticated visitor
  Should click edit profile, fill out the fields, and update
    
  Scenario: Visitor edits profile
  Given I am a new, authenticated user
  When I click "Home"
  Then I should see "Outward Facing Profile"
  When I click "Edit Your Profile"
  And I fill in "user_username" with "Panera"
  And I fill in "user_description" with "An amazing bakery of utter awesomeness"
  And I fill in "user_price_range" with "9000"
  And I fill in "user_address" with "2025 Dooley Drive, Decatur GA 30322"
  And I press "Update User"
  Then I should see "Panera's page"