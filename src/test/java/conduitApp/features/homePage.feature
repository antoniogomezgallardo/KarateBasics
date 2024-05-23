@homePage
Feature: Home Page tests

Background:
    * url apiUrl 

@getAllTags    
Scenario: Get all tags
    Given path 'tags'
    When method GET
    Then status 200
    And match response.tags == '#array'
    And match response.tags == '#[10]'
    And match response.tags contains ['Test','Coding','Bondar Academy','Git','Zoom','YouTube','GitHub','qa career','Collaboration','Value-Focused']

@getArticles
Scenario: Get the first 5 articles
    Given path 'articles'
    And param limit = 5
    And param offset = 0
    When method GET
    Then status 200
    And match response.articles == '#array'
    And match response.articles == '#[5]'
    And match response.articlesCount == 10

