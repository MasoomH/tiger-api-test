	@SmokeTest
	Feature: Authentication  
  
  Scenario: Generate token with Valid username and password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response.token
    
  Scenario: Generate token with Invalid username and Valid password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor7", "password": "tek_supervisor"}
    When method post
    Then status 404
    And print response.token