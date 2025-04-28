Feature: Compliance reports - log summary Report
Background:
Given user logged in
When user navigates to Report
And clicks on it

@Log_Management_Log_Summary_Report_9409
Scenario: Verify the Log Management license for report
    Given Navigate to report
    When a user clicks on the Add Report
    Then user can be able to see the log management category

@Log_Management_Log_Summary_Report_9409
Scenario: Verfiy the log summary report card
    Given Navigate to report
    When a user click on the Add Report
    And user can be able to see the see the list of category
    And user clicks on the log management category
    Then user can be able to see the log summary report card in log management category

@Log_Management_Log_Summary_Report_9409
Scenario: Verify the Indices fields data display
    Given Navigate to report
    When a user click on the Add Report
    And click on log summary report card
    Then now the user can be able to see the configuration page
    Then user can be able to see the indices fields
    And user click on the indices fields
    Then user can see the data like "linux" , "windows" pattern on the dropdown

@Log_Management_Log_Summary_Report_9409
Scenario: Verify the log Column fields data display
    Given Navigate to report
    When a user click on the Add Report
    And click on log summary report card
    Then now the user can be able to see the configuration page
    Then user can be able to see the Log Column fields
    And user click on the Log Column fields
    Then user can see the log column data like both linux and widowns column in the dropdown


@Log_Management_Log_Summary_Report_9409
Scenario: Verify the Column fields data display
    Given Navigate to report
    When a user click on the Add Report
    And click on log summary report card
    Then now the user can be able to see the configuration page
    Then user can be able to see the Column fields
    And user click on the Column fields
    Then user can see the column data like "All the asset inventory data" in the dropdown

@Log_Management_Log_Summary_Report_9409
Scenario: Verify the search filter
    Given Navigate to report
    When a user click on the Add Report
    And click on log summary report card
    Then now the user can be able to see the configuration page
    Then user can be able to see the search filter
    And user click on the search fields
    Then user can see the search data like "All the asset inventory data"

@Log_Management_Log_Summary_Report_9409
Scenario: Verify the select all toggle filter
    Given Navigate to report
    When a user click on the Add Report
    And click on log summary report card
    Then now the user can be able to see the configuration page
    Then user can be able to see the select all toggle filter
    And user click on the select all toggle filter
    Then now the select all toggle filter select all the data columns from the columns fields

@Log_Management_Log_Summary_Report_9409
Scenario: Verify the filter
    Given Navigate to report
    When a user click on the Add Report
    And click on log summary report card
    Then now the user can be able to see the configuration page
    And once the user completed filling all the fields in the configuration page
    Then click on next button
    Then now the user can be able to see the filter page

@Log_Management_Log_Summary_Report_9409
Scenario: Verify the filter timescale fields
    Given Navigate to report
    When a user click on the Add Report
    And click on log summary report card
    Then now the user can be able to see the configuration page
    And once the user completed filling all the fields in the configuration page
    Then click on next button
    Then now the user can be able to see the filter page and timescale field

@Log_Management_Log_Summary_Report_9409
Scenario: Verify the custom filters
    Given Navigate to report
    When a user click on the Add Report
    And click on log summary report card
    Then now the user can be able to see the configuration page
    And once the user completed filling all the fields in the configuration page
    Then click on next button
    Then now the user can be able to see filter page and asset custom filter
    When user applty the filter
    Then the data load on the report preivew should load based on the filter

@Log_Management_Log_Summary_Report_9409
Scenario: Verify the custom data displays
    Given Navigate to report
    When a user click on the Add Report
    And click on log summary report card
    Then now the user can be able to see the configuration page
    And once the user completed filling all the fields in the configuration page
    Then click on next button
    Then now the user can be able to see filter page and asset custom filter
    Then user can be able to see the asset columns in the dropdown

@Log_Management_Log_Summary_Report_9409
Scenario: Verify the logs custom data displays
    Given Navigate to report
    When a user click on the Add Report
    And click on log summary report card
    Then now the user can be able to see the configuration page
    And once the user completed filling all the fields in the configuration page
    Then click on next button
    Then now the user can be able to see filter page and logs custom filter
    Then user can be able to see the logs columns in the logs custom field has context menu
    When user apply the log custom filter
    Then the data load on the report preivew should load based on the log custom filter


@Log_Management_Log_Summary_Report_9409
Scenario: Verify the visibility log data in reports
    Given  Navigate to report
    When a user click on the Add Report
    And user creates one report 
    Then the log data will be visible based on the asset access of the users.

@Log_Management_Log_Summary_Report_9409
Scenario: Verify the private button on the view report
    Given  Navigate to report
    When a user click on the Add Report
    And user enter all the fields on the configuration page
    Then filter page will be displayed 
    And user fill the required fields on the filter page 
    And click on the View Report 
    Then View Report page with Private button will be displayed
    And user click on the private report the report will be view only for the selected users or team and creators.

@Log_Management_Log_Summary_Report_9409
Scenario: Verify the public button on the view report
    Given  Navigate to report
    When a user click on the Add Report
    And user enter all the fields on the configuration page
    Then filter page will be displayed 
    And user fill the required fields on the filter page 
    And click on the View Report 
    Then View Report page with public button will be displayed
    And user click on the public report the report will be view for all.
