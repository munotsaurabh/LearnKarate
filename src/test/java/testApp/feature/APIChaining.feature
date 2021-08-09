Feature: Test API chaining
  Background: Define url
    Given url 'https://gorest.co.in/public/v1/'

  Scenario: API chaining test
    Given header Content-Type = "application/json"
    Given header Authorization = "Bearer "+ "41ceaf2b5f5daad4d82191a8405555e465db5df4186dc82c9e16f33a57e36808"
    Given path 'users'
    And request {"name":"Dinesh Karthik", "gender":"male", "email":"dinesh@bcci.com", "status":"active"}
    When method Post
    Then status 201
    * def id = response.data.id

    Given path 'users/' + id
    When method Get
    Then status 200
    And match response.data.email == 'dinesh@bcci.com'
