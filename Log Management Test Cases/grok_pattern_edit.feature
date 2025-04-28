Feature: Edit a Grok template

  Background:
    Given the user is logged in
    And the user navigates to the "Grok Template Page" page

  @12287_The_check_for_valid_log_config_file_and_editing_grok
  Scenario: Edit a Grok template linked to a Parent pipeline
    Given the user has a valid "Grok Template Management" license
    And the user has a Grok pattern template linked to a Parent pipeline
    When the user edits the Grok pattern template
    And the user saves the changes
    Then the system should display a toaster message "Grok template updated successfully"
    And the system should list the pipelines linked to this template

  @12287_The_check_for_valid_log_config_file_and_editing_grok
  Scenario: Edit a Grok template that is not linked to a Parent pipeline
    Given the user has a valid "Grok Template Management" license
    And the user has a Grok pattern template that is not linked to any Parent pipeline
    When the user edits the Grok pattern template
    And the user saves the changes
    Then the system should display a toaster message "Grok template updated successfully"
    And the template changes should be saved successfully

  @12287_The_check_for_valid_log_config_file_and_editing_grok
  Scenario: Edit a Grok template linked to multiple pipelines (Parent and Child)
    Given the user has a valid "Grok Template Management" license
    And the user has a Grok pattern template linked to multiple pipelines
    When the user edits the Grok pattern template
    And the user saves the changes
    Then the system should display a toaster message "Grok template updated successfully"
    And the system should list the pipelines linked to this template

  @12287_The_check_for_valid_log_config_file_and_editing_grok
  Scenario: Edit a Grok template while another user is editing it
    Given the user has a valid "Grok Template Management" license
    And another user is currently editing the same Grok pattern template
    When the user attempts to edit the Grok pattern template
    Then the system should display a toaster message "This Grok pattern template is being edited by another user"
    And the user should not be able to save changes until the other user finishes editing

  @12287_The_check_for_valid_log_config_file_and_editing_grok
  Scenario: Prevent editing of a Grok template if the user lacks edit permissions
    Given the user has a valid "Grok Template Management" license
    But the user does not have edit permissions for Grok templates
    When the user attempts to edit the Grok pattern template
    Then the system should display a toaster message "You do not have permission to edit Grok pattern templates"
    And the user should not be able to save changes

  @12287_The_check_for_valid_log_config_file_and_editing_grok
  Scenario: Prevent editing of a Grok template if the user lacks a valid Grok Template Management license
    Given the user does not have a valid "Grok Template Management" license
    And the user has a Grok pattern template
    When the user attempts to edit the Grok pattern template
    Then the system should display a toaster message "License required to edit Grok pattern templates"
    And the user should not be able to save changes
