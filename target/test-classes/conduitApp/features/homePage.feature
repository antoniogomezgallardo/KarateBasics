Feature: Home Page tests

Background:
    * url 'https://conduit-api.bondaracademy.com/api' 

Scenario: Get all tags
    Given path 'tags'
    When method GET
    Then status 200

Scenario: Get the first 10 articles
    Given path 'articles'
    And param limit = 10
    And param offset = 0
    When method GET
    Then status 200
