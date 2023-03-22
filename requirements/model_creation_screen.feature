Feature: Create Model
    as an user
    I wanna create a model

    Scenario: Missing Information
        Given I'm on the create model screen
        And I haven't given a name or send one image
        Then I shouldn't be able to create model

    Scenario: Unexpected Error
        Then I click on the submit button
        And the server returns an error
        Then I should see an error message


