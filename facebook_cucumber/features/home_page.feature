Feature: "Login functionality"
  Background:
    Given there is a facebook home page

  Scenario: "User should login with existing account"
    When fill form with existing credentials
    And press login button
    Then user should be logged in

  Scenario: "User cannot register with already registered email"
    When user fill_form_with "used_email"
    And click on sign_up button
    Then user should see error message that email is already registered

  Scenario: "User cannot register with unexisting email"
    When user fill_form_with "unexisting_email"
    And click on sign_up button
    Then user should see error message that he is not able to continue registation

  Scenario: "User should not be abel to register with blank email"
    When fill form with blank "email_or_mobile"
    And click on sign_up button
    Then user should see error message and stay on home page

  Scenario: "User should not be abel to register with blank first name"
    When fill form with blank "first_name"
    And click on sign_up button
    Then user should see error message and stay on home page

  Scenario: "User should not be abel to register with blank last name"
    When fill form with blank "last_name"
    And click on sign_up button
    Then user should see error message and stay on home page

  Scenario: "User should not be abel to register with blank password"
    When fill form with blank "password"
    And click on sign_up button
    Then user should see error message and stay on home page

  Scenario: "User should not be abel to register with blank birthday"
    When fill form with blank "checkbox_day"
    And click on sign_up button
    Then user should see error message and stay on home page

  Scenario: "User should not be abel to register with blank gender"
    When fill form with blank "gender_male"
    And click on sign_up button
    Then user should see error message and stay on home page