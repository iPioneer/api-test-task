Feature: Check "List of currencies" parameters
    Check number and types of response parameters

    Scenario Outline: Check number and types of parameters in response for 1st currency
        When I send request to '<URL>' with '<api_token>'
        Then I recieve status code '<status_code>'
        Then Get all elements Responce body not null and first element has parameters id, code, country, value which are integer, string, string, number
        Examples:
            | URL                 | status_code | api_token            |
            | /api/v1/currencies/ | 200         | tR6TI49mh4fbKAuSjm9L |

    Scenario Outline: Check number and types of parameters in response for all currencies
        When I send request to '<URL>' with '<api_token>'
        Then I recieve status code '<status_code>'
        And Get all elements Responce body not null and all elements have parameters id, code, country, value which are integer, string, string, number
        Examples:
            | URL                 | status_code | api_token            |
            | /api/v1/currencies/ | 200         | tR6TI49mh4fbKAuSjm9L |

    Scenario Outline: Check responce for request with not mandatory parameters
        When I send request to '<URL>' with '<api_token>'
        Then I recieve status code '<status_code>'
        And Get all elements Responce body not null and without restricted parameters
        Examples:
            | URL                                               | status_code | api_token            |
            | /api/v1/currencies/?_fields=id                    | 200         | tR6TI49mh4fbKAuSjm9L |
            | /api/v1/currencies/?_fields=id,code               | 200         | tR6TI49mh4fbKAuSjm9L |
            | /api/v1/currencies/?_fields=id,code,country       | 200         | tR6TI49mh4fbKAuSjm9L |
            | /api/v1/currencies/?_fields=id,code,country,value | 200         | tR6TI49mh4fbKAuSjm9L |