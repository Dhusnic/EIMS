Feature: Creating Multi Input configuration for Parent Pipeline
    As a user
    I want to configure multiple inputs for a parent pipeline
    So that I can process data from multiple sources

    Background:
        Given I am logged into the application
        And I navigate to the pipeline configuration page

    @13025_creating_Multi_Input_configuration_for_Parent_Pipeline
    Scenario: Configure multiple inputs for parent pipeline
        When I choose to add a pipeline
        And I select the parent pipeline option
        And I configure multiple inputs
        And I save the configuration
        Then the parent pipeline should be created successfully
    
    @13025_creating_Multi_Input_configuration_for_Parent_Pipeline
    Scenario: Configure multiple inputs for parent pipeline with invalid inputs
        When I choose to add a pipeline
        And I select the parent pipeline option
        And I configure multiple inputs with invalid data for Input id
        And I save the configuration
        Then the parent pipeline should not be created successfully
        And I should see an error message

    @13025_creating_Multi_Input_configuration_for_Parent_Pipeline
    Scenario: Configure multiple inputs for parent pipeline with repeated port
        When I choose to add a pipeline
        And I select the parent pipeline option
        And I configure multiple inputs with repeated port
        And I save the configuration
        Then the parent pipeline should not be created successfully

    @13025_creating_Multi_Input_configuration_for_Parent_Pipeline
    Scenario: Configure multiple inputs for parent pipeline with repeated port
        When I choose to add a pipeline
        And I select the parent pipeline option
        And I configure multiple inputs with repeated port
        Then the UI should display an error message indicating that "The Ports Cant Be repeated"

    @13025_creating_Multi_Input_configuration_for_Parent_Pipeline
    Scenario: Configure multiple inputs for parent pipeline with repeated port
        When I choose to add a pipeline
        And I select the parent pipeline option
        And I configure multiple inputs with repeated port
        And I save the configuration
        Then I should see an error toastermessage indicating that "The Ports Cant Be repeated"

    @13025_creating_Multi_Input_configuration_for_Parent_Pipeline
    Scenario: Configure multiple inputs for parent pipeline with repeated input id
        When I choose to add a pipeline
        And I select the parent pipeline option
        And I configure multiple inputs with repeated input id
        Then the UI should display an error message indicating that "The Input Id Can't Be Repeated"

    @13025_creating_Multi_Input_configuration_for_Parent_Pipeline
    Scenario: Configure multiple inputs for parent pipeline with repeated input id
        When I choose to add a pipeline
        And I select the parent pipeline option
        And I configure multiple inputs with repeated input id
        And I save the configuration
        Then the parent pipeline should not be created successfully

    @13025_creating_Multi_Input_configuration_for_Parent_Pipeline
    Scenario: Configure multiple inputs for parent pipeline with repeated input id
        When I choose to add a pipeline
        And I select the parent pipeline option
        And I configure multiple inputs with repeated input id
        And I save the configuration
        Then I should see an error toastermessage indicating that "The Input Id Can't Be Repeated"

    @13025_creating_Multi_Input_configuration_for_Parent_Pipeline
    Scenario: Configure multiple inputs for parent pipeline with repeated input type and port
        When I choose to add a pipeline
        And I select the parent pipeline option
        And I configure multiple inputs with input type and port as "input type as 'beats' and port as '5044'"
        And I save the configuration
        Then the parent pipeline should created successfully
        And I try to save the configuration again with the same input type and port "input type as 'beats' and port as '5044'"
        Then the UI should display an error message indicating that "The Input Type and Port combination already exists"

    @13025_creating_Multi_Input_configuration_for_Parent_Pipeline
    Scenario: Configure multiple inputs for parent pipeline with repeated input type and port
        When I choose to add a pipeline
        And I select the parent pipeline option
        And I configure multiple inputs with input type and port as "input type as 'beats' and port as '5044'"
        And I save the configuration
        Then the parent pipeline should created successfully
        And I try to save the configuration again with the same input type and port "input type as 'beats' and port as '5044'"
        Then the configuration should not be saved successfully

    @13025_creating_Multi_Input_configuration_for_Parent_Pipeline
    Scenario: Configure multiple inputs for parent pipeline with multiple inputs
        When I choose to add a pipeline
        And I select the parent pipeline option
        And I configure multiple inputs
        And I save the configuration
        Then the parent pipeline should be created successfully
        And I should see the multiple inputs in the pipeline configuration grid page

    @13025_creating_Multi_Input_configuration_for_Parent_Pipeline
    Scenario: multiple port data that get should segregate data based on child configuration
        When I choose to add a pipeline
        And I select the parent pipeline option
        And I configure multiple inputs
        And add multiple child pipelines
        And I save the configuration
        Then the parent pipeline should be created successfully
        And I should see the multiple inputs in the pipeline configuration
        Then  the data should be segregated based on the child configuration

    @13025_creating_Multi_Input_configuration_for_Parent_Pipeline
    Scenario: diffrent potrocols with same port in same profile
        When I choose to add a pipeline
        And I select the parent pipeline option
        And I configure multiple inputs with multiple inputs
        And I save the configuration
        Then the parent pipeline should be created successfully