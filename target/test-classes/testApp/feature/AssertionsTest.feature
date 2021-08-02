Feature: Test basic assertions
  Background: Define url
    Given url 'https://reqres.in/api'

  Scenario: Basic assertions test
    Given path 'unknown'
    When method Get
    Then status 200
    And match response.total_pages == 2
    And match response.data == "#array"
