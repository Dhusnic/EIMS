Feature: Log Rule Removed From Correlation Rule (Rules) Page

    As a user
    I want to remove a log rule from a correlation rule
    So that I can manage my correlation rules effectively

    Background:
        Given I am logged into the application
        And I navigate to the Rules page

    @18450
    Scenario: Remove Log Rule from Correlation Rule
        Given I am in Rules page
        And I should see only "Correlation Rules"
        And I should not see any "Log Rules"
    
    @18450
    Scenario: Verify Log Rule is not displayed in Correlation Rule page
        Given I am in Rules page
        When I try to add a new Correlation Rule
        Then I should see sidebar with "Add Correlation Rule" options
        And I should not see any option to add a Log Rule in that add button

    @18450
    Scenario: Verify previously added Log Rule is not displayed in Correlation Rule page
        Given I have previously added a Log Rule to a Correlation Rule
        When I navigate to the Correlation Rule page
        Then I should not see the previously added Log Rule in the list of rules
        And I should see those log rules in Log Rule page

    @18450
    Scenario: Verify Log Rule Add Button in Both Card and Grid Views
        Given I am in Rules page
        When I switch to Card view
        Then I should not see "Add Log Rule" button in Card view
        When I switch to Grid view
        Then I should not see "Add Log Rule" button in Grid view

    @18450
    Scenario: Verify the same Rule Name should not be added again
        Given I am in Rules page
        When I try to add a Correlation Rule with the same name as an existing rule
        Then I should see an error message indicating that the rule name already exists
        And I should not be able to save the new Correlation Rule
