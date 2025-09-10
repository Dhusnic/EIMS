Feature: 24142_Logstash HTTP/HTTPS output implementation in Log Pipeline
    Background:
        Given I am Logged in to the application
        And navigate to the Pipeline
        And I am on the Pipeline card page

    @24142_Logstash_HTTP/HTTPS_output_implementation_in_Log_Pipeline
    Scenario: Verify Logstash HTTP/HTTPS output implementation in Log Pipeline
        Given I am on the Pipeline card page
        When I choose to create a new  Pipeline
        And I should see the HTTP/HTTPS output option in the output section
        Then I should be able to configure the HTTP/HTTPS output settings if the folder configuration is enabled


    @24142_Logstash_HTTP/HTTPS_output_implementation_in_Log_Pipeline
    Scenario: Verify Logstash HTTP/HTTPS output implementation in Log Pipeline when folder configuration is disabled
        Given I am on the Pipeline card page
        When I choose to create a new  Pipeline
        And I should see the HTTP/HTTPS output option in the output section
        Then I should not be able to configure the HTTP/HTTPS output settings if the folder configuration is disabled


    @24142_Logstash_HTTP/HTTPS_output_implementation_in_Log_Pipeline
    Scenario: Verify Logstash HTTP/HTTPS output implementation with Http or Https selection in Log Pipeline
        Given I am on the Pipeline card page
        When I choose to create a new  Pipeline
        And I should see the HTTP/HTTPS output option in the output section
        Then I should be able to configure the HTTP/HTTPS output settings if the folder configuration is enabled
        And I should be able to configure the Pipeline with HTTP/HTTPS output settings with selection for Http or Https

    @24142_Logstash_HTTP/HTTPS_output_implementation_in_Log_Pipeline
    Scenario: Verify Logstash HTTP/HTTPS output implementation in Log Pipeline when folder configuration is 
        Given I am on the Pipeline card page
        When I choose to create a new  Pipeline
        And I should see the HTTP/HTTPS output option in the output section
        Then I should not be able to configure the HTTP/HTTPS output settings if the folder configuration is disabled
        And I should not be able to configure the Pipeline with HTTP/HTTPS output settings with selection for Http or Https
        And If i choose Http 
        Then I should see the url field with url field validations as mandatory field
        And Device Credentials field with device credential options in the dropdown which configured with device credential options
        And the Device Credentials field is not a mandatory field

    @24142_Logstash_HTTP/HTTPS_output_implementation_in_Log_Pipeline
    Scenario: verify Logstash HTTP/HTTPS output implementation in Log Pipeline with Https selection
        Given I am on the Pipeline card page
        When I choose to create a new  Pipeline
        And I should see the HTTP/HTTPS output option in the output section
        Then I should be able to configure the HTTP/HTTPS output settings if the folder configuration is enabled
        And I should be able to configure the Pipeline with HTTP/HTTPS output settings with selection for Https
        And If i choose Https 
        Then I should see the url field with url field validations as mandatory field
        And Device Credentials field with device credential options in the dropdown which configured with device credential options
        And the Device Credentials field is not a mandatory field
    
    @24142_Logstash_HTTP/HTTPS_output_implementation_in_Log_Pipeline
    Scenario: Verify Logstash HTTP/HTTPS output implementation in Log Pipeline with Https selection and Device Credential configuration
        Given I am on the Pipeline card page
        When I choose to create a new  Pipeline
        And I should see the HTTP/HTTPS output option in the output section
        Then I should be able to configure the HTTP/HTTPS output settings if the folder configuration is enabled
        And I should be able to configure the Pipeline with HTTP/HTTPS output settings with selection for Https
        And If i choose Https 
        Then I should see the url field with url field validations as mandatory field
        And Device Credentials field with device credential options in the dropdown which configured with device credential options
        And the Device Credentials field is not a mandatory field
        When I select a Device Credential from the dropdown
        Then The selected Device Credential should be associated with the Pipeline configuration
        When I save and upload the Pipeline
        Then The Pipeline should be saved and uploaded successfully with the selected HTTP/HTTPS output settings and Device Credential

    @24142_Logstash_HTTP/HTTPS_output_implementation_in_Log_Pipeline
    Scenario: Verify Logstash HTTP/HTTPS output implementation in Log Pipeline with Https selection and with device credential configuration
        Given I am on the Pipeline card page
        When I choose to create a new  Pipeline
        And I should see the HTTP/HTTPS output option in the output section
        Then I should be able to configure the HTTP/HTTPS output settings if the folder configuration is enabled
        And I should be able to configure the Pipeline with HTTP/HTTPS output settings with selection for Https
        And If i choose Https 
        Then I should see the url field with url field validations as mandatory field
        And Device Credentials field with device credential options in the dropdown which configured with device credential options
        And the Device Credentials field is not a mandatory field
        When I do not select any Device Credential from the dropdown
        Then The Pipeline should be saved and uploaded successfully with the selected HTTP/HTTPS output settings with selected Device Credential
        When I save and upload the Pipeline
        Then The Pipeline should be saved and uploaded successfully with the selected HTTP/HTTPS output settings without Device Credential

    @24142_Logstash_HTTP/HTTPS_output_implementation_in_Log_Pipeline
    Scenario: Verify the recived data from Logstash HTTP/HTTPS output in the configured endpoint
        Given I am on the Pipeline card page
        When I choose to create a new  Pipeline
        And I should see the HTTP/HTTPS output option in the output section
        Then I should be able to configure the HTTP/HTTPS output settings if the folder configuration is enabled
        And I should be able to configure the Pipeline with HTTP/HTTPS output settings with selection for Http or Https
        When I save and upload the Pipeline
        Then The Pipeline should be saved and uploaded successfully with the selected HTTP/HTTPS output settings
        When I send log data through the configured Pipeline
        Then The log data should be received at the configured HTTP/HTTPS endpoint successfully



    @24142_Logstash_HTTP/HTTPS_output_implementation_in_Log_Pipeline
    Scenario: Verify Logstash HTTP/HTTPS output implementation in Log Pipeline with invalid URL
        Given I am on the Pipeline card page
        When I choose to create a new  Pipeline
        And I should see the HTTP/HTTPS output option in the output section
        Then I should be able to configure the HTTP/HTTPS output settings if the folder configuration is enabled
        And I should be able to configure the Pipeline with HTTP/HTTPS output settings with selection for Http or Https
        And If i choose Http or Https 
        Then I should see the url field with url field validations as mandatory field
        When I enter an invalid URL in the URL field
        Then I should see an error message indicating that the URL is invalid
        When I try to save the Pipeline with the invalid URL
        Then The Pipeline should not be saved and an appropriate error message should be displayed


    