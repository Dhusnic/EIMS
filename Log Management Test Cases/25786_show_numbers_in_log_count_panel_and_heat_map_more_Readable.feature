Feature: Readable Number Formatting in Dashboard
Background:
    Given the user is logged in
    And the user navigates to the Dashboard page
    And the user has log data available for display
    And the user has a heat map visualization on the dashboard
    And the user has a log count panel on the dashboard
  # Count Panel Test Cases
  @25786_show_numbers_in_log_count_panel_and_heat_map_more_Readable
  Scenario: Count panel shows K format with 2 decimals
    Given log count is 1500
    When I view count panel
    Then I see "1.50K"

  @25786_show_numbers_in_log_count_panel_and_heat_map_more_Readable
  Scenario: Count panel shows M format with 2 decimals
    Given log count is 2500000
    When I view count panel
    Then I see "2.50M"

  @25786_show_numbers_in_log_count_panel_and_heat_map_more_Readable
  Scenario: Count panel shows B format with 2 decimals
    Given log count is 1500000000
    When I view count panel
    Then I see "1.50B"

  @25786_show_numbers_in_log_count_panel_and_heat_map_more_Readable
  Scenario: Count panel shows numbers below 1000 without formatting
    Given log count is 999
    When I view count panel
    Then I see "999"

  @25786_show_numbers_in_log_count_panel_and_heat_map_more_Readable
  Scenario: Count panel shows zero
    Given log count is 0
    When I view count panel
    Then I see "0"

  # Heat Map Test Cases
  @25786_show_numbers_in_log_count_panel_and_heat_map_more_Readable
  Scenario: Heat map shows K format with 1 decimal
    Given heat map cell value is 2500
    When I view heat map
    Then cell displays "2.5K"

  @25786_show_numbers_in_log_count_panel_and_heat_map_more_Readable
  Scenario: Heat map shows M format with 1 decimal
    Given heat map cell value is 3500000
    When I view heat map
    Then cell displays "3.5M"

  @25786_show_numbers_in_log_count_panel_and_heat_map_more_Readable
  Scenario: Heat map shows B format with 1 decimal
    Given heat map cell value is 1200000000
    When I view heat map
    Then cell displays "1.2B"

  @25786_show_numbers_in_log_count_panel_and_heat_map_more_Readable
  Scenario: Heat map shows numbers below 1000 without formatting
    Given heat map cell value is 850
    When I view heat map
    Then cell displays "850"

  @25786_show_numbers_in_log_count_panel_and_heat_map_more_Readable
  Scenario: Heat map shows zero
    Given heat map cell value is 0
    When I view heat map
    Then cell displays "0"

  # Heat Map Tooltip Test Cases
  @25786_show_numbers_in_log_count_panel_and_heat_map_more_Readable
  Scenario: Heat map tooltip shows exact number for K values
    Given heat map cell displays "2.5K"
    When I hover over heat map cell
    Then tooltip shows "2,500"

  @25786_show_numbers_in_log_count_panel_and_heat_map_more_Readable
  Scenario: Heat map tooltip shows exact number for M values
    Given heat map cell displays "3.5M"
    When I hover over heat map cell
    Then tooltip shows "3,500,000"

  @25786_show_numbers_in_log_count_panel_and_heat_map_more_Readable
  Scenario: Heat map tooltip shows exact number for B values
    Given heat map cell displays "1.2B"
    When I hover over heat map cell
    Then tooltip shows "1,200,000,000"

  @25786_show_numbers_in_log_count_panel_and_heat_map_more_Readable
  Scenario: Heat map tooltip shows exact number for unformatted values
    Given heat map cell displays "850"
    When I hover over heat map cell
    Then tooltip shows "850"

  @25786_show_numbers_in_log_count_panel_and_heat_map_more_Readable
  Scenario: Heat map tooltip shows zero
    Given heat map cell displays "0"
    When I hover over heat map cell
    Then tooltip shows "0"
