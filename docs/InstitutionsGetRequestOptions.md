# Plaid::InstitutionsGetRequestOptions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **products** | [**Array&lt;Products&gt;**](Products.md) | Filter the Institutions based on which products they support.  | [optional] |
| **routing_numbers** | **Array&lt;String&gt;** | Specify an array of routing numbers to filter institutions. | [optional] |
| **oauth** | **Boolean** | Limit results to institutions with or without OAuth login flows. This is primarily relevant to institutions with European country codes. | [optional] |
| **include_optional_metadata** | **Boolean** | When &#x60;true&#x60;, return the institution&#39;s homepage URL, logo and primary brand color.  Note that Plaid does not own any of the logos shared by the API, and that by accessing or using these logos, you agree that you are doing so at your own risk and will, if necessary, obtain all required permissions from the appropriate rights holders and adhere to any applicable usage guidelines. Plaid disclaims all express or implied warranties with respect to the logos. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::InstitutionsGetRequestOptions.new(
  products: null,
  routing_numbers: null,
  oauth: null,
  include_optional_metadata: null
)
```

