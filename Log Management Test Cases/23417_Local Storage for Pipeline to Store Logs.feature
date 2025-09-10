Feature : 23417_Local Storage for Pipeline to Store Logs
    Background:
        Given I am Logged in to the application
        And I am on the Pipeline card page


    @23417_Local_Storage_for_Pipeline_to_Store_Logs
    Scenario: User choose add the folder section for local storage
        Given I am on the Pipeline card page
        When I choose to add the folder section for local storage
        Then I should see the Folder section in the pipeline configuration page
        And I should see the option to select SFTP,Local Storage configuration

    @23417_Local_Storage_for_Pipeline_to_Store_Logs
    Scenario: User choose to add the folder section for local storage and show the folder is mandator
        Given I am on the Pipeline card page
        When I choose to add the folder section for local storage
        Then I should see the Folder section in the pipeline configuration page
        And enable the folder section
        And I choose the Folder Type as Local Storage
        And I should see the Folder section fields Path is mandatory until the folder is enabled

    @23417_Local_Storage_for_Pipeline_to_Store_Logs
    Scenario: User choose to add the folder section for local storage and show the folder is mandatory when the folder is enabled
        Given I am on the Pipeline card page
        When I choose to add the folder section for local storage
        And I enable the folder section
        And I choose the Folder Type as Local Storage
        Then I should see the Folder section fields Path is mandatory when the folder is enabled
        And I save the pipeline configuration
        Then I should see a message this field is mandatory to path field when the folder is enabled 

    @23417_Local_Storage_for_Pipeline_to_Store_Logs
    Scenario: User choose to add the folder section for local storage and show the path is mandatory when the folder is enabled and save the pipeline configuration
        Given I am on the Pipeline card page
        When I choose to add the folder section for local storage
        And I enable the folder section
        And I choose the Folder Type as Local Storage
        Then I should see the Path field is mandatory when the folder is enabled
        And I fill the Path field with a valid path
        And I tried to save the pipeline configuration
        Then I should see a success message indicating that pipeline is saved successfully

    @23417_Local_Storage_for_Pipeline_to_Store_Logs
    Scenario: When User uploads the pipeline which configured with local storage folder section
        Given I am on the Pipeline card page
        When I upload a pipeline configuration file that is configured with local storage
        Then I should see the pipeline configuration is uploaded successfully
        And I should see the Folder section with Local Storage configuration in the pipeline configuration file in log collector


    
    @23417_Local_Storage_for_Pipeline_to_Store_Logs
    Scenario: When User uploads the pipeline which configured with local storage folder section
        Given I am on the Pipeline card page
        When I upload a pipeline configuration file that is configured with local storage
        Then I should see the pipeline configuration is uploaded successfully
        And I should see the Folder section with Local Storage configuration in the pipeline configuration file in log collector
        Then the Logs comming to that pipeline should be stored in the local storage path specified in the configuration inside the folder with index name as pipeline index name

    @23417_Local_Storage_for_Pipeline_to_Store_Logs
    Scenario: When User uploads the pipeline which configured with local storage folder section and the logs are stored in a given path
        Given I am on the Pipeline card page
        When I upload a pipeline configuration file that is configured with local storage
        And I fill the Path field with a valid path
        Then I should see the pipeline configuration is uploaded successfully
        And I should see the Folder section with Local Storage configuration in the pipeline configuration file in log collector
        And the logs coming to that pipeline should be stored in the local storage path specified in the configuration inside the folder with index name as pipeline index name
        And folder will be created based on the give path in the configuration
        And the required permissions will be given to the folder

    @23417_Local_Storage_for_Pipeline_to_Store_Logs
    Scenario: When User uploads the pipeline which configured with local storage folder section and the logs are stored in a given path
        Given I am on the Pipeline card page
        When I upload a pipeline configuration file that is configured with local storage
        And I fill the Path field with a valid path
        Then I should see the pipeline configuration is uploaded successfully
        And I should see the Folder section with Local Storage configuration in the pipeline configuration file in log collector
        And the logs coming to that pipeline should be stored in the local storage path specified in the configuration inside the folder with index name as pipeline index name
        And if the path already available then the logs will be stored in that path
        And the path should not be duplicated in the local storage