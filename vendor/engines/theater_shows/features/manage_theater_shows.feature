@theater_shows
Feature: Theater Shows
  In order to have theater_shows on my website
  As an administrator
  I want to manage theater_shows

  Background:
    Given I am a logged in refinery user
    And I have no theater_shows

  @theater_shows-list @list
  Scenario: Theater Shows List
   Given I have theater_shows titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of theater_shows
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @theater_shows-valid @valid
  Scenario: Create Valid Theater Show
    When I go to the list of theater_shows
    And I follow "Add New Theater Show"
    And I fill in "Title Fi" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 theater_show

  @theater_shows-invalid @invalid
  Scenario: Create Invalid Theater Show (without title_fi)
    When I go to the list of theater_shows
    And I follow "Add New Theater Show"
    And I press "Save"
    Then I should see "Title Fi can't be blank"
    And I should have 0 theater_shows

  @theater_shows-edit @edit
  Scenario: Edit Existing Theater Show
    Given I have theater_shows titled "A title_fi"
    When I go to the list of theater_shows
    And I follow "Edit this theater_show" within ".actions"
    Then I fill in "Title Fi" with "A different title_fi"
    And I press "Save"
    Then I should see "'A different title_fi' was successfully updated."
    And I should be on the list of theater_shows
    And I should not see "A title_fi"

  @theater_shows-duplicate @duplicate
  Scenario: Create Duplicate Theater Show
    Given I only have theater_shows titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of theater_shows
    And I follow "Add New Theater Show"
    And I fill in "Title Fi" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 theater_shows

  @theater_shows-delete @delete
  Scenario: Delete Theater Show
    Given I only have theater_shows titled UniqueTitleOne
    When I go to the list of theater_shows
    And I follow "Remove this theater show forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 theater_shows
 