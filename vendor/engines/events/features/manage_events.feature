@events
Feature: Events
  In order to have events on my website
  As an administrator
  I want to manage events

  Background:
    Given I am a logged in refinery user
    And I have no events

  @events-list @list
  Scenario: Events List
   Given I have events titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of events
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @events-valid @valid
  Scenario: Create Valid Event
    When I go to the list of events
    And I follow "Add New Event"
    And I fill in "Title Fi" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 event

  @events-invalid @invalid
  Scenario: Create Invalid Event (without title_fi)
    When I go to the list of events
    And I follow "Add New Event"
    And I press "Save"
    Then I should see "Title Fi can't be blank"
    And I should have 0 events

  @events-edit @edit
  Scenario: Edit Existing Event
    Given I have events titled "A title_fi"
    When I go to the list of events
    And I follow "Edit this event" within ".actions"
    Then I fill in "Title Fi" with "A different title_fi"
    And I press "Save"
    Then I should see "'A different title_fi' was successfully updated."
    And I should be on the list of events
    And I should not see "A title_fi"

  @events-duplicate @duplicate
  Scenario: Create Duplicate Event
    Given I only have events titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of events
    And I follow "Add New Event"
    And I fill in "Title Fi" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 events

  @events-delete @delete
  Scenario: Delete Event
    Given I only have events titled UniqueTitleOne
    When I go to the list of events
    And I follow "Remove this event forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 events
 