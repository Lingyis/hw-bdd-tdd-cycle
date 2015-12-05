Feature: create movies
 
  As a user
  So that I can browse my favorites movies
  I want to be able to create movies
  
Scenario: able to create a movie
  Given I am on the homepage
  When I follow "Add new movie"
  Then I should be on the create new movie page
  When I fill in "Title" with "Newnewnew Movie"
  And I press "Save Changes"
  Then I should see "Newnewnew Movie"