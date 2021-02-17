# Plaid::InstitutionsGetByIdRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
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

