@guestbook_notes
Feature: Guestbook Notes
  In order to have guestbook_notes on my website
  As an administrator
  I want to manage guestbook_notes

  Background:
    Given I am a logged in refinery user
    And I have no guestbook_notes

  @guestbook_notes-list @list
  Scenario: Guestbook Notes List
   Given I have guestbook_notes titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of guestbook_notes
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @guestbook_notes-valid @valid
  Scenario: Create Valid Guestbook Note
    When I go to the list of guestbook_notes
    And I follow "Add New Guestbook Note"
    And I fill in "Writer Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 guestbook_note

  @guestbook_notes-invalid @invalid
  Scenario: Create Invalid Guestbook Note (without writer_name)
    When I go to the list of guestbook_notes
    And I follow "Add New Guestbook Note"
    And I press "Save"
    Then I should see "Writer Name can't be blank"
    And I should have 0 guestbook_notes

  @guestbook_notes-edit @edit
  Scenario: Edit Existing Guestbook Note
    Given I have guestbook_notes titled "A writer_name"
    When I go to the list of guestbook_notes
    And I follow "Edit this guestbook_note" within ".actions"
    Then I fill in "Writer Name" with "A different writer_name"
    And I press "Save"
    Then I should see "'A different writer_name' was successfully updated."
    And I should be on the list of guestbook_notes
    And I should not see "A writer_name"

  @guestbook_notes-duplicate @duplicate
  Scenario: Create Duplicate Guestbook Note
    Given I only have guestbook_notes titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of guestbook_notes
    And I follow "Add New Guestbook Note"
    And I fill in "Writer Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 guestbook_notes

  @guestbook_notes-delete @delete
  Scenario: Delete Guestbook Note
    Given I only have guestbook_notes titled UniqueTitleOne
    When I go to the list of guestbook_notes
    And I follow "Remove this guestbook note forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 guestbook_notes
 