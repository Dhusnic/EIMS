Feature: Creating winloagbeat configuration file from Log Agent Configuration page
Background:
    Given The user is logged in
    And The user has navigated to the "Log Agent Configuration" page


@13026
Scenario: Create a new winlogbeat configuration file
    When user gave to input to all mandatory fields
    And user clicks on "upload" button
    Then a new winlogbeat configuration file should be created in path "\infraon_api\infraon\media\uploads\<organization_id>\log_agent_config\winlogbeat.yml"

@13026
Scenario: Upload an existing winlogbeat configuration file
    When user gave to input to all mandatory fields
    And User have permission to upload the file
    Then only the upload button should be visible

@13026
Scenario: Upload a file with appropriate config
    When user gave to input to all mandatory fields
    And User have permission to upload the file
    And user clicks on "upload" button
    Then a new winlogbeat configuration file should be created with correct configuration of key value pairs
    Then the path of the file"\infraon_api\infraon\media\uploads\<organization_id>\log_agent_config\winlogbeat.yml"


@13026
Scenario: Upload a file with appropriate Log collecter 
    When user gave to input to all mandatory fields
    And User have permission to upload the file
    And user clicks on "upload" button
    Then a new winlogbeat configuration file should be created with correct config of log collector host
    Then the path of the file"\infraon_api\infraon\media\uploads\<organization_id>\log_agent_config\winlogbeat.yml"

@13026
Scenario: Upload a file with again
    When user gave to input to all mandatory fields
    And User have permission to upload the file
    And user clicks on "upload" button
    Then a new winlogbeat configuration file should be created with correct config of log collector host
    Then the file in "\infraon_api\infraon\media\uploads\<organization_id>\log_agent_config\winlogbeat.yml" should update with new configuration

