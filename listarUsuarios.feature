Feature: Listar todos os usuários 
    Como um gestor da API C.R.U.D
    Desejo listar os usuários cadastrados
    Para ter o controle das informações cadastradas

    Background: Base url 
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"

    Scenario: Listar todos os usuários
        When method get
        Then status 200
        And match response == "#array"
        And match response[*].id == "#present"
        And match response[*].name == "#present"
        And match response[*].email == "#present"
        And match response[*].createdAt == "#present"
        And match response[*].updatedAt == "#present"
        And match response[*].id == "#[] #string"
        And match response[*].name == "#[] #string"
        And match response[*].email == "#[] #string"   
        And match response[*].createdAt == "#[] #string"   
        And match response[*].updatedAt == "#[] #string"      


