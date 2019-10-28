Feature: Check "Delete a currency" feature parameters
    Check number and types of response parameters

    Scenario Outline: Check response code for just deleted currency
        When I send DELETE last item in the list request with '<api_token>' to '<URL>'
        Then I recieve status code '<status_code>'
        Examples:
            | URL                 | status_code | api_token            |
            | /api/v1/currencies/ | 200         | tR6TI49mh4fbKAuSjm9L |