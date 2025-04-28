Feature: Multi-Service Provider (MSP) Feature Flag Testing
Background:
    Given the MSP feature flag is enabled
    And the user is logged in
    And the user has navigated to the "Pipeline Configuration" page

    @15111
    Scenario: Verify MSP dropdown visibility during pipeline creation
        Given the MSP feature flag is enabled
        When the user creates a parent pipeline at the organization level
        Then the MSP dropdown should be visible for both customer and entity levels

    @15111
    Scenario: Verify MSP dropdown visibility during pipeline editing
        Given the MSP feature flag is enabled
        When the user edits an existing pipeline
        Then the MSP dropdown should be disabled for selection

    @15111
    Scenario: Verify MSP dropdown visibility at the customer level
        Given the MSP feature flag is enabled
        When the user accesses the customer-level view
        Then then pipeline associated with the customer should be displayed

    @15111
    Scenario: Verify MSP dropdown visibility at the entity level
        Given the MSP feature flag is enabled
        When the user accesses the entity-level view
        Then the pipeline associated with the entity should be displayed

    @15111
    Scenario: Verify global filter behavior for MSP
        Given the MSP feature flag is enabled
        When the user applies a global filter at the organization level
        Then only relevant MSP-related data should be displayed

    @15111
    Scenario: Verify deletion of MSP-related pipelines and configurations
        Given the MSP feature flag is enabled
        When the user deletes an MSP-related pipeline
        Then the pipeline should be removed successfully without errors

    @15111
    Scenario: Verify customer and entity IDs in logs and pipeline file
        Given the MSP feature flag is enabled
        When the user interacts with an MSP-related pipeline
        Then the customer ID and entity ID should be logged in the parent pipeline file

    @15111
    Scenario: Verify MSP feature visibility for customers and users
        Given the MSP feature flag is enabled
        When a customer or user accesses the pipeline configuration page
        Then they should see the actions and related options based on permissions

    @15111
    Scenario: Verify role-based access control for customer and entity users
        Given a user belongs to the customer or entity level
        When they attempt to perform actions like Add, Edit, Delete, or Upload
        Then they should only have view access with no modification permissions

    @15111
    Scenario: Verify pipeline creation restriction for customer and entity levels
        Given the MSP feature flag is enabled
        When a user at the customer or entity level attempts to create a pipeline
        Then they should not have access to pipeline creation

    @15111
    Scenario: Verify pipeline creation is allowed only at the organization level
        Given the MSP feature flag is enabled
        When a user at the organization level creates a pipeline
        Then the pipeline should be created successfully
