Feature: Grid View in Rules Page
    Background:
        Given the user is logged in
        And the user is on the correlation rule page with grid view enabled

    @17750
    Scenario: Verify add correlation rule with only mandatory fields
        When the user clicks on "Add Correlation Rule"
        And fills in all the mandatory fields with valid details
        And clicks on "Save"
        Then the correlation rule profile should be created
        And a toaster message should display "Profile created successfully"

    @17750
    Scenario: Verify correlation rule edit from grid action
        Given a correlation rule is present in the grid
        When the user clicks on "Edit" icon for the rule
        And updates the required fields
        And clicks on "Save"
        Then the correlation rule profile should be updated
        And a toaster message should display "Profile updated successfully"

    @17750
    Scenario: Verify correlation rule delete (individual)
        Given a correlation rule is present in the grid
        When the user clicks on "Delete" icon for the rule
        And confirms the deletion
        Then the correlation rule should be removed from the grid
        And a toaster message should display "Profile deleted successfully"

    @17750
    Scenario: Verify correlation rule duplicate parameter name
        Given a correlation rule with the name "TestRule1" exists
        When the user attempts to create another rule with the name "TestRule1"
        And fills in all the mandatory fields
        And clicks on "Save"
        Then the rule should not be saved
        And a toaster message should display "Profile name exists"

    @17750
    Scenario: Verify individual enable of correlation rule using toggle switch
        Given a disabled correlation rule is present in the grid
        When the user toggles the enable switch for the rule
        Then the rule should be enabled
        And a toaster message should display "Profile enabled successfully"

    @17750
    Scenario: Verify individual disable of correlation rule using toggle switch
        Given an enabled correlation rule is present in the grid
        When the user toggles the disable switch for the rule
        Then the rule should be disabled
        And a toaster message should display "Profile disabled successfully"

    @17750
    Scenario: Verify multiple delete of correlation rules
        Given multiple correlation rules are selected in the grid
        When the user clicks on "Delete" from bulk action menu
        And confirms the deletion
        Then all selected correlation rules should be deleted
        And a toaster message should display "Selected profiles deleted successfully"

    @17750
    Scenario: Verify multiple enable of correlation rules
        Given multiple disabled rules are selected in the grid
        When the user selects "Enable" from bulk action menu
        Then all selected rules should be enabled
        And a toaster message should display "Selected profiles enabled successfully"

    @17750
    Scenario: Verify multiple disable of correlation rules
        Given multiple enabled rules are selected in the grid
        When the user selects "Disable" from bulk action menu
        Then all selected rules should be disabled
        And a toaster message should display "Selected profiles disabled successfully"

    @17750
    Scenario: Verify sorting of each column
        Given correlation rules are listed in the grid
        When the user clicks on the sort icon of each column
        Then the data should be sorted in ascending and descending order accordingly

    @17750
    Scenario: Verify pagination with total count and page number
        Given more than one page of correlation rules exists
        When the user navigates through the pages
        Then the correct number of pages and total rule count should be displayed

    @17750
    Scenario: Verify view-only permission restricts grid actions
        Given the user has only view permission
        Then the "Add", "Edit", and "Delete" icons should not be visible
        And toggle switches should be disabled

    @17750
    Scenario: Verify edit permission enables edit icon
        Given the user has edit permission
        Then the "Edit" icon should be visible in the action column of the grid

    @17750
    Scenario: Verify delete permission enables delete icon
        Given the user has delete permission
        Then the "Delete" icon should be visible in the action column of the grid

    @17750
    Scenario: Verify column alignment in the grid
        Then all columns (Name, Status, Action, etc.) should be properly aligned
        And no data should overflow or misalign

