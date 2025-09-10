Feature: 22224_AI_Audit_for_Log_Management_NQL
Background: 
        When user is logged in and navigate to Log search page


    @22224_AI_Audit_for_Log_Management_NQL
    Scenario: Feature flag LOG_MANAGEMENT_NQL is enabled
        When Feature flag LOG_MANAGEMENT_NQL is enabled
        Then the Nql toggle for Nql search in log search page should be visible

    @22224_AI_Audit_for_Log_Management_NQL
    Scenario: Feature flag LOG_MANAGEMENT_NQL is Disabled
        When Feature flag LOG_MANAGEMENT_NQL is Disabled
        Then Then Nql toggle for Nql search in log search page should not be visible 

    @22224_AI_Audit_for_Log_Management_NQL
    Scenario: Audit for NQL search
        When user had search for NQL in Log search
        And After Log filteration
        And user navigate to AI Audit
        Then audit for NQL search should there with proper information

    @22224_AI_Audit_for_Log_Management_NQL
    Scenario: AI Audit should not duplicated
        When user had search for NQL in Log search
        And After Log filteration
        And user navigate to AI Audit
        Then audit for NQL search should there with proper information
        And the Audit for that Should not duplicated