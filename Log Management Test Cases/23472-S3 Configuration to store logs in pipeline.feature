Feature: S3 Configuration to store logs in pipeline
Background:
    Given I am Logged in to the application
    And navigate to the Pipeline
    And I am on the Pipeline card page
    And I choose to add a new pipeline


@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: User choose add the folder section for S3 storage
    Given I am on the Pipeline card page
    When I choose to add the folder section for S3 storage
    Then I should see the Folder section in the pipeline configuration page
    And I should see the option to select Local Storage,S3 configuration

@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: User choose to add the folder section for S3 storage and show the folder is mandator
    Given I am on the Pipeline card page
    When I choose to add the folder section for S3 storage
    Then I should see the Folder section in the pipeline configuration page
    And enable the folder section
    And I choose the Folder Type as S3 Storage
    And I should see the Folder section fields Bucket Name,AWS cerdentials,Region,Access control ,file Size,Time filed rotation until the folder is enabled



@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: verify the Info icon for S3 configuration fields
    Given I am on the Pipeline card page
    When I choose to add the folder section for S3 storage
    And enable the folder section
    And I choose the Folder Type as S3 Storage
    Then I should see the Info icon for Bucket Name,AWS cerdentials,Region,Access control  fields in the Folder section

    |field                |tooltip message                                                                                                                        |
    |Bucket Name         | The name of your S3 bucket where files will be stored. Bucket names must be globally unique across all AWS accounts.|
    |AWS cerdentials    | AWS credentials with permissions to write to the specified S3 from the Device credential configuration for Cloud Storage.|
    |Region             | The AWS region where your S3 bucket is located (e.g., us-east-1, eu-west-1). Choosing the right region can optimize latency and minimize costs.|
    |Access control     | Specify access control settings for the uploaded files. Options include private, public-read, and authenticated-read. Default is private.|
    |File Size         | Maximum size for each log file before it gets rotated and uploaded to S3. When a file reaches this size, Log Collector will close it, upload it to S3, and start a new file. Larger files reduce upload frequency but increase memory usage. Common values: 50MB-200MB for high-volume logs, 10MB-50MB for moderate volumes.|
    |Time Interval     | Maximum time interval before a log file is rotated and uploaded to S3, regardless of file size. This ensures regular uploads even during low-activity periods. Files are uploaded based on the timestamp when rotation occurs. Common values: 5-15 minutes for real-time needs, 30-60 minutes for batch processing.|

@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: verify the default values for S3 configuration fields
    Given I am on the Pipeline card page
    When I choose to add the folder section for S3 storage
    And enable the folder section
    And I choose the Folder Type as S3 Storage
    Then I should see the default values for Bucket Name,AWS cerdentials,Region,Access control  fields in the Folder section

    |field                |default value                                                                                                                        |
    |Bucket Name         |from Enviroinmental configuration|
    |AWS cerdentials    | No default value|
    |Region             | from Enviroinmental configuration |
    |Access control     | private|
    |File Size         | 200MB|
    |Time Interval     | 5 minutes|

