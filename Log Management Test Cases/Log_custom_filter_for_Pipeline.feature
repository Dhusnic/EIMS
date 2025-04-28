Feature: Log Custom Filter
  As a user,
  I want to apply custom filters to logs with fixed columns,
  So that I can segregate and view logs based on conditions.

  Background:
    Given The system has predefined columns and options for filtering
    And The user is logged in with appropriate permissions

  @11736_creating_application_specific_filter_in_filebeat_and_testing
  Scenario: Navigate to pipeline configuration and add/edit pipeline
    Given The user navigates to the "Pipeline Configuration" section
    When The user chooses to add a new pipeline or edit an existing pipeline
    Then The user selects "Parent" as the pipeline type
    And The user can add or edit a child pipeline within the parent pipeline

  @11736_creating_application_specific_filter_in_filebeat_and_testing
  Scenario: Display columns for child logs
    When I add a child log filter
    Then The column names should be displayed separately
    And The data should be segregated based on the selected column

  @11736_creating_application_specific_filter_in_filebeat_and_testing
  Scenario: Filter logs using agent type
    When I select the column "agent.type.keyword"
    Then The available options should be "filebeat", "auditbeat", "winlogbeat"

  @11736_creating_application_specific_filter_in_filebeat_and_testing
  Scenario: Filter logs using log level
    When I select the column "log.level.keyword"
    Then The available options should be "information", "error", "warning", "critical"

  @11736_creating_application_specific_filter_in_filebeat_and_testing
  Scenario: Filter logs using log file path
    When I select the column "log.file.path.keyword"
    Then The available options should be various predefined log file paths

  @11736_creating_application_specific_filter_in_filebeat_and_testing
  Scenario: Filter logs using application type
    When I select the column "fields.application_type.keyword"
    Then The available options should be "linux", "apache", "postgres", "redis", "mysql", "mongodb", "cisco", "juniper", "msexchange"

  @11736_creating_application_specific_filter_in_filebeat_and_testing
  Scenario: Filter logs using host OS name
    When I select the column "host.os.name.keyword"
    Then The available options should be different OS names like "Oracle Linux Server", "Windows 11 Pro", "Ubuntu 22.04 LTS"

  @11736_creating_application_specific_filter_in_filebeat_and_testing
  Scenario: Filter logs using host OS family
    When I select the column "host.os.family.keyword"
    Then The available options should be "redhat", "windows", "debian", "centos", "ubuntu", "amazon", "suse"

  @11736_creating_application_specific_filter_in_filebeat_and_testing
  Scenario: Filter logs using multiple conditions
    When I apply filters with multiple conditions using "AND" (e.g., host.ip.keyword : "10.0.*" AND log.file.path.keyword : "/var/log/mongodb/mongod*")
    Then The data should be segregated accordingly
    And The filtered data should be shown only on the log search page
    And The filtered data can be verified in the log search page

  @11736_creating_application_specific_filter_in_filebeat_and_testing
  Scenario: Filter logs using multiple conditions
    When I apply filters with multiple conditions using "OR" (e.g., log.file.path.keyword : "/var/log/mongodb/mongod*" OR fields.application_type.keyword : "redislogs")
    Then The data should be segregated accordingly
    And The filtered data should be shown only on the log search page
    And The filtered data can be verified in the log search page

  @11736_creating_application_specific_filter_in_filebeat_and_testing
  Scenario: New options are added in suggestions while new logs arrive
    When A new log arrives
    Then New options should be added to the filter suggestions dynamically
    And The user can select those new options to filter logs

    @11736_creating_application_specific_filter_in_filebeat_and_testing
    Scenario: Handle failed conditions
        When I apply a filter with conditions that do not match any data
        Then The system should not show the failed condition data

    @11736_creating_application_specific_filter_in_filebeat_and_testing
    Scenario: Ensure logs are not present if mismatched
        When I apply filters that do not match specific log entries
        Then Those log entries should be excluded from the results

    @11736_creating_application_specific_filter_in_filebeat_and_testing
    Scenario: Update filters dynamically
        When I update the log filter by adding a new filter
        Then The data should be re-segregated accordingly
        When I delete a filter
        Then The data should be updated dynamically based on the remaining filters

    @11736_creating_application_specific_filter_in_filebeat_and_testing
    Scenario: Update filters dynamically
        When I update the log filter by adding a new filter
        Then The data should be re-segregated accordingly
        When I delete a filter
        Then The data should be updated dynamically based on the remaining filters
    
    
    @11736_creating_application_specific_filter_in_filebeat_and_testing
    Scenario: For multiple cases with "AND" and "OR"
        When I apply multiple conditions with "*" using "AND" and "OR" (e.g., host.ip.keyword : "10.0.*" AND log.file.path.keyword : "/var/log/mongodb/mongod*" OR fields.application_type.keyword : "redislogs"  OR message.keyword : "*linux*")
        Then The logs should match both conditions and display the relevant logs