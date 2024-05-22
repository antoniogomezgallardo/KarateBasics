Feature: Articles

Background: 
    * url 'https://conduit-api.bondaracademy.com/api' 

    Given path 'users/login'
    And request {"user": {"email": "karateEmail@email.com","password": "karate123" }}
    When method POST
    Then status 200
     * def token = response.user.token

Scenario: Create Article
    Given header Authorization = "Token " + token
    And path 'articles'
    When request read('createArticle.json')
    And method POST
    Then status 201
    * def slug = response.article.slug
    
    #Delete Article
    Given header Authorization = "Token " + token
    And path 'articles/' + slug
    When method DELETE 
    Then status 204



    