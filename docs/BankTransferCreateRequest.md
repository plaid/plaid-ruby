# Plaid::BankTransferCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **idempotency_key** | **String** | A random key provided by the client, per unique bank transfer. Maximum of 50 characters.  The API supports idempotency for safely retrying requests without accidentally performing the same operation twice. For example, if a request to create a bank transfer fails due to a network connection error, you can retry the request with the same idempotency key to guarantee that only a single bank transfer is created. |  |
| **access_token** | **String** | The Plaid &#x60;access_token&#x60; for the account that will be debited or credited. |  |
| **account_id** | **String** | The Plaid &#x60;account_id&#x60; for the account that will be debited or credited. |  |
| **type** | [**BankTransferType**](BankTransferType.md) |  |  |
| **network** | [**BankTransferNetwork**](BankTransferNetwork.md) |  |  |
| **amount** | **String** | The transfer amount (decimal string with two digits of precision e.g. \&quot;10.00\&quot;). |  |
| **iso_currency_code** | **String** | The currency of the transfer amount – should be set to \&quot;USD\&quot;. |  |
| **description** | **String** | The transfer description. Maximum of 10 characters. |  |
| **ach_class** | [**ACHClass**](ACHClass.md) |  | [optional] |
| **user** | [**BankTransferUser**](BankTransferUser.md) |  |  |
| **custom_tag** | **String** | An arbitrary string provided by the client for storage with the bank transfer. Will be returned in all &#x60;BankTransfer&#x60; objects. May be up to 100 characters. | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | The Metadata object is a mapping of client-provided string fields to any string value. The following limitations apply: - The JSON values must be Strings (no nested JSON objects allowed) - Only ASCII characters may be used - Maximum of 50 key/value pairs - Maximum key length of 40 characters - Maximum value length of 500 characters  | [optional] |
| **origination_account_id** | **String** | Plaid’s unique identifier for the origination account for this transfer. If you have more than one origination account, this value must be specified. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransferCreateRequest.new(
  client_id: null,
  secret: null,
  idempotency_key: null,
  access_token: null,
  account_id: null,
  type: null,
  network: null,
  amount: null,
  iso_currency_code: null,
  description: null,
  ach_class: null,
  user: null,
  custom_tag: null,
  metadata: null,
  origination_account_id: null
)
```

