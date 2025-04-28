Feature: 15114 Dashboard Index and multi-index data should be visible based on organization, customer, and entity levels

Background:
    Given the user is logged in
    And the MSP feature flag is enabled

@15114
Scenario: Verify Dashboard Index and multi-index visibility at the organization level
    Given the user is at the organization level
    When the user creates an index (pipeline) at the organization level
    And receives logs to that pipeline
    And navigates to the "Dashboard" page
    And choose the "Log Management" dashboard to add Widgets
    Then the Dashboard index and multi-index data should be visible based on the organization level user

@15114
Scenario: Verify Dashboard Index and multi-index visibility at the customer level
    Given the user is at the customer level
    When the user creates an index (pipeline) at the customer level
    And receives logs to that pipeline
    And navigates to the "Dashboard" page
    And choose the "Log Management" dashboard to add Widgets
    Then the Dashboard index and multi-index data should be visible based on the customer level user and organization level user

@15114
Scenario: Verify Dashboard Index and multi-index visibility at the entity level
    Given the user is at the entity level
    When the user creates an index (pipeline) at the entity level
    And receives logs to that pipeline
    And navigates to the "Dashboard" page
    And choose the "Log Management" dashboard to add Widgets
    Then the Dashboard index and multi-index data should be visible based on the entity level user, customer level user, and organization level user

@15114
Scenario: Verify Organization user can view all Dashboard profiles
    Given the user is logged in as an MSP Organization user
    When the user accesses the "Dashboard Configuration" page
    Then the user should be able to view all Dashboard profiles
    And have visibility to both customer and entity profiles
    Then the organization user can see all profiles across all levels (organization, customer, and entity)

@15114
Scenario: Verify Customer user can view assigned and associated entity Dashboard profiles
    Given the user is logged in as an MSP Customer user
    When the user accesses the "Dashboard Configuration" page
    Then the user should be able to view their assigned Dashboard profiles and entity Dashboard profiles

@15114
Scenario: Verify Organization user sees all Dashboard profiles including customer and entity
    Given the user is logged in as an MSP Organization user
    When the user navigates to the customer-level view
    Then the user should see all Dashboard profiles assigned to customers
    Then the organization user should be able to view Dashboard profiles across all levels (organization, customer, and entity)

@15114
Scenario: Verify Customer user can only see their assigned Dashboard profiles and their entity's Dashboard profiles
    Given the user is logged in as an MSP Customer user
    When the user navigates to the customer-level view
    Then the user should see their own assigned Dashboard profiles
    Then the customer user will only see their assigned Dashboard profiles

@15114
Scenario: Verify Organization user cannot access Dashboard profiles assigned to other customers or entities
    Given the user is logged in as an MSP Organization user
    When the user tries to access a Dashboard profile assigned to another customer or entity
    Then the system should not allow the user to see Dashboard profiles that do not belong to them
    Then the organization user should not be able to access Dashboard profiles assigned to different customers or entities unless they are linked to them

@15114
Scenario: Verify Customer user cannot access Dashboard profiles assigned to other customers or entities
    Given the user is logged in as an MSP Customer user
    When the user tries to access a Dashboard profile assigned to another customer or entity
    Then the system should restrict access to Dashboard profiles that do not belong to them or their entity
    Then the customer user cannot view Dashboard profiles outside their assigned or entity's profiles

@15114
Scenario: Verify Entity user cannot access Dashboard profiles assigned to other entities or customers
    Given the user is logged in as an MSP Entity user
    When the user tries to access a Dashboard profile assigned to another customer
    Then the system should prevent access to Dashboard profiles not assigned to them
    Then the entity user should only be able to view their own assigned Dashboard profile and not any others




@15114
Scenario: Verify Organization user sees Dashboard profiles across all levels (organization, customer, entity)
    Given the user is logged in as an MSP Organization user
    When the user accesses the "Dashboard Configuration" page
    Then the user should see all Dashboard profiles across all levels (organization, customer, entity)
    Then The organization user can view all Dashboard profiles at every level (organization, customer, entity)

