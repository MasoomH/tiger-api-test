Feature: Create an Account and Add Address to the account

  # Step 1) Get token
  # Step 2) Generate an Account
  # Step 3) Add address to generate account
  Background: Create new account
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def createAccountResult = callonce read('GenerateToken.feature')
    And print createAccountResult
    * def primaryPersonId = createAccountResult.response.id
    * def token = createAccountResult.result.response.token

  Scenario: Add address to an account
    Given path '/api/accounts/add-account-address'
    Given param primaryPersonId = primaryPersonId
    Given header Authorization = "Bearer " + token
    Given request
      """
      {

       "addressType": "Home",
       "addressLine1": "2345 deer dr",
       "city": "Springfield",
       "state": "va",
       "postalCode": "22153",
       "countryCode": "12345",
       "current": true
      }
      """
    When method post
    Then staus 201
    And print response