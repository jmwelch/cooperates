Feature: Add Ingredient
  In order to add food
  A authenticated visitor
  Should click edit menu, click add food, fill out the fields, and add
    
  Scenario: Visitor adds ingredient
  Given I am a new, authenticated user
  When I click "Home"
  Then I should see "Inward Facing Profile"
  When I click "Edit Inventory"
  When I click "Add an item to your Inventory"
  And I fill in "stock_ingredient_name" with "cream cheese"
  And I fill in "stock_quantity" with "42"
  And I fill in "stock_low_quantity" with "5"
  And I press "Update"
  Then I should see "This ingredient's stock status is"