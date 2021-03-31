# Plaid::Item

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **item_id** | **String** | The Plaid Item ID. The &#x60;item_id&#x60; is always unique; linking the same account at the same institution twice will result in two Items with different &#x60;item_id&#x60; values. Like all Plaid identifiers, the &#x60;item_id&#x60; is case-sensitive. |  |
| **institution_id** | **String** | The Plaid Institution ID associated with the Item. Field is &#x60;null&#x60; for Items created via Same Day Micro-deposits. | [optional] |
| **webhook** | **String** | The URL registered to receive webhooks for the Item. | [optional] |
| **error** | [**Error**](Error.md) |  | [optional] |
| **available_products** | [**Array&lt;Products&gt;**](Products.md) | A list of products available for the Item that have not yet been accessed. |  |
| **billed_products** | [**Array&lt;Products&gt;**](Products.md) | A list of products that have been billed for the Item. Note - &#x60;billed_products&#x60; is populated in all environments but only requests in Production are billed.  |  |
| **consent_expiration_time** | **String** | The RFC 3339 timestamp after which the consent provided by the end user will expire. Upon consent expiration, the item will enter the &#x60;ITEM_LOGIN_REQUIRED&#x60; error state. To circumvent the &#x60;ITEM_LOGIN_REQUIRED&#x60; error and maintain continuous consent, the end user can reauthenticate via Link’s update mode in advance of the consent expiration time.  Note - This is only relevant for European institutions subject to PSD2 regulations mandating a 90-day consent window. For all other institutions, this field will be null.  | [optional] |
| **update_type** | **String** | Indicates whether an Item requires user interaction to be updated, which can be the case for Items with some forms of two-factor authentication.  &#x60;background&#x60; - Item can be updated in the background  &#x60;requires_user_authentication&#x60; - Item requires user interaction to be updated |  |

## Example

```ruby
require 'plaid'

instance = Plaid::Item.new(
  item_id: null,
  institution_id: null,
  webhook: null,
  error: null,
  available_products: null,
  billed_products: null,
  consent_expiration_time: null,
  update_type: null
)
```

