Feature: 20984_NQL_Configuration_UI_implementation_in_Marketplace
    Background:
        Given I am Logged in to the application
        And I am on the Log logSearch page


    @20984_NQL_Configuration_UI_implementation_in_Marketplace
    Scenario: when user is logged in and navigate to  the Log Search page
        Then I should see the NQL toggle UI in the Log Search page in disable state

    @20984_NQL_Configuration_UI_implementation_in_Marketplace
    Scenario: when user is logged in and navigate to  the Log Search page and enable the NQL toggle UI
        When I click on the NQL toggle UI
        Then I should see the NQL toggle UI in the Log Search page in enable state

    @20984_NQL_Configuration_UI_implementation_in_Marketplace
    Scenario: while NQl is enabled , the syntax should be in NQL syntax
        When I click on the NQL toggle UI
        Then I should see the NQL syntax in the Log Search page Search Background

    @20984_NQL_Configuration_UI_implementation_in_Marketplace
    Scenario: while NQl is disabled , the syntax should be in KQL syntax
        When I disable the NQL toggle UI
        Then I should see the KQL syntax in the Log Search page Search Background

    @20984_NQL_Configuration_UI_implementation_in_Marketplace
    Scenario: when user is logged in and navigate to  the Log Search page and enable the NQL toggle UI and refresh the page
        When I click on the NQL toggle UI
        And I refresh the page
        Then I should see the NQL toggle UI in the Log Search page in disable state

    @20984_NQL_Configuration_UI_implementation_in_Marketplace
    Scenario: The KQL filter should works when NQL is disabled
        When I disable the NQL toggle UI
        And I enter the kql query in the search box
        Then I should see the search result