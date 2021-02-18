# Plaid::Transaction

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **transaction_type** | **String** | Please use the &#x60;payment_channel&#x60; field, &#x60;transaction_type&#x60; will be deprecated in the future.  &#x60;digital:&#x60; transactions that took place online.  &#x60;place:&#x60; transactions that were made at a physical location.  &#x60;special:&#x60; transactions that relate to banks, e.g. fees or deposits.  &#x60;unresolved:&#x60; transactions that do not fit into the other three types.  | [optional] |
| **transaction_id** | **String** | The unique ID of the transaction. Like all Plaid identifiers, the &#x60;transaction_id&#x60; is case sensitive. |  |
| **account_owner** | **String** | The name of the account owner. This field is not typically populated and only relevant when dealing with sub-accounts. | [optional] |
| **pending_transaction_id** | **String** | The ID of a posted transaction&#39;s associated pending transaction, where applicable. | [optional] |
| **pending** | **Boolean** | When &#x60;true&#x60;, identifies the transaction as pending or unsettled. Pending transaction details (name, type, amount, category ID) may change before they are settled. |  |
| **payment_channel** | **String** | The channel used to make a payment. &#x60;online:&#x60; transactions that took place online.  &#x60;in store:&#x60; transactions that were made at a physical location.  &#x60;other:&#x60; transactions that relate to banks, e.g. fees or deposits.  This field replaces the &#x60;transaction_type&#x60; field.  | [optional] |
| **payment_meta** | [**PaymentMeta**](PaymentMeta.md) |  | [optional] |
| **name** | **String** | The merchant name or transaction description.  If the &#x60;transaction&#x60; object was returned by a Transactions endpoint such as &#x60;/transactions/get&#x60;, this field will always appear. If the &#x60;transaction&#x60; object was returned by an Assets endpoint such as &#x60;/asset_report/get/&#x60; or &#x60;/asset_report/pdf/get&#x60;, this field will only appear in an Asset Report with Insights. | [optional] |
| **merchant_name** | **String** | The merchant name, as extracted by Plaid from the &#x60;name&#x60; field. | [optional] |
| **location** | [**Location**](Location.md) |  | [optional] |
| **authorized_date** | **String** | The date that the transaction was authorized. Dates are returned in an ISO 8601 format ( &#x60;YYYY-MM-DD&#x60; ). | [optional] |
| **date** | **String** | For pending transactions, the date that the transaction occurred; for posted transactions, the date that the transaction posted. Both dates are returned in an ISO 8601 format ( &#x60;YYYY-MM-DD&#x60; ). |  |
| **category_id** | **String** | The ID of the category to which this transaction belongs. See [Categories](https://plaid.com/docs/#category-overview).  If the &#x60;transaction&#x60; object was returned by an Assets endpoint such as &#x60;/asset_report/get/&#x60; or &#x60;/asset_report/pdf/get&#x60;, this field will only appear in an Asset Report with Insights. | [optional] |
| **category** | **Array&lt;String&gt;** | A hierarchical array of the categories to which this transaction belongs. See [Categories](https://plaid.com/docs/#category-overview).  If the &#x60;transaction&#x60; object was returned by an Assets endpoint such as &#x60;/asset_report/get/&#x60; or &#x60;/asset_report/pdf/get&#x60;, this field will only appear in an Asset Report with Insights. | [optional] |
| **unofficial_currency_code** | **String** | The unofficial currency code associated with the transaction. Always &#x60;null&#x60; if &#x60;iso_currency_code&#x60; is non-&#x60;null&#x60;. Unofficial currency codes are used for currencies that do not have official ISO currency codes, such as cryptocurrencies and the currencies of certain countries.  See the [currency code schema](/docs/api/accounts#currency-code-schema) for a full listing of supported &#x60;iso_currency_code&#x60;s. | [optional] |
| **iso_currency_code** | **String** | The ISO-4217 currency code of the transaction. Always &#x60;null&#x60; if &#x60;unofficial_currency_code&#x60; is non-null. | [optional] |
| **amount** | **Float** | The settled value of the transaction, denominated in the account&#39;s currency, as stated in &#x60;iso_currency_code&#x60; or &#x60;unofficial_currency_code&#x60;. Positive values when money moves out of the account; negative values when money moves in. For example, debit card purchases are positive; credit card payments, direct deposits, and refunds are negative. |  |
| **account_id** | **String** | The ID of the account in which this transaction occurred. |  |
| **transaction_code** | [**TransactionCode**](TransactionCode.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::Transaction.new(
  transaction_type: null,
  transaction_id: null,
  account_owner: null,
  pending_transaction_id: null,
  pending: null,
  payment_channel: null,
  payment_meta: null,
  name: null,
  merchant_name: null,
  location: null,
  authorized_date: null,
  date: null,
  category_id: null,
  category: null,
  unofficial_currency_code: null,
  iso_currency_code: null,
  amount: null,
  account_id: null,
  transaction_code: null
)
```

