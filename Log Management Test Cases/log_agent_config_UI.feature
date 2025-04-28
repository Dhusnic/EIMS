Feature : Log Agent Configuration
Background :
Given user logged in
When user navigates to Log Agent Configuration
And user clicks on the Log Agent Configuration

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration Verify the lisense
    When user have the license
    And  user have the view permission
    Then user should be able to view the Log Agent Configuration

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration Verify the lisense
    When user dont have the license
    Then user should not be able to view the Log Agent Configuration


@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration Verify the view permission
    When user have the view permission
    Then user should be able to view the Log Agent Configuration

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration Verify the add permission
    When user have the add permission
    Then user should be able to add the Log Agent Configuration

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration Verify the upload permission
    When user have the upload permission
    Then user should be able to upload the Log Agent Configuration

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration Verify the view permission
    When user not have the view permission
    Then user should not be able to view the Log Agent Configuration

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration Verify the add permission
    When user not have the add permission
    Then user should not be able to add the Log Agent Configuration

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration Verify the upload permission
    When user not have the upload permission
    Then user should not be able to upload the Log Agent Configuration

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Log Agent Configuration
    When user have the license
    And user have the view permission
    And user navigate to Log Agent Configuration
    Then user should be able to view the Log Agent Configuration with the default configuration

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Log Agent Configuration with winlogbeat as agent type
    When user have the license
    And user have the view permission
    And user navigate to Log Agent Configuration
    And UI should load with winlogbeat as agent type

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Log Agent Configuration with filebeat as agent type
    When user have the license
    And user have the view permission
    And user navigate to Log Agent Configuration
    And UI should load with filebeat as disabled for agent type

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Log Agent Configuration with filebeat as agent type
    When user have the license
    And user have the view permission
    And user navigate to Log Agent Configuration
    Then UI should load with agent type as Mandatory one with "*"

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Log Agent Configuration with inventory agent as Mandatory one
    When user have the license
    And user have the view permission
    And user navigate to Log Agent Configuration
    Then UI should load with inventory agent as Mandatory one with "*"

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Log Agent Configuration with inventory agent options
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with inventory agent options

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Log Agent Configuration with inventory agent as multiple selection
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with inventory agent as multiple selection

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Log Agent Configuration with WinlogAgent Configuration
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with default WinlogAgent Configuration

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Log Agent Configuration with WinlogAgent Configuration with single selection
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with WinlogAgent Configuration with single selection for event types

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Log Agent Configuration with WinlogAgent Configuration attributes as text area
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with WinlogAgent Configuration attributes of event type for text area

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Log Agent Configuration with addable WinlogAgent Configuration
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with addable WinlogAgent Configuration
    And user give add configuration
    Then new box of event should appear

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Log Agent Configuration with addable WinlogAgent Configuration
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with addable WinlogAgent Configuration
    And user give add configuration
    Then new box of event should appear
    And user select event type
    Then the attributes to add for the event type should appear

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Log Agent Configuration with deleteable WinlogAgent Configuration
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with deleteable WinlogAgent Configuration
    And user give delete configuration
    Then the configuration should be deleted

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Log Agent Configuration with editable WinlogAgent Configuration
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with editable WinlogAgent Configuration
    And user give edit configuration
    Then the configuration should be edited

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Add pipeline configuration as Mandatory one
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with Add pipeline configuration as Mandatory one with "*"
    

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Add pipeline configuration as Multiple selection
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with Add pipeline configuration as Multiple selection

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Add pipeline configuration as parent pipelines
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with Add pipeline configuration with option to select parent pipeline

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Add Host
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with Add Host as optional

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the Add Host
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with Add Host as optional
    And user can add multiple hosts

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able cancel
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with data
    And user gave cancel button
    Then user should be able to cancel the configuration

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to save
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with data
    And user gave save button
    Then user should be able to save the configuration

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the saved configuration
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with data
    And user gave save button
    Then user should be able to save the configuration
    And user again navigate to Log Agent Configuration
    And user should be able to view the saved configuration

@12126_Log_Agent_configuration_UI_implementation
Scenario:UI_log_agent_configuration then  user should be able to view the upload configuration
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with data
    And user gave save button
    Then user should be able to uploaded the configuration


@12126_Log_Agent_configuration_UI_implementation\
Scenario:UI_log_agent_configuration then  user should be able to view the upload configuration
    When user have the license
    And user have the view and add permission
    And user navigate to Log Agent Configuration
    Then UI should load with data
    And user gave upload button
    Then user should be able to upload the configuration
    And user again navigate to Log Agent Configuration
    And user should be able to view the uploaded configuration



based on user permission to asset inventory agent should show 
user visibiliy
mandotary and icon and field is required
multiple inventory agent and multiple pipeline
Agent type cases
invetory agents
add pipe
log server ip
port
filebeat disable
