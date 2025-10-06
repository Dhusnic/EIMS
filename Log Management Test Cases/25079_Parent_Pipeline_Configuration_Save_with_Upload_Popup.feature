Feature: 25079 Parent Pipeline Configuration Save with Upload Popup

    Background:
        Given the user has logged in
        And the user navigates to the Pipeline page

    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Add parent pipeline – upload to logserver
        When the user chooses to add a parent pipeline
        And the user fills all mandatory fields
        And the user clicks "Save"
        Then an "Upload" popup should appear
        When the user clicks "Upload"
        Then the pipeline is saved
        And the pipeline is uploaded to the logserver

    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Add parent pipeline – cancel upload
        When the user chooses to add a parent pipeline
        And the user fills all mandatory fields
        And the user clicks "Save"
        Then an "Upload" popup should appear
        When the user clicks "Cancel"
        Then the pipeline is saved
        And the pipeline is not uploaded to the logserver

    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Add child pipeline – no popup
        When the user chooses to add a child pipeline
        And the user fills all mandatory fields
        And the user clicks "Save"
        Then the pipeline is saved
        And no upload popup is shown

    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Edit parent pipeline fields (excluding name/description) – upload to logserver
        When the user edits a parent pipeline (fields other than name and description)
        And the user fills all mandatory fields
        And the user clicks "Save"
        Then an "Upload" popup should appear
        When the user clicks "Upload"
        Then the pipeline is saved
        And the pipeline is uploaded to the logserver

    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Edit parent pipeline fields (excluding name/description) – cancel upload
        When the user edits a parent pipeline (fields other than name and description)
        And the user fills all mandatory fields
        And the user clicks "Save"
        Then an "Upload" popup should appear
        When the user clicks "Cancel"
        Then the pipeline is saved
        And the pipeline is not uploaded to the logserver

    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Edit parent pipeline without any changes – no popup
        When the user opens a parent pipeline for editing
        And the user makes no changes
        And the user clicks "Save"
        Then the pipeline is saved
        And no upload popup is shown

    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Edit parent pipeline description only – no popup
        When the user edits the description of a parent pipeline
        And the user clicks "Save"
        Then the pipeline is saved
        And no upload popup is shown

    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Edit child pipeline – no popup
        When the user edits a child pipeline
        And the user changes any field
        And the user clicks "Save"

    # ---------------------------------------------------
    #  Popup visibility
    # ---------------------------------------------------
    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Popup appears after clicking Save
        When the user clicks the "Save" button
        Then the upload popup is displayed

    # ---------------------------------------------------
    #  Button colour (light theme)
    # ---------------------------------------------------
    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Verify button colours in light theme
        Given the application is in light theme
        And the upload popup is open
        Then the "Upload" button colour matches the light-theme primary colour
        And the "Cancel" button colour matches the light-theme secondary colour

    # ---------------------------------------------------
    #  Button colour (dark theme)
    # ---------------------------------------------------
    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Verify button colours in dark theme
        Given the application is in dark theme
        And the upload popup is open
        Then the "Upload" button colour matches the dark-theme primary colour
        And the "Cancel" button colour matches the dark-theme secondary colour

    # ---------------------------------------------------
    #  Popup title and descriptive content
    # ---------------------------------------------------
    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Verify popup title and content
        When the upload popup is open
        Then the popup title reads "Are you sure?"
        And the description explains the impact of uploading to the log server "Configuration will be uploaded to Log Collector Server"


    # ---------------------------------------------------
    #  Responsive design
    # ---------------------------------------------------
    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Popup layout on multiple screen sizes
        When the upload popup is viewed at different responsiveness
        Then the popup stays alignment should be Proper

    # ---------------------------------------------------
    #  Keyboard accessibility
    # ---------------------------------------------------
    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Navigate popup with keyboard
        When the upload popup is open
        Then the focus order follows logical tab sequence
        And pressing Enter on the focused "Upload" button triggers the upload action
        And pressing Enter on the focused "Cancel" button closes the popup without upload

    # ---------------------------------------------------
    #  Auto-close after successful upload
    # ---------------------------------------------------
    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Popup auto-closes on successful upload
        When the upload popup is open
        And the user clicks "Upload"
        Then the pipeline is uploaded to the log server
        And the popup closes automatically

    # ---------------------------------------------------
    #  Upload success message
    # ---------------------------------------------------
    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Success toast after uploading
        When the user completes a successful upload
        Then a toast message appears stating "Pipeline uploaded successfully"

    # ---------------------------------------------------
    #  Save without uploading (Cancel path)
    # ---------------------------------------------------
    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Pipeline saved but not uploaded after Cancel
        When the upload popup is open
        And the user clicks "Cancel"
        Then the popup closes

    # ---------------------------------------------------
    #  No popup on invalid details
    # ---------------------------------------------------
    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Popup does not appear when Save is clicked with invalid fields
        Given the user has left a mandatory field empty
        When the user clicks "Save"
        Then the upload popup is not displayed
        And inline validation errors are shown

    # ---------------------------------------------------
    #  User permission enforcement
    # ---------------------------------------------------
    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: User without upload permission
        Given the user lacks "Upload Pipeline" permission
        When the user clicks "Save"
        Then the pipeline is saved
        And the upload popup is not displayed

    # ---------------------------------------------------
    #  Audit logging – Upload
    # ---------------------------------------------------
    @25079_Parent_Pipeline_Configuration_Save_with_Upload_Popup
    Scenario: Audit entry recorded for a successful upload
        When the user uploads a parent pipeline
        Then an audit record is created with action "UPLOAD" and status "SUCCESS"
