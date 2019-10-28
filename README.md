# api-test-task

To start test running print "npm test" in terminal

Test coverage:

1. Roles:

- User
  - GET List of currencies - PASSED
  - READ a currency - PASSED
  - POST Exchange currencies - FAILED

- Admin
  - GET List of currencies - PASSED
  - POST Create a currency - PASSED
  - DELETE currency - FAILED
  - READ a currency - PASSED
  - POST Exchange currencies - FAILED

2. Currency:
GET List of currencies
- Status Codes
- 200 - PASSED
- 403 - PASSED
- Parameters
  - id - integer - PASSED
  - code - string - PASSED
  - country - string - PASSED
  - value - numeric - PASSED
- Not required parameters
  - \_fields - string - PASSED
  - \_expands - string

3. POST Create a currency:
- Required parameters + code - string + country - string + value - numeric - PASSED
- Status Codes
  - 200 Return when operation success - PASSED
    - Return parameters:
      - id - integer
      - code - string
      - country - string
      - value - numeric
  - 400 Return when bad request format - PASSED
  - 403 Return when issuer had no permission for operation - PASSED
  - 422 Return when validation errors - PASSED
- Parameters
  - code - string - PASSED
  - country - string - PASSED
  - value - numeric - PASSED

4. DELETE currency:
- Required parameters
  - id
- Status codes
  - 200 Return when operation success - FAILED
  - 403 Return when issuer had no permission for operation - PASSED

5. READ currency:
- Required parameters
  - id
- Not required parameters
  - \_fields - string - PASSED
  - \_expands - string
- Status Codes
  - 200 Return when operation success - PASSED
    - Return parameters:
      - id - integer
      - code - string
      - country - string
      - value - numeric
  - 403 Return when issuer had no permission for operation - PASSED

6. POST Exchange currencies:
- Required parameters
  - currencyFromId - integer
  - currencyToId - integer
  - amount - numeric
- Status Codes
  - 200 Return when operation success - FAILED
  - 403 Return when issuer had no permission for operation - FAILED


Found issues:
1. Currency exchange doesn't work: Type error: Too few arguments... 3 passed... and exactly 4 expected (500 Internal Server Error)
2. Deletion a currency: API returns response code "204 No Content" but should response code "200 OK"
