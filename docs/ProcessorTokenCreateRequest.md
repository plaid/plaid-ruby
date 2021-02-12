# Plaid::ProcessorTokenCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **access_token** | **String** | The access token associated with the Item data is being requested for. |  |
| **account_id** | **String** | The &#x60;account_id&#x60; value obtained from the &#x60;onSuccess&#x60; callback in Link |  |
| **processor** | **String** | The processor you are integrating with. Valid values are &#x60;\&quot;achq\&quot;&#x60;, &#x60;\&quot;checkbook\&quot;&#x60;, &#x60;\&quot;circle\&quot;&#x60;, &#x60;\&quot;drivewealth\&quot;&#x60;, &#x60;\&quot;dwolla\&quot;&#x60;, &#x60;\&quot;galileo\&quot;&#x60;, \&quot;&#x60;interactive_brokers&#x60;\&quot;, &#x60;\&quot;modern_treasury\&quot;&#x60;, &#x60;\&quot;ocrolus\&quot;&#x60;, &#x60;\&quot;prime_trust\&quot;&#x60;, &#x60;\&quot;velox\&quot;&#x60;, &#x60;\&quot;vesta\&quot;&#x60;, &#x60;\&quot;vopay\&quot;&#x60; |  |

## Example

```ruby
require 'plaid'

instance = Plaid::ProcessorTokenCreateRequest.new(
  client_id: null,
  secret: null,
  access_token: null,
  account_id: null,
  processor: null
)
```

