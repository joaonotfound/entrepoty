Feature: Create Model
    as an user
    I wanna create a model

    Scenario: Missing Information
        Given I'm on the create model screen
        And I haven't given a name or send one image
        Then I shouldn't be able to create model

    Scenario: Duplicated Name
        Given I'm on the create model screen
        And I fill the name field with a name already registered
        Then I should see an error

    Scenario: Unexpected Error
        Given I'm on the create model screen
        And I fullfill all the fields
        And I click on the submit button
        And the server returns an error
        Then I should see an error message


