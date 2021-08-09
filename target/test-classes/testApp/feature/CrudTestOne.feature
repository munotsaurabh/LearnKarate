@demo
Feature: Basic API testing

  Scenario: Get single user
    Given url 'https://reqres.in/api/users/2'
    When method Get
    Then status 200

   Scenario: List all users
     Given url 'https://reqres.in/api/users'
     Given param page = 2
     When method Get
     Then status 200

  Scenario: Separating path from API url
    Given url 'https://reqres.in/api'
    Given path 'unknown'
    When method Get
    Then status 200