Feature: Test API Endpoint

Scenario: Generate token with Invalid Username and valid password.
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username" : "supervisor22", "password": "tek_supervisor"}
When method post
Then status 404
And print response
 

# Status code should be 404 not found. and print the reponse.