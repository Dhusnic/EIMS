Feature: 20263 Default Pipeline for Log Pipeline
    Background:
        Given I create a new organization
        And I am Logged in to the application
        And I navigate to the Pipeline
        And I am on the Pipeline card page

    @20263_default_pipeline_for_log_pipeline
    Scenario: The default pipeline should be created
        Given I am on the Pipeline card page
        Then I should see the default pipeline is created 4 Parent Pipelines and 19 Child Pipelines
        And I should see the default pipeline is in draft state

    @20263_default_pipeline_for_log_pipeline
    Scenario: The default pipeline beats should be created with ports 5048
        Given I am on the Pipeline card page
        Then I should see the default pipeline beats is created with ports 5048
        And I should see the default pipeline beats is in draft state

    @20263_default_pipeline_for_log_pipeline
    Scenario: The default pipeline should have the upload icon in both grid and card
        Given I am on the Pipeline card page
        Then I should see the upload icon in both grid and card for default pipeline

    @20263_default_pipeline_for_log_pipeline
    Scenario: The default pipeline should have the edit icon in both grid and card
        Given I am on the Pipeline card page
        Then I should see the edit icon in both grid and card for default pipeline


    @20263_default_pipeline_for_log_pipeline
    Scenario: The default pipeline should not have the delete icon in both grid and card
        Given I am on the Pipeline card page
        Then I should not see the delete icon in both grid and card for default pipeline

    @20263_default_pipeline_for_log_pipeline
    Scenario: The log collector host should be empty for default pipelines
        Given I am on the Pipeline card page
        Then I should see the log collector host is empty for default pipelines if the organization does not have any log collector host
        And I should see the log collector host for default pipelines if the organization has log collector host

    @20263_default_pipeline_for_log_pipeline
    Scenario: The default pipeline should have editable index name for tcp, udp, syslog
        Given I am on the Pipeline card page
        Then I should see the index name is editable for tcp, udp, syslog default pipeline
        And the index name should be "network"

    @20263_default_pipeline_for_log_pipeline
    Scenario: The default pipelines index  name should be editable
        Given I am on the Pipeline card page
        And I choose to edit the default pipeline
        Then I should see the index name is editable for default pipelines

    @20263_default_pipeline_for_log_pipeline
    Scenario: The default grok should not be shown in grok list if default grok is deleted
        Given I am on the Pipeline card page
        And I choose to edit the default pipeline
        Then I should not see the default grok in grok list if the default grok is deleted

    @20263_default_pipeline_for_log_pipeline
    Scenario: The default pipeline should have editable port and pipeline name and input type should not be editable
        Given I am on the Pipeline card page
        And I choose to edit the default pipeline
        Then the port and pipeline name and input type are not editable for default pipelines

    @20263_default_pipeline_for_log_pipeline
    Scenario: The default pipeline should have customer and entity id can be empty and can be edited
        Given I am on the Pipeline card page
        And I choose to edit the default pipeline
        Then I should see the customer and entity id can be empty and can be edited for default pipelines

    @20263_default_pipeline_for_log_pipeline
    Scenario: The default pipeline should have upload successfully, restart successfully, restart state
        Given I am on the Pipeline card page
        And the default pipeline is in uploaded successfully, restart successfully, restart state
        Then I should see the default pipeline is in uploaded successfully, restart successfully, restart state
        And index shoud be created and shown in multiple index page