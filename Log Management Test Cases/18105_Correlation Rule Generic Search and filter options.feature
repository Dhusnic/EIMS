Feature: Rules Page - Filters and Generic Search

    As a user
    I want to filter and search rules in both Grid and Card views
    So that I can find relevant rules based on view and toggle state

    Background:
        Given I am logged into the application
        And I navigate to the Rules page

    ################################################################
    #                        GRID VIEW - LOG RULES                 #
    ################################################################

    @18105
    Scenario Outline: Grid View - Log Rules - Filter by Rule Type
        Given I am in Grid view
        And I toggle to "Log Rules"
        When I apply filter on "Rule Type" with value "<RuleType>"
        Then only Log Rules with rule type "<RuleType>" should be displayed

        Examples:
            | RuleType                   |
            | Event Based Correlation    |
            | Topology Based Correlation |
            | Custom Query               |
            | Threshold Rule             |

    @18105
    Scenario Outline: Grid View - Log Rules - Filter by Status
        Given I am in Grid view
        And I toggle to "Log Rules"
        When I apply filter on "Status" with value "<Status>"
        Then only Log Rules with status "<Status>" should be displayed

        Examples:
            | Status   |
            | Enabled  |
            | Disabled |

    @18105
    Scenario Outline: Grid View - Log Rules - Filter by Default Flag
        Given I am in Grid view
        And I toggle to "Log Rules"
        When I apply filter on "Default" with value "<Is Default>"
        Then only Log Rules with default flag "<Is Default>" should be displayed

        Examples:
            | Is Default |
            | Yes        |
            | No         |

    @18105
    Scenario: Grid View - Log Rules - Generic Search
        Given I am in Grid view
        And I toggle to "Log Rules"
        When I enter "Login Attempt" in the search bar
        Then only Log Rules containing "Login Attempt" in name or description should be displayed

    ################################################################
    #                GRID VIEW - CORRELATION RULES                 #
    ################################################################

    @18105
    Scenario Outline: Grid View - Correlation Rules - Filter by Rule Type
        Given I am in Grid view
        And I toggle to "Correlation Rules"
        When I apply filter on "Rule Type" with value "<RuleType>"
        Then only Correlation Rules with rule type "<RuleType>" should be displayed

        Examples:
            | RuleType                   |
            | Event Based Correlation    |
            | Topology Based Correlation |
            | Custom Query               |
            | Threshold Rule             |

    @18105
    Scenario Outline: Grid View - Correlation Rules - Filter by Status
        Given I am in Grid view
        And I toggle to "Correlation Rules"
        When I apply filter on "Status" with value "<Status>"
        Then only Correlation Rules with status "<Status>" should be displayed

        Examples:
            | Status   |
            | Enabled  |
            | Disabled |

    @18105
    Scenario Outline: Grid View - Correlation Rules - Filter by Default Flag
        Given I am in Grid view
        And I toggle to "Correlation Rules"
        When I apply filter on "Default" with value "<Is Default>"
        Then only Correlation Rules with default flag "<Is Default>" should be displayed

        Examples:
            | Is Default |
            | Yes        |
            | No         |

    @18105
    Scenario: Grid View - Correlation Rules - Generic Search
        Given I am in Grid view
        And I toggle to "Correlation Rules"
        When I enter "Port Scan" in the search bar
        Then only Correlation Rules containing "Port Scan" in name or description should be displayed

    ################################################################
    #                        CARD VIEW (COMBINED)                  #
    ################################################################

    @18105
    Scenario Outline: Card View - Filter by Rule Type (All Rules)
        Given I switch to Card view
        When I apply filter on "Rule Type" with value "<RuleType>"
        Then all rules (Log and Correlation) with rule type "<RuleType>" should be displayed

        Examples:
            | RuleType                   |
            | Event Based Correlation    |
            | Topology Based Correlation |
            | Custom Query               |
            | Threshold Rule             |

    @18105
    Scenario Outline: Card View - Filter by Status (All Rules)
        Given I switch to Card view
        When I apply filter on "Status" with value "<Status>"
        Then all rules (Log and Correlation) with status "<Status>" should be displayed

        Examples:
            | Status   |
            | Enabled  |
            | Disabled |

    @18105
    Scenario Outline: Card View - Filter by Default Flag (All Rules)
        Given I switch to Card view
        When I apply filter on "Default" with value "<Is Default>"
        Then all rules (Log and Correlation) with default flag "<Is Default>" should be displayed

        Examples:
            | Is Default |
            | Yes        |
            | No         |

    @18105
    Scenario: Card View - Generic Search
        Given I switch to Card view
        When I enter "System Crash" in the search bar
        Then all rules (Log and Correlation) containing "System Crash" in name or description should be displayed

    @18105
    Scenario Outline: Grid View - Log Rules - Filter by Name
        Given I am in Grid view
        And I toggle to "Log Rules"
        When I apply filter on "Name" with value "<Name>"
        Then only Log Rules with name containing "<Name>" should be displayed

        Examples:
            | Name      |
            | Failed Login  |
            | Suspicious IP |
            | Memory Usage  |

    @18105
    Scenario Outline: Grid View - Log Rules - Filter by Description
        Given I am in Grid view
        And I toggle to "Log Rules"
        When I apply filter on "Description" with value "<Description>"
        Then only Log Rules with description containing "<Description>" should be displayed

        Examples:
            | Description         |
            | login failed            |
            | unauthorized access     |
            | high memory utilization |

    @18105
    Scenario Outline: Grid View - Correlation Rules - Filter by Name
        Given I am in Grid view
        And I toggle to "Correlation Rules"
        When I apply filter on "Name" with value "<Name>"
        Then only Correlation Rules with name containing "<Name>" should be displayed

        Examples:
            | Name           |
            | DNS Amplification  |
            | Data Exfiltration  |
            | Brute Force Attack |

    @18105
    Scenario Outline: Grid View - Correlation Rules - Filter by Description
        Given I am in Grid view
        And I toggle to "Correlation Rules"
        When I apply filter on "Description" with value "<Description>"
        Then only Correlation Rules with description containing "<Description>" should be displayed

        Examples:
            | Description          |
            | DNS attack pattern       |
            | suspicious file movement |
            | repeated login attempts  |

    @18105
    Scenario Outline: Card View - Filter by Name (All Rules)
        Given I switch to Card view
        When I apply filter on "Name" with value "<Name>"
        Then all rules (Log and Correlation) with name containing "<Name>" should be displayed

        Examples:
            | Name          |
            | System Crash      |
            | Port Scan         |
            | Unauthorized Host |

    @18105
    Scenario Outline: Card View - Filter by Description (All Rules)
        Given I switch to Card view
        When I apply filter on "Description" with value "<Description>"
        Then all rules (Log and Correlation) with description containing "<Description>" should be displayed

        Examples:
            | Description             |
            | system reboot detected      |
            | malicious activity detected |
            | port scan signature found   |
