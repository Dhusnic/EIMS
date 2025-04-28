Feature: 15799 Input id remove from pipeline conf and validation for index pattern field
Background:
    Given the user is logged in
    And the user has navigated to the "Pipeline Configuration" page
    
Scenario: Verify Input id remove from pipeline conf
    Given the user clicks on "Add" in the "Pipeline Configuration" page
    And the user gives input to all mandatory fields
    And user chooses to fill  the input config
    Then there Appears only 2 input fields in the input config [input type and port]
    And the user clicks on "Save" button
    Then the input id should be removed from the pipeline configuration
    And the index pattern field should be validated with a message "Index pattern is required"

Scenario: Verify the validation for index pattern field
    Given the user clicks on "Add" in the "Pipeline Configuration" page
    And the user gives input to all mandatory fields
    And fill the index name field with invalid value
    And the user clicks on "Save" button
    Then the index pattern field should be validated with a message "Index name should be valid"