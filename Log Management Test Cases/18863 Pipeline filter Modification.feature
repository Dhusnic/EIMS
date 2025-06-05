    @18863_Pipeline_Filter_Modification
    Scenario: Filter parent pipelines using main filter
        When the user types "audit" into the name filter in the main filter section
        Then only parent  pipelines matching "audit" should be displayed

    @18863_Pipeline_Filter_Modification
    Scenario: Filter pipelines using description and port number
        When the user filters by description "ingest" and port "514"
        Then only parent pipelines matching these filters should be shown

    @18863_Pipeline_Filter_Modification
    Scenario: Generic search only child pipelines using the child filter
        When the user enters "syslog" in the child pipeline filter
        Then only child pipelines with names containing "syslog" should be displayed


    @18863_Pipeline_Filter_Modification
    Scenario: Filter by type and status
        When the user filters pipelines by type "tcp" and status "Disabled"
        Then only the matching parent pipelines should be shown

    @18863_Pipeline_Filter_Modification
    Scenario: Filtering with only port number
        When the user filters with port number "10514"
        Then only pipelines using port 10514 should be visible

    @18863_Pipeline_Filter_Modification
    Scenario: Apply multiple filters simultaneously
        When the user filters by name "log", type "ETL", and port "514"
        Then all matching pipelines should be listed in both parent sections

    @18863_Pipeline_Filter_Modification
    Scenario: Removing all filters shows complete data
        Given filters are applied
        When the user clears all filters
        Then the page should show all parent pipelines

    @18863_Pipeline_Filter_Modification
    Scenario: apply matching filter for both parent pipeline
        Given filters are applied
        When the user filters by name "log"
        Then the page should show all parent pipelines
        And click on parent pipeline
        Then parent associated pipeline should be displayed