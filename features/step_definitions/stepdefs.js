const { Given, When, Then } = require('cucumber');
const expect = require('chai').expect;
const assert = require('chai').assert;
const supertest = require('supertest');
api = supertest('http://qa-test.cloudbeds.com/app_dev.php');

When('I send get request with parameter {string} with {string} to {string}', async function (currency_id, apiToken, requestUrl) {
    this.response = await api.get(requestUrl + currency_id)
        .set('Accept', 'application/json')
        .set('Authorization', apiToken);
});

When('I send request to {string} with {string}', async function (requestUrl, apiToken) {
    this.response = await api.get(requestUrl)
        .set('Accept', 'application/json')
        .set('Authorization', apiToken);
});


Then('I recieve status code {string}', function (statusCode, done) {
    assert.equal(this.response.status, statusCode);
    done();
});


//Exchange currencies - status code 200:
When('I send EXCHANGE request with parameters {string}, {string}, {string} with {string} to {string}', async function (curFromId, curToId, sum, api_token, requestUrl) {
    this.response = await api.post(requestUrl)
        .set('Accept', 'application/json')
        .set('Authorization', api_token)
        .send({
            currencyFromId: curFromId,
            currencyToId: curToId,
            amount: +sum
        })
});


When('I send CREATE new currency request with parameters {string}, {string}, {string} with {string} to {string}', async function (code, country, value, api_token, requestUrl) {
    this.response = await api.post(requestUrl)
        .set('Accept', 'application/json')
        .set('Authorization', api_token)
        .send({
            code: code,
            country: country,
            value: +value
        })
});

When('I send DELETE request with parameter {string} with {string} to {string}', async function (currency_id, api_token, requestUrl) {
    this.response = await api.delete(requestUrl + currency_id)
        .set('Accept', 'application/json')
        .set('Authorization', api_token)
});