@exhibitions
Feature: Exhibitions
  In order to have exhibitions on my website
  As an administrator
  I want to manage exhibitions

  Background:
    Given I am a logged in refinery user
    And I have no exhibitions

  @exhibitions-list @list
  Scenario: Exhibitions List
   Given I have exhibitions titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of exhibitions
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @exhibitions-valid @valid
  Scenario: Create Valid Exhibition
    When I go to the list of exhibitions
    And I follow "Add New Exhibition"
    And I fill in "Title Fi" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 exhibition

  @exhibitions-invalid @invalid
  Scenario: Create Invalid Exhibition (without title_fi)
    When I go to the list of exhibitions
    And I follow "Add New Exhibition"
    And I press "Save"
    Then I should see "Title Fi can't be blank"
    And I should have 0 exhibitions

  @exhibitions-edit @edit
  Scenario: Edit Existing Exhibition
    Given I have exhibitions titled "A title_fi"
    When I go to the list of exhibitions
    And I follow "Edit this exhibition" within ".actions"
    Then I fill in "Title Fi" with "A different title_fi"
    And I press "Save"
    Then I should see "'A different title_fi' was successfully updated."
    And I should be on the list of exhibitions
    And I should not see "A title_fi"

  @exhibitions-duplicate @duplicate
  Scenario: Create Duplicate Exhibition
    Given I only have exhibitions titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of exhibitions
    And I follow "Add New Exhibition"
    And I fill in "Title Fi" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 exhibitions

  @exhibitions-delete @delete
  Scenario: Delete Exhibition
    Given I only have exhibitions titled UniqueTitleOne
    When I go to the list of exhibitions
    And I follow "Remove this exhibition forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 exhibitions
 