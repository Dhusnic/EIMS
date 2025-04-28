Feature: 15113 Report Index and multi index data should be visible based orgainziation
Background:
    Given the user is logged in
    And the user has navigated to the "Report" page
    And the MSP feature flag is enabled
    And the user is at the organization level

@15113
Scenario: Verify Report Index and multi index visibility for log management report at the organization level
    Given the user is at the organization level
    When the user creates a index(pipeline) at the organization level
    And user reciveing logs to that pipeline
    And user navigates to the "Report" page
    And user selects the "Log Management" report
    Then the report index and multi index data should be visible based on the organization 

@15113
Scenario: Verify Report Index and multi index visibility for log management report at the customer level
    Given the user is at the customer level
    When the user creates a index(pipeline) at the customer level
    And user reciveing logs to that pipeline
    And user navigates to the "Report" page
    And user selects the "Log Management" report
    Then the report index and multi index data should be visible based on the customer level pipeline

@15113
Scenario: Verify Report Index and multi index visibility for log management report at the entity level
    Given the user is at the entity level
    When the user creates a index(pipeline) at the entity level
    And user reciveing logs to that pipeline
    And user navigates to the "Report" page
    And user selects the "Log Management" report
    Then the report index and multi index data should be visible based on the entity level pipeline

@15113
Scenario: Verify Organization user can view all report profiles
    Given the user is logged in as an MSP Organization user
    When the user accesses the "Report Configuration" page
    Then the user should be able to view all report profiles
    And the user should have visibility to both customer and entity profiles
    Then The organization user can see all profiles across all levels (organization, customer, and entity).

@15113
Scenario: Verify Customer user can view assigned and associated entity report profiles
    Given the user is logged in as an MSP Customer user
    When the user accesses the "Report Configuration" page
    Then the user should be able to view only their assigned report profile
    Then The customer user can only see their assigned report profile.


@15113
Scenario: Verify Organization user sees all report profiles including customer and entity
    Given the user is logged in as an MSP Organization user
    When the user navigates to the customer-level view
    Then the user should see all report profiles assigned to customers
    Then The organization user should be able to view report profiles across all levels (organization, customer, and entity).

@15113
Scenario: Verify Customer user can only see their assigned report profile and their entity's report profiles
    Given the user is logged in as an MSP Customer user
    When the user navigates to the customer-level view
    Then the user should see their own assigned report profile
    Then The customer user will only see their assigned report profile.

@15113
Scenario: Verify Organization user cannot access report profiles assigned to other customers or entities
    Given the user is logged in as an MSP Organization user
    When the user tries to access a report profile assigned to another customer or entity
    Then the system should not allow the user to see report profiles that do not belong to them
    Then The organization user should not be able to access report profiles assigned to different customers or entities unless they are linked to them.

@15113
Scenario: Verify Customer user cannot access report profiles assigned to other customers or entities
    Given the user is logged in as an MSP Customer user
    When the user tries to access a report profile assigned to another customer or entity
    Then the system should restrict access to report profiles that do not belong to them or their entity
    Then The customer user cannot view report profiles outside their assigned or entity's profiles.

@15113
Scenario: Verify Entity user cannot access report profiles assigned to other entities or customers
    Given the user is logged in as an MSP Entity user
    When the user tries to access a report profile assigned to another customer
    Then the system should prevent access to report profiles not assigned to them
    Then The entity user should only be able to view their own assigned report profile and not any others.

@15113
Scenario: Verify Organization user sees report profiles across all levels (organization, customer, entity)
    Given the user is logged in as an MSP Organization user
    When the user accesses the "Report Configuration" page
    Then the user should see all report profiles across all levels (organization, customer, entity)
    Then The organization user can view all report profiles at every level (organization, customer, entity).


