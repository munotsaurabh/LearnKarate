@delete
Feature: Perform Delete operation
  Background: Define url
    Given url 'https://gorest.co.in/public/v1/'

  Scenario: Perform delete operation
    Given header Content-Type = "application/json"
    Given header Authorization = "Bearer "+ "41ceaf2b5f5daad4d82191a8405555e465db5df4186dc82c9e16f33a57e36808"
#   Create a user
    Given path 'users'
    And request {"name":"Ishant Sharma", "gender":"male", "email":"ishant.s1@15ce.com", "status":"active"}
    When method Post
    Then status 201
    * def id = response.data.id

#   Verfiy the user is created
    Given path 'users', id
    When method Get
    Then status 200
    And match response.data.email == 'ishant.s1@15ce.com'

#   Delete the created user
    Given header Content-Type = "application/json"
    Given header Authorization = "Bearer "+ "41ceaf2b5f5daad4d82191a8405555e465db5df4186dc82c9e16f33a57e36808"
    Given path 'users', id
    When method Delete
    Then status 204

#   Validate the user is deleted
    Given path 'users', id
    When method Get
    Then status 404
    And match response.data.message == 'Resource not found'

