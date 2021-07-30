Feature: Basic API testing. Defining common url.
  Background: Define URL
    Given url 'https://reqres.in/api'

  Scenario: Get single user
    Given path 'users/2'
    When method Get
    Then status 200


  Scenario: List all users
    Given path 'users'
    Given param page = 2
    When method Get
    Then status 200
