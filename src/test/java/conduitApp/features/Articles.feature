@articles
Feature: Articles

Background: 
    * url 'https://conduit-api.bondaracademy.com/api' 
    * def authTokenResponse = callonce read('classpath:conduitApp/utils/AuthToken.feature')
    * def token = authTokenResponse.authToken
    * def createArticleBody = read('classpath:conduitApp/resources/createArticle.json')

@createArticle
Scenario: Create Article
    Given header Authorization = "Token " + token
    And path 'articles'
    When request {"article":{"title":"bla title","description":"bla bla","body":"some more bla","tagList":["bla","bla bla"]}}
    And method POST
    Then status 201

    @createAndDeleteArticle
    Scenario: Create and Delete Article
    Given header Authorization = "Token " + token
    And path 'articles'
    When request createArticleBody
    And method POST
    Then status 201
    * def slug = response.article.slug
    
    #Delete Article
    Given header Authorization = "Token " + token
    And path 'articles/' + slug
    When method DELETE 
    Then status 204



    