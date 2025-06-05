Feature: Log Rule Management under Configurations -> Log Management -> Log Rule

    @18135
    Scenario: Verify Rule Type in rule Add option
        Given navigate to Configurations -> Log Management -> Log Rule
        Then verify available of Log Rule page

    @18135
    Scenario: Verify popup on click of Log rule
        Given navigate to Configurations -> Log Management -> Log Rule
        When click on add button
        Then it should show sidebar to add Log Rule

    @18135
    Scenario: Verify tabs on click log rule
        Given navigate to Configurations -> Log Management -> Log Rule
        When click on add button
        Then it should open popup and show tabs like rule, criteria and action

    @18135
    Scenario: Verify fields in rule tab on click log rule
        Given navigate to Configurations -> Log Management -> Log Rule
        When click on add button
        Then rule tab should have fields like Name, status, description, options like custom query and threshold rule

    @18135
    Scenario: Verify fields in criteria tab on click log rule
        Given navigate to Configurations -> Log Management -> Log Rule
        When click on add button
        Then criteria tab should have fields like index pattern and data view, custom filters, check every, look back along with filters

    @18135
    Scenario: Verify fields in action tab on click log rule
        Given navigate to Configurations -> Log Management -> Log Rule
        When click on add button
        Then action tab should have fields like create new event option along with severity, alarm / Event message

    @18135
    Scenario: Verify save of log rule
        Given navigate to Configurations -> Log Management -> Log Rule
        When click on add button, fill all the details and click on submit
        Then log rule should be saved successfully

    @18135
    Scenario: Verify editing log rule
        Given navigate to Configurations -> Log Management -> Log Rule
        When click any existing log rule
        Then it should open popup with log rule

    @18135
    Scenario: Verify updating log rule
        Given navigate to Configurations -> Log Management -> Log Rule
        When click any existing log rule and make some modification and click on submit button
        Then it should save the log rule successfully

    @18135
    Scenario: Verify deleting log rule
        Given navigate to Configurations -> Log Management -> Log Rule Grid
        When click delete icon of any log rule
        Then it should delete the log rule successfully

    @18135
    Scenario: Verify adding log rule in kibana using celery
        Given navigate to Configurations -> Log Management -> Log Rule
        When click on add button, fill all the details and click on submit
        Then log rule should be saved in kibana

    @18135
    Scenario: Verify updating log rule in kibana using celery
        Given navigate to Configurations -> Log Management -> Log Rule
        When click any existing log rule and make some modification and click on submit button
        Then it should save the log rule in kibana

    @18135
    Scenario: Verify deleting log rule from kibana using celery
        Given navigate to Configurations -> Log Management -> Log Rule Grid
        When click delete icon of any log rule
        Then it should delete the log rule from kibana

    @18135
    Scenario: Verify data view list in criteria tab of log rule
        Given navigate to Configurations -> Log Management -> Log Rule
        When click on add button, check data view field
        Then it should show added data view

    @18135
    Scenario: Verify Log Rule option based on license
        Given navigate to Configurations -> Log Management
        Then it should show log rule if log rule license permission is there










@18135
Feature: Log Rule Permissions - Add, Edit (Enable/Disable), Delete, View in Card and Grid Views

    # ----------------------------- VIEW PERMISSION -----------------------------

    @18135
    Scenario: Verify log rule visibility in card view with only view permission
        Given user has only view permission for log rule
        When user navigates to Configurations -> Log Management -> Log Rule
        Then user should see log rules in card view
        And should not see Add, Edit, or Delete options

    @18135
    Scenario: Verify log rule visibility in grid view with only view permission
        Given user has only view permission for log rule
        When user switches to grid view
        Then user should see log rules in tabular format
        And should not see Add, Edit, or Delete icons

    # ----------------------------- ADD PERMISSION -----------------------------

    @18135
    Scenario: Verify Add Log Rule button visibility and functionality with add permission
        Given user has add permission for log rule
        When user navigates to Configurations -> Log Management -> Log Rule
        Then Add button should be visible
        When user clicks on Add and selects Log Rule
        Then Log Rule popup should open for creation

    @18135
    Scenario: Verify Add Log Rule button not visible without add permission
        Given user does not have add permission
        When user navigates to Configurations -> Log Management -> Log Rule
        Then Add button should not be visible

    # ----------------------------- EDIT PERMISSION -----------------------------

    @18135
    Scenario: Verify Edit icon visibility in card view with edit permission
        Given user has edit permission for log rule
        When user navigates to Configurations -> Log Management -> Log Rule in card view
        Then edit icon should be visible on each log rule card

    @18135
    Scenario: Verify Edit icon visibility in grid view with edit permission
        Given user has edit permission for log rule
        When user switches to grid view
        Then edit icon should be available for each log rule row

    @18135
    Scenario: Verify updating log rule with edit permission in card view
        Given user has edit permission and is on card view
        When user clicks edit on a log rule card and modifies details
        Then the changes should be saved successfully

    @18135
    Scenario: Verify updating log rule with edit permission in grid view
        Given user has edit permission and is on grid view
        When user clicks edit icon for a row and modifies rule
        Then the log rule should be updated

    @18135
    Scenario: Verify enabling/disabling log rule with edit permission in card view
        Given user has edit permission for log rule
        When user clicks enable/disable toggle on a card
        Then log rule should be enabled or disabled accordingly

    @18135
    Scenario: Verify enabling/disabling log rule with edit permission in grid view
        Given user has edit permission for log rule
        When user clicks enable/disable switch in grid view
        Then rule status should update to enabled or disabled

    @18135
    Scenario: Verify Edit and enable/disable not visible without edit permission
        Given user does not have edit permission
        When user navigates to log rule page in card or grid view
        Then edit icons and enable/disable toggles should not be visible

    # ----------------------------- DELETE PERMISSION -----------------------------

    @18135
    Scenario: Verify Delete icon visibility in card view with delete permission
        Given user has delete permission for log rule
        When user is on card view of log rules
        Then delete icon should be visible on each rule card

    @18135
    Scenario: Verify Delete icon visibility in grid view with delete permission
        Given user has delete permission for log rule
        When user switches to grid view
        Then delete icon should be visible per row

    @18135
    Scenario: Verify deletion of log rule from card view with delete permission
        Given user has delete permission and is on card view
        When user clicks delete on a rule card and confirms
        Then log rule should be deleted successfully

    @18135
    Scenario: Verify deletion of log rule from grid view with delete permission
        Given user has delete permission and is on grid view
        When user clicks delete icon for a row and confirms
        Then the log rule should be removed

    @18135
    Scenario: Verify Delete icon not visible without delete permission
        Given user does not have delete permission
        When user navigates to card or grid view
        Then delete icon should not be shown for any log rule

    # ----------------------------- COMBINED PERMISSIONS -----------------------------

    @18135
    Scenario: Verify full log rule functionality with add, edit, delete, and view permissions
        Given user has add, edit, delete, and view permissions
        When user navigates to Configurations -> Log Management -> Log Rule
        Then user should be able to view rules, add new, edit existing, and delete log rules
        And should be able to enable/disable log rules in both card and grid view

    # ----------------------------- NO PERMISSIONS -----------------------------

    @18135
    Scenario: Verify Log Rule menu not accessible with no permissions
        Given user has no permissions for log rule
        When user navigates to Configurations
        And Log Management
        Then Log Rule menu should not be visible