@15113
Scenario: Verify Customer 1 cannot see Customer 2's report profiles
    Given Customer 1 has entities Entity 1 and Entity 2
    And Customer 2 has entities Entity 1 and Entity 2
    When the Customer 1 user accesses the "Report Configuration" page
    Then Customer 1 should not see any report profiles belonging to Customer 2
    Then Customer 1 can only view profiles associated with **Customer 1** and their respective entities, not Customer 2’s profiles.

@15113
Scenario: Verify Customer 2 cannot see Customer 1's report profiles
    Given Customer 1 has entities Entity 1 and Entity 2
    And Customer 2 has entities Entity 1 and Entity 2
    When the Customer 2 user accesses the "Report Configuration" page
    Then Customer 2 should not see any report profiles belonging to Customer 1
    Then Customer 2 can only view profiles associated with **Customer 2** and their respective entities, not Customer 1’s profiles.

@15113
Scenario: Verify Entity 1 under Customer 1 cannot see profiles of Entity 1 under Customer 2
    Given Customer 1 has entities Entity 1 and Entity 2
    And Customer 2 has entities Entity 1 and Entity 2
    When the Entity 1 user from Customer 1 accesses the "Report Configuration" page
    Then Entity 1 from Customer 1 should not see any profiles assigned to Entity 1 under Customer 2
    Then Entity 1 from **Customer 1** should not have visibility into **Customer 2**’s entities, even if their entity names are the same.

@15113
Scenario: Verify Entity 2 under Customer 2 cannot see profiles of Entity 1 under Customer 2
    Given Customer 2 has entities Entity 1 and Entity 2
    When the Entity 2 user from Customer 2 accesses the "Report Configuration" page
    Then Entity 2 from Customer 2 should not see any profiles assigned to Entity 1 under Customer 2
    Then Entity 2 from **Customer 2** should not be able to see **Entity 1’s** report profile under **Customer 2**, even though they belong to the same customer.

@15113
Scenario: Verify Entity 1 under Customer 1 cannot see profiles of Entity 1 under Customer 2
    Given Customer 1 has entities Entity 1 and Entity 2
    And Customer 2 has entities Entity 1 and Entity 2
    When the Entity 1 user from Customer 1 accesses the "Report Configuration" page
    Then Entity 1 from Customer 1 should not see profiles of **Entity 1** from **Customer 2**
    Then Entity 1 from **Customer 1** should not be able to view **Entity 1's** profile from **Customer 2**.

@15113
Scenario: Verify Customer 1 and Customer 2 users cannot access each other's report profiles
    Given Customer 1 has entities Entity 1 and Entity 2
    And Customer 2 has entities Entity 1 and Entity 2
    When the Customer 1 user tries to view the report profiles of Customer 2
    Then Customer 1 should not have access to Customer 2’s report profiles
    Then Customers 1 and 2 cannot view each other’s profiles, regardless of entity assignments.

@15114
Scenario: Verify that the Report is edited on customer level  
    Given the user is at the Organization level  
    When the user edits a Report which is assigned to customer level
    And a customer level user is logged in
    Then the edited Report should be visible in the customer level  

@15114
Scenario: Verify that the Report is exported on customer level  
    Given the user is at the Organization level  
    When the user exports a Report which is assigned to customer level  
    And a customer level user is logged in
    Then the exported Report should contain data in the customer level  

@15114
Scenario: Verify that the Report is cloned on customer level  
    Given the user is at the Organization level  
    When the user clones a Report which is assigned to customer level  
    And a customer level user is logged in
    Then the cloned Report should contain data in the customer level


@15114
Scenario: Verify that the Report is scheduled on customer level  
    Given the user is at the Organization level
    When the user schedules a Report which is assigned to customer level
    And a customer level user is logged in
    Then the scheduled Report should be visible in the customer level

@15114
Scenario: Verify that the Report is send immediately on customer level
    Given the user is at the Organization level
    When the user sends a Report which is assigned to customer level
    And a customer level user is logged in
    Then the sent Report should be visible in the customer level