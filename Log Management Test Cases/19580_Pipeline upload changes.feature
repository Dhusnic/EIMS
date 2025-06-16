Feature: Pipeline upload changes
    Background:
        Given I am logged in to the application
        And I am on the "Log Pipeline Configuration" page

    @19580_Pipeline_upload_changes
    Scenario: Upload a new pipeline configuration file and verify the info incon
        Given I have a valid pipeline configuration file
        When I upload the file
        Then the info icon should be be visible in the pipeline configuration card

    @19580_Pipeline_upload_changes
    Scenario: add pipeline to queeue a new pipeline configuration file and verify the status
        Given I have a valid pipeline configuration file
        When I upload the file
        And the pipeline is in Added to queeue
        Then the status should be "queeued"

    @19580_Pipeline_upload_changes
    Scenario: add pipeline to queeue configuration file and verify the status color
        Given I have a valid pipeline configuration file
        When I upload the file
        And the pipeline is in Added to queeue
        Then the status color should be "orange"

    @19580_Pipeline_upload_changes
    Scenario: Upload a new pipeline configuration file and verify the status
        Given I have a valid pipeline configuration file
        When I upload the file
        And the pipeline is in uploaded successfully
        Then the status should be "uploaded successfully"

    @19580_Pipeline_upload_changes
    Scenario: Upload a new pipeline configuration file and verify the status color
        Given I have a valid pipeline configuration file
        When I upload the file
        And the pipeline is in uploaded successfully
        Then the status color should be "geen"

    @19580_Pipeline_upload_changes
    Scenario: Upload failed in new pipeline configuration file and verify the status
        Given I have a valid pipeline configuration file
        When I upload the file
        And the pipeline is in uploaded failed
        Then the status should be "uploaded failed"

    @19580_Pipeline_upload_changes
    Scenario: Upload failed in new pipeline configuration file and verify the status color
        Given I have a valid pipeline configuration file
        When I upload the file
        And the pipeline is in uploaded failed
        Then the status color should be "red"

    @19580_Pipeline_upload_changes
    Scenario: logstash restart a new pipeline configuration file and verify the status
        Given I have a valid pipeline configuration file
        When I upload the file
        And the pipeline is in logstash restart
        Then the status should be "restart successfull"

    @19580_Pipeline_upload_changes
    Scenario: logstash restart a new pipeline configuration file and verify the status color
        Given I have a valid pipeline configuration file
        When I upload the file
        And the pipeline is in logstash restart
        Then the status color should be "green"

    @19580_Pipeline_upload_changes
    Scenario: logstash restart failed by a new pipeline configuration file and verify the status
        Given I have a valid pipeline configuration file
        When I upload the file
        And the pipeline is in restart failed
        Then the status should be "restart failed"

    @19580_Pipeline_upload_changes
    Scenario: logstash restart failed by a new pipeline configuration file and verify the status color
        Given I have a valid pipeline configuration file
        When I upload the file
        And the pipeline is in restart failed
        Then the status color should be "red"

    @19580_Pipeline_upload_changes
    Scenario: the satus info sidebar is visible
        Given I have a valid pipeline configuration file
        When I upload the file
        And the pipeline is in uploaded successfully
        Then the status info sidebar should be visible
        And the status info sidebar should have the correct information of the pipeline uploaded status

    @19580_Pipeline_upload_changes
    Scenario: the child pipeline uploaded is draft
        Given I have a valid pipeline configuration file with child pipeline
        When it is in  draft
        Then the status should be "draft"


    @19580_Pipeline_upload_changes
    Scenario: the child pipeline uploaded is draft colour code
        Given I have a valid pipeline configuration file with child pipeline
        When it is in  draft
        Then the status color should be "grey"


    @19580_Pipeline_upload_changes
    Scenario: the child pipeline is uploaded successfully
        Given I have a valid pipeline configuration file with child pipeline
        When it is in uploaded successfully
        Then the status should be "uploaded successfully"

    @19580_Pipeline_upload_changes
    Scenario: the child pipeline is uploaded successfully colour code
        Given I have a valid pipeline configuration file with child pipeline
        When it is in uploaded successfully
        Then the status color should be "green"

    @19580_Pipeline_upload_changes
    Scenario: the child pipeline is uploaded failed
        Given I have a valid pipeline configuration file with child pipeline
        When it is in uploaded failed
        Then the status should be "uploaded failed"

    @19580_Pipeline_upload_changes
    Scenario: the child pipeline is uploaded failed colour code
        Given I have a valid pipeline configuration file with child pipeline
        When it is in uploaded failed
        Then the status color should be "red"

    @19580_Pipeline_upload_changes
    Scenario: Upload a new pipeline configuration file without child pipeline
        Given I have a valid pipeline configuration file without child pipeline
        When I upload the file
        And the pipeline is in uploaded successfully
        Then the pipeline conf file should be uploaded successfully to the logstash server


    @19580_Pipeline_upload_changes
    Scenario: Upload a new pipeline configuration file with child pipeline and verify the conf file
        Given I have a valid pipeline configuration file without child pipeline
        When I upload the file
        And the pipeline is in uploaded successfully
        Then the pipeline conf file should be uploaded successfully to the logstash server
        And the child pipeline associated with the pipeline conf file should be uploaded successfully to the logstash server

    @19580_Pipeline_upload_changes
    Scenario: Upload a new pipeline configuration file with child pipeline and verify the pipeline.yml file
        Given I have a valid pipeline configuration file without child pipeline
        When I upload the file
        And the pipeline is in uploaded successfully
        Then the pipeline.yml file should be updated in the logstash server based on the pipeline files uploaded


    @19580_Pipeline_upload_changes
    Scenario: delete the pipeline configuration file which has uplloaded successfully without child pipeline
        Given I have a valid pipeline configuration file with child pipeline
        When I delete the file
        And the pipeline is in deleted successfully
        Then the pipeline conf file should be deleted successfully from the logstash server


    @19580_Pipeline_upload_changes
    Scenario: delete the pipeline configuration file which has uplloaded successfully with child pipeline
        Given I have a valid pipeline configuration file with child pipeline
        When I delete the file
        And the pipeline is in deleted successfully
        Then the pipeline conf file should be deleted successfully from the logstash server
        And the child pipeline associated with the pipeline conf file and dose not associated with any other pipelines should be deleted successfully from the logstash server

    @19580_Pipeline_upload_changes
    Scenario: When user does not have the permission to upload the pipeline configuration file
        Given I have a valid pipeline configuration file
        And I am not logged in without a permission to upload the pipeline configuration file
        And I should not be able to see upload button

