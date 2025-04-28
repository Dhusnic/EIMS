Feature: Multi elastic node configuration implementation
    As a user I want to configure multiple elastic nodes
    So that I can process data from multiple elastic nodes
    Background:
        Given In .env file, I have the following configuration
        | key | value |
        | LOG_HOSTS | ["http://10.0.5.97:9200","http://10.0.5.219:9200"] |

@13330_Multi_elastic_Node_configuration_Implementation
Scenario: verify Configurations of multiple elastic nodes in parent pipeline
    When I choose to add a pipeline
    And I select the parent pipeline option
    And I save the configuration
    And I configure pipeline with index name
    Then the parent pipeline should be created successfully
    And I uploded the pipeline successfully
    And I should see the pipeline file in the server with multiple elastic nodes which is configured in the .env file

@13330_Multi_elastic_Node_configuration_Implementation
Scenario: Configure multiple elastic nodes in child pipeline
    When I choose to add a pipeline
    And I select the child pipeline option
    And I save the configuration
    And I configure pipeline with child
    Then the child pipeline should be created successfully
    And I uploded the pipeline successfully
    And I should see the child pipeline files in the server with multiple elastic nodes which is configured in the .env file

@13330_Multi_elastic_Node_configuration_Implementation
Scenario: verify Configurations of multiple elastic nodes in report
    When I choose to add a report
    And I provide data to the report
    And I save the report
    Then I should see the report data from multiple elastic nodes which is configured in the .env file

@13330_Multi_elastic_Node_configuration_Implementation
Scenario: verify Configurations of multiple elastic nodes in dashboard
    When I choose to add a dashboard
    And I configure dashboard with multiple elastic nodes
    And I save the dashboard
    Then I should see the dashboard data from multiple elastic nodes which is configured in the .env file



