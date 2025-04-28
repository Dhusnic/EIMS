Feature: Log Search Logs Based MSP and Different Organizations
    Background:
        Given the user is logged in
        And the user has navigated to the "Log Search" page

@16372
Scenario: Verify Customer 1 cannot see logs from pipelines assigned to Customer 2
    Given Customer 1 has entities Entity 1 and Entity 2
    And Customer 2 has entities Entity 1 and Entity 2
    When the Customer 1 user accesses the "Log Search" page
    Then Customer 1 should not see any logs generated through pipelines assigned to Customer 2
    Then Customer 1 can only view logs from pipelines assigned to **Customer 1** and its entities.

@16372
Scenario: Verify Customer 2 cannot see logs from pipelines assigned to Customer 1
    Given Customer 1 has entities Entity 1 and Entity 2
    And Customer 2 has entities Entity 1 and Entity 2
    When the Customer 2 user accesses the "Log Search" page
    Then Customer 2 should not see any logs generated through pipelines assigned to Customer 1
    Then Customer 2 can only view logs from pipelines assigned to **Customer 2** and its entities.

@16372
Scenario: Verify Entity 1 under Customer 1 cannot see logs from pipelines assigned to Entity 2
    Given Customer 1 has entities Entity 1 and Entity 2
    When the Entity 1 user accesses the "Log Search" page
    Then Entity 1 should not see logs generated through pipelines assigned to Entity 2
    Then Entity 1 can only view logs from pipelines assigned to **Entity 1**, not **Entity 2**, even within the same customer.

@16372
Scenario: Verify Entity 2 under Customer 1 cannot see logs from pipelines assigned to Entity 1
    Given Customer 1 has entities Entity 1 and Entity 2
    When the Entity 2 user accesses the "Log Search" page
    Then Entity 2 should not see logs generated through pipelines assigned to Entity 1
    Then Entity 2 can only view logs from pipelines assigned to **Entity 2**, not **Entity 1**, even within the same customer.

@16372
Scenario: Verify Entity 1 under Customer 1 cannot see logs from pipelines assigned to Entity 1 under Customer 2
    Given Customer 1 has entities Entity 1 and Entity 2
    And Customer 2 has entities Entity 1 and Entity 2
    When the Entity 1 user from Customer 1 accesses the "Log Search" page
    Then Entity 1 from Customer 1 should not see any logs generated through pipelines assigned to Entity 1 under Customer 2
    Then Entity 1 from **Customer 1** should not have visibility into logs from pipelines assigned to **Customer 2**, even if the entity names are the same.

@16372
Scenario: Verify Entity 2 under Customer 2 cannot see logs from pipelines assigned to Entity 1 under Customer 2
    Given Customer 2 has entities Entity 1 and Entity 2
    When the Entity 2 user from Customer 2 accesses the "Log Search" page
    Then Entity 2 from Customer 2 should not see logs generated through pipelines assigned to Entity 1
    Then Entity 2 from **Customer 2** can only view logs from pipelines assigned to **Entity 2**, not **Entity 1**.

@16372
Scenario: Verify Entity 1 under Customer 1 cannot see logs from pipelines assigned to Entity 1 under Customer 2
    Given Customer 1 has entities Entity 1 and Entity 2
    And Customer 2 has entities Entity 1 and Entity 2
    When the Entity 1 user from Customer 1 accesses the "Log Search" page
    Then Entity 1 from Customer 1 should not see logs generated through pipelines assigned to **Entity 1** from **Customer 2**
    Then Entity 1 from **Customer 1** should not have visibility into logs from pipelines under **Customer 2**.

@16372
Scenario: Verify Customer 1 and Customer 2 users cannot access logs from pipelines assigned to each other
    Given Customer 1 has entities Entity 1 and Entity 2
    And Customer 2 has entities Entity 1 and Entity 2
    When the Customer 1 user tries to view logs from pipelines assigned to Customer 2
    Then Customer 1 should not have access to those logs
    Then Customers 1 and 2 should only see logs generated through pipelines assigned to themselves and their entities.

