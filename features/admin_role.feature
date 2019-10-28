Feature: Check "Admin" role permissions
    Admin role has permissions to 5 actions

    Scenario Outline: "ADMIN" role has permission to get the list of currencies
        When I send request to '<URL>' with '<api_token>'
        Then I recieve status code '<status_code>'
        Examples:
            | URL                 | status_code | api_token            |
            | /api/v1/currencies/ | 200         | tR6TI49mh4fbKAuSjm9L |

    Scenario Outline: "ADMIN" role has permission to read certain currency record
        When I send get request with parameter '<currency_id>' with '<api_token>' to '<URL>'
        Then I recieve status code '<status_code>'
        Examples:
            | URL                 | currency_id | status_code | api_token            |
            | /api/v1/currencies/ | 31          | 200         | tR6TI49mh4fbKAuSjm9L |
            | /api/v1/currencies/ | 101         | 200         | tR6TI49mh4fbKAuSjm9L |
            | /api/v1/currencies/ | 147         | 200         | tR6TI49mh4fbKAuSjm9L |
            | /api/v1/currencies/ | 10          | 404         | tR6TI49mh4fbKAuSjm9L |
            | /api/v1/currencies/ | 1000        | 404         | tR6TI49mh4fbKAuSjm9L |

    Scenario Outline: "ADMIN" role has permission to exchange currencies
        When I send EXCHANGE request with parameters '<currencyFromId>', '<currencyToId>', '<amount>' with '<api_token>' to '<URL>'
        Then I recieve status code '<status_code>'
        Examples:
            | URL               | currencyFromId | currencyToId | amount | status_code | api_token            |
            | /api/v1/exchange/ | 31             | 70           | 5      | 200         | tR6TI49mh4fbKAuSjm9L |

    Scenario Outline: "ADMIN" role have permission create new currency
        When I send CREATE new currency request with '<api_token>' to '<URL>'
        Then I recieve status code '<status_code>'
        Examples:
            | URL                 | status_code | api_token            |
            | /api/v1/currencies/ | 200         | tR6TI49mh4fbKAuSjm9L |

    Scenario Outline: Create new currency request with wrong parameters will be rejected
        When I send CREATE new currency request with wrong parameters with '<api_token>' to '<URL>'
        Then I recieve status code '<status_code>'
        Examples:
            | URL                 | status_code | api_token            |
            | /api/v1/currencies/ | 422         | tR6TI49mh4fbKAuSjm9L |


    Scenario Outline: "ADMIN" role have permission delete a currency
        When I send DELETE last item in the list request with '<api_token>' to '<URL>'
        Then I recieve status code '<status_code>'
        Examples:
            | URL                 | status_code | api_token            |
            | /api/v1/currencies/ | 200         | tR6TI49mh4fbKAuSjm9L |

