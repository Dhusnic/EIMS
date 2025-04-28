Feature: Multi Logstash host support in Hybrid Pipeline
Background:
    Given The user is logged in
    And The user has navigated to the "Log piplines" page


@14173
Scenario: Create a new Logstash pipeline with multiple logstash hosts option
    When user clicks on the "Add" button
    And user selects "Logstash Hosts" option
    And user selects multiple logstash hosts
    Then The logstash hosts options should be displayed based on "LOGSTASH_HOST" in .env file

@14173
Scenario: Create a new Logstash pipeline with single logstash host
    When user clicks on the "Add" button
    And user selects "Logstash Hosts" option
    And user selects a single logstash host
    Then The logstash hosts options should be displayed based on "LOGSTASH_HOST" in .env file
    And User able to choose multiple logstash hosts
    And User able to choose save the pipeline

@14173
Scenario: Create a new Logstash pipeline with single logstash host
    When user clicks on the "Add" button
    And user selects "Logstash Hosts" option
    And user selects a single logstash host
    Then The logstash hosts options should be displayed based on "LOGSTASH_HOST" in .env file
    And User able to choose single logstash hosts
    And User able to choose save the pipeline

@14173
Scenario: Create a new Logstash pipeline with single logstash host with already used port
    When user clicks on the "Add" button
    And user selects "Logstash Hosts" option
    And user selects a single logstash host
    Then The logstash hosts options should be displayed based on "LOGSTASH_HOST" in .env file
    And User able to choose single logstash hosts which port is already used
    And User not able to choose save the pipeline
    Then The toaster message should be displayed "Port already in use"

@14173
Scenario: Create a new Logstash pipeline with multiple logstash host with already used port
    When user clicks on the "Add" button
    And user selects "Logstash Hosts" option
    And user selects multiple logstash hosts
    Then The logstash hosts options should be displayed based on "LOGSTASH_HOST" in .env file
    And User able to choose multiple logstash hosts which port is already used with any one of them
    And User not able to choose save the pipeline
    Then The toaster message should be displayed "Port already in use"

@14173
Scenario: Upload a new Logstash pipeline with multiple logstash host 
    When user clicks on the "Add" button
    And user selects "Logstash Hosts" option
    And user selects multiple logstash hosts
    Then The logstash hosts options should be displayed based on "LOGSTASH_HOST" in .env file
    And User able to choose multiple logstash hosts which port is already used with any one of them
    And User not able to choose save the pipeline
    Then The toaster message should be displayed
    And User able to choose save the Pipeline
    Then The user uploads the pipeline
    Then the pl.conf conf should be uploaded to all selected logstash hosts

@14173
Scenario: Upload a new Logstash pipeline with single logstash host
    When user clicks on the "Add" button
    And user selects "Logstash Hosts" option
    And user selects a single logstash host
    Then The logstash hosts options should be displayed based on "LOGSTASH_HOST" in .env file
    And User able to choose single logstash hosts which port
    And User able to choose save the pipeline
    Then The  user uploads the pipeline
    Then the pl.conf conf should be uploaded to selected logstash host
    Then the proper info should be displayed in the "Status" column
    And the proper info should be displayed in the info side bar

@14173
Scenario: Upload a new Logstash pipeline with single logstash if failed to connect
    When user clicks on the "Add" button
    And user selects "Logstash Hosts" option
    And user selects a single logstash host
    Then The logstash hosts options should be displayed based on "LOGSTASH_HOST" in .env file
    And User able to choose single logstash hosts
    And User able to choose save the pipeline
    Then The  user uploads the pipeline
    Then the proper info should be displayed in the "Status" column for failure
    And the proper info should be displayed in the info side bar for failure

@14173
Scenario: Upload a new Logstash pipeline with multiple logstash host if failed to connect
    When user clicks on the "Add" button
    And user selects "Logstash Hosts" option
    And user selects multiple logstash hosts
    Then The logstash hosts options should be displayed based on "LOGSTASH_HOST" in .env file
    And User able to choose multiple logstash hosts
    And User able to choose save the pipeline
    Then The user uploads the pipeline
    Then the proper info should be displayed in the "Status" column
    And the pipeline should not be uploaded  to any of the selected logstash hosts
    Then the proper info should be displayed in the info side bar

@14173
Scenario: Upload a new Logstash pipeline with single logstash host with upload failure
    When user clicks on the "Add" button
    And user selects "Logstash Hosts" option
    And user selects a single logstash host
    Then The logstash hosts options should be displayed based on "LOGSTASH_HOST" in .env file
    And User able to choose single logstash hosts
    And User able to choose save the pipeline
    Then The  user uploads the pipeline
    Then the proper info should be displayed in the "Status" column for failure
    And the proper info should be displayed in the info side bar for failure

@14173
Scenario: Upload a new Logstash pipeline with multiple logstash host with upload failure
    When user clicks on the "Add" button
    And user selects "Logstash Hosts" option
    And user selects multiple logstash hosts
    Then The logstash hosts options should be displayed based on "LOGSTASH_HOST" in .env file
    And User able to choose multiple logstash hosts
    And User able to choose save the pipeline
    Then The user uploads the pipeline
    Then the proper info should be displayed in the "Status" column for failure should be displayed
    And the pipeline should not be uploaded  to any of the selected logstash hosts
    Then the proper info should be displayed in the info side bar for failure

@14173
Scenario: Upload a new Logstash pipeline with single logstash host with upload success
    When user clicks on the "Add" button
    And user selects "Logstash Hosts" option
    And user selects a single logstash host
    Then The logstash hosts options should be displayed based on "LOGSTASH_HOST" in .env file
    And User able to choose single logstash hosts
    And User able to choose save the pipeline
    Then The  user uploads the pipeline
    Then the proper info should be displayed in the "Status" column for success
    And the proper info should be displayed in the info side bar for success
    And the pipeline should be uploaded to selected logstash host
    Then the proper info should be displayed in the "Status" column for success


@14173
Scenario: Upload a new Logstash pipeline with multiple logstash host with upload success
    When user clicks on the "Add" button
    And user selects "Logstash Hosts" option
    And user selects multiple logstash hosts
    Then The logstash hosts options should be displayed based on "LOGSTASH_HOST" in .env file
    And User able to choose multiple logstash hosts
    And User able to choose save the pipeline
    Then The user uploads the pipeline
    Then the proper info should be displayed in the "Status" column for success
    And the pipeline should be uploaded to selected logstash hosts
    Then the proper info should be displayed in the info side bar for success
    And the pipeline should be uploaded to selected logstash hosts