@16372
Scenario: Verify Entity 2 under Customer 2 cannot access logs from pipelines assigned to Entity 1 under Customer 2
    Given Customer 2 has entities Entity 1 and Entity 2
    When the Entity 2 user from Customer 2 tries to view logs from pipelines assigned to Entity 1
    Then Entity 2 should not have access to those logs
    Then Entity 2 from **Customer 2** should only have visibility into logs from pipelines assigned to **Entity 2**.

@16372
Scenario: Verify Entity 1 under Customer 2 cannot see logs from pipelines assigned to Entity 2 under Customer 1
    Given Customer 1 has entities Entity 1 and Entity 2
    And Customer 2 has entities Entity 1 and Entity 2
    When the Entity 1 user from Customer 2 accesses the "Log Search" page
    Then Entity 1 from Customer 2 should not see logs from pipelines assigned to Entity 2 under Customer 1
    Then Entity 1 from **Customer 2** should only see logs from pipelines assigned to **Customer 2**.

@16372
Scenario: Verify Organization A cannot see logs from pipelines assigned to Organization B
    Given Organization A and Organization B each have their own customers and entities
    When the Organization A user accesses the "Log Search" page
    Then Organization A should not see any logs generated through pipelines assigned to Organization B
    Then Organization A can only view logs from pipelines assigned to **Organization A** and its respective customers and entities.

@16372
Scenario: Verify Organization B cannot see logs from pipelines assigned to Organization A
    Given Organization A and Organization B each have their own customers and entities
    When the Organization B user accesses the "Log Search" page
    Then Organization B should not see any logs generated through pipelines assigned to Organization A
    Then Organization B can only view logs from pipelines assigned to **Organization B** and its respective customers and entities.

@16372
Scenario: Verify Organization A cannot access logs generated through pipelines assigned to a customer under Organization B
    Given Organization A has Customer 1
    And Organization B has Customer 2
    When a user from Organization A accesses the "Log Search" page
    Then they should not see logs from pipelines assigned to Customer 2
    Then users from **Organization A** should only see logs from pipelines assigned to its own customers and entities.

@16372
Scenario: Verify Organization B cannot access logs generated through pipelines assigned to a customer under Organization A
    Given Organization A has Customer 1
    And Organization B has Customer 2
    When a user from Organization B accesses the "Log Search" page
    Then they should not see logs from pipelines assigned to Customer 1
    Then users from **Organization B** should only see logs from pipelines assigned to its own customers and entities.

@16372
Scenario: Verify Organization A cannot access logs from pipelines assigned to an entity under Organization B
    Given Organization A has Entity A1
    And Organization B has Entity B1
    When the Organization A user accesses the "Log Search" page
    Then they should not see logs generated through pipelines assigned to Entity B1
    Then **Organization A** should not have access to logs from pipelines assigned to **Organization B**’s entities.

@16372
Scenario: Verify logs visibility is isolated between organizations even if customer/entity names match
    Given Organization A and Organization B both have a Customer 1 and Entity 1
    When a user from Organization A accesses the "Log Search" page
    Then they should not see logs generated through pipelines assigned to Customer 1 or Entity 1 of Organization B
    Then even if names match, **Organization A** cannot see logs generated by **Organization B** pipelines.



@16372
Scenario: Verify the Customer 1 user can see logs for assets assigned to Customer 1 and its entities
    Given Customer 1 has Entity 1 and Entity 2
    And assets A1, A2 are assigned to Entity 1
    And assets A3, A4 are assigned to Entity 2
    And assets A5, A6 are assigned directly to Customer 1 (not to any entity)
    When the Customer 1 user accesses the "Log Search" page
    Then they should see logs generated through pipelines assigned to assets A1, A2, A3, A4, A5, and A6
    And they should not see logs generated through assets assigned to other customers or entities outside Customer 1.


@16372
Scenario: Verify the Entity 1 user can only see logs for assets assigned specifically to Entity 1
    Given Customer 1 has Entity 1 and Entity 2
    And assets A1, A2 are assigned to Entity 1
    And assets A3, A4 are assigned to Entity 2
    When the Entity 1 user accesses the "Log Search" page
    Then they should see logs generated through pipelines assigned to A1 and A2 only
    And they should not see logs generated through assets A3, A4 or any assets not assigned to Entity 1.


