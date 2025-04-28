Feature: Log Custom Filter with Pattern Matching
  As a user,
  I want to use the "*" symbol in the log custom filter options,
  So that I can match patterns and filter logs based on the selected column and options.

  @1192_Log_custom_filter_with_series_of_IP_with_"*"_in_field
  Background:
    Given The system has predefined columns and options for filtering
    And The user is logged in with appropriate permissions

  @1192_Log_custom_filter_with_series_of_IP_with_"*"_in_field
  Scenario: Base on the star symbol, all devices should come
    When I use "*beat*" in the agent type column filter
    Then All devices (filebeat, winlogbeat) should be included in the filter results

  @1192_Log_custom_filter_with_series_of_IP_with_"*"_in_field
  Scenario: For double star, the log should segregate
    When I use "*info*" in the log level column filter
    Then The logs should be segregated based on different log levels (information)

  @1192_Log_custom_filter_with_series_of_IP_with_"*"_in_field
  Scenario: For star in the same column
    When I use "*" in the log file path column filter
    Then The filter should match all log file paths and display the relevant logs

  @1192_Log_custom_filter_with_series_of_IP_with_"*"_in_field
  Scenario: For star in different columns
    When I use "*" in both the "agent.type.keyword" and "log.level.keyword" column filters
    Then The filter should match both patterns and display the relevant logs

  @1192_Log_custom_filter_with_series_of_IP_with_"*"_in_field
  Scenario: Add a new child log to the filter
    When I add a new child log filter with a specific pattern using "*"
    Then The child log should be added and the data should be segregated based on the new filter

  @1192_Log_custom_filter_with_series_of_IP_with_"*"_in_field
  Scenario: Edit the child log filter
    When I edit the child log filter by modifying the pattern with "*"
    Then The data should be re-segregated based on the updated filter

  @1192_Log_custom_filter_with_series_of_IP_with_"*"_in_field
  Scenario: Updated filter data should be segregated
    When I update the filter with new conditions
    Then The data should be segregated accordingly
    And The filtered data should be shown on the log search page

  @1192_Log_custom_filter_with_series_of_IP_with_"*"_in_field
  Scenario: Delete a filter and update data
    When I delete an existing filter
    Then The data should be updated dynamically based on the remaining filters
    And The filtered data should be re-segregated accordingly

  @1192_Log_custom_filter_with_series_of_IP_with_"*"_in_field
  Scenario: Add "AND" condition with different columns
    When I apply an "AND" condition with "*" in both "agent.type.keyword" and "log.file.path.keyword" filters
    Then The logs should match both conditions (e.g., "*filebeat" AND "*path/to/log")
    And The relevant logs should be displayed

  @1192_Log_custom_filter_with_series_of_IP_with_"*"_in_field
  Scenario: Add "OR" condition with different columns
    When I apply an "OR" condition with "*" in both "agent.type.keyword" and "fields.application_type.keyword" filters
    Then The logs should match either condition (e.g., "*filebeat" OR "*apache")
    And The relevant logs should be displayed

  @1192_Log_custom_filter_with_series_of_IP_with_"*"_in_field
  Scenario: Add "AND" condition with the same column
    When I apply an "AND" condition with "*" in the "log.level.keyword" filter (e.g., "*error" AND "*warning")
    Then The logs should match both conditions within the same column
    And The relevant logs should be displayed

  @1192_Log_custom_filter_with_series_of_IP_with_"*"_in_field
  Scenario: Add "OR" condition with the same column
    When I apply an "OR" condition with "*" in the "log.level.keyword" filter (e.g., "*error" OR "*critical")
    Then The logs should match either condition within the same column
    And The relevant logs should be displayed

  @1192_Log_custom_filter_with_series_of_IP_with_"*"_in_field
  Scenario: For multiple cases with "AND" and "OR"
    When I apply multiple conditions with "*" using "AND" and "OR" (e.g., host.ip.keyword : "10.0.*" AND log.file.path.keyword : "/var/log/mongodb/mongod*" OR fields.application_type.keyword : "redislogs"  OR message.keyword : "*linux*")
    Then The logs should match both conditions and display the relevant logs
