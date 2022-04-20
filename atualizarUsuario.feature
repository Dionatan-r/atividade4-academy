Feature: Atualizar informações de um usuário
    Como um gestor da API C.R.U.D
    Desejo poder atualizar as informações de um usuário
    Para verificar as informações atualiadas

    Background: Base url 
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        And request
        """
                {
                    "name": "Elma Chips",
                    "email": "elma@example.com"
                }
        """
        When method post  
        * def variavel = response.id 
     
    Scenario: Atualiza informações de um usuário
        And path "users"
        And path variavel    
        And request
        """
                {
                    "name": "Elma Chips2",
                    "email": "elma2@example.com"
                }
        """
        When method put
        Then status 200
        And match response == "#object"
        And match response.id == "#present"
        And match response.name == "#present"
        And match response.email == "#present"
        And match response.createdAt == "#present"
        And match response.updatedAt == "#present"
        And match response.id == "#string"
        And match response.name == "#string"
        And match response.email == "#string"   
        And match response.createdAt == "#string"   
        And match response.updatedAt == "#string"  
        And match response contains { name: "Elma Chips2", email: "elma2@example.com"}
        * def variavel2 = response.id 
        And path "users"
        And path variavel2
        And method delete     

    Scenario: Atualiza informações de um usuário com bad request
        And path "users"
        And path variavel    
        And request
        """
                {
                    "name": "Elma Chips2",
                    "email": "elma2@example"
                }
        """
        When method put
        Then status 400
        And path "users"
        And path variavel
        And method delete  

    Scenario: Atualização usuário não existente
        And path "users/6e09181e-e890-4a76-9ff8-19cd9eb57155"
        And request
        """
                {
                 "name": "Name Surname",
                 "email": "user@example.com"
                }
        """
        When method put
        Then status 404
        And path "users"
        And path variavel
        And method delete          


