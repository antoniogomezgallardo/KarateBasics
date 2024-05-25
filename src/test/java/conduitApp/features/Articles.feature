@articles
Feature: Articles

Background: 
    * url apiUrl 
    * def createArticleBody = read('classpath:conduitApp/resources/createArticle.json')
    * def dataGenerator = Java.type('conduitApp.utils.DataGenerator')
    * def responseSchema = read("classpath:conduitApp/resources/articlesSchema.json")
    * def timeValidator = read("classpath:conduitApp/utils/timeValidator.js")

@createArticle
Scenario: Create Article

    * def randomTitle = dataGenerator.getTitle()

    Given path 'articles'
    When request {"article":{"title":#(randomTitle), "description":"bla bla", "body":"some more bla", "tagList":["bla","bla bla"]}}
    And method POST
    Then status 201
    And match response == '#object'
    And match response.article == responseSchema

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



    