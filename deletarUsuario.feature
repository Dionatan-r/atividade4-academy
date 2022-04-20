Feature: Deletar informações de um usuário
    Como um gestor da API C.R.U.D
    Desejo poder deletar as informações de um usuário
    Para excluir as informações da base de dados

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
        When method delete
        Then status 204
