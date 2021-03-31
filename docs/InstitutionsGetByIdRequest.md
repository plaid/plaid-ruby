# Plaid::InstitutionsGetByIdRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
| **institution_id** | **String** | The ID of the institution to get details about |  |
| **country_codes** | [**Array&lt;CountryCode&gt;**](CountryCode.md) | Specify an array of Plaid-supported country codes this institution supports, using the ISO-3166-1 alpha-2 country code standard.  |  |
| **options** | [**InstitutionsGetByIdRequestOptions**](InstitutionsGetByIdRequestOptions.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::InstitutionsGetByIdRequest.new(
  client_id: null,
  secret: null,
  institution_id: null,
  country_codes: null,
  options: null
)
```

