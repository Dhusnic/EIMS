Feature: 20263 Enable and Disable pipeline in Pipeline Grid Page
    Background:
        Given I am Logged in to the application
        And navigate to the Pipeline
        And I am on the Pipeline grid page

    @20263_Enable_and_Disable_pipeline_in_Pipeline_Grid_Page
    Scenario: Able to enable,disable the Parent Pipeline
        Given I am on the Pipeline grid page
        And I click on the Enable button
        Then I should see the Enable toggle button is Enabled  when it is in disabled state
        And I click on the Enable button when it is in enabled state then the Enable toggle button is Disabled




    @20263_Enable_and_Disable_pipeline_in_Pipeline_Grid_Page
    Scenario:  Able To enable in Single Select and pipelines.yml should update
        Given I am on the Pipeline
        And I click on the Enable button
        Then I should see the Enable toggle button is Enabled  when it is in disabled state
        And the pipeline should be added in pipelines.yml

    @20263_Enable_and_Disable_pipeline_in_Pipeline_Grid_Page
    Scenario: Able To disable in Single Select and pipelines.yml should update
        Given I am on the Pipeline
        And I click on the Enable button
        And I click on the disable button
        Then I should see the Enable toggle button is Disabled  when it is in enabled state
        And the pipeline should be removed from pipelines.yml

    @20263_Enable_and_Disable_pipeline_in_Pipeline_Grid_Page
    Scenario: Able To enable toogle will show only after uploaded
        Given I am on the Pipeline grid page
        And the pipeline is in draft,queued,upload_failed state
        Then I the Enable toggle button should not be accessible in Parent Pipeline

    @20263_Enable_and_Disable_pipeline_in_Pipeline_Grid_Page
    Scenario: Able To check toogle will show only after uploaded
        Given I am on the Pipeline grid page
        And the pipeline is in draft,queued,upload_failed state
        Then I the check box should not be shown in Parent Pipeline

    @20263_Enable_and_Disable_pipeline_in_Pipeline_Grid_Page
    Scenario: Able To enable after uploaded
        Given I am on the Pipeline grid page
        And the pipeline is in uploaded successfully,restart successfully,restart state
        Then I the Enable toggle button should be accessible in Parent Pipeline

    @20263_Enable_and_Disable_pipeline_in_Pipeline_Grid_Page
    Scenario: Able To check after uploaded
        Given I am on the Pipeline grid page
        And the pipeline is in uploaded successfully,restart successfully,restart state
        Then I the check box should be shown in Parent Pipeline

    @20263_Enable_and_Disable_pipeline_in_Pipeline_Grid_Page
    Scenario: The Disabled Time Data should be recived
        Given I am on the Pipeline grid page
        And I click on the Enable button
        Then I should recive the Log
        And I Disabled the pipeline
        Then I should not recive the Log
        And I enable the pipeline
        Then I should not recive the Log at that time

    @20263_Enable_and_Disable_pipeline_in_Pipeline_Grid_Page
    Scenario: The check box should not be shown when user dont have edit permission on pipeline
        Given I am on the Pipeline grid page
        And I dont have edit permission on pipeline
        Then I should not see the check box in Parent Pipeline

    @20263_Enable_and_Disable_pipeline_in_Pipeline_Grid_Page
    Scenario: The Enable toggle button should not be accessible when user dont have edit permission on pipeline
        Given I am on the Pipeline grid page
        And I dont have edit permission on pipeline
        Then I should not accessible the Enable toggle button in Parent Pipeline

    @20263_Enable_and_Disable_pipeline_in_Pipeline_Grid_Page
    Scenario: When celery and rabbitmq is not running the Enable toggle button should be functional
        Given I am on the Pipeline grid page
        And celery and rabbitmq is not running
        And I click on the Enable button
        Then I should see the Enable toggle button is Enabled  when it is in disabled state
        And the pipeline should be added in pipelines.yml

    @20263_Enable_and_Disable_pipeline_in_Pipeline_Grid_Page
    Scenario: When enable or disable the pipeline the toaster message should be displayed properly
        Given I am on the Pipeline grid page
        And I click on the Enable button
        Then I should see the Enable toggle button is Enabled  when it is in disabled state
        And the pipeline should be added in pipelines.yml
        Then the toaster message should be displayed properly "Pipeline Enabled Successfully"

    @20263_Enable_and_Disable_pipeline_in_Pipeline_Grid_Page
    Scenario: When enable or disable the pipeline the toaster message should be displayed properly
        Given I am on the Pipeline grid page
        And I click on the disable button
        Then I should see the Enable toggle button is Disabled  when it is in enabled state
        And the pipeline should be removed from pipelines.yml
        Then the toaster message should be displayed properly "Pipeline Disabled Successfully"