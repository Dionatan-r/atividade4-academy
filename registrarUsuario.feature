Feature: Registrar um novo usuário
    Como um gestor da API C.R.U.D
    Desejo registrar um novo usuário
    Para ter acesso as informações cadastradas do novo usuário

    Background: Base url 
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"

    Scenario: Registra um novo usuário
        And request
        """
                {
                    "name": "Elma Chips",
                    "email": "elma@example.com"
                }
        """        
        When method post
        Then status 201
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

    Scenario: Tentativa de registro com informações faltantes (name)
        And request
        """
                {
                    "email": "elma@example.com"
                }
        """        
        When method post
        Then status 400

    Scenario: Tentativa de registro com informações faltantes (email)
        And request
        """
                {
                    "name": "Elma Chips"
                }
        """        
        When method post
        Then status 400    

    Scenario: Tentativa de registro com email sem formato aceito 
        And request
        """
                {
                    "name": "Elma Chips",
                    "email": "elma@example"
                }
        """        
        When method post
        Then status 400   

    Scenario: Registro com nome com 100 caracteres
        And request
        """
                {
                    "name": "elmaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                    "email": "elma2@example.com"
                }
        """        
        When method post
        Then status 201
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
        And match response contains { name: "elmaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", email: "elma2@example.com"}   
        * def variavel = response.id
        And path "users"
        And path variavel
        And method delete
    
    Scenario: Tentativa de registro com nome com 101 caracteres
        And request
        """
            {
                "name": "elmaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                "email": "user@example.com"
            }
        """        
        When method post
        Then status 400
     
    Scenario: Registro com email com 60 caracteres
        And request
        """
                {
                    "name": "Elma Chipe",
                    "email": "elmaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@example.com"
                }
        """        
        When method post
        Then status 201
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
        And match response contains { name: "Elma Chipe", email: "elmaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@example.com"}   
        * def variavel = response.id
        And path "users"
        And path variavel
        And method delete

    Scenario: Tentativa de registro com email com 61 caracteres
        And request
        """
                {
                    "name": "Elma Chipe",
                    "email": "elmaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@example.com"
                }
        """        
        When method post
        Then status 400        
