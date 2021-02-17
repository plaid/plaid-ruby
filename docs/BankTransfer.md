# Plaid::BankTransfer

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Plaid’s unique identifier for a bank transfer. |  |
| **ach_class** | [**ACHClass**](ACHClass.md) |  |  |
| **account_id** | **String** | The account ID that should be credited/debited for this bank transfer. |  |
| **type** | [**BankTransferType**](BankTransferType.md) |  |  |
| **user** | [**BankTransferUser**](BankTransferUser.md) |  |  |
| **amount** | **String** | The amount of the transfer (decimal string with two digits of precision e.g. “10.00”). |  |
| **iso_currency_code** | **String** | The currency of the transfer amount, e.g. \&quot;USD\&quot; |  |
| **description** | **String** | The description of the transfer. |  |
| **created** | **String** | The datetime when this bank transfer was created. This will be of the form &#x60;2006-01-02T15:04:05Z&#x60; |  |
| **status** | [**BankTransferStatus**](BankTransferStatus.md) |  |  |
| **network** | [**BankTransferNetwork**](BankTransferNetwork.md) |  |  |
| **cancellable** | **Boolean** | When &#x60;true&#x60;, you can still cancel this bank transfer. |  |
| **failure_reason** | [**BankTransferFailure**](BankTransferFailure.md) |  | [optional] |
| **custom_tag** | **String** | A string containing the custom tag provided by the client in the create request. Will be null if not provided. | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | The Metadata object is a mapping of client-provided string fields to any string value. The following limitations apply: - The JSON values must be Strings (no nested JSON objects allowed) - Only ASCII characters may be used - Maximum of 50 key/value pairs - Maximum key length of 40 characters - Maximum value length of 500 characters  |  |
| **origination_account_id** | **String** | Plaid’s unique identifier for the origination account that was used for this transfer. |  |
| **direction** | [**BankTransferDirection**](BankTransferDirection.md) |  |  |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransfer.new(
  id: null,
  ach_class: null,
  account_id: null,
  type: null,
  user: null,
  amount: null,
  iso_currency_code: null,
  description: null,
  created: null,
  status: null,
  network: null,
  cancellable: null,
  failure_reason: null,
  custom_tag: null,
  metadata: null,
  origination_account_id: null,
  direction: null
)
```