@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: Verify the info icon for the Access control  options
    Given I am on the Pipeline card page
    When I choose to add the folder section for S3 storage
    And enable the folder section
    And I choose the Folder Type as S3 Storage
    Then I should see the Info icon for Access control  options in the Folder section

    |option                |tooltip message                                                                                                                        |
    |private     | PRIVATE: Only the bucket owner can read and write the log files. This is the most secure option, ensuring complete privacy of your data. Recommended for internal logs, sensitive application data, debugging information, and any confidential data that should remain accessible only to your AWS account.| 
    |public-read| PUBLIC READ: Anyone on the internet can download and read your log files, but only the bucket owner can write or modify them. Use with extreme caution as this exposes your data publicly. Suitable only for public API logs, website analytics, or other data intended for public consumption. Not recommended for sensitive information.|
    |public-read-write| PUBLIC READ-WRITE: Anyone on the internet can read, write, modify, and delete your log files. This is a high-risk setting that should never be used in production environments. Your log data could be corrupted, modified, or deleted by unauthorized users. Only appropriate for temporary testing environments.|
    |authenticated-read| AUTHENTICATED READ: Only authenticated AWS users can read your log files, while only the bucket owner can write them. This setting is suitable for sharing logs with other AWS accounts within your organization, enabling cross-account log analysis, or facilitating partner integrations while maintaining write control.|
    |aws-exec-read| AWS EXEC READ: Only AWS services (such as CloudFront, Elastic Load Balancing, etc.) can read your log files, while the bucket owner maintains write access. This setting is designed for logs that need to be processed by AWS services, including CDN access logs, load balancer logs, or other service-generated content.|
    |bucket-owner-read| BUCKET OWNER READ: When other AWS accounts upload files to your bucket, you (the bucket owner) can read their files, but they retain write access control. This setting is useful for multi-tenant logging scenarios where different applications or accounts log to your bucket, but you require oversight and read access to all content.|
    |bucket-owner-full-control| BUCKET OWNER FULL CONTROL: The bucket owner has complete read and write control over all files, including those uploaded by other AWS accounts. This setting is ideal for enterprise logging environments where IT administrators need comprehensive control over all log files regardless of the original uploader.|
    |log-delivery-write| LOG DELIVERY WRITE: Special permissions designed for AWS logging services (CloudTrail, VPC Flow Logs, Access Logs, etc.) to write log files to your bucket. This setting is appropriate when you want AWS services to deliver logs directly to the same S3 bucket where Logstash uploads your application logs.|


@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: The Options for AWS Credentials field
    Given I am on the Pipeline card page
    When I choose to add the folder section for S3 storage
    And enable the folder section
    And I choose the Folder Type as S3 Storage
    Then I should see the Options for AWS Cerdentials field in the Folder section
    And the options for that field are the device credentials configured with type as Cloud Storage whch configured AWS

@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: The options for File Size and Time Interval fields
    Given I am on the Pipeline card page
    When I choose to add the folder section for S3 storage
    And enable the folder section
    And I choose the Folder Type as S3 Storage
    Then I should see the Options for File Size and Time Interval fields in the Folder section
    And the options for File Size field are B,KB,MB,GB,TB
    And the options for Time Interval field are minutes,hours,days

@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: validations for File Size and Time Interval fields
    Given I am on the Pipeline card page
    When I choose to add the folder section for S3 storage
    And enable the folder section
    And I choose the Folder Type as S3 Storage
    Then I should see the validations for File Size and Time Interval fields in the Folder section
    And I should see only numbers are allowed in the File Size and Time Interval fields in the Folder section

@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: Delete the cloud storage device credential which is used in the pipeline S3 configuration
    Given I am on the Pipeline card page
    When I choose to add the folder section for S3 storage
    And enable the folder section
    And I choose the Folder Type as S3 Storage
    And I select a AWS cerdentials from the AWS cerdentials dropdown
    And I navigate to the Device Credential page
    And I delete the cloud storage device credential which is used in the pipeline S3 configuration
    Then I should see a warning message indicating that this device credential is used in the pipeline S3 configuration and cannot be deleted


@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: User choose to add the folder section for S3 storage and show the folder is mandatory when the folder is enabled
    Given I am on the Pipeline card page
    When I choose to add the folder section for S3 storage
    And I enable the folder section
    And I choose the Folder Type as S3 Storage
    Then I should see the Folder section fields Bucket Name,AWS cerdentials,Region,Access control  is mandatory when the folder is enabled
    And I save the pipeline configuration
    Then I should see a message this field is mandatory to Bucket Name,AWS cerdentials,Region,Access control  fields when the folder is enabled

@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: User choose to add the folder section for S3 storage and show the Bucket Name,AWS cerdentials,Region,Access control  is mandatory when the folder is enabled and save the pipeline configuration
    Given I am on the Pipeline card page
    When I choose to add the folder section for S3 storage
    And I enable the folder section
    And I choose the Folder Type as S3 Storage
    Then I should see the Folder section fields Bucket Name,AWS cerdentials,Region,Access control  is mandatory when the folder is enabled
    And I fill the Bucket Name,AWS cerdentials,Region,Access control  fields with valid data
    And I tried to save the pipeline configuration
    Then I should see a success message indicating that pipeline is saved successfully