@15114
Scenario: Verify Customer 1 cannot see Customer 2's Dashboard profiles
    Given Customer 1 has entities Entity 1 and Entity 2
    And Customer 2 has entities Entity 1 and Entity 2
    When the Customer 1 user accesses the "Dashboard Configuration" page
    Then Customer 1 should not see any Dashboard profiles belonging to Customer 2
    Then Customer 1 can only view profiles associated with **Customer 1** and their respective entities, not Customer 2’s profiles

@15114
Scenario: Verify Customer 2 cannot see Customer 1's Dashboard profiles
    Given Customer 1 has entities Entity 1 and Entity 2
    And Customer 2 has entities Entity 1 and Entity 2
    When the Customer 2 user accesses the "Dashboard Configuration" page
    Then Customer 2 should not see any Dashboard profiles belonging to Customer 1
    Then Customer 2 can only view profiles associated with **Customer 2** and their respective entities, not Customer 1’s profiles

@15114
Scenario: Verify Entity 1 under Customer 1 cannot see profiles of Entity 1 under Customer 2
    Given Customer 1 has entities Entity 1 and Entity 2
    And Customer 2 has entities Entity 1 and Entity 2
    When the Entity 1 user from Customer 1 accesses the "Dashboard Configuration" page
    Then Entity 1 from Customer 1 should not see any profiles assigned to Entity 1 under Customer 2
    Then Entity 1 from **Customer 1** should not have visibility into **Customer 2**’s entities, even if their entity names are the same

@15114
Scenario: Verify Entity 2 under Customer 2 cannot see profiles of Entity 1 under Customer 2
    Given Customer 2 has entities Entity 1 and Entity 2
    When the Entity 2 user from Customer 2 accesses the "Dashboard Configuration" page
    Then Entity 2 from Customer 2 should not see any profiles assigned to Entity 1 under Customer 2
    Then Entity 2 from **Customer 2** should not be able to see **Entity 1’s** Dashboard profile under **Customer 2**, even though they belong to the same customer

@15114
Scenario: Verify Entity 1 under Customer 1 cannot see profiles of Entity 1 under Customer 2
    Given Customer 1 has entities Entity 1 and Entity 2
    And Customer 2 has entities Entity 1 and Entity 2
    When the Entity 1 user from Customer 1 accesses the "Dashboard Configuration" page
    Then Entity 1 from Customer 1 should not see profiles of **Entity 1** from **Customer 2**
    Then Entity 1 from **Customer 1** should not be able to view **Entity 1's** profile from **Customer 2**

@15114
Scenario: Verify Customer 1 and Customer 2 users cannot access each other's Dashboard profiles
    Given Customer 1 has entities Entity 1 and Entity 2
    And Customer 2 has entities Entity 1 and Entity 2
    When the Customer 1 user tries to view the Dashboard profiles of Customer 2
    Then Customer 1 should not have access to Customer 2’s Dashboard profiles
    Then Customers 1 and 2 cannot view each other’s profiles, regardless of entity assignments

@15114
Scenario: verify the Dashboard created in one organization level is not visible in another organization level
    Given the user is at the organization level
    When the user creates a Dashboard at the organization level
    And another user from another organization level is logged in
    And the user tries to access the "Dashboard Configuration" page
    Then the user should not see any Dashboard profiles belonging to another organization level
    Then the user can only view profiles associated with their own organization level and their respective entities, not other organization levels’ profiles.


@15114
Scenario: Verify that the Dashboard edited in on customer level
    Given the user is at the Organization level
    When the user edits a Dashboard at wich is assigned to customer level
    Then edited Dashboard should be visible in the customer level

@15114
Scenario: Verify that the Dashboard export in on customer level
    Given the user is at the Organization level
    When the user exports a Dashboard at wich is assigned to customer level
    Then exported Dashboard should be be have data in the customer level

@15114
Scenario: Verify that the Dashboard clone in on customer level
    Given the user is at the Organization level
    When the user clones a Dashboard at wich is assigned to customer level
    Then cloned Dashboard should be be have data in the customer level




