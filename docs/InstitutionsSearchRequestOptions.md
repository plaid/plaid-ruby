# Plaid::InstitutionsSearchRequestOptions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **oauth** | **Boolean** | Limit results to institutions with or without OAuth login flows. This is primarily relevant to institutions with European country codes | [optional] |
| **include_optional_metadata** | **Boolean** | When true, return the institution&#39;s homepage URL, logo and primary brand color. Learn more | [optional] |
| **account_filter** | [**InstitutionsSearchAccountFilter**](InstitutionsSearchAccountFilter.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::InstitutionsSearchRequestOptions.new(
  oauth: null,
  include_optional_metadata: null,
  account_filter: null
)
```