@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: When User uploads the pipeline which configured with S3 storage folder section
    Given I am on the Pipeline card page
    When I upload a pipeline configuration file that is configured with S3 storage
    Then I should see the pipeline configuration is uploaded successfully
    And I should see the Folder section with S3 storage configuration in the pipeline configuration file in log collector

@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: When User uploads the pipeline which configured with S3 storage folder section
    Given I am on the Pipeline card page
    When I upload a pipeline configuration file that is configured with S3 storage
    Then I should see the pipeline configuration is uploaded successfully
    And I should see the Folder section with S3 storage configuration in the pipeline configuration file in log collector
    Then the Logs comming to that pipeline should be stored in the S3 bucket 


@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: When User uploads the pipeline which configured with S3 storage folder section and the logs are stored in a given S3 bucket as per time file rotation or file size
    Given I am on the Pipeline card page
    When I upload a pipeline configuration file that is configured with S3 storage with 5 minutes time file rotation
    Then I should see the pipeline configuration is uploaded successfully
    And I should see the Folder section with S3 storage configuration in the pipeline configuration file in log collector
    When I send logs to that pipeline
    Then I should see the logs are stored in the given S3 bucket each 5 minutes of time file rotation


@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: When User uploads the pipeline which configured with S3 storage folder section and the logs are stored in a given S3 bucket as per file size
    Given I am on the Pipeline card page
    When I upload a pipeline configuration file that is configured with S3 storage with 200MB file size
    Then I should see the pipeline configuration is uploaded successfully
    And I should see the Folder section with S3 storage configuration in the pipeline configuration file in log collector
    When I send logs to that pipeline
    Then I should see the logs are stored in the given S3 bucket each 200MB of file size


@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: When User uploads the pipeline which configured with S3 storage folder section and the logs are stored in a given S3 bucket as per time file rotation or file size
    Given I am on the Pipeline card page
    When I upload a pipeline configuration file that is configured with S3 storage with 5 minutes time file rotation and 200MB file size
    Then I should see the pipeline configuration is uploaded successfully
    And I should see the Folder section with S3 storage configuration in the pipeline configuration file in log collector
    When I send logs to that pipeline
    Then I should see the logs are stored in the given S3 bucket each 5 minutes of time file rotation or 200MB of file size which ever occurs first


@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: Edit the pipeline which configured with S3 storage folder section and change the S3 configuration
    Given I am on the Pipeline card page
    When I upload a pipeline configuration file that is configured with S3 storage
    Then I should see the pipeline configuration is uploaded successfully
    And I should see the Folder section with S3 storage configuration in the pipeline configuration file in log collector
    When I edit that pipeline and change the S3 configuration like Bucket Name,AWS cerdentials,Region,Access control ,file Size,Time filed rotation
    And I save the pipeline configuration
    Then I should see a success message indicating that pipeline is saved successfully
    When I send logs to that pipeline
    Then I should see the logs are stored in the given S3 bucket as per the updated S3 configuration


@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: Edit the pipeline which configured with S3 storage folder section and disable the folder section
    Given I am on the Pipeline card page
    When I upload a pipeline configuration file that is configured with S3 storage
    Then I should see the pipeline configuration is uploaded successfully
    And I should see the Folder section with S3 storage configuration in the pipeline configuration file in log collector
    When I edit that pipeline and disable the folder section
    And I save the pipeline configuration
    Then I should see a success message indicating that pipeline is saved successfully
    When I send logs to that pipeline
    Then I should see the logs are not stored in the S3 bucket


@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: Edit the pipeline which configured with S3 Storage with access control  as private
    Given I am on the Pipeline card page
    When I upload a pipeline configuration file that is configured with S3 storage with access control  as private
    Then I should see the pipeline configuration is uploaded successfully
    And I should see the Folder section with S3 storage configuration in the pipeline configuration file in log collector
    When I send logs to that pipeline
    Then I should see the logs are stored in the given S3 bucket with access control  as private (only the bucket owner can read and write the log files)

