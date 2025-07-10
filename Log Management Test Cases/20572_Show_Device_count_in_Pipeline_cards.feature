
Feature: Show Device count in Pipeline cards

    Background:
        Given I am on the Pipeline grid page
        And I have a pipeline with devices

    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: Verify device count is displayed in Pipeline cards
        When I view the Pipeline cards
        Then I should see the device count displayed for each Pipeline card for pipeline with upload successfull,restart successfull,restart failed

    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: Device count updates when devices are added or removed
        Given I add a new device to a Pipeline
        When I refresh the Pipeline cards
        Then I should see the updated device count for that Pipeline card

    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: Device count remains accurate after enabling/disabling Pipelines
        Given I enable a Pipeline with devices
        When I refresh the Pipeline cards
        Then I should see the device count remains accurate for that Pipeline card

    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: Device count is not shown for Pipelines without devices
        Given I have a Pipeline without any devices
        When I view the Pipeline cards
        Then I should not see a device count for that Pipeline card

    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: Device count updates when devices are added to a disabled Pipeline
        Given I have a disabled Pipeline with devices
        Then No device should add for disabled pipeline
        When I enable the Pipeline
        Then I should see the device count had not changed  for that Pipeline card

    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: Device count updates when devices are removed from a logs using purge config
        Given I have a Pipeline with devices
        When I purge the devices from the Pipeline
        Then I should see the device count updated to reflect the removed devices for that Pipeline card


    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: Device count should not duplicated in Pipeline cards when index changes from linux to linux server
        Given I have multiple Pipelines with devices
        When I view the Pipeline cards
        And the index name is changed from "linux" to "linux server"
        Then I should not see duplicated device counts for pipelines

    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: when there is no asset in It asset but logs are reciving through pipeline
        Given I have a Pipeline with devices
        And I have a device in the Pipeline
        Then the asset Ip shoud be in status Asset Not Found

    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: when there is asset in It asset but in disabled status in log management and logs are reciving through pipeline
        Given I have a Pipeline with devices
        And the asset is in disabled status in It asset
        Then the asset Ip shoud be in status Asset Disabled


    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: when there is asset in It asset but in enabled status in log management and logs are reciving through pipeline
        Given I have a Pipeline with devices
        And the asset is in enabled status in It asset
        Then the asset Ip shoud be in status Asset Enabled

    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: the log rate change for 5 min
        Given I have a Pipeline with devices
        When I view the log rate for the Pipeline
        Then I should see the log rate is based last 5 minutes for each devices

    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: For deleted and disabled assets the log count should shown as 0 in Pipeline cards
        Given I have a Pipeline with devices
        And I delete an asset from It asset
        When I view the Pipeline cards
        Then I should see the deleted asset in the Pipeline card device count as 0 and licsense should be shown as asset not found

    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: when i see all child pipelines the count should be based on only child pipelines
        Given I have a Pipeline with devices
        When I view the child pipelines of that Pipeline
        Then I should see the device count is shown based on only child pipelines and not parent pipelines


    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: when i see child pipelines of particular parent pipeline the count should be based on  child pipeline and parent pipeline
        Given I have a Pipeline with devices
        When I view the child pipelines of that Pipeline
        Then I should see the device count is shown based on child pipelines and parent pipelines

    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: the performance of the sidebar load with in 15 sec
        Given I have a Pipeline with devices
        When I view the Pipeline cards
        Then I should see the device count summary sidebar loads within 15 seconds


    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: the device count should show only user have view permission on pipeline
        Given I have a Pipeline with devices
        And I have a user with view permission on that Pipeline
        When I view the Pipeline cards
        Then I should see the device count is shown only for pipelines where the user has view permission

    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: the device count is showing in pipeline and the pipeline able to delete
        Given I have a Pipeline with devices
        Then I able to delete the Pipeline

    @20572_Show_Device_count_in_Pipeline_cards
    Scenario: when the pipeline is deleted and created again the device count should be shown
        Given I have a Pipeline with devices
        When I delete the Pipeline
        And I create a new Pipeline with the same name
        Then I should not see the device count is shown for the new Pipeline like the deleted Pipeline

