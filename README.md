# Apex-Dwolla
This is an Apex wrapper for [Dwolla](https://www.dwolla.com/platform) - an ACH payment API.

Dwolla has an easy-to-use API, and it allows customers to pay a flat monthly fee rather than a percentage of all payments they receive.

A lot of companies that sell apps on the AppExchange end up using Stripe, which takes a rather significant percentage of every payment.

Their API is also complicated, brittle, and frequently update. This is my attempt to offer an alternative.

## Getting Started

These instructions will get you a copy of the project up and running on any salesforce org. I have moved all of the credentials into custom settings
so that you can point your sandbox to your Dwolla developer account and your production org to your live Dwolla account. They assume you have deployed all
of the code and metadata, and that you have a Dwolla account.

1. Navigate to the "Dwolla API Connection" custom setting and create a Default Org value
* Fill in the OAuth Key and OAuth Secret with the key and secret from your Dwolla account
* If you are pointing to a Dwolla Sandbox:
** Set OAuth Endpoint to https://sandbox.dwolla.com/oauth/v2/token
** Set API Endpoint to https://api-sandbox.dwolla.com
* If you are pointing to a live Dwolla account:
** Set OAuth Endpoint to https://www.dwolla.com/oauth/v2/token
** Set API Endpoint to https://api.dwolla.com
2. Navigate to the "Dwolla API Log Level" custom setting and create a Default Org value
* Dwolla API responses are stored in the "Dwolla API Log" object
* If you want to create a Dwolla API Log for errors only, leave "Log Errors" checked
* If you want to create a Dwolla API Log for all responses, check "Log All"
* If you don't want to save any responses, uncheck "Log Errors" and leave "Log All" unchecked
3. Navigate to the "Dwolla API Session" custom setting and create a Default Org value
* Leave all fields blank

## Authors

* **Brock Elgart** - *Initial and ongoing work* - [SystemSynthesis](http://www.systemsynthesis.io/)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
