Feature: Check "Create a currency" feature parameters
    Check number and types of response parameters

    Scenario Outline: Check number and types of parameters in response for newly created currency
        When I send CREATE new currency request with '<api_token>' to '<URL>'
        Then I recieve status code '<status_code>'
        Then Create an elements Responce body not null and has parameters id, code, country, value which are integer, string, string, number
        Examples:
            | URL                 | status_code | api_token            |
            | /api/v1/currencies/ | 200         | tR6TI49mh4fbKAuSjm9L |

    Scenario Outline: Check status for wrong request
        When I send CREATE new currency request with wrong parameters with '<api_token>' to '<URL>'
        Then I recieve status code '<status_code>'
        Examples:
            | URL                 | status_code | api_token            |
            | /api/v1/currencies/ | 422         | tR6TI49mh4fbKAuSjm9L |