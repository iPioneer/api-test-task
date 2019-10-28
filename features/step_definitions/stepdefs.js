const { Given, When, Then } = require('cucumber');
const expect = require('chai').expect;
const assert = require('chai').assert;
const supertest = require('supertest');
const random_word = require('./../utilities/random_word.js')
api = supertest('http://qa-test.cloudbeds.com/app_dev.php');

When('I send get request with parameter {string} with {string} to {string}', async function (currency_id, apiToken, requestUrl) {
    this.response = await api.get(requestUrl + currency_id)
        .set('Accept', 'application/json')
        .set('Authorization', apiToken);
});

When('I send request to {string} with {string}', async function (requestUrl, apiToken) {
    this.requestUrl = requestUrl;
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


When('I send CREATE new currency request with wrong parameters with {string} to {string}', async function (api_token, requestUrl) {

    let code = random_word(5);
    let country = random_word(5);


    this.response = await api.post(requestUrl)
        .set('Accept', 'application/json')
        .set('Authorization', api_token)
        .send({
            code: code,
            country: country,
            value: null
        })
});

When('I send CREATE new currency request with {string} to {string}', async function (api_token, requestUrl) {

    let code = random_word(5);
    let country = random_word(5);

    this.response = await api.post(requestUrl)
        .set('Accept', 'application/json')
        .set('Authorization', api_token)
        .send({
            code: code,
            country: country,
            value: 7
        })
});


//ToDo - Check last
When('I send DELETE last item in the list request with {string} to {string}', async function (api_token, requestUrl) {
    let resp = await api.get(requestUrl)
        .set('Accept', 'application/json')
        .set('Authorization', api_token);

    let res = resp.body._collection
    let lastElementId = res[res.length - 1].id

    this.response = await api.delete(requestUrl + lastElementId)
        .set('Accept', 'application/json')
        .set('Authorization', api_token)

});


Then('Get all elements Responce body not null and first element has parameters id, code, country, value which are integer, string, string, number', function () {
    let res = this.response.body._collection
    expect(res.length).to.not.equal(null);
    expect(res[0]).to.have.property('id');
    expect(res[0].id).to.not.equal(null);
    expect(Number.isInteger(res[0].id)).to.be.true;

    expect(res[0]).to.have.property('code');
    expect(res[0].code).to.not.equal(null);
    expect(typeof (res[0].code) === 'string').to.be.true;

    expect(res[0]).to.have.property('country');
    expect(res[0].country).to.not.equal(null);
    expect(typeof (res[0].country) === 'string').to.be.true;

    expect(res[0]).to.have.property('value');
    expect(res[0].value).to.not.equal(null);
    expect(typeof (res[0].value) === 'number').to.be.true;
});

Then('Get all elements Responce body not null and all elements have parameters id, code, country, value which are integer, string, string, number', function () {
    let res = this.response.body._collection
    if (res.length) {
        res.forEach(element => {
            try {
                expect(element).to.have.property('id');
                expect(element.id).to.not.equal(null);
                expect(Number.isInteger(element.id)).to.be.true;

                expect(element).to.have.property('code');
                expect(element.code).to.not.equal(null);
                expect(typeof (element.code) === 'string').to.be.true;

                expect(element).to.have.property('country');
                expect(element.country).to.not.equal(null);
                expect(typeof (element.country) === 'string').to.be.true;

                expect(element).to.have.property('value');
                expect(element.value).to.not.equal(null);
                expect(typeof (element.value) === 'number').to.be.true;
            } catch (error) {
                console.error(error);
            }
        });
    }
});

Then('Get an element Responce body not null and has parameters id, code, country, value which are integer, string, string, number', function () {
    let res = this.response.body
    expect(res).to.not.equal(null);
    expect(res).to.have.property('id');
    expect(res.id).to.not.equal(null);
    expect(Number.isInteger(res.id)).to.be.true;

    expect(res).to.have.property('code');
    expect(res.code).to.not.equal(null);
    expect(typeof (res.code) === 'string').to.be.true;

    expect(res).to.have.property('country');
    expect(res.country).to.not.equal(null);
    expect(typeof (res.country) === 'string').to.be.true;

    expect(res).to.have.property('value');
    expect(res.value).to.not.equal(null);
    expect(typeof (res.value) === 'number').to.be.true;
});

Then('Create an elements Responce body not null and has parameters id, code, country, value which are integer, string, string, number', function () {
    let res = this.response.body
    expect(res).to.not.equal(null);
    expect(res).to.have.property('id');
    expect(res.id).to.not.equal(null);
    expect(Number.isInteger(res.id)).to.be.true;

    expect(res).to.have.property('code');
    expect(res.code).to.not.equal(null);
    expect(typeof (res.code) === 'string').to.be.true;

    expect(res).to.have.property('country');
    expect(res.country).to.not.equal(null);
    expect(typeof (res.country) === 'string').to.be.true;

    expect(res).to.have.property('value');
    expect(res.value).to.not.equal(null);
    expect(typeof (res.value) === 'number').to.be.true;
});

Then('Get all elements Responce body not null and without restricted parameters', function () {
    let res = this.response.body._collection;
    let req = this.requestUrl;
    if (res.length) {
        res.forEach(element => {
            try {
                if (req.includes('id')) {
                    expect(element).to.have.property('id');
                    expect(element.id).to.not.equal(null);
                    expect(Number.isInteger(element.id)).to.be.true;

                } else if (req.includes('code')) {
                    expect(element).to.have.property('code');
                    expect(element.code).to.not.equal(null);
                    expect(typeof (element.code) === 'string').to.be.true;

                } else if (req.includes('country')) {
                    expect(element).to.have.property('country');
                    expect(element.country).to.not.equal(null);
                    expect(typeof (element.country) === 'string').to.be.true;

                } else if (req.includes('value')) {
                    expect(element).to.have.property('value');
                    expect(element.value).to.not.equal(null);
                    expect(typeof (element.value) === 'number').to.be.true;
                }
            } catch (error) {
                console.error(error);
            }
        });
    }





});