Feature: 22793 The license control For NQL in Log Management
    Background:
        Given I am logged in as a user with the necessary permissions
        And the license "Log_Management_NQL" is set to default state
        And I have access to the Log Search page

    @22793_The_License_Control_For_NQL_in_Log_Management
    Scenario: License "Log_Management_NQL" is activated
        Given the license "Log_Management_NQL" is enabled
        When I navigate to the Log Search page
        Then the NQL toggle should be visible
        And the NQL toggle should be enabled

    @22793_The_License_Control_For_NQL_in_Log_Management
    Scenario: License "Log_Management_NQL" is disabled
        Given the license "Log_Management_NQL" is disabled
        When I navigate to the Log Search page
        Then the NQL toggle should not be visible
        And the NQL toggle should be disabled

    @22793_The_License_Control_For_NQL_in_Log_Management
    Scenario: Filter should happen once license is enabled
        Given the license "Log_Management_NQL" is enabled
        And I have entered a valid NQL query
        When I click on the enter button
        Then the search results should be filtered based on the NQL query

    @22793_The_License_Control_For_NQL_in_Log_Management
    Scenario: Downgrade license by disabling Log_Management_NQL
        Given the license "Log_Management_NQL" is enabled
        And I have entered a valid NQL query
        When I disable the license "Log_Management_NQL"
        Then the NQL toggle should not be visible
        And the search results should not be filtered based on the NQL query

    @22793_The_License_Control_For_NQL_in_Log_Management
    Scenario: Upgrade license by enabling Log_Management_NQL
        Given the license "Log_Management_NQL" is disabled
        And I have entered a valid NQL query
        When I enable the license "Log_Management_NQL"
        Then the NQL toggle should be visible
        And the search results should be filtered based on the NQL query

    @22793_The_License_Control_For_NQL_in_Log_Management
    Scenario: Log search page visibility based on log search license
        Given the license "Log_Management_NQL" is enabled
        And the log search license is enabled
        When I navigate to the Log Search page
        Then the Log Search page should be visible
        And the NQL toggle should be visible

    @22793_The_License_Control_For_NQL_in_Log_Management
    Scenario: New organization - toggle should not be visible before completing multi-index configurations
        Given a new organization is created
        And the multi-index configurations are not completed
        When I navigate to the Log Search page
        Then the NQL toggle should not be visible

    @22793_The_License_Control_For_NQL_in_Log_Management
    Scenario: In Gen AI Marketplace, The feature dropdown should not be visible
        Given I am in the Gen AI Marketplace and the license "Log_Management_NQL" is disabled
        When I check the feature dropdown
        Then the NQL feature should not be listed in the dropdown

    @22793_The_License_Control_For_NQL_in_Log_Management
    Scenario: In Gen AI Marketplace, The feature dropdown should be visible when the license is enabled
        Given I am in the Gen AI Marketplace and the license "Log_Management_NQL" is enabled
        When I check the feature dropdown
        Then the NQL feature should be listed in the dropdown
        And I should be able to select it from the dropdown