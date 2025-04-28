Feature: 16144 Asset Addition Due to Logs Based on MSP

Background:
    Given the user is logged in
    And the user has navigated to the "Pipeline Configuration" page
    And user create the pipeline configuration associated with MSP
    And user uploads the pipeline configuration successfully
    And user starts to get the logs for the pipeline configuration from different IP's

@16144
Scenario: Verify Asset Addition Due to Logs Based on Customer
    Given the Asset is not present in the "IT Asset" page
    When the user navigates to the "IT Asset" page
    Then the Asset should be added to the "IT Asset" page based on the logs IPs received
    And the pipeline configuration is associated with customer
    Then The Asset should be added associated with the same customer name as the pipeline configuration

@16144
Scenario: Verify Asset Addition Due to Logs Based on Entity
    Given the Asset is not present in the "IT Asset" page
    When the user navigates to the "IT Asset" page
    Then the Asset should be added to the "IT Asset" page based on the logs IPs received
    And the pipeline configuration is associated with customer_entity
    Then The Asset should be added associated with the same customer_entity and customer as the pipeline configuration

@16144
Scenario: Verify Asset Addition Due to Logs Based on MSP
    Given the Asset is present in the "IT Asset" page and not mapped to any MSP
    When the user navigates to the "IT Asset" page
    Then the New Asset should be added to the "IT Asset" page based on the logs received from different IP's
    And the pipeline configuration is associated with customer
    Then The Asset should be added associated with the same customer as the pipeline configuration

@16144
Scenario: Verify Asset Addition Due to Logs Based on Customer and Entity
    Given the Asset is present in the "IT Asset" page and not mapped to any entity
    When the user navigates to the "IT Asset" page
    Then the New Asset should be added to the "IT Asset" page based on the logs received from different IP's
    And the pipeline configuration is associated with customer_entity
    Then The Asset should be added associated with the same customer_entity and customer as the pipeline configuration
    And The Asset should be added associated with the same customer as the pipeline configuration

@16144
Scenario: Verify Asset Addition in Audit page
    Given the Asset is not present in the "IT Asset" page
    When the user navigates to the "IT Asset" page
    Then the New Asset should be added to the "IT Asset" page based on the logs received from different IP's
    And the pipeline configuration is associated with customer
    Then The Asset should be added associated with the same customer as the pipeline configuration
    And the Asset Addition details should be present in the "Audit" page

@16144
Scenario: Verify Asset customer Change in Audit page
    Given the Asset is present in the "IT Asset" page and not mapped to any MSP
    When the user navigates to the "IT Asset" page
    Then the New Asset should be added to the "IT Asset" page based on the logs received from different IP's
    And the pipeline configuration is associated with customer
    Then The Asset should be added associated with the same customer as the pipeline configuration
    And The Customer change details should be present in the "Audit" page


@16144
Scenario: Verify that log management license count is available before asset addition
    Given the system has log management feature enabled
    Then the license count should be validated before asset is added from logs

@16144
Scenario: Verify that Asset Management license is enabled
    Given the system has asset management feature enabled
    Then the system should allow asset addition from logs

@16144
Scenario: Verify asset visibility within the same customer user
    Given assets are added to a customer
    Then users under the same customer should be able to view the asset

@16144
Scenario: Verify asset visibility between different customers users (Customer A vs. Customer B)
    Given assets are added to Customer A
    Then users under Customer B should not be able to view Customer A's assets

@16144
Scenario: Verify asset visibility between different entities user (Entity A vs. Entity B)
    Given assets are added to Entity A under the same customer
    Then users under Entity B should not be able to view Entity A's assets

@16144
Scenario: Verify customer/entity asset visibility for an organization-level user
    Given an organization-level user is logged in
    Then they should be able to view assets of all customers and entities

@16144
Scenario: Verify behavior when duplicate asset IP exists in a different customer and pipeline profile is unmapped
    Given a duplicate asset IP exists under another customer
    And the pipeline profile is not mapped
    Then the system should not associate or create conflicting assets

