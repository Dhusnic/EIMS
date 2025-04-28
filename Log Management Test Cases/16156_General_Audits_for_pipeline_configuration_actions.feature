Feature: General Audits for Pipeline Configuration Actions

    @16156
    Scenario: Create a New Pipeline
        Given User is logged in to the application
        When User creates a new pipeline configuration
        Then Audit log should record the creation of the pipeline
        And Proper data and description should be shown in the audit log

    @16156
    Scenario: Edit an Existing Pipeline
        Given User is logged in to the application
        And There exists an existing pipeline configuration
        When User edits the pipeline configuration
        Then Audit log should record the edit of the pipeline
        And Proper data and description should be shown in the audit log

    @16156
    Scenario: Delete a Pipeline
        Given User is logged in to the application
        And There exists an existing pipeline configuration
        When User deletes the pipeline configuration
        Then Audit log should record the deletion of the pipeline
        And Proper data and description should be shown in the audit log

    @16156
    Scenario: Edit Fields of a Pipeline Configuration
        Given User is logged in to the application
        And There exists an existing pipeline configuration
        When User edits specific fields of the pipeline configuration
        Then Audit log should record the field edits
        And Proper data and description should be shown in the audit log

    @16156
    Scenario: MSP Fields Audit
        Given User is logged in to the application as an MSP user
        When MSP-specific fields in the pipeline configuration are edited
        Then Audit log should record the MSP field edits
        And Proper data and description should be shown in the audit log

    @16156
        Scenario: Global Filter Audit Cases
        Given User is logged in to the application
        And Global filters in the pipeline configuration are modified
        When User modifies the global filters
        Then Audit log should record the global filter modifications
        And Proper data and description should be shown in the audit log

    @16156
    Scenario: Grok Pattern Cases Audit
        Given User is logged in to the application
        And Grok patterns in the pipeline configuration are updated
        When User updates the grok patterns
        Then Audit log should record the grok pattern updates
        And Proper data and description should be shown in the audit log

    @16156
    Scenario: Upload in Audits
        Given User is logged in to the application
        And User uploads a file related to pipeline configurations
        When Upload is completed
        Then Audit log should record the upload action
        And Proper data and description should be shown in the audit log

    @16156
    Scenario: Audit for Change in Pipeline Name
        Given User is logged in to the application
        When User updates the name of an existing pipeline
        Then User navigates to the General Audits page
        And Audit log should record the field change for 'Name' with from-value to to-value

    @16156
    Scenario: Audit for Change in Pipeline Description
        Given User is logged in to the application
        When User updates the description of the pipeline
        Then User navigates to the General Audits page
        And Audit log should record the field change for 'Description' with from-value to to-value

    @16156
    Scenario: Audit for Change in Input Type
        Given User is logged in to the application
        When User changes the input type in the pipeline configuration
        Then User navigates to the General Audits page
        And Audit log should record the field change for 'Input Type' with from-value to to-value

    @16156
    Scenario: Audit for Change in Port
        Given User is logged in to the application
        When User updates the port in the pipeline configuration
        Then User navigates to the General Audits page
        And Audit log should record the field change for 'Port' with from-value to to-value

    @16156
    Scenario: Audit for Change in Customer or Entity Selection
        Given User is logged in to the application
        When User changes the selected customer or entity
        Then User navigates to the General Audits page
        And Audit log should record the field change for 'Customer or Entity' with from-value to to-value

    @16156
    Scenario: Audit for Change in Index Name
        Given User is logged in to the application
        When User updates the index name in the pipeline configuration
        Then User navigates to the General Audits page
        And Audit log should record the field change for 'Index Name' with from-value to to-value

    @16156
    Scenario: Audit for Change in Log Collector Host
        Given User is logged in to the application
        When User updates the log collector host in the pipeline configuration
        Then User navigates to the General Audits page
        And Audit log should record the field change for 'Log Collector Host' with from-value to to-value

    @16156
    Scenario: Audit for Add Child in Pipeline
        Given User is logged in to the application
        When User adds a child configuration in the pipeline
        Then User navigates to the General Audits page
        And Audit log should record the addition of a child entry with proper description

    @16156
    Scenario: Verify audit description when a parent pipeline is changed to a child pipeline
        Given User is logged in to the application
        And A parent pipeline exists
        When User converts the parent pipeline into a child pipeline under another parent
        Then User navigates to the General Audits page
        And Audit log should clearly state the pipeline role changed from 'Parent' to 'Child'
        And Description should include the original state and the new parent pipeline name

    @16156
    Scenario: Verify audit description when a child pipeline is changed to a parent pipeline
        Given User is logged in to the application
        And A child pipeline exists
        When User detaches it and makes it a parent pipeline
        Then User navigates to the General Audits page
        And Audit log should clearly state the pipeline role changed from 'Child' to 'Parent'
        And Description should reflect that the pipeline is now a standalone parent

    @16156
    Scenario: Verify audit description when a child pipeline is added to a parent pipeline
        Given User is logged in to the application
        When User adds a child pipeline to a parent pipeline
        Then User navigates to the General Audits page
        And Audit log should mention that the child pipeline was linked to the specified parent
        And Description should contain the parent and child pipeline names

    @16156
    Scenario: Verify audit description when a child pipeline is removed from a parent pipeline
        Given User is logged in to the application
        And A child pipeline is currently linked to a parent pipeline
        When User removes the linkage
        Then User navigates to the General Audits page
        And Audit log should mention that the child pipeline was removed from the parent
        And Description should contain the names of both pipelines involved

    @16156
    Scenario: Verify audit description when a child pipeline is added with a custom filter
        Given User is logged in to the application
        When User adds a child pipeline with specific filter values to a parent
        Then User navigates to the General Audits page
        And Audit log should record the addition of the child with custom filter values
        And Description should include the filter values applied during linkage

    @16156
    Scenario: Verify audit description when a child pipeline is added with a log custom filter
        Given User is logged in to the application
        When User adds a child pipeline with specific log-based filter values to a parent
        Then User navigates to the General Audits page
        And Audit log should mention the child pipeline was added with log custom filter values
        And Description should reflect the values of the log filter used

    @16156
    Scenario: Verify audit description when a child pipeline is removed with a custom filter
        Given User is logged in to the application
        And A child pipeline is linked with a parent using custom filter values
        When User removes the child pipeline
        Then User navigates to the General Audits page
        And Audit log should mention the removal along with the custom filter values that were in use
        And Description should specify the filter values that were removed

    @16156
    Scenario: Verify audit description when a child pipeline is removed with a log custom filter
        Given User is logged in to the application
        And A child pipeline is linked with a parent using log custom filter values
        When User removes the child pipeline
        Then User navigates to the General Audits page
        And Audit log should mention the removal of the child pipeline with associated log filter values
        And Description should reflect the log filter values removed

    @16156
    Scenario: Verify audit description when a `pl.conf` name is created
        Given User is logged in to the application
        When User creates a new pipeline configuration with a specific `pl.conf` name
        Then User navigates to the General Audits page
        And Audit log should reflect the creation of the pipeline configuration with `pl.conf`
        And Description should include the `pl.conf` name created

    @16156
    Scenario: Verify audit description when a `pl.conf` name is deleted
        Given User is logged in to the application
        And A `pl.conf` entry exists in a pipeline configuration
        When User deletes the associated pipeline or removes the `pl.conf` reference
        Then User navigates to the General Audits page
        And Audit log should indicate the deletion of the `pl.conf` name
        And Description should clearly state which configuration was deleted
