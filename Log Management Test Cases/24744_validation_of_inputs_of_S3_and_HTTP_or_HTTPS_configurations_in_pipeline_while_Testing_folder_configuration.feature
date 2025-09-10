Feature: Validation of Inputs of S3 and HTTP or HTTPS configurations in Pipeline for testing Folder configurations

    Background:
        Given the pipeline configuration interface is loaded
        And the user has appropriate permissions to configure pipelines
        And the pipeline configuration form is displayed
    
    @24744_validation_of_inputs_of_S3_and_HTTP_or_HTTPS_configurations_in_pipeline_while_Testing_folder_configuration @s3_validation @save_button @positive
    Scenario: S3 Configuration Save Button - Valid Configuration
        Given I am on the S3 configuration section
        And folder config is enabled
        When I enter valid AWS access key
        And I enter valid AWS secret key
        And I enter valid region "us-east-1"
        And I enter valid bucket name "test-bucket"
        And I enter valid Access Control "private"
        And I click the Save button
        Then the pipeline configuration should be saved successfully
        And I should see a success message

    @24744_validation_of_inputs_of_S3_and_HTTP_or_HTTPS_configurations_in_pipeline_while_Testing_folder_configuration @s3_validation @test_button
    Scenario Outline: S3 Configuration Test Button Validation
        Given I am on the S3 configuration section
        And folder config is enabled
        When I enter "<access_key>" in the AWS access key field
        And I enter "<secret_key>" in the AWS secret key field
        And I enter "<region>" in the region field
        And I enter "<bucket_name>" in the bucket name field
        And I enter "<canned_acl>" in the Access Control field
        And I click the Test button
        Then I should see the error message "<expected_message>"

        Examples:
            | access_key | secret_key   | region       | bucket_name  | canned_acl  | expected_message                                                                                                                    |
            | wrong_key  | valid_secret | us-east-1    | valid-bucket | private     | Access denied: Wrong AWS credentials or insufficient permissions.Check Device Credentials and IAM policies for the specified bucket |
            | valid_key  | wrong_secret | us-east-1    | valid-bucket | private     | Access denied: Wrong AWS credentials or insufficient permissions.Check Device Credentials and IAM policies for the specified bucket |
            | valid_key  | valid_secret | wrong-region | valid-bucket | private     | Connection error: Unable to connect to AWS S3 Region you provided                                                                   |
            | valid_key  | valid_secret | us-east-1    | wrong-bucket | private     | Bucket not found: The specified S3 bucket does not exist or is not accessible.                                                      |
            | valid_key  | valid_secret | us-east-1    | valid-bucket | invalid-acl | Invalid Access Control (ACL): The ACL invalid-acl is not supported by your S3 Bucket.                                               |
            | empty      | valid_secret | us-east-1    | valid-bucket | private     | Provide the correct AWS credentials, region, bucket,Access Control To validate S3 credentials and permissions.                      |
            | valid_key  | empty        | us-east-1    | valid-bucket | private     | Provide the correct AWS credentials, region, bucket,Access Control To validate S3 credentials and permissions.                      |
            | valid_key  | valid_secret | empty        | valid-bucket | private     | Provide the correct AWS credentials, region, bucket,Access Control To validate S3 credentials and permissions.                      |
            | valid_key  | valid_secret | us-east-1    | empty        | private     | Provide the correct AWS credentials, region, bucket,Access Control To validate S3 credentials and permissions.                      |

    @24744_validation_of_inputs_of_S3_and_HTTP_or_HTTPS_configurations_in_pipeline_while_Testing_folder_configuration @s3_validation @test_button @positive
    Scenario: S3 Configuration Test Button - Valid Configuration
        Given I am on the S3 configuration section
        And folder config is enabled
        When I enter valid AWS access key
        And I enter valid AWS secret key
        And I enter valid region "us-east-1"
        And I enter valid bucket name "test-bucket"
        And I enter valid Access Control "private"
        And I click the Test button
        Then I should see the success message "S3 credentials, permissions, and canned ACL are valid for Logstash. ACL Private applied successfully."


    @24744_validation_of_inputs_of_S3_and_HTTP_or_HTTPS_configurations_in_pipeline_while_Testing_folder_configuration @s3_validation @path_validation
    Scenario Outline: S3 Path Validation
        Given I am on the S3 configuration section
        And folder config is enabled
        When I enter valid AWS credentials
        And I enter "<s3_path>" in the S3 path field
        And I click the Test button
        Then the path validation result should be "<validation_result>"

        Examples:
            | s3_path                         | validation_result |
            | logs/application/               | valid             |
            | logs/system/%{+YYYY}/%{+MM}/    | valid             |
            | data/processed/daily/           | valid             |
            | archive/%{host}/%{+yyyy-MM-dd}/ | valid             |
            | /logs/absolute/path/            | valid             |
            | logs/../invalid/path/           | invalid           |
            | logs/with spaces/               | valid             |
            | logs/with-special-chars_123/    | valid             |


    @24744_validation_of_inputs_of_S3_and_HTTP_or_HTTPS_configurations_in_pipeline_while_Testing_folder_configuration @http_https_validation @test_button
    Scenario Outline: HTTP/HTTPS Configuration Test Button Validation
        Given I am on the HTTP/HTTPS configuration section
        And folder config is enabled
        When I enter "<endpoint_url>" in the endpoint URL field
        And I enter "<username>" in the device credential username field
        And I enter "<password>" in the device credential password field
        And I click the Test button
        Then I should see the error message "<expected_message>"

        Examples:
            | endpoint_url             | username   | password   | expected_message                                    |
            | http://inactive-url.com  | valid_user | valid_pass | Connection error: Unable to establish a connection. |
            | https://inactive-url.com | valid_user | valid_pass | Connection error: Unable to establish a connection. |
            | http://valid-url.com     | wrong_user | valid_pass | Authentication failed                               |
            | https://valid-url.com    | valid_user | wrong_pass | Authentication failed                               |
            | http://valid-url.com     | wrong_user | wrong_pass | Authentication failed                               |

    @24744_validation_of_inputs_of_S3_and_HTTP_or_HTTPS_configurations_in_pipeline_while_Testing_folder_configuration @http_https_validation @test_button @positive
    Scenario: HTTP/HTTPS Configuration Test Button - Valid Configuration
        Given I am on the HTTP/HTTPS configuration section
        And folder config is enabled
        When I enter active endpoint URL "https://api.example.com"
        And I enter valid device credentials
        And I click the Test button
        Then I should see a connection success message
        And authentication should be verified