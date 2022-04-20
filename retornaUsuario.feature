Feature: Pesquisar usuário
    Como um gestor da API C.R.U.D
    Desejo buscar as informações de um usuário
    Para verificar as informações cadastradas
     
    Scenario: Procura usuário existente
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
        And path "users"
        And path variavel
        When method get
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
        And match response contains { name: "Elma Chips", email: "elma@example.com"}
        * def variavel = response.id
        And path "users"
        And path variavel
        And method delete     


    Scenario: Procura usuário com bad request
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        And path "6e09181e-e890-4a76-9ff8-19cd9e"
        When method get
        Then status 400

    Scenario: Procura usuário inexistente
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        And path "6e09181e-e890-4a76-9ff8-19cd9eb57155"
        When method get
        Then status 404        
             
