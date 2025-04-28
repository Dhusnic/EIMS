Feature: The check for valid log config file and editing grok
Background:
Given user logged in
When user navigates to Log piplines
And clicks on it

@12287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: When the log custom filter in Parent pipeline consists of "1111"
    When user clicks on the "Add" button
    And user chooses the pipeline type as "Parent"
    And user Add the child pipeline
    And user chooses the "Log Custom Filter"
    And user chooses the "1111"
    And user clicks on the "Save" button
    And user tries to upload the log config file
    Then user should see the error status "Upload failed"

@12287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: When the log custom filter in Parent pipeline consists of special charecter "@","="
    When user clicks on the "Add" button
    And user chooses the pipeline type as "Parent"
    And user Add the child pipeline
    And user chooses the "Log Custom Filter"
    And user gives the value as "@=123"
    And user clicks on the "Save" button
    And user tries to upload the log config file
    Then user should see the error status "Upload failed"

@12287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: When the log custom filter in Parent pipeline consists of forward slashes
    When user clicks on the "Add" button
    And user chooses the pipeline type as "Parent"  
    And user Add the child pipeline
    And user chooses the "Log Custom Filter"
    And user gives the value as "1111/1111"
    And user clicks on the "Save" button
    And user tries to upload the log config file
    Then user should see the error status "Upload failed"

@112287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: When the log custom filter in Parent pipeline consists of "AND"
    When user clicks on the "Add" button
    And user chooses the pipeline type as "Parent"
    And user Add the child pipeline
    And user chooses the "Log Custom Filter"
    And user gives the value with "agent.type.keyword : filebeat AND host.ip.keyword : kjsdn:we :w3 : "
    And user clicks on the "Save" button
    And user tries to upload the log config file
    Then user should see the error status "Upload failed"

@12287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: When the log custom filter in Parent pipeline consists of "AND" or "OR"
    When user clicks on the "Add" button
    And user chooses the pipeline type as "Parent"
    And user Add the child pipeline
    And user chooses the "Log Custom Filter"
    And user gives the value with "agent.type.keyword : filebeat OR host.ip.keyword : we :w3  AND host.ip.keyword : kjsdn:we :w3 : "
    And user clicks on the "Save" button
    And user tries to upload the log config file
    Then user should see the error status "Upload failed"

@12287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: When the log custom filter in Parent pipeline consists of "1111"
    When user clicks on the "Add" button
    And user chooses the pipeline type as "Parent"
    And user Add the child pipeline
    And user chooses the "Log Custom Filter"
    And user chooses the "1111"
    And user clicks on the "Save" button
    And user tries to upload the log config file
    Then pl.conf should not be available in the log server

@12287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: When the log custom filter in Parent pipeline consists of special charecter "@","="
    When user clicks on the "Add" button
    And user chooses the pipeline type as "Parent"
    And user Add the child pipeline
    And user chooses the "Log Custom Filter"
    And user gives the value as "@=123"
    And user clicks on the "Save" button
    And user tries to upload the log config file
    Then pl.conf should not be available in the log server

@12287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: When the log custom filter in Parent pipeline consists of forward slashes
    When user clicks on the "Add" button
    And user chooses the pipeline type as "Parent"
    And user Add the child pipeline
    And user chooses the "Log Custom Filter"
    And user gives the value as "1111/1111"
    And user clicks on the "Save" button
    And user tries to upload the log config file
    Then pl.conf should not be available in the log server

@12287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: When the log custom filter in Parent pipeline consists of "AND"
    When user clicks on the "Add" button
    And user chooses the pipeline type as "Parent"
    And user Add the child pipeline
    And user chooses the "Log Custom Filter"
    And user gives the value with "agent.type.keyword : filebeat AND host.ip.keyword : kjsdn:we :w3 : "
    And user clicks on the "Save" button
    And user tries to upload the log
    Then pl.conf should not be available in the log server

@12287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: When the log custom filter in Parent pipeline consists of "AND" or "OR"
    When user clicks on the "Add" button
    And user chooses the pipeline type as "Parent"
    And user Add the child pipeline
    And user chooses the "Log Custom Filter"
    And user gives the value with "agent.type.keyword : filebeat OR host.ip.keyword : we :w3  AND host.ip.keyword : kjsdn:we :w3 : "
    And user clicks on the "Save" button
    And user tries to upload the log config file
    Then pl.conf should not be available in the log server

@12287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: When the log custom filter in Parent pipeline consists of "1111"
    When user clicks on the "Add" button
    And user chooses the pipeline type as "Parent"
    And user Add the child pipeline
    And user chooses the "Log Custom Filter"
    And user chooses the "1111"
    And user clicks on the "Save" button
    And user tries to upload the log config file
    And user give info icon in the log pipeline grid
    Then the user should see the error message "Invalid log config file" and also see the error messages

@12287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: When the log custom filter in Parent pipeline consists of special charecter "@","="
    When user clicks on the "Add" button
    And user chooses the pipeline type as "Parent"
    And user Add the child pipeline
    And user chooses the "Log Custom Filter"
    And user gives the value as "@=123"
    And user clicks on the "Save" button
    And user tries to upload the log config file
    And user give info icon in the log pipeline grid
    Then the user should see the error message "Invalid log config file" and also see the error messages

@12287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: When the log custom filter in Parent pipeline consists of forward slashes
    When user clicks on the "Add" button
    And user chooses the pipeline type as "Parent"
    And user Add the child pipeline
    And user chooses the "Log Custom Filter"
    And user gives the value as "1111/1111"
    And user clicks on the "Save" button
    And user tries to upload the log config file
    And user give info icon in the log pipeline grid
    Then the user should see the error message "Invalid log config file" and also see the error messages

@12287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: When the log custom filter in Parent pipeline consists of "AND"
    When user clicks on the "Add" button
    And user chooses the pipeline type as "Parent"
    And user Add the child pipeline
    And user chooses the "Log Custom Filter"
    And user gives the value with "agent.type.keyword : filebeat AND host.ip.keyword : kjsdn:we :w3 : "
    And user clicks on the "Save " button
    And user tries to upload the log config file
    And user give info icon in the log pipeline grid
    Then the user should see the error message "Invalid log config file" and also see the error messages

@12287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: When the log custom filter in Parent pipeline consists of "AND" or "OR"
    When user clicks on the "Add" button
    And user chooses the pipeline type as "Parent"
    And user Add the child pipeline
    And user chooses the "Log Custom Filter"
    And user gives the value with "agent.type.keyword : filebeat OR host.ip.keyword : we :w3  AND host.ip.keyword : kjsdn:we :w3 : "
    And user clicks on the "Save" button
    And user tries to upload the log config file
    And user give info icon in the log pipeline grid
    Then the user should see the error message "Invalid log config file" and also see the error messages

@12287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: When already the valid logpipeline has uploaded sucessfully and the log custom filter in Parent pipeline consists of "1111"
    When user tries to edit the valid log pipeline
    And user chooses the pipeline type as "Parent"
    And user edit the child pipeline
    And user chooses the "Log Custom Filter"
    And user gives the value as "1111"
    And user clicks on the "Save" button
    And user tries to upload the log config file
    And user give info icon in the log pipeline grid 
    Then the user should see the error message "Invalid log config file" and also see the error messages
    And then status of the log pipeline should be "Upload Failed"
    And the log pipeline is not available in the log server

@12287_The_check_for_valid_log_config_file_and_editing_grok
Scenario: when ever the the invalid log pipeline is uploaded service status of logstash should not change red
    When user tries to upload the invalid log config file
    Then the service status of logstash should not change red or stoped

