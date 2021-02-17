# Plaid::InstitutionsGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
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

