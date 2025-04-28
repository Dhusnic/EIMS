Feature: If grok pattern is used by any pipeline it should not be able to delete

  Background:
    Given the user is logged in
    And the user navigates to the "Grok Template Page" page

    @11646_grok_pattern_deletion
  Scenario: Prevent deletion of a Grok template linked to a Parent pipeline
    Given the user has a valid "Grok Template Management" license
    And the user has added a Grok pattern template to a Parent pipeline
    When the user attempts to delete the Grok pattern template
    Then the system should display a toaster message "This Grok pattern template is linked with a Parent pipeline and cannot be deleted"
    And the Grok pattern template should not be deleted

  @11646_grok_pattern_deletion
  Scenario: Prevent deletion of a Grok template linked to a Child pipeline
    Given the user has a valid "Grok Template Management" license
    And the user has added a Grok pattern template to a Child pipeline
    When the user attempts to delete the Grok pattern template
    Then the system should display a toaster message "This Grok pattern template is linked with a Child pipeline and cannot be deleted"
    And the Grok pattern template should not be deleted

  @11646_grok_pattern_deletion
  Scenario: Prevent deletion of a Grok template linked to multiple pipelines
    Given the user has a valid "Grok Template Management" license
    And the user has added a Grok pattern template to multiple pipelines (Parent and Child)
    When the user attempts to delete the Grok pattern template
    Then the system should display a toaster message "This Grok pattern template is linked with multiple pipelines and cannot be deleted"
    And the Grok pattern template should not be deleted

  @11646_grok_pattern_deletion
  Scenario: Prevent deletion of a Grok template while it's being used in a live pipeline
    Given the user has a valid "Grok Template Management" license
    And the user has a Grok pattern template linked to an active pipeline
    When the user attempts to delete the Grok pattern template
    Then the system should display a toaster message "This Grok pattern template is in use and cannot be deleted"
    And the Grok pattern template should not be deleted

  @11646_grok_pattern_deletion
  Scenario: Allow deletion of an unused Grok template
    Given the user has a valid "Grok Template Management" license
    And the user has a Grok pattern template that is not linked to any pipeline
    When the user attempts to delete the Grok pattern template
    Then the system should allow the deletion
    And the Grok pattern template should be removed successfully

  @11646_grok_pattern_deletion
  Scenario: Prevent deletion of Grok template if user lacks delete permissions
    Given the user has a valid "Grok Template Management" license
    But the user does not have delete permissions for Grok templates
    And the user has a Grok pattern template
    When the user attempts to delete the Grok pattern template
    Then the system should display a toaster message "You do not have permission to delete Grok pattern templates"
    And the Grok pattern template should not be deleted

  @11646_grok_pattern_deletion
  Scenario: Prevent deletion of Grok template if user lacks a valid Grok Template Management license
    Given the user does not have a valid "Grok Template Management" license
    And the user has a Grok pattern template
    When the user attempts to delete the Grok pattern template
    Then the system should display a toaster message "License required to delete Grok pattern templates"
    And the Grok pattern template should not be deleted

  @11646_grok_pattern_deletion
  Scenario: Prevent deletion of a Grok template linked to multiple teams
    Given the user has a valid "Grok Template Management" license
    And the user has a Grok pattern template linked to multiple teams
    When the user attempts to delete the Grok pattern template
    Then the system should display a toaster message "This Grok pattern template is linked to multiple teams and cannot be deleted"
    And the Grok pattern template should not be deleted

  @11646_grok_pattern_deletion
  Scenario: Prevent deletion of a Grok template linked to a scheduled report
    Given the user has a valid "Grok Template Management" license
    And the user has a Grok pattern template linked to a scheduled report
    When the user attempts to delete the Grok pattern template
    Then the system should display a toaster message "This Grok pattern template is linked to a scheduled report and cannot be deleted"
    And the Grok pattern template should not be deleted

  @11646_grok_pattern_deletion
  Scenario: Allow deletion of a Grok template after unlinking from pipelines
    Given the user has a valid "Grok Template Management" license
    And the user unlinks a Grok pattern template from all pipelines
    When the user attempts to delete the Grok pattern template
    Then the system should allow the deletion
    And the Grok pattern template should be removed successfully

  @11646_grok_pattern_deletion
  Scenario: Prevent deletion of a Grok template linked to a Logstash configuration
    Given the user has a valid "Grok Template Management" license
    And the user has a Grok pattern template linked to a Logstash configuration
    When the user attempts to delete the Grok pattern template
    Then the system should display a toaster message "This Grok pattern template is linked to a Logstash configuration and cannot be deleted"
    And the Grok pattern template should not be deleted

  @11646_grok_pattern_deletion
  Scenario: Prevent deletion of a Grok template when system backup is in progress
    Given the user has a valid "Grok Template Management" license
    And a system backup is in progress
    When the user attempts to delete the Grok pattern template
    Then the system should display a toaster message "Cannot delete Grok pattern template while system backup is in progress"
    And the Grok pattern template should not be deleted

  @11646_grok_pattern_deletion
  Scenario: Prevent deletion of a Grok template linked to a compliance audit log
    Given the user has a valid "Grok Template Management" license
    And the Grok pattern template is linked to a compliance audit log
    When the user attempts to delete the Grok pattern template
    Then the system should display a toaster message "This Grok pattern template is linked to a compliance audit log and cannot be deleted"
    And the Grok pattern template should not be deleted

  @11646_grok_pattern_deletion
  Scenario: Prevent deletion of a Grok template while another user is editing it
    Given the user has a valid "Grok Template Management" license
    And another user is currently editing the same Grok pattern template
    When the user attempts to delete the Grok pattern template
    Then the system should display a toaster message "This Grok pattern template is being edited by another user and cannot be deleted"
    And the Grok pattern template should not be deleted

  @11646_grok_pattern_deletion
  Scenario: Allow a user with admin privileges to force delete an unlinked Grok template
    Given the user has a valid "Grok Template Management" license
    And the user has admin privileges
    And the Grok pattern template is not linked to any pipeline
    When the user attempts to delete the Grok pattern template
    Then the system should allow the deletion
    And the Grok pattern template should be removed successfully
