Feature: Batch wise separation of IP's in pipeline conf File

    Background:
        Given the user is logged in
        And Navigate to the pipeline configuration page
        And the pipeline configuration interface is loaded

    @24805_Batch_wise_separation_of_IP's_in_pipeline_conf_File @single_child_pipeline @asset_filter
    Scenario: Child pipeline with more than 200 IPs - Asset Filter Configuration
        Given I am creating a new child pipeline
        When I configure the asset filter with 250 unique IP addresses
        And I upload the child pipeline configuration
        Then the child pipeline should be uploaded successfully
        And the asset filter should contain all 250 IP addresses
        And the pipeline status should show "Active"

    @24805_Batch_wise_separation_of_IP's_in_pipeline_conf_File @parent_pipeline @batch_processing
    Scenario: Parent pipeline with batch size condition for 200 IPs
        Given I have a child pipeline configured with 250 IP addresses
        When I create a parent pipeline for the child pipeline
        And I upload the parent pipeline configuration
        Then the parent pipeline should be uploaded successfully
        And the parent pipeline conf file should contain batch size condition of 200 IPs
        And the IP addresses should be processed in batches of 200
        And the remaining 50 IPs should be processed in a separate batch

    @24805_Batch_wise_separation_of_IP's_in_pipeline_conf_File @multiple_child_pipelines @unique_ips
    Scenario: Two child pipelines with 1000 unique IPs each
        Given I am creating the first child pipeline
        When I configure the asset filter with 1000 unique IP addresses for first child
        And I upload the first child pipeline
        And I create a second child pipeline
        And I configure the asset filter with 1000 different unique IP addresses for second child
        And I upload the second child pipeline
        Then both child pipelines should be uploaded successfully
        And first child pipeline should contain 1000 unique IPs
        And second child pipeline should contain 1000 different unique IPs
        And there should be no IP overlap between the two child pipelines
        And the 1000 unique IPs should be in batch 200 ips (totaly 5 batches)

    @24805_Batch_wise_separation_of_IP's_in_pipeline_conf_File @parent_pipeline @multiple_children @batch_processing
    Scenario: Parent pipeline for two child pipelines with batch processing
        Given I have two child pipelines with 1000 unique IPs each
        When I create a parent pipeline for both child pipelines
        And I upload the parent pipeline configuration
        Then the parent pipeline should be uploaded successfully
        And the parent pipeline conf should handle 2000 total IP addresses
        And IPs should be processed in batches of 200 for first child pipeline
        And IPs should be processed in batches of 200 for second child pipeline
        And each child should have 5 batches of 200 IPs each

    @24805_Batch_wise_separation_of_IP's_in_pipeline_conf_File @log_custom_filter @batch_processing
    Scenario: Batch processing with log custom filter
        Given I have a child pipeline configured with 300 IP addresses
        And the pipeline has log custom filter enabled
        When I upload the parent pipeline for this child
        Then the parent pipeline should be uploaded successfully
        And the conf file should include log custom filter configuration
        And IP batches should be processed with custom filter applied
        And each batch of 200 IPs should pass with addition of log custom filter
        And the remaining 100 IPs should be processed in a separate batch with also log custom filter

    @24805_Batch_wise_separation_of_IP's_in_pipeline_conf_File @batch_size_validation
    Scenario Outline: Different IP counts and batch size validation
        Given I have a child pipeline configured with "<ip_count>" IP addresses
        When I upload the parent pipeline configuration
        Then the parent pipeline should be uploaded successfully
        And IPs should be divided into "<expected_batches>" batches
        And each batch should contain maximum 200 IPs
        And the last batch should contain "<remaining_ips>" IPs

        Examples:
            | ip_count | expected_batches | remaining_ips |
            | 150      | 1                | 150           |
            | 200      | 1                | 200           |
            | 201      | 2                | 1             |
            | 400      | 2                | 200           |
            | 450      | 3                | 50            |
            | 600      | 3                | 200           |
            | 999      | 5                | 199           |

    @24805_Batch_wise_separation_of_IP's_in_pipeline_conf_File @ip_uniqueness_validation
    Scenario: IP address uniqueness validation across batches
        Given I have a 2 child pipeline with unique 500 IP addresses
        When I upload the parent pipeline
        Then the system should not identify duplicatation IP addresses across child
        And only unique IP addresses should be processed in batches
        And the final batch count should reflect unique IP count only

    @24805_Batch_wise_separation_of_IP's_in_pipeline_conf_File @ip_uniqueness_validation
    Scenario: the logs should be recived according to configuration
        Given I have been configured a pipeline
        And uploaded the Pipeline
        And i should see log receving in log search page based on the configuration