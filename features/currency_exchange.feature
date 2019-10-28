Feature: Check "Currency exchange" feature parameters
    Check number and types of response parameters

    Scenario Outline: Check number and types of parameters in response for currency exchange
        When I send EXCHANGE request with parameters '<currencyFromId>', '<currencyToId>', '<amount>' with '<api_token>' to '<URL>'
        Then I recieve status code '<status_code>'
        Examples:
            | URL               | currencyFromId | currencyToId | amount | status_code | api_token            |
            | /api/v1/exchange/ | 31             | 70           | 5      | 200         | tR6TI49mh4fbKAuSjm9L |