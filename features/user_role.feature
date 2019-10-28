Feature: Check "User" role permissions
    User role has permissions to 3 actions

    Scenario Outline: "USER" role has permission to get the list of currencies
        When I send request to '<URL>' with '<api_token>'
        Then I recieve status code '<status_code>'
        Examples:
            | URL                 | status_code | api_token            |
            | /api/v1/currencies/ | 200         | YECRSbpLDCXrJXCrVKOU |


    Scenario Outline: "USER" role has permission to read certain currency record
        When I send get request with parameter '<currency_id>' with '<api_token>' to '<URL>'
        Then I recieve status code '<status_code>'
        Examples:
            | URL                 | currency_id | status_code | api_token            |
            | /api/v1/currencies/ | 31          | 200         | YECRSbpLDCXrJXCrVKOU |
            | /api/v1/currencies/ | 101         | 200         | YECRSbpLDCXrJXCrVKOU |
            | /api/v1/currencies/ | 147         | 200         | YECRSbpLDCXrJXCrVKOU |
            | /api/v1/currencies/ | 10          | 404         | YECRSbpLDCXrJXCrVKOU |
            | /api/v1/currencies/ | 1000        | 404         | YECRSbpLDCXrJXCrVKOU |


    Scenario Outline: "USER" role has permission to exchange currencies
        When I send EXCHANGE request with parameters '<currencyFromId>', '<currencyToId>', '<amount>' with '<api_token>' to '<URL>'
        Then I recieve status code '<status_code>'
        Examples:
            | URL               | currencyFromId | currencyToId | amount | status_code | api_token            |
            | /api/v1/exchange/ | 32             | 71           | 10     | 200         | YECRSbpLDCXrJXCrVKOU |


    Scenario Outline: "USER" role doesn't have permission create new currency
        When I send CREATE new currency request with '<api_token>' to '<URL>'
        Then I recieve status code '<status_code>'
        Examples:
            | URL                 | status_code | api_token            |
            | /api/v1/currencies/ | 403         | YECRSbpLDCXrJXCrVKOU |
            | /api/v1/currencies/ | 403         | YECRSbpLDCXrJXCrVKOU |

    Scenario Outline: "USER" role doesn't have permission delete a currency
        When I send DELETE last item in the list request with '<api_token>' to '<URL>'
        Then I recieve status code '<status_code>'
        Examples:
            | URL                 | status_code | api_token            |
            | /api/v1/currencies/ | 403         | YECRSbpLDCXrJXCrVKOU |
            | /api/v1/currencies/ | 403         | YECRSbpLDCXrJXCrVKOU |
