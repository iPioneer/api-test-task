Feature: Check "Get a currency" feature parameters
    Check number and types of response parameters

    Scenario Outline: Check number and types of parameters in response for certain currency
        When I send get request with parameter '<currency_id>' with '<api_token>' to '<URL>'
        Then I recieve status code '<status_code>'
        Then Get an element Responce body not null and has parameters id, code, country, value which are integer, string, string, number
        Examples:
            | URL                 | currency_id | status_code | api_token            |
            | /api/v1/currencies/ | 31          | 200         | tR6TI49mh4fbKAuSjm9L |
            | /api/v1/currencies/ | 72          | 200         | tR6TI49mh4fbKAuSjm9L |


    Scenario Outline: Check status for wrong request
        When I send get request with parameter '<currency_id>' with '<api_token>' to '<URL>'
        Then I recieve status code '<status_code>'
        Examples:
            | URL                 | currency_id | status_code | api_token            |
            | /api/v1/currencies/ | 1200        | 404         | tR6TI49mh4fbKAuSjm9L |