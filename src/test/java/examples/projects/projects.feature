Feature: Projects redmine test script

  Background:
    * url 'http://localhost:8081'

#  Scenario Outline: Creacion de un proyecto en redmine - examples
#
#    Given path 'projects.json'
#    And header X-Redmine-API-Key = 'f04abfe57d3828d1a53df2db5699e2d108680e0b'
#    And request read('project1.json')
#    When method post
#    Then status 201
#
#    Examples:
#      | name            | identifier      | description             | inherit_members | is_public |
#      | Redmine Project | xudmaneplwafgo6 | esta es una descripcion | false           | true      |
#      | Redmine Project | xidmaneplwafgo6 | esta es una descripcion | false           | true      |

  Scenario Outline: Creacion de un proyecto en redmine - csv
    * def numberRandom = function(){return (Math.floor(Math.random() * (900000)) + 100000).toString()}
    * def identifierRandom = 'redmineproject' + numberRandom()

    Given path 'projects.json'
    And header X-Redmine-API-Key = 'f04abfe57d3828d1a53df2db5699e2d108680e0b'
    And request read('project.json')
    When method post
    Then status 201

    Examples:
      | read('projects.csv') |
