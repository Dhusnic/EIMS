Feature: Custom filter implementation in Rule page
Background:
    Given user logged in
    When user navigates to Rule page
    And clicks on it


@14565
Scenario: Index Pattern implementation in Rule page
    When user clicks on Add Rule
    And user chooses to add a "New Rule"
    And user chooses the "Log Rule"
    And user chooses to give data to Mandatory fields
    And user selects the "Index Pattern"
    And user select Index from Multi select dropdown
    And user saves the  rule
    Then user should see the success message "Rule created successfully"

@14565
Scenario: Multiple Index Pattern implementation in Rule page
    When user clicks on Add Rule
    And user chooses to add a "New Rule"
    And user chooses the "Log Rule"
    And user chooses to give data to Mandatory fields
    And user selects the "Multi Index Pattern"
    And user select Index from Multi select dropdown

@14565
Scenario: Custom filter implementation in Rule page based on Index Pattern
    When user clicks on Add Rule
    And user chooses to add a "New Rule"
    And user chooses the "Log Rule"
    And user chooses to give data to Mandatory fields
    And user selects the "Index Pattern"
    And user select Index from Multi select dropdown
    And user selects the "Log Custom Filter"
    And the suggestion based on the input of Index Pattern is displayed
    And user saves the  rule
    Then user should see the success message "Rule created successfully"


@14565
Scenario: Custom filter implementation in Rule page based on Multi Index Pattern
    When user clicks on Add Rule
    And user chooses to add a "New Rule"
    And user chooses the "Log Rule"
    And user chooses to give data to Mandatory fields
    And user selects the "Multi Index Pattern"
    And user select Index from Multi select dropdown
    And user selects the "Log Custom Filter"
    And the suggestion based on the input of Multi Index is displayed
    And user saves the  rule
    Then user should see the success message "Rule created successfully"

@14565
Scenario: Custom filter implementation in Rule page based on no Options selected
    When user clicks on Add Rule
    And user chooses to add a "New Rule"
    And user chooses the "Log Rule"
    And user chooses to give data to Mandatory fields
    And user did not select Anyoption for Index Pattern or Multi Index Pattern
    And user select Index from Multi select dropdown
    And user selects the "Log Custom Filter"
    And the all the suggestion based on the all of Index Pattern and Multi Index is displayed
    And user saves the  rule
    Then user should see the success message "Rule created successfully"

@14565
Scenario: verify the alarm based added custom filter
    When log rule is created with custom filter
    And user saves the  rule
    Then alarm should be created based on custom filter


@14565
Scenario: verify the alarm when multiple AND condition 
    When log rule is created with custom filter with multiple AND condition
    And user saves the  rule
    Then alarm should be created based on custom filter with multiple AND condition

@14565
Scenario: verify the alarm when multiple OR condition
    When log rule is created with custom filter with multiple OR condition
    And user saves the  rule
    Then alarm should be created based on custom filter with multiple OR condition

@14565
Scenario: verify the alarm when multiple AND OR condition
    When log rule is created with custom filter with multiple AND OR condition
    And user saves the  rule
    Then alarm should be created based on custom filter with multiple AND OR condition

@14565
Scenario: verify the alarm when log message value mapped with the *
    When log rule is created with custom filter with log message value mapped with the *
    And user saves the  rule
    Then alarm should be created based on custom filter with log message value mapped with the *

@14565
Scenario: verify the alarm when log message with ip address or severity or agentid or message*
    When log rule is created with custom filter with log message with ip address or severity or agentid or message*
    And user saves the  rule
    Then alarm should be created based on custom filter with log message with ip address or severity or agentid or message*