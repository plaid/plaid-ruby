# Plaid::InstitutionsGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
| **count** | **Integer** | The total number of Institutions to return. |  |
| **offset** | **Integer** | The number of Institutions to skip. |  |
| **country_codes** | [**Array&lt;CountryCode&gt;**](CountryCode.md) | Specify an array of Plaid-supported country codes this institution supports, using the ISO-3166-1 alpha-2 country code standard.  |  |
| **options** | [**InstitutionsGetRequestOptions**](InstitutionsGetRequestOptions.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::InstitutionsGetRequest.new(
  client_id: null,
  secret: null,
  count: null,
  offset: null,
  country_codes: null,
  options: null
)
```

