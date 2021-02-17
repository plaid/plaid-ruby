# Plaid::BankTransferListRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **start_date** | **Time** | The start datetime of bank transfers to list. This should be in RFC 3339 format (i.e. &#x60;2019-12-06T22:35:49Z&#x60;) | [optional] |
| **end_date** | **Time** | The end datetime of bank transfers to list. This should be in RFC 3339 format (i.e. &#x60;2019-12-06T22:35:49Z&#x60;) | [optional] |
| **count** | **Integer** | The maximum number of bank transfers to return. | [optional][default to 25] |
| **offset** | **Integer** | The number of bank transfers to skip before returning results. | [optional][default to 0] |
| **origination_account_id** | **String** | Filter bank transfers to only those originated through the specified origination account. | [optional] |
| **direction** | [**BankTransferDirection**](BankTransferDirection.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransferListRequest.new(
  client_id: null,
  secret: null,
  start_date: null,
  end_date: null,
  count: null,
  offset: null,
  origination_account_id: null,
  direction: null
)
```

