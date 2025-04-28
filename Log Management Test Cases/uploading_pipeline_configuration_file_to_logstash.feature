Feature: Uploading Pipeline Configuration File to Logstash

  @uploading_pipeline_configuration_file_to_logstash_11009
  Scenario: Verify upload button on Pipeline Configuration page
    Given I navigate to the Pipeline Configuration page
    When I check for the Upload button
    Then the Upload button should be visible and enabled

  @uploading_pipeline_configuration_file_to_logstash_11009
  Scenario: Verify upload button is available only for parent pipelines
    Given I navigate to the Pipeline Configuration page
    When I select a parent pipeline type
    Then the Upload button should be visible
    Given I select a child pipeline type
    Then the Upload button should not be visible

  @uploading_pipeline_configuration_file_to_logstash_11009
  Scenario: Verify toaster message on successful upload
    Given I am on the Pipeline Configuration page
    When I upload a valid configuration file for a pipeline
    Then I should see a success toaster message "Upload successful"

  @uploading_pipeline_configuration_file_to_logstash_11009
  Scenario: Verify info icon visibility after upload
    Given I navigate to the Pipeline Configuration page
    When I click on the Upload button and upload a valid file
    Then the info icon should become visible
    And clicking the info icon should display relevant details about the pipeline configuration

  @uploading_pipeline_configuration_file_to_logstash_11009
  Scenario: Verify service status on upload
    Given I upload a valid configuration file for a pipeline
    When the upload is successful
    Then the service status should update to "Active"

  @uploading_pipeline_configuration_file_to_logstash_11009
  Scenario: Verify parent and child configuration in /etc/logstash/conf.d
    Given I have uploaded valid configuration files for parent and child pipelines
    When I check the files in the /etc/logstash/conf.d directory
    Then the parent and child configurations should match the expected structure

  @uploading_pipeline_configuration_file_to_logstash_11009
  Scenario: Verify pipeline.yml in /etc/logstash
    Given I navigate to the /etc/logstash directory
    When I open the pipeline.yml file
    Then it should contain the expected configuration details

  @uploading_pipeline_configuration_file_to_logstash_11009
  Scenario: Verify configuration of parent and child in /etc/logstash/conf.d based on IP filters
    Given I have uploaded valid configuration files for parent and child pipelines
    When I check the configurations in the /etc/logstash/conf.d directory
    Then the configurations should adhere to the given filters for IP addresses