@16372
Scenario: Verify the Organization-level user (non-admin role) can see logs from all assets under all customers and entities
    Given Organization A has Customer 1 and Customer 2
    And Customer 1 has entities E1, E2; Customer 2 has entities E3, E4
    And assets are assigned to each customer and entity
    When an Organization A user with a non-admin role accesses the "Log Search" page
    Then they should be able to view logs from pipelines assigned to assets across all customers and entities within Organization A
    And should not see logs from pipelines assigned to any asset outside Organization A.



@16372
Scenario: Verify the Organization Admin can see logs from all assets under all customers and entities
    Given Organization A has multiple customers and entities
    And each customer/entity has assets with pipelines generating logs
    When an Organization A Admin accesses the "Log Search" page
    Then they should be able to view logs from pipelines assigned to all assets across the organization — including customer and entity levels
    And they should have full visibility across all levels within Organization A.



@16372
Scenario: Verify assets not mapped to any customer are visible in logs for Organization-level users
    Given Organization A has assets A1 and A2 not assigned to any customer or entity
    And pipelines assigned to A1 and A2 are generating logs
    When an Organization-level user (Admin or Non-Admin) accesses the "Log Search" page
    Then they should be able to see logs generated through assets A1 and A2
    And these logs should be visible only to Organization-level users, not to any customer/entity users.



@16372
Scenario: Verify all customer/entity users can see logs from multi-index profiles assigned to them
    Given a multi-index pipeline profile is created and assigned to multiple customers/entities
    And logs are generated through this profile for assets under Customer 1/Entity 1 and Customer 2/Entity 2
    When any user under these customers/entities accesses the "Log Search" page
    Then they should see logs generated through pipelines using this multi-index profile
    And only logs relevant to their own assigned assets and profile access should be visible.

@16372
Scenario: Verify Customer 1 cannot see logs from Customer 2's multi-index profile
    Given Customer 1 and Customer 2 have their own multi-index profiles assigned to different sets of assets
    And logs are being generated only through pipelines assigned to Customer 2's profile
    When Customer 1 user accesses the "Log Search" page
    Then they should not see any logs generated from Customer 2's pipelines
    And Customer 1 users should only see data from their own assigned multi-index profiles.


@16372
Scenario: Verify the Global Filter should filter data based on selected Customer/Entity
    Given the user has access to Organization A with multiple customers and entities
    And the Global Filter dropdown allows selecting Customer 1 or Entity 1
    When the user selects "Customer 1" from the Global Filter
    Then only logs, assets, and pipeline profiles related to **Customer 1** should be visible
    When the user then selects "Entity 1" under Customer 1
    Then only data (logs, assets, profiles) specific to **Entity 1** should be shown
    And no data from other customers or entities should be included in the filtered results.



@16372
Scenario: Verify the system honors license limitations for customers and entities
    Given Customer 1 has a license to manage up to 10 assets
    And currently 10 assets are assigned with active pipeline logs
    When a new asset is attempted to be onboarded under Customer 1
    Then the system should block onboarding due to license cap
    And an appropriate error or alert should be shown
    And no additional logs should be generated for unlicensed assets
    When a license is upgraded
    Then onboarding and log generation should resume accordingly.



@16372
Scenario: Verify access permissions control visibility and actions on log data
    Given an Organization has users with roles: Org Admin, Customer Admin, Entity Viewer
    And each role has defined permissions on assets and logs
    When an Entity Viewer logs in and accesses the "Log Search" page
    Then they should only have view access to logs related to their entity
    And should not see action buttons like Delete, Edit, or Upload
    When a Customer Admin accesses the same page
    Then they can view logs from all their entities and customers and perform limited actions
    When an Org Admin accesses the page
    Then they have full visibility and all action controls enabled across the organization
    And any permission mismatch should trigger access control errors or be restricted by UI.

