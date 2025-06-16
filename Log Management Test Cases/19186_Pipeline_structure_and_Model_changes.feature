Feature: 19186 Pipeline structure and Model changes
    Background:
        Given I am logged in to the application
        And I am on the "Log Pipeline Configuration" page

    @19186_Pipeline_structure_and_Model_changes
    Scenario: Add a new Parent Pipeline with a Linked Child Pipeline
        Given I am on the "Log Pipeline Configuration" page
        When I click on the "Add Parent Pipeline" button
        And I enter a name for the parent pipeline
        And I select a child pipeline to link to the parent
        And I click on the "Save" button
        Then the parent pipeline should be added with the linked child pipeline

    @19186_Pipeline_structure_and_Model_changes
    Scenario: Remove a Linked Child Pipeline from a Parent Pipeline
        Given I am on the "Log Pipeline Configuration" page
        And I have a parent pipeline with a linked child pipeline
        When I remove the linked child pipeline from the parent pipeline
        And I click on the "Save" button
        Then the parent pipeline should no longer have the linked child pipeline

    @19186_Pipeline_structure_and_Model_changes
    Scenario: Remove all Linked Child Pipelines from a Parent Pipeline
        Given I am on the "Log Pipeline Configuration" page
        And I have a parent pipeline with multiple linked child pipelines
        When I remove all linked child pipelines from the parent pipeline
        And fill the index name field with a valid index name
        And I click on the "Save" button
        Then the parent pipeline should no longer have any linked child pipelines

    @19186_Pipeline_structure_and_Model_changes
    Scenario: Deleted Child pipeline should not be displayed in the option list
        Given I am on the "Log Pipeline Configuration" page
        And I have a parent pipeline with a linked child pipeline
        And choose to link the child pipeline to the parent pipeline
        Then the child pipeline should be displayed in the option list
        And the Deleted child pipeline should not be displayed in the option list

    @19186_Pipeline_structure_and_Model_changes
    Scenario: Filtering of child pipeline should happen based on the search
        Given I am on the "Log Pipeline Configuration" page
        And choosed to add a parent pipeline
        And I choosed to add a child pipeline
        And I enter a name for the child pipeline
        Then  the child pipeline associated with name only display in the option list

    @19186_Pipeline_structure_and_Model_changes
    Scenario: Multiple child pipelines can be added
        Given I am on the "Log Pipeline Configuration" page
        And choosed to add a parent pipeline
        And I choosed to add a child pipeline
        And choose add multiple child pipeline
        And choose to Save the parent pipeline
        Then the child pipeline should be added to the parent pipeline

    @19186_Pipeline_structure_and_Model_changes
    Scenario: Child pipelines should be removed when customer or entity changed
        Given I am on the "Log Pipeline Configuration" page
        And I have a parent pipeline with a linked child pipeline
        And I choose to change the customer or entity for the parent pipeline
        Then all the selected child pipelines should be removed

    @19186_Pipeline_structure_and_Model_changes
    Scenario: Child pipelines link filed in scrollable
        Given I am on the "Log Pipeline Configuration" page
        And I have a parent pipeline with a linked child pipeline
        And I choose more child
        Then the Linked child pipeline field should be scrollable

    @19186_Pipeline_structure_and_Model_changes
    Scenario: Child pipelines should be displayed in multiple pipelines
        Given I am on the "Log Pipeline Configuration" page
        And I have a parent pipeline with a linked child pipeline
        And I choose to add another parent pipeline
        Then the child pipeline should be displayed in both parent pipelines options list

    @19186_Pipeline_structure_and_Model_changes
    Scenario: In  mongo DB it will be updated
        Given I am on the "Log Pipeline Configuration" page
        And I have a parent pipeline with a linked child pipeline
        And I add, remove and edit child pipelines
        Then the child pipeline should be updated in the mongo DB




    

    @19186_Pipeline_structure_and_Model_changes
    Scenario: Add a new Asset custom filter
        Given I am on the "Log Pipeline Configuration" page
        And I choose to add child pipeline
        And I enter all mandotary fields
        And give Asset custom filter
        And I choose to save the child pipeline
        Then the child pipeline should be added successfully

    @19186_Pipeline_structure_and_Model_changes
    Scenario: Add a new Log custom filter
        Given I am on the "Log Pipeline Configuration" page
        And  I choose to add child pipeline
        And I enter all mandotary fields
        And give Log custom filter
        And I choose to save the child pipeline
        Then the child pipeline should be added successfully

    @19186_Pipeline_structure_and_Model_changes
    Scenario: Multiple Add and can be preview
        Given I am on the "Log Pipeline Configuration" page
        And I choose to add child pipeline
        And I enter all mandotary fields
        And give Asset custom Filter
        And I choose to preivew the asset custom filter
        Then the preview grid should be displayed based on the filter

    @19186_Pipeline_structure_and_Model_changes
    Scenario: Tool tip for Preview icon
        Given I am on the "Log Pipeline Configuration" page
        And I choose to add child pipeline
        And I enter all mandotary fields
        And give Asset custom Filter
        And I choose to preivew the asset custom filter
        Then the preview tool tip shoub shown near preview icon

    @19186_Pipeline_structure_and_Model_changes
    Scenario: Able to delete custom filter and able to save pipeline
        Given I am on the "Log Pipeline Configuration" page
        And I choose to edit child pipeline with multiple asset custom filter
        And I enter all mandotary fields
        And I remove some of the asset custom filter
        And save the child pipeline
        Then the child pipeline should be deleted successfully

    @19186_Pipeline_structure_and_Model_changes
    Scenario: Preivew should happen properly and pagination for grid should be correct
        Given I am on the "Log Pipeline Configuration" page
        And I choose to add child pipeline
        And I enter all mandotary fields
        And give Asset custom Filter
        And I choose to preivew the asset custom filter
        Then the preview grid should be displayed based on the filter
        And pagination and sort for the grid should be correct

    @19186_Pipeline_structure_and_Model_changes
    Scenario: Created and able add in parent pipelines
        Given I am on the "Log Pipeline Configuration" page
        And I choose to add child pipeline
        And I enter all mandotary fields
        And give Asset custom Filter
        And I choose to preivew the asset custom filter
        And I choose to save the child pipeline
        And I choose to add parent pipeline
        And Add that  child pipeline to parent pipeline
        Then the child pipeline should be added in parent pipeline

