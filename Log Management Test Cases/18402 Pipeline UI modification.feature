@18402_pipeline_UI_modification
Feature: Pipeline UI modification for Log Pipeline Configuration

    This feature validates the new card-based UI for Pipeline Configuration.
    It includes filters, permission-based actions, and parent-child relationships.

    Background:
        Given the user is on the "Log Pipeline Configuration" page

    @18402_pipeline_UI_modification
    Scenario: Scroll through the parent pipeline sidebar
        When the user scrolls the left sidebar
        Then additional parent pipelines should be loaded

    @18402_pipeline_UI_modification
    Scenario: Filter parent pipelines using main filter
        When the user types "audit" into the name filter in the main filter section
        Then only parent and child pipelines matching "audit" should be displayed

    @18402_pipeline_UI_modification
    Scenario: Filter pipelines using description and port number
        When the user filters by description "ingest" and port "514"
        Then only parent and child pipelines matching these filters should be shown

    @18402_pipeline_UI_modification
    Scenario: Generic search only child pipelines using the child filter
        When the user enters "syslog" in the child pipeline filter
        Then only child pipelines with names containing "syslog" should be displayed

    @18402_pipeline_UI_modification
    Scenario: Show all child pipelines after clicking "Show All child"
        When the user clicks the "Show All Child Pipelines" button
        Then all child pipelines should be displayed regardless of parent association

    @18402_pipeline_UI_modification
    Scenario: Display only children of selected parent pipeline
        Given a parent pipeline named "AuditLogProcessor"
        When the user clicks on "AuditLogProcessor" in the sidebar
        Then only child pipelines associated with "AuditLogProcessor" should be displayed

    @18402_pipeline_UI_modification
    Scenario: generic Search with invalid name should return no child pipelines
        When the user searches with the name "invalid-child-name"
        Then no child pipelines should be displayed

    @18402_pipeline_UI_modification
    Scenario: generic Search with index name should return no child pipelines
        When the user searches with the name "index name"
        Then no child pipelines should be displayed


    @18402_pipeline_UI_modification
    Scenario: Sorting of pipelines based on latest parent pipeline added
        When the parent pipelines are displayed
        Then they should be sorted in descending order of creation time

    @18402_pipeline_UI_modification
    Scenario: Sorting of pipelines based on latest child pipeline added
        When the child pipelines are displayed
        Then they should be sorted in descending order of creation time

    @18402_pipeline_UI_modification
    Scenario: Newly added child pipeline is not shown when a parent is selected
        Given a parent pipeline is selected
        And a new child pipeline "RealtimeMetrics" is added
        Then "RealtimeMetrics" should not be shown under the currently selected parent unless it's explicitly associated

    @18402_pipeline_UI_modification
    Scenario: Display attributes of pipelines in the UI
        Then each pipeline card should show name, description, status, type, port number, and upload status

    @18402_pipeline_UI_modification
    Scenario: Add button is shown only if user has add permission
        Given the user has "add" permission
        Then the "Add" button should be visible

    @18402_pipeline_UI_modification
    Scenario: Edit and Delete buttons respect user permissions
        Given the user does not have "edit" or "delete" permission
        Then "Edit" and "Delete" buttons should be disabled or hidden

    @18402_pipeline_UI_modification
    Scenario: Upload button is disabled without upload permission
        Given the user lacks upload permission
        Then the "Upload" button should be disabled or not visible

    @18402_pipeline_UI_modification
    Scenario: Enable/disable status toggle based on edit permission
        Given the user has edit permission
        Then the status toggle should be enabled
        But if not, it should be read-only

    @18402_pipeline_UI_modification
    Scenario: A child pipeline associated with multiple parents is shown for each parent
        Given a child pipeline "ParserX" is associated with parent "A" and "B"
        When the user selects parent "A"
        Then "ParserX" should appear in the list
        When the user selects parent "B"
        Then "ParserX" should also appear in that list

    @18402_pipeline_UI_modification
    Scenario: On initial page load, all child pipelines are displayed
        When the page is loaded
        Then all child pipelines should be shown by default

    @18402_pipeline_UI_modification
    Scenario: Filter by type and status
        When the user filters pipelines by type "tcp" and status "Disabled"
        Then only the matching parent and child pipelines should be shown

    @18402_pipeline_UI_modification
    Scenario: Filtering with only port number
        When the user filters with port number "10514"
        Then only pipelines using port 10514 should be visible

    @18402_pipeline_UI_modification
    Scenario: Apply multiple filters simultaneously
        When the user filters by name "log", type "ETL", and port "514"
        Then all matching pipelines should be listed in both parent and child sections

    @18402_pipeline_UI_modification
    Scenario: Removing all filters shows complete data
        Given filters are applied
        When the user clears all filters
        Then the page should show all parent and child pipelines

    @18402_pipeline_UI_modification
    Scenario: apply matching filter for both parent and child pipeline
        Given filters are applied
        When the user filters by name "log"
        Then the page should show all parent and child pipelines
        And click on parent pipeline
        Then parent associated pipeline should be displayed


