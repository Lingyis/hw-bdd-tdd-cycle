Feature: delete movies
 
  As a user
  So that I can remove unwanted movies
  I want to be able to delete movies
  
Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: able to delete a movie
  When I go to the details page for "THX-1138"
  And  I press "Delete"
  Then I should be on the homepage
  And  I should see "Movie 'THX-1138' deleted"
  And  I should not see "1971-03-11"
