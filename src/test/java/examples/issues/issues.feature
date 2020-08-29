
 Feature: Issue redmine test script

   Background:
     * url 'http://localhost:8081'

   Scenario: Obtener todos los issues
     Given path 'issues.json'
     When method get
     Then status 200
     And match response.issues == '##[_ > 0]'

   Scenario: Obtener un issue por id
     Given path 'issues/2.json'
     When method get
     Then status 200

     And match response.issue.subject == '#string'
     And match response.issue.subject == 'I cannot create a user xml.'
     And match response.issue.description == 'As an admin user, I cannot create an user when xml...'


   Scenario: Crear un nuevo Issue
     * def bodyIssue =
     """
     {
      "issue": {
        "project_id": 1,
        "subject": "Mi segundo issue creado desde postman",
        "priority_id": 1
      }
     }
     """
     Given path 'issues.json'
     And header X-Redmine-API-Key = 'f04abfe57d3828d1a53df2db5699e2d108680e0b'
     And request bodyIssue
     When method post
     Then status 201

   Scenario: Crear un nuevo Issue y eliminarlo
     * def bodyIssue =
     """
     {
      "issue": {
        "project_id": 1,
        "subject": "Mi segundo issue creado desde postman",
        "priority_id": 1
      }
     }
     """
     Given path 'issues.json'
     And header X-Redmine-API-Key = 'f04abfe57d3828d1a53df2db5699e2d108680e0b'
     And request bodyIssue
     When method post
     Then status 201

     * def id = response.issue.id
     * print 'El siguiente issue fue creado: ', id

     Given path 'issues/' +id+ '.json'
     And header X-Redmine-API-Key = 'f04abfe57d3828d1a53df2db5699e2d108680e0b'
     When method delete
     Then status 204