# Plaid::InstitutionsSearchRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **query** | **String** | The search query. Institutions with names matching the query are returned |  |
| **products** | [**Array&lt;Products&gt;**](Products.md) | Filter the Institutions based on whether they support all products listed in products. Provide &#x60;null&#x60; to get institutions regardless of supported products |  |
| **country_codes** | [**Array&lt;CountryCode&gt;**](CountryCode.md) | Specify an array of Plaid-supported country codes this institution supports, using the ISO-3166-1 alpha-2 country code standard.  |  |
| **options** | [**InstitutionsSearchRequestOptions**](InstitutionsSearchRequestOptions.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::InstitutionsSearchRequest.new(
  client_id: null,
  secret: null,
  query: null,
  products: null,
  country_codes: null,
  options: null
)
```

