Feature: Create index name based on selected log fields in pipeline
    Background:
        Given user is logged in to the application
        And user navigates to the Pipeline

    @20573_Create_index_name_based_on_selected_log_fields_in_pipeline
    Scenario: Create index name based on selected log fields in pipeline (host.ip)
        Given user is on the Pipeline card page
        When user chsooses to add a new pipeline
        And user selects the log column index name as host.ip
        And user uploads the pipeline
        Then user should see the index name is created based on selected log fields in pipeline as host.ip

    @20573_Create_index_name_based_on_selected_log_fields_in_pipeline
    Scenario: Create index name based on selected log fields in pipeline (host.name)
        Given user is on the Pipeline card page
        When user chsooses to add a new pipeline
        And user selects the log column index name as host.name
        And user uploads the pipeline
        Then user should see the index name is created based on selected log fields in pipeline as host.hostname

    @20573_Create_index_name_based_on_selected_log_fields_in_pipeline
    Scenario: Create index name based on selected log fields in pipeline if the field is not present in the log
        Given user is on the Pipeline card page
        When user chsooses to add a new pipeline
        And user selects the log column index name as host.ip
        And user uploads the pipeline
        Then user should see the index name is created based on selected log fields in pipeline as host.ip
        And if the field is not present in the log, the index name should be created as "unknown" index name

    @20573_Create_index_name_based_on_selected_log_fields_in_pipeline
    Scenario: Create index name based on selected log fields in pipeline and index is viewd in Multi-Index
        Given user is on the Pipeline card page
        When user chsooses to add a new pipeline
        And user selects the log column index name as host.ip or host.name
        And user uploads the pipeline
        Then user should see the index name is created based on selected log fields in pipeline as host.ip or host.name
        And user should see the index name is created in Multi-Index

    @20573_Create_index_name_based_on_selected_log_fields_in_pipeline
    Scenario: Create index name based on selected log fields in pipeline and index is viewd in Multi-Index and see logs in logSearch
        Given user is on the Pipeline card page
        When user chsooses to add a new pipeline
        And user selects the log column index name as host.ip or host.name
        And user uploads the pipeline
        Then user should see the index name is created based on selected log fields in pipeline as host.ip or host.name
        And user should see the index name is created in Multi-Index
        And user should see the logs in logSearch