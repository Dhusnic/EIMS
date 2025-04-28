Feature: The Multi Index based report generation For Log reports
Background:
    Given I am logged into the application 
    And I navigate to the reports page


@13728
Scenario: Verify Index Type Selection in report Configuration
Given I am on the report Configuration screen
When I select an index type from the dropdown
Then The selected index type should be updated and saved correctly

@13728
Scenario: Verify on Selecting "Index" Toggle, All Indices Should Be Visible
Given I am on the report Configuration screen
When I select the "Index" toggle
Then All available single indices should be displayed

@13728
Scenario: Verify on Selecting "Multi Index" Toggle, All Multi Indices Should Be Visible
Given I am on the report Configuration screen
When I select the "Multi Index" toggle
Then All available multi indices should be displayed

@13728
Scenario: Verify report Data by Selecting a Single Index
Given I have selected an index in the report Configuration
When I save the configuration and view the report
Then The report should display data corresponding to the selected index

@13728
Scenario: Verify report Data by Selecting Multiple Indices
Given I have selected multiple indices in the report Configuration
When I save the configuration and view the report
Then The report should display aggregated data from all selected indices

@13728
Scenario: Verify report Data by Selecting a Multi Index
Given I have selected a multi index in the report Configuration
When I save the configuration and preview the report
Then the report should display data corresponding to the selected multi index

@13728
Scenario: Verify report Data by Selecting Multiple Multi Indices
Given I have selected multiple multi indices in the report Configuration
When I save the configuration and edit the report
Then the report should display data corresponding to all selected multi indices


@13728
Scenario: Verify report Data by Selecting a Multi Index
Given I have selected a multi index in the report Configuration
When I save the configuration and clone the report
Then the report should display data corresponding to the selected multi index

@13728
Scenario: Verify report Data by Selecting Multiple Multi Indices
Given I have selected multiple multi indices in the report Configuration
When I save the configuration and scheduled the report
Then the report should display data corresponding to all selected multi indices

@13728
Scenario: Verify report Data by Selecting a Multi Index
Given I have selected a multi index in the report Configuration
When I save the configuration and export the report
Then the report should display data corresponding to the selected multi index


@13728
Scenario: Verify report Data by Selecting a Index
Given I have selected an index in the report Configuration
When I save the configuration and preview the report
Then the report should display data corresponding to the selected index

@13728
Scenario: Verify report Data by Selecting  Index
Given I have selected index in the report Configuration
When I save the configuration and edit the report
Then the report should display aggregated data from all selected indices

@13728
Scenario: Verify report Data by Selecting a Index
Given I have selected an index in the report Configuration
When I save the configuration and scheduled the report
Then the report should display data corresponding to the selected index

@13728
Scenario: Verify report Data by Selecting a Index
Given I have selected an index in the report Configuration
When I save the configuration and export the report
Then the report should display data corresponding to the selected index

@13728
Scenario: Verify report Data by Selecting Multiple Indices
Given I have selected multiple indices in the report Configuration
When I save the configuration and send the report
Then the report should display aggregated data from all selected indices

@13728
Scenario: Verify report Data by Selecting Index
Given I have selected an index in the report Configuration
When I save the configuration and send the report
Then the report should display data corresponding to the selected index