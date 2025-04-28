Feature: Make MSP Related Log and Pipeline Conf.
Background:
    Given the MSP feature flag is enabled
    And the user is logged in
    And the user has navigated to the "Pipeline Configuration" page
    And the Pipeline is Configured with MSP

@15308
Scenario: Verify MSP Related Pipeline Configuration in Organization Level
    Given the user is at the organization level
    When the user creates a parent pipeline at the organization level
    And sucessfully Upload the pipeline configuration
    And View the uploaded parent pipeline
    Then only Organization id should present in the pipeline configuration

@15308
Scenario: Verify MSP Related Pipeline Configuration in Customer Level
    Given the user is at the customer level
    When the user creates a parent pipeline at the customer level
    And sucessfully Upload the pipeline configuration
    And View the uploaded parent pipeline
    Then only Customer id and Organization id should present in the pipeline configuration

@15308
Scenario: Verify MSP Related Pipeline Configuration in Entity Level
    Given the user is at the entity level
    When the user creates a parent pipeline at the entity level
    And sucessfully Upload the pipeline configuration
    And View the uploaded parent pipeline
    Then only Entity id, Customer id and Organization id should present in the pipeline configuration

@15308
Scenario: Verify MSP Related Log in Pipeline Level
    Given the user is at the organization level
    When the user creates a parent pipeline at the organization level
    And sucessfully Upload the pipeline configuration
    And View the uploaded parent pipeline
    Then only Organization id should present in the pipeline configuration
    And The Log optaining through the pipeline should contain the Organization id

@15308
Scenario: Verify MSP Related Log in Customer Level
    Given the user is at the customer level
    When the user creates a parent pipeline at the customer level
    And sucessfully Upload the pipeline configuration
    And View the uploaded parent pipeline
    Then only Customer id and Organization id should present in the pipeline configuration
    And The Log optaining through the pipeline should contain the Customer id and Organization id

@15308
Scenario: Verify MSP Related Log in Entity
    Given the user is at the entity level
    When the user creates a parent pipeline at the entity level
    And sucessfully Upload the pipeline configuration
    And View the uploaded parent pipeline
    Then only Entity id, Customer id and Organization id should present in the pipeline configuration
    And The Log optaining through the pipeline should contain the Entity id, Customer id and Organization id