@16144
Scenario: Verify the General Audits when Asset added from logs
    Given an asset is added from logs
    Then a general audit entry should be created with below details
    | Module | Customer / Entity Name | Event            | Description                                 | User Name | IP Address | Creation Time |
    | Asset  | customer/entity name   | Add/edit/delete  | Asset created Asset name with details       | User name | IP Address | Creation time |

@16144
Scenario: Verify the General Audits when Asset added from logs with different customer
    Given an asset is added from logs under a different customer
    Then a general audit entry should be created with accurate customer context

@16144
Scenario: Verify the General Audits when Asset added from logs with different customer and entity
    Given an asset is added from logs under a different customer and entity
    Then a general audit entry should capture both customer and entity association@16144
Scenario:   Verify pipeline profile is mapped with Customer 1 while asset exists with Customer 2.
    Given the Asset is  present in the "Customer 2 IT Asset" page
    And the pipeline configuration  is associated with customer1
    And  the logs  IP's received    
    When the user navigates to the "IT Asset" page    
    Then The Asset should be added to customer 1
@16144
Scenario:   Verify pipeline profile is mapped with Customer 1 while asset exists with Customer 1.
    Given the Asset is  present in the "Customer 1 IT Asset" page
    And the pipeline configuration  is associated with customer1
    And  the logs  IP's received    
    When the user navigates to the "IT Asset" page    
    Then The Asset should be added associated with the same customer name 1 as the pipeline configuration
@16144
Scenario:   Verify pipeline profile is mapped with Customer 1 while manual asset exists without any MSP.
    Given the Asset is  present in the organization " IT Asset" page
    And the pipeline configuration  is associated with customer1
    And  the logs  IP's received    
    When the user navigates to the "IT Asset" page    
    Then The Asset should be added associated with the same customer name 1 as the pipeline configuration
@16144
Scenario:   Verify pipeline profile is mapped with Customer 1 while discover asset exists without any MSP.
    Given the Asset is  present in the organization " IT Asset" page
    And the pipeline configuration  is associated with customer1
    And  the logs  IP's received    
    When the user navigates to the "IT Asset" page    
    Then The Asset should be added associated with the same customer name 1 as the pipeline configuration

@16144
Scenario:   Verify pipeline profile is mapped with Customer 1 while asset exists with Customer 2.
    Given the Asset is  present in the "Customer 2 IT Asset" page
    And the pipeline configuration  is associated with customer1
    And  the logs  IP's received    
    When the user navigates to the "IT Asset" page    
    Then The Asset should not be updated
@16144
Scenario:   Verify pipeline profile is mapped with Customer 1 while asset exists with Customer 1.
    Given the Asset is  present in the "Customer 1 IT Asset" page
    And the pipeline configuration  is associated with customer1
    And  the logs  IP's received    
    When the user navigates to the "IT Asset" page    
    Then The Asset should be added associated with the same customer name 1 as the pipeline configuration

@16144
Scenario:   Verify pipeline profile is mapped with Customer 1 while manual asset exists without any MSP.
    Given the Asset is  present in the organization " IT Asset" page
    And the pipeline configuration  is associated with customer1
    And  the logs  IP's received    
    When the user navigates to the "IT Asset" page    
    Then The Asset should be added associated with the same customer name 1 as the pipeline configuration

@16144
Scenario:   Verify pipeline profile is mapped with Customer 1 while discover asset exists without any MSP.
    Given the Asset is  present in the organization " IT Asset" page
    And the pipeline configuration  is associated with customer1
    And  the logs  IP's received    
    When the user navigates to the "IT Asset" page    
    Then The Asset should be added associated with the same customer name 1 as the pipeline configuration

@16144
Scenario:   Verify behavior when duplicate asset IP exists in a different customer and pipeline profile is unmapped.
    Given the Asset is  present in the bith customer " IT Asset" page
    And the pipeline configuration  is associated withouth msp
    And  the logs  IP's received    
    When the user navigates to the "IT Asset" page    
    Then The Asset should not be updated

