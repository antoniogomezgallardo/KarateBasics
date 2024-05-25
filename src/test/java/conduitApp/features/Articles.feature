@articles
Feature: Articles

Background: 
    * url apiUrl 
    * def createArticleBody = read('classpath:conduitApp/resources/createArticle.json')

@createArticle
@ignore
Scenario: Create Article

    Given path 'articles'
    When request {"article":{"title":"bla bla bla", "description":"bla bla", "body":"some more bla", "tagList":["bla","bla bla"]}}
    And method POST
    Then status 201

    @createAndDeleteArticle
    Scenario: Create and Delete Article
    Given path 'articles'
    When request createArticleBody
    And method POST
    Then status 201
    * def slug = response.article.slug
    
    #Delete Article
    Given path 'articles/' + slug
    When method DELETE 
    Then status 204



    