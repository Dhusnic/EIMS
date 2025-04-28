Feature: Timescale update for Log Management related reports and Dashboard widgets
Background:
    Given I am logged into the application
    And I navigate to the reports page


@13392
Scenario: Configure Timescale for Log Management related reports and Dashboard widgets
    When I choose to add a report
    And I provide data to the report
    And I try to save the report
    Then I should see the Timescale ranges from 15 minutes to 90 days in the report

@13392
Scenario: Configure Timescale for Log Management detailed reports 
    When I choose to add a report
    And I provide data to the report 
    And I should see the Timescale ranges from 15 minutes to 30 days for the (fileintegrity report, user Management report, log summary report, change Mangaement report)
    Then I try to save the report

@13392
Scenario: Configure Timescale for Log Management summary reports
    When I choose to add a report
    And I provide data to the report 
    And I should see the Timescale ranges from 15 minutes to 90 days for the (Log Summary Table , Log Count Summary)


@13392
Scenario: Configure Timescale for Log Management related reports
    When I choose to add a report
    And I provide data to the report
    And I try to save the report
    Then I should see the Timescale ranges from 15 minutes to 90 days or 15 minutes to 30 days in the report
    And when i choose to preview the report
    Then I should see the data based on the given timescale



@13392
Scenario: Configure Timescale for Log Management related report and export as pdf
    When I choose to add a report
    And I provide data to the report
    And I try to save the report
    And choose the timescale range from 15 minutes to 30 days
    And I save the report
    And I choose to export the report as pdf
    Then I should see the pdf report with the data based on the given timescale

@13392
Scenario: Configure Timescale for Log Management related report and export as csv
    When I choose to add a report
    And I configure report with required data
    And I should see the Timescale ranges from 15 minutes to 30 days in the report
    And I choose to export the report as csv
    Then I should see the csv file with the data based on the given timescale

@13392
Scenario: Configure Timescale for Log Management related report and export as Excel
    When I choose to add a report
    And I configure report with required data
    And I should see the Timescale ranges from 15 minutes to 30 days in the report
    And I choose to export the report as Excel
    Then I should see the Excel file with the data based on the given timescale

@13392
Scenario: Configure Timescale for Log Management related report and export as email
    When I choose to add a report
    And I configure report with required data
    And I should see the Timescale ranges from 15 minutes to 30 days in the report
    And I choose to export the report as email
    Then I should see the email with the data based on the given timescale

@13392
Scenario: Configure Timescale for Log Management related report as scheduled report and export as pdf
    When I choose to add a report
    And I configure report with required data
    And I should see the Timescale ranges from 15 minutes to 30 days in the report
    And I choose to export the report as pdf and scheduled it 
    Then I should see the pdf file with the data based on the given timescale in scheduled time

@13392
Scenario: Configure Timescale for Log Management related report as scheduled report and export as csv
    When I choose to add a report
    And I configure report with required data
    And I should see the Timescale ranges from 15 minutes to 30 days in the report
    And I choose to export the report as csv and scheduled it
    Then I should see the csv file with the data based on the given timescale in scheduled time

@13392
Scenario: Configure Timescale for Log Management related report as scheduled report and export as Excel
    When I choose to add a report
    And I configure report with required data
    And I should see the Timescale ranges from 15 minutes to 30 days in the report
    And I choose to export the report as Excel and scheduled it
    Then I should see the Excel file with the data based on the given timescale in scheduled time

@13392
Scenario: Configure Timescale for Log Management related dashboard widgets
    When I choose to add a dashboard
    And I configure dashboard with log related widgets
    And I should see the Timescale ranges from 15 minutes to 30 days in the dashboard
    Then I can able the dashboard

@13392
Scenario: Configure Timescale for Log Management related dashboard widgets
    When I choose to add a dashboard
    And I configure dashboard with log related widgets
    And I should see the Timescale ranges from 15 minutes to 30 days in the dashboard
    Then I can able to save the dashboard widget

@13392
Scenario: Configure Timescale for Log Management related dashboard widgets
    When I choose to add a dashboard
    And I configure dashboard with log related widgets
    And I should see the Timescale ranges from 15 minutes to 30 days in the dashboard
    And I choose to preview the dashboard
    Then I should see the data based on the given timescale
