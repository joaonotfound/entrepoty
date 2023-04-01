Feature: User Signup

    Scenario: Successful Signup
        Given I am on the Signup page
        When I enter my name "John Doe", username "johndoe", and password "test1234"
        And I click the Signup button
        Then I should be redirected to the Dashboard page
        And I should see a welcome message "Welcome, John Doe!"

    Scenario: Missing Fields
        Given I am on the Signup page
        When I leave the name field blank
        And I enter my username "johndoe" and password "test1234"
        Then I shouldn't be able to click on the signup button

        Given I am on the Signup page
        When I leave the username field blank
        And I enter my name "John Doe" and password "test1234"
        Then I shouldn't be able to click on the signup button

        Given I am on the Signup page
        When I leave the password field blank
        And I enter my name "John Doe" and username "johndoe"
        Then I shouldn't be able to click on the signup button

    Scenario: Username Already Exists
        Given I am on the Signup page
        And there is already a user with username "johndoe"
        When I enter my name "Jane Doe", username "johndoe", and password "test1234"
        And I click the Signup button
        Then I should see an error message "Username already exists. Please choose a different username"