@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: Edit the pipeline which configured with S3 Storage with access control  as public-read
    Given I am on the Pipeline card page
    When I upload a pipeline configuration file that is configured with S3 storage with access control  as public-read
    Then I should see the pipeline configuration is uploaded successfully
    And I should see the Folder section with S3 storage configuration in the pipeline configuration file in log collector
    When I send logs to that pipeline
    Then I should see the logs are stored in the given S3 bucket with access control  as public-read (Anyone on the internet can download and read your log files, but only the bucket owner can write or modify them)

@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: Edit the pipeline which configured with S3 Storage with access control  as public-read-write
    Given I am on the Pipeline card page
    When I upload a pipeline configuration file that is configured with S3 storage with access control  as public-read-write
    Then I should see the pipeline configuration is uploaded successfully
    And I should see the Folder section with S3 storage configuration in the pipeline configuration file in log collector
    When I send logs to that pipeline
    Then I should see the logs are stored in the given S3 bucket with access control  as public-read-write (Anyone on the internet can read, write, modify, and delete your log files. This is a high-risk setting that should never be used in production environments)

@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: Edit the pipeline which configured with S3 Storage with access control  as authenticated-read
    Given I am on the Pipeline card page
    When I upload a pipeline configuration file that is configured with S3 storage with access control  as authenticated-read
    Then I should see the pipeline configuration is uploaded successfully
    And I should see the Folder section with S3 storage configuration in the pipeline configuration file in log collector
    When I send logs to that pipeline
    Then I should see the logs are stored in the given S3 bucket with access control  as authenticated-read (Only authenticated AWS users can read your log files, while only the bucket owner can write them)

@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: Edit the pipeline which configured with S3 Storage with access control  as aws-exec-read
    Given I am on the Pipeline card page
    When I upload a pipeline configuration file that is configured with S3 storage with access control  as aws-exec-read
    Then I should see the pipeline configuration is uploaded successfully
    And I should see the Folder section with S3 storage configuration in the pipeline configuration file in log collector
    When I send logs to that pipeline
    Then I should see the logs are stored in the given S3 bucket with access control  as aws-exec-read (Only AWS services can read your log files, while the bucket owner maintains write access)


@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: Edit the pipeline which configured with S3 Storage with access control  as bucket-owner-read
    Given I am on the Pipeline card page
    When I upload a pipeline configuration file that is configured with S3 storage with access control  as bucket-owner-read
    Then I should see the pipeline configuration is uploaded successfully
    And I should see the Folder section with S3 storage configuration in the pipeline configuration file in log collector
    When I send logs to that pipeline
    Then I should see the logs are stored in the given S3 bucket with access control  as bucket-owner-read (When other AWS accounts upload files to your bucket, you (the bucket owner) can read their files, but they retain write access control)


@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: Edit the pipeline which configured with S3 Storage with access control  as bucket-owner-full-control
    Given I am on the Pipeline card page
    When I upload a pipeline configuration file that is configured with S3 storage with access control  as bucket-owner-full-control
    Then I should see the pipeline configuration is uploaded successfully
    And I should see the Folder section with S3 storage configuration in the pipeline configuration file in log collector
    When I send logs to that pipeline
    Then I should see the logs are stored in the given S3 bucket with access control  as bucket-owner-full-control (The bucket owner has complete read and write control over all files, including those uploaded by other AWS accounts)

@23472_S3_Configuration_to_store_logs_in_pipeline
Scenario: Edit the pipeline which configured with S3 Storage with access control  as log-delivery-write 
    Given I am on the Pipeline card page
    When I upload a pipeline configuration file that is configured with S3 storage with access control  as log-delivery-write
    Then I should see the pipeline configuration is uploaded successfully
    And I should see the Folder section with S3 storage configuration in the pipeline configuration file in log collector
    When I send logs to that pipeline
    Then I should see the logs are stored in the given S3 bucket with access control  as log-delivery-write (Special permissions designed for AWS logging services to write log files to your bucket)
