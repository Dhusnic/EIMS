Feature: 23197 Pipeline Multiple Output Configurations UI Development
    Background:
        Given I am Logged in to the application
        And I am on the pipeline configuration page
        And Choose to add the pipeline

    @23197_Pipeline_Multiple_Output_Configurations_UI_dev
    Scenario: The Folder section should be shown in the pipeline configuration page
        Then I should see the Folder section in the pipeline configuration page

    @23197_Pipeline_Multiple_Output_Configurations_UI_dev
    Scenario: The Folder section should be shown in the pipeline configuration page and show nothing is mandotory
        Then I should see the Folder section in the pipeline configuration page
        And I should see the Folder section fields Target Server,Device credential,Path is not mandatory unit the folder is enabled

    @23197_Pipeline_Multiple_Output_Configurations_UI_dev
    Scenario: The Folder section should be shown in the pipeline configuration page and show the folder is mandatory when the folder is enabled
        Given I enable the folder in the pipeline configuration
        Then I should see the Folder section in the pipeline configuration page
        And I should see the Folder section fields Target Server,Device credential,Path is mandatory when the folder is enabled

    @23197_Pipeline_Multiple_Output_Configurations_UI_dev
    Scenario: The invalid Ip should be filled in the Target Server
        Given I enable the folder in the pipeline configuration
        And I fill the Target Server with a valid IP address
        Then I should see the Target Server is filled with a invalid IP address msg shown below the field

    @23197_Pipeline_Multiple_Output_Configurations_UI_dev
    Scenario: The Device credential field should show options of credentials with sftp
        Given I enable the folder in the pipeline configuration
        And I click on the Device credential field
        Then I should see a list of credentials with SFTP options configurated in Device Credentials

    @23197_Pipeline_Multiple_Output_Configurations_UI_dev
    Scenario: The path should plain text field below the folder section
        Given I enable the folder in the pipeline configuration
        Then I should see the Path field as a plain text field below the Folder section


    @23197_Pipeline_Multiple_Output_Configurations_UI_dev
    Scenario: The path should be mandatory when the folder is enabled
        Given I enable the folder in the pipeline configuration
        And I fill the Path field with a valid path
        Then I should see the Path field is mandatory when the folder is enabled

    @23197_Pipeline_Multiple_Output_Configurations_UI_dev
    Scenario: The folder section should be disabled if i choose to add child pipeline in parent pipeline
        Given I enable the folder in the pipeline configuration
        And I choose to add a child pipeline in the parent pipeline
        Then I should see the Folder section is disabled in the pipeline configuration page and the data are vanished


    @23197_Pipeline_Multiple_Output_Configurations_UI_dev
    Scenario: The Folder section should save successfully when the folder is enabled
        Given I enable the folder in the pipeline configuration
        And I fill the Target Server with a valid IP address
        And I select a Device credential from the list
        And I fill the Path field
        When I save the pipeline configuration
        Then I should see a success message indicating that the Folder section is saved successfully

    @23197_Pipeline_Multiple_Output_Configurations_UI_dev
    Scenario: The Folder section should not save if the folder is enabled and the Target Server is invalid
        Given I enable the folder in the pipeline configuration
        And I fill the Target Server with an invalid IP address
        And I select a Device credential from the list
        And I fill the Path field
        When I save the pipeline configuration
        Then I should see an error message indicating that the Target Server is invalid and the Folder section is not saved

    @23197_Pipeline_Multiple_Output_Configurations_UI_dev
    Scenario: The Folder section should not save if the folder is enabled and the Device credential is not selected
        Given I enable the folder in the pipeline configuration
        And I fill the Target Server with a valid IP address
        And I do not select a Device credential from the list
        And I fill the Path field
        When I save the pipeline configuration
        Then I should see an error message indicating that the Device credential is required and the Folder section is not saved

    @23197_Pipeline_Multiple_Output_Configurations_UI_dev
    Scenario: The Folder section should not save if the folder is enabled and the Path field is empty
        Given I enable the folder in the pipeline configuration
        And I fill the Target Server with a valid IP address
        And I select a Device credential from the list
        And I do not fill the Path field
        When I save the pipeline configuration
        Then I should see an error message indicating that the Path field is required and the Folder section is not saved

    @23197_Pipeline_Multiple_Output_Configurations_UI_dev
    Scenario: The Folder section should not save if the folder is disabled
        Given I disable the folder in the pipeline configuration
        And fill all the mandatory fields in the pipeline configuration
        When I save the pipeline configuration
        Then I should see a success message of pipeline configuration saved successfully

    @23197_Pipeline_Multiple_Output_Configurations_UI_dev
    Scenario: Edit the Folder section in the pipeline configuration page
        Given I enable the folder in the pipeline configuration
        And I fill the Target Server with a valid IP address
        And I select a Device credential from the list
        And I fill the Path field
        When I save the pipeline configuration
        And I navigate back to the pipeline configuration page
        And I edit the Folder section by changing the Target Server, Device credential, and Path fields
        Then I should see a success message indicating that the Folder section is updated successfully


    @23197_Pipeline_Multiple_Output_Configurations_UI_dev
    Scenario: The Folder section should should be filled with proper data when the pipeline is edited
        Given I enable the folder in the pipeline configuration
        And I fill the Target Server with a valid IP address
        And I select a Device credential from the list
        And I fill the Path field
        When I save the pipeline configuration
        And I navigate back to the pipeline configuration page
        Then I should see the Folder section filled with the data I entered previously

    @23197_Pipeline_Multiple_Output_Configurations_UI_dev
    Scenario: The newly Implemented Folder section should not affect the existing pipeline configurations
        Given I have existing pipeline configurations without the Folder section
        When I navigate to those existing pipeline configurations
        Then I should see that the existing configurations are not affected by the newly implemented Folder section
        And the existing configurations should function as they did before the implementation of the Folder section


