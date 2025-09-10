Feature: Getting Elasticsearch Query using OpenAI API
    Background:
        Given I am logged in to the application
        And I am on the Log Search page
        And I turned on the NQL toggle UI
        And I have entered a valid NQL query

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Failed SSH login for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Successful SSH login for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "SSH key authentication for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "SSH connection closed for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Invalid SSH user for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "SSH brute force for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "PAM authentication failure for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "PAM session opened for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "PAM session closed for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Failed console login for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Root login for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "User login for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "TTY login for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Multiple failed logins for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Account locked for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "su success for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "su failure for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Failed su for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Sudo command for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Sudo success for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Sudo failure for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Sudo password attempt for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Sudo policy violation for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Root shell access for Linux"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "User logon success for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "User logon failure for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Account lockouts for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Account unlocks for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Password changes for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Logoff for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Session disconnected for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Screen locked for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Screen unlocked for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "RDP logons for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Network logons for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Interactive logons for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Service logons for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Batch logons for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Unlock logons for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Network cleartext logons for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Credential delegation for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Kerberos authentication for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Kerberos service ticket for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Kerberos ticket renewal for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results

    @21440_NQL_Getting_Elasticsearch_Query_using_OpenAI_API
    Scenario: search with NQL query of "Kerberos pre-auth failed for Windows"
        When I click on the enter button
        Then I should see the search results
        And then the search results should contain the expected results
