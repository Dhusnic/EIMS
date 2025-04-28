Feature: Latest Upload Time and Latest Updated Time for Log management Pipeline Configurations
Background:
    Given The user is logged in
    And The user has navigated to the "Pipeline Configuration Page" page

@14253
Scenario: Verify the Latest Update Time in pipeline configuration page
    When user clicks on "Add" in the "Pipeline Configuration" page
    And give input to all mandatory fields
    And click on "Save" button
    Then the latest Updated time should be displayed in the "Pipeline Configuration grid" page based on the user time zone
@14253
Scenario: Verify the Latest Updated Time in pipeline configuration page while editing the pipeline configuration
    When user clicks on "Edit" in the "Pipeline Configuration" page
    And give input to all mandatory fields
    And click on "Save" button
    Then the latest updated time should be displayed in the "Pipeline Configuration grid" page based on the user time zone
@14253
Scenario: Verify the Latest Upload Time in pipeline configuration page
    When user clicks on "Add" in the "Pipeline Configuration" page
    And give input to all mandatory fields
    And click on "Save" button
    And User clicks on "Upload" button
    And the pipeline uploads successfully
    And user choose to see the info
    Then the latest upload time should be displayed in the "info" sidebar based on the user time zone
@14253
Scenario: Verify the Latest Upload Time in pipeline configuration page for pervious configured file
    When click on "Upload" button for pervious configure pipelines
    And the pipeline uploads successfully
    And user choose to see the info
    Then the latest upload time should be displayed in the "info" sidebar based on the user time zone

@14253
Scenario: Verify the Latest Upload Time in pipeline configuration page for pervious configured file according to changed time zone
    When user clicks on "Account Settings" and change the time zone
    And user clicks on "Save" button
    And user navigate to "Pipeline Configuration" page
    And click on "Upload" button for pervious configure pipelines
    And the pipeline uploads successfully
    And user choose to see the info
    Then the latest upload time should be displayed in the "info" sidebar based on the user time zone
@14253
Scenario: Verify the Latest Upload Time in pipeline configuration page for pervious configured file according to changed time zone for child pipelines
    When user clicks on "Add" in the "Pipeline Configuration" page
    And give input to all mandatory fields
    And user add child to parent pipelines
    And click on "Save" button
    And User clicks on "Upload" button
    And the pipeline uploads successfully
    And user choose to see the info
    Then the latest upload time should be displayed in the "info" sidebar based on the user time zone for parent pipelines and  child pipelines
