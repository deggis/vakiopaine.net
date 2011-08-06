@newsitems
Feature: Newsitems
  In order to have newsitems on my website
  As an administrator
  I want to manage newsitems

  Background:
    Given I am a logged in refinery user
    And I have no newsitems

  @newsitems-list @list
  Scenario: Newsitems List
   Given I have newsitems titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of newsitems
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @newsitems-valid @valid
  Scenario: Create Valid Newsitem
    When I go to the list of newsitems
    And I follow "Add New Newsitem"
    And I fill in "Title Fi" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 newsitem

  @newsitems-invalid @invalid
  Scenario: Create Invalid Newsitem (without title_fi)
    When I go to the list of newsitems
    And I follow "Add New Newsitem"
    And I press "Save"
    Then I should see "Title Fi can't be blank"
    And I should have 0 newsitems

  @newsitems-edit @edit
  Scenario: Edit Existing Newsitem
    Given I have newsitems titled "A title_fi"
    When I go to the list of newsitems
    And I follow "Edit this newsitem" within ".actions"
    Then I fill in "Title Fi" with "A different title_fi"
    And I press "Save"
    Then I should see "'A different title_fi' was successfully updated."
    And I should be on the list of newsitems
    And I should not see "A title_fi"

  @newsitems-duplicate @duplicate
  Scenario: Create Duplicate Newsitem
    Given I only have newsitems titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of newsitems
    And I follow "Add New Newsitem"
    And I fill in "Title Fi" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 newsitems

  @newsitems-delete @delete
  Scenario: Delete Newsitem
    Given I only have newsitems titled UniqueTitleOne
    When I go to the list of newsitems
    And I follow "Remove this newsitem forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 newsitems
 