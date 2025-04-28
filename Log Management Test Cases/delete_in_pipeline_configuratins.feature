
Feature: Grok Pattern Management in Parent and Child Pipelines with License and User Permissions

  Background:
    Given the user is logged in
    And the user navigates to the "Pipeline Configuration" page

  @11640_deleteing_in_pipeline_configurations
  Scenario: Delete Parent pipeline with Child pipelines without conflict (Server)
    Given the user has a valid "Pipeline Configuration" license
    And the user has a Parent pipeline with associated Child pipelines without any conflict (Child not associated with another Parent)
    When the user deletes the Parent pipeline
    Then the Parent pipeline and its associated Child pipelines should be deleted from the server

  @11640_deleteing_in_pipeline_configurations
  Scenario: Delete Parent pipeline with Child pipelines with conflict (Server)
    Given the user has a valid "Pipeline Configuration" license
    And the user has a Parent pipeline with associated Child pipelines, and some Child pipelines are linked with another Parent (conflict)
    When the user deletes the Parent pipeline
    Then the Parent pipeline should be deleted from the server
    And the Child pipelines without conflict should be deleted from the server
    And the Child pipelines with conflict should remain on the server

  @11640_deleteing_in_pipeline_configurations
  Scenario: Delete Parent pipeline without Child pipelines (Server)
    Given the user has a valid "Pipeline Configuration" license
    And the user has a Parent pipeline without any associated Child pipelines
    When the user deletes the Parent pipeline
    Then the Parent pipeline should be deleted from the server

  @11640_deleteing_in_pipeline_configurations
  Scenario: Attempt to delete a Child pipeline with conflict (Server)
    Given the user has a valid "Pipeline Configuration" license
    And the user has a Child pipeline with a conflict (Child is associated with another Parent pipeline)
    When the user attempts to delete the Child pipeline
    Then the system should display a toaster message "This pipeline cannot be deleted due to conflict with another Parent pipeline"
    And the Child pipeline should not be deleted from the server


  @11640_deleteing_in_pipeline_configurations
  Scenario: Delete Parent pipeline and ensure Child pipelines without conflict are deleted from the server (Server)
    Given the user has a valid "Pipeline Configuration" license
    And the user has a Parent pipeline with Child pipelines without conflict
    When the user deletes the Parent pipeline
    Then the Parent pipeline should be deleted from the server
    And the Child pipelines without conflict should be deleted from the server
    And the Child pipelines with conflict should remain on the server

  @11640_deleteing_in_pipeline_configurations
  Scenario: Delete Parent pipeline and ensure Child pipelines with conflict are retained (Server)
    Given the user has a valid "Pipeline Configuration" license
    And the user has a Parent pipeline with Child pipelines, and some Child pipelines are linked to another Parent pipeline (conflict)
    When the user deletes the Parent pipeline
    Then the Parent pipeline should be deleted from the server
    And the Child pipelines without conflict should be deleted from the server
    And the Child pipelines with conflict should remain on the server

  @11640_deleteing_in_pipeline_configurations
  Scenario: Prevent Parent pipeline deletion if any Child pipeline is linked with conflict (Server)
    Given the user has a valid "Pipeline Configuration" license
    And the user has a Parent pipeline with at least one Child pipeline linked to another Parent (conflict)
    When the user attempts to delete the Parent pipeline
    Then the system should display a toaster message "This Parent pipeline cannot be deleted due to linked Child pipelines with conflict"
    And the Parent pipeline should not be deleted from the server

  @11640_deleteing_in_pipeline_configurations
  Scenario: Prevent deletion of a Parent pipeline if it is linked with Child pipelines with unresolved conflicts (Server)
    Given the user has a valid "Pipeline Configuration" license
    And the user has a Parent pipeline linked to Child pipelines with unresolved conflicts (Child linked with another Parent)
    When the user attempts to delete the Parent pipeline
    Then the system should display a toaster message "This Parent pipeline cannot be deleted due to unresolved Child pipeline conflicts"
    And the Parent pipeline should not be deleted from the server

  @11640_deleteing_in_pipeline_configurations
  Scenario: Delete Child pipeline linked to Parent with conflicts (Server)
    Given the user has a valid "Pipeline Configuration" license
    And the user has a Child pipeline linked to a Parent pipeline with conflict (Child associated with another Parent)
    When the user attempts to delete the Child pipeline
    Then the system should display a toaster message "This Child pipeline cannot be deleted due to conflicts with another Parent pipeline"
    And the Child pipeline should not be deleted from the server

  @11640_deleteing_in_pipeline_configurations
  Scenario: Delete Parent pipeline with Child pipelines without conflict (Database)
    Given the user has a valid "Pipeline Configuration" license
    And the user has a Parent pipeline with associated Child pipelines without any conflict (Child not associated with another Parent)
    When the user deletes the Parent pipeline
    Then the Parent pipeline should be deleted from the database
    And the Child pipelines should remain in the database

  @11640_deleteing_in_pipeline_configurations
  Scenario: Delete Parent pipeline with Child pipelines with conflict (Database)
    Given the user has a valid "Pipeline Configuration" license
    And the user has a Parent pipeline with associated Child pipelines, and some Child pipelines are linked with another Parent (conflict)
    When the user deletes the Parent pipeline
    Then the Parent pipeline should be deleted from the database
    And the Child pipelines without conflict should be deleted from the database
    And the Child pipelines with conflict should remain in the database

  @11640_deleteing_in_pipeline_configurations
  Scenario: Delete Parent pipeline without Child pipelines (Database)
    Given the user has a valid "Pipeline Configuration" license
    And the user has a Parent pipeline without any associated Child pipelines
    When the user deletes the Parent pipeline
    Then the Parent pipeline should be deleted from the database

  @11640_deleteing_in_pipeline_configurations
  Scenario: Delete a Child pipeline without conflict (Database)
    Given the user has a valid "Pipeline Configuration" license
    And the user has a Child pipeline without any conflict (not associated with another Parent)
    When the user deletes the Child pipeline
    Then the Child pipeline should be deleted from the database

  @11640_deleteing_in_pipeline_configurations
  Scenario: Delete Parent pipeline and ensure Child pipelines without conflict are deleted from the database (Database)
    Given the user has a valid "Pipeline Configuration" license
    And the user has a Parent pipeline with Child pipelines without conflict
    When the user deletes the Parent pipeline
    Then the Parent pipeline should be deleted from the database
    And the Child pipelines without conflict should be deleted from the database
    And the Child pipelines with conflict should remain in the database

  @11640_deleteing_in_pipeline_configurations
  Scenario: Delete Parent pipeline and ensure Child pipelines with conflict are retained in the database (Database)
    Given the user has a valid "Pipeline Configuration" license
    And the user has a Parent pipeline with Child pipelines, and some Child pipelines are linked to another Parent pipeline (conflict)
    When the user deletes the Parent pipeline
    Then the Parent pipeline should be deleted from the database
    And the Child pipelines without conflict should be deleted from the database
    And the Child pipelines with conflict should remain in the database

  @11640_deleteing_in_pipeline_configurations
  Scenario: Delete Parent pipeline and ensure no conflict-related Child pipelines are deleted from the database (Database)
    Given the user has a valid "Pipeline Configuration" license 
    And the user has a Parent pipeline with Child pipelines, and some Child pipelines are linked to another Parent pipeline (conflict)
    When the user deletes the Parent pipeline
    Then the Parent pipeline should be deleted from the database
    And the Child pipelines without conflict should be deleted from the database
    And the Child pipelines with conflict should remain in the database