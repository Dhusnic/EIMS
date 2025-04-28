Feature: Implement coma separated values in Log related widgets
Background:
    Given I am logged into the application
    And I navigate to the dashboard

@13393_Implement_coma_separated_values_in_Log_related_widgets
Scenario: Configure coma separated values in log related widgets
    When I choose to add count widget in a dashboard
    And I configure dashboard with  log related widgets
    And I save the dashboard
    Then I should see the dashboard data with coma separated values in count panel

@13393_Implement_coma_separated_values_in_Log_related_widgets
Scenario: Configure coma separated values in log related widgets which are greater than 999
    When I choose to add count widget in a dashboard
    And I configure dashboard with  log related widgets which are greater than 999
    And I save the dashboard
    Then I should see the dashboard data with coma separated values in count panel

@13393_Implement_coma_separated_values_in_Log_related_widgets
Scenario: Configure coma separated values in log related widgets in indian standards
    When I choose to add count widget in a dashboard
    And I configure dashboard with  log related widgets in indian standards 
    And I save the dashboard
    Then I should see the dashboard data with coma separated values in count panel in indian standards

@13393_Implement_coma_separated_values_in_Log_related_widgets
Scenario: Configure coma separated values in log related widgets in indian standards which are greater than 999
    When I choose to add count widget in a dashboard
    And I configure dashboard with  log related widgets in indian standards which are greater than 999
    And I save the dashboard
    Then I should see the dashboard data with coma separated values in count panel in indian standards
    And when I click on the count widget
    Then a data of the count panel should displayed in the sidebar page

