Feature: Grok Pattern Management in Parent and Child Pipelines with License and User Permissions

  Background:
    Given the user is logged in
    And the user navigates to the "Pipeline Configuration" page

  @11425_include_grok_template_for_pipelines
  Scenario: User uploads a Parent pipeline with a Grok pattern and verifies in Logstash configuration
    Given the user clicks the "Add Pipeline Configuration" button
    When the user selects a Grok pattern from the multi-dropdown input
    And the user chooses "Parent" from the pipeline type dropdown
    And the user uploads the pipeline
    Then the pipeline should be saved in the Logstash configuration directory as "pipeline_name_pl.config"
    And the Grok pattern should be referenced in the "pipeline_name_pl.config" file

  @11425_include_grok_template_for_pipelines
  Scenario: User uploads a Child pipeline with a Grok pattern and verifies in Logstash configuration
    Given the user clicks the "Add Pipeline Configuration" button
    When the user selects a Grok pattern from the multi-dropdown input
    And the user chooses "Child" from the pipeline type dropdown
    And the user uploads the pipeline
    Then the pipeline should be saved in the Logstash configuration directory as "pipeline_name_pl.config"
    And the Grok pattern should be referenced in the "pipeline_name_pl.config" file

  @11425_include_grok_template_for_pipelines
  Scenario: User edits a Grok pattern in a Parent pipeline and verifies changes in Logstash configuration
    Given the user has uploaded a Parent pipeline with a Grok pattern
    When the user edits the Grok pattern in the pipeline configuration
    And the user uploads the updated pipeline
    Then the edited Grok pattern should be updated in the "pipeline_name_pl.config" file in the Logstash configuration directory

  @11425_include_grok_template_for_pipelines
  Scenario: User edits a Grok pattern in a Child pipeline and verifies changes in Logstash configuration
    Given the user has uploaded a Child pipeline with a Grok pattern
    When the user edits the Grok pattern in the pipeline configuration
    And the user uploads the updated pipeline
    Then the edited Grok pattern should be updated in the "pipeline_name_pl.config" file in the Logstash configuration directory

  @11425_include_grok_template_for_pipelines
  Scenario: User selects multiple Grok patterns for a Parent pipeline and verifies in Logstash configuration
    Given the user clicks the "Add Pipeline Configuration" button
    When the user selects multiple Grok patterns from the multi-dropdown input
    And the user chooses "Parent" from the pipeline type dropdown
    And the user uploads the pipeline
    Then all selected Grok patterns should be referenced in the "pipeline_name_pl.config" file in the Logstash configuration directory

  @11425_include_grok_template_for_pipelines
  Scenario: User selects multiple Grok patterns for a Child pipeline and verifies in Logstash configuration
    Given the user clicks the "Add Pipeline Configuration" button
    When the user selects multiple Grok patterns from the multi-dropdown input
    And the user chooses "Child" from the pipeline type dropdown
    And the user uploads the pipeline
    Then all selected Grok patterns should be referenced in the "pipeline_name_pl.config" file in the Logstash configuration directory

  @11425_include_grok_template_for_pipelines
  Scenario: User removes and re-adds a Grok pattern in a Parent pipeline and verifies in Logstash configuration
    Given the user has uploaded a Parent pipeline with a Grok pattern
    When the user removes the Grok pattern from the pipeline configuration
    And re-adds the same Grok pattern
    And uploads the updated pipeline
    Then the Grok pattern should be referenced in the "pipeline_name_pl.config" file in the Logstash configuration directory
    And the Grok pattern should not be duplicated

  @11425_include_grok_template_for_pipelines
  Scenario: User removes and re-adds a Grok pattern in a Child pipeline and verifies in Logstash configuration
    Given the user has uploaded a Child pipeline with a Grok pattern
    When the user removes the Grok pattern from the pipeline configuration
    And re-adds the same Grok pattern
    And uploads the updated pipeline
    Then the Grok pattern should be referenced in the "pipeline_name_pl.config" file in the Logstash configuration directory
    And the Grok pattern should not be duplicated

  @11425_include_grok_template_for_pipelines
  Scenario: User edits Grok pattern parameters in a Parent pipeline and verifies in Logstash configuration
    Given the user has uploaded a Parent pipeline with a Grok pattern
    When the user edits the Grok pattern parameters in the pipeline configuration
    And uploads the updated pipeline
    Then the edited Grok pattern parameters should be updated in the "pipeline_name_pl.config" file in the Logstash configuration directory

  @11425_include_grok_template_for_pipelines
  Scenario: User edits Grok pattern parameters in a Child pipeline and verifies in Logstash configuration
    Given the user has uploaded a Child pipeline with a Grok pattern
    When the user edits the Grok pattern parameters in the pipeline configuration
    And uploads the updated pipeline
    Then the edited Grok pattern parameters should be updated in the "pipeline_name_pl.config" file in the Logstash configuration directory

  @11425_include_grok_template_for_pipelines
  Scenario: User adds, deletes, and edits Grok pattern templates in a Parent pipeline and verifies in Logstash configuration
    Given the user has added a Grok pattern template to a Parent pipeline
    When the user deletes the Grok pattern template
    And edits the Grok pattern template
    And uploads the updated pipeline
    Then the changes should be reflected in the "pipeline_name_pl.config" file in the Logstash configuration directory

  @11425_include_grok_template_for_pipelines
  Scenario: User adds, deletes, and edits Grok pattern templates in a Child pipeline and verifies in Logstash configuration
    Given the user has added a Grok pattern template to a Child pipeline
    When the user deletes the Grok pattern template
    And edits the Grok pattern template
    And uploads the updated pipeline
    Then the changes should be reflected in the "pipeline_name_pl.config" file in the Logstash configuration directory

  @11425_include_grok_template_for_pipelines
  Scenario: Auto-generated and manually added Grok patterns reflect in Parent pipeline Logstash configuration
    Given an auto-generated Grok pattern is added to a Parent pipeline
    And a manually added Grok pattern is added to the same Parent pipeline
    When the user uploads the pipeline
    Then both the auto-generated and manually added Grok patterns should be referenced in the "pipeline_name_pl.config" file in the Logstash configuration directory

  @11425_include_grok_template_for_pipelines
  Scenario: Auto-generated and manually added Grok patterns reflect in Child pipeline Logstash configuration
    Given an auto-generated Grok pattern is added to a Child pipeline
    And a manually added Grok pattern is added to the same Child pipeline
    When the user uploads the pipeline
    Then both the auto-generated and manually added Grok patterns should be referenced in the "pipeline_name_pl.config" file in the Logstash configuration directory

  @11425_include_grok_template_for_pipelines
  Scenario: Verify the Log Management license for pipeline configuration
    Given the user is logged in with the license for "Pipeline Configuration"
    When the user navigates to the "Pipeline Configuration" page
    Then the LogPipeline page should be displayed

  @11425_include_grok_template_for_pipelines
  Scenario: Verify user permissions to view, edit, and delete Log Pipeline
    Given the user is logged in
    When the user attempts to view, edit, or delete a Log Pipeline
    Then the LogPipeline module should display options based on the user's permissions