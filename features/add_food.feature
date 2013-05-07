Feature: Add food
  In order to add food
  A authenticated visitor
  Should click edit menu, click add food, fill out the fields, and add
    
  Scenario: Visitor adds food
  Given I am a new, authenticated user
  Given I have added an ingredient
  When I click "Home"
  Then I should see "Inward Facing Profile"
  Then I should see "cream cheese"
  When I click "Edit Menu"
  When I click "Add food?"
  And I fill in "food_name" with "bagel"
  And I fill in "Price" with "$4.00"
  And I fill in "food_ingredients_attributes_0_ingredient_name" with "cream cheese"
  And I fill in "food_ingredients_attributes_0_quantity_used" with "4"
  And I press "Submit"
  Then I should see "Remove this Food"