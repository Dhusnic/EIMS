Feature: Hybrid Pipeline Implementation Hybrid Pipeline Back End

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Navigate to pipeline configuration page
    Given the user is logged in
    When the user navigates to the "Pipeline Configuration" page
    Then the "Pipeline Configuration" page should be displayed

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Add a new parent pipeline
    Given the user is on the "Pipeline Configuration" page
    When the user clicks the "Add Pipeline Configuration" button
    And the user chooses to add a "Parent Pipeline"
    Then a new parent pipeline form should appear

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Add a child pipeline to the parent pipeline
    Given the user has created a parent pipeline
    When the user chooses to add a "Child Pipeline" to the parent pipeline
    Then a side bar for adding child pipeline details should appear

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Mandatory fields validation for adding a child pipeline
    Given the side bar for adding child pipeline details is open
    When the user does not choose a "Child Pipeline" and clicks the "Save" button
    Then an error message should appear stating "Child Pipeline selection is mandatory"
    And the user should not be able to save the child pipeline

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Fill in asset filters and preview grid
    Given the side bar for adding child pipeline details is open
    When the user fills in the "Asset Filters" details
    And the user clicks the "Preview" button
    Then a grid containing asset details should be displayed
    And the grid should contain the following columns:
      | Asset ID    |
      | IP Address  |
      | Device Type |
      | Hostname    |

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Verify asset details in the grid
    Given the grid containing asset details is visible
    When asset details are displayed
    Then each row in the grid should contain:
      | Asset ID    | IP Address  | Device Type | Hostname    |
      | 123         | 192.168.1.1 | Router      | Router-1    |
      | 124         | 192.168.1.2 | Switch      | Switch-1    |

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Fill in log custom fields
    When user chooses to give input "Log Custom Filter"
    And the user chooses a suggestion for "Log Custom Filter"
    Then the "Log Custom Fields" should be filled with the selected suggestion

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Save the child pipeline
    Given the "Log Custom Fields" have been filled
    And a "Child Pipeline" has been selected
    When the user clicks the "Save" button
    Then the child pipeline should be added
    And the side bar should close

  @feature_10642_hybrid_pipeline_back_end
  Scenario: License for LogPipeline
    Given the user is logged in with the license for "Pipeline Configuration"
    When the user navigates to the "Pipeline Configuration" page
    Then the LogPipeline page should be displayed

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Permission of user to view, edit, and delete Log Pipeline
    Given the user is logged in
    When the user attempts to view, edit, or delete a Log Pipeline
    Then based appropriate permissions for user the LogPipeline module should display the options

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Warning when no child available
    Given no child pipeline has been created
    When the pipeline type changes to "Parent"
    Then a warning toaster should display stating "No child available"

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Clear data in core side bar input when closed
    Given the core side bar is open
    When the user closes the core side bar
    Then all input data in the side bar should be cleared

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Info icon near log custom filter
    Given the info icon near "Log Custom Filter" is visible
    When the user clicks the info icon
    Then information on how to use the "Log Custom Filter" should display as a side bar


  @feature_10642_hybrid_pipeline_back_end
  Scenario: Child or parent pipeline should be shown
    Given the pipeline page is displayed
    Then it should clearly indicate if the pipeline is a child or parent

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Pagination cases for all grids
    Given a grid is displayed in the side bar or configuration page
    When there are multiple pages of data
    Then pagination controls should be functional

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Cancel button for core side bar
    Given the core side bar for adding a child is open
    When the user clicks the "Cancel" button
    Then the side bar should close without saving changes

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Choose either log custom filter or asset custom filter
    Given the user is adding a child pipeline
    When the user does not choose either a log custom filter or an asset custom filter
    Then an save button should be disabled

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Sorting in grids
    Given a grid is displayed
    When the user clicks on a column header
    Then the rows in the grid should be sorted by the selected column

  @feature_10642_hybrid_pipeline_back_end
  Scenario: Prevent duplicate child pipeline with same parent
    Given a parent pipeline is selected
    When the user attempts to add a duplicate child pipeline
    Then an same pipeline option is not displayed again