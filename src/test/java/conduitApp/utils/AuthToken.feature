Feature: Authorization Token

Scenario: Get Auth Token
    * url 'https://conduit-api.bondaracademy.com/api' 
    Given path 'users/login'
    And request {"user": {"email": "karateEmail@email.com","password": "karate123" }}
    When method POST
    Then status 200
     * def authToken = response.user.token