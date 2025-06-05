Feature: 16643 Place the “Add Pipeline” button in the center of the grid page, and display a “Total Asset Count” column
Background: 
    Given I am logged in as a user with the role "Admin"
    When I navigate to the "Pipeline" page

@16643
Scenario: Verify the "Add Pipeline" button is centered on the grid page when no pipelines has been created and user has add permission
    When user navigate to the "Pipeline" page and no pipelines has been created
    And that user has add permission to add a pipeline
    Then user should see the "Add Pipeline" button in the center of the grid page
    And info as "No pipelines had configured"

@16643
Scenario: Verify the "Add Pipeline" is not vissible if user has not have add permission
    When user navigate to the "Pipeline" page and no pipelines has been created
    And that user not have add permission to add a pipeline
    Then user should not see the "Add Pipeline" button in the center of the grid page
    And user should only see the info as "No pipelines had configured"

@16643
Scenario: Verify the "Add Pipeline" button in top right corner when pipelines has been created and user has add permission
    When user navigate to the "Pipeline" page and pipelines has been created
    And that user has add permission to add a pipeline
    Then user should not see the "Add Pipeline" button in the center of the grid page
    And user should not see the info as "No pipelines had configured"
    And user should see the "Add Pipeline" button in top right corner of the grid 

@16643 
Scenario: Verify the "Add Pipeline" button in top right corner when pipelines has been created and user has not have add permission
    When user navigate to the "Pipeline" page and pipelines has been created
    And that user not have add permission to add a pipeline
    Then user should not see the "Add Pipeline" button in the center of the grid page
    And user should not see the info as "No pipelines had configured"
    And user should not see the "Add Pipeline" button in top right corner of the grid

@16643
Scenario: verify the add slider fields 
    When user navigate to the "Pipeline" page and no pipelines has been created
    And that user has add permission to add a pipeline
    Then user should see the "Add Pipeline" button in the center of the grid page
    And user click on the "Add Pipeline" button
    And user should see all proper options and fields to add the pipeline

@16643
Scenario: verify ADD Pipeline Button once after delete the existing profile 
    When user navigate to the "Pipeline" page and pipelines has been created and deleted
    And that user has add permission to add a pipeline
    Then user should see the "Add Pipeline" button in the center of the grid page
    And user add the pipeline 
    And user should not see the "Add Pipeline" button in the center of the grid page
    And user deleted the pipeline 
    And user should see the "Add Pipeline" button in the center of the grid page if pipelines is there to display

@16643
Scenario: verify able to save the profile
    When user navigate to the "Pipeline" page and no pipelines has been created
    And that user has add permission to add a pipeline
    Then user should see the "Add Pipeline" button in the center of the grid page
    And user add the pipeline with all mandatory fields details
    And user should able save the pipeline