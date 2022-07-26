Feature: Security test. Token Generation test

  Scenario: generate token with valid username and password.
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username" : "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
    And print response

    Scenario: Generate token with Invalid Username and valid password.
		Given url "https://tek-insurance-api.azurewebsites.net"
		And path "/api/token"
		And request {"username" : "supervisor22", "password": "tek_supervisor"}
		When method post
		Then status 404
		And print response
		* def errorMessage = response.errorMessage
		And assert errorMessage == "USER_NOT_FOUND"
		
		Scenario: Generate token with valid Username and Invalid password.
		Given url "https://tek-insurance-api.azurewebsites.net"
		And path "/api/token"
		And request {"username" : "supervisor", "password": "tek_supervisor"}
		When method post
		Then status 400
		And print response
		* def errorMessage = response.errorMessage
		And assert errorMessage == "Password Not Matched"
		
		
		
		
		
		