# Plaid::OwnerOverride

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **names** | **Array&lt;String&gt;** | A list of names associated with the account by the financial institution. These should always be the names of individuals, even for business accounts. Note that the same name data will be used for all accounts associated with an Item. |  |
| **phone_numbers** | [**Array&lt;PhoneNumber&gt;**](PhoneNumber.md) | A list of phone numbers associated with the account. |  |
| **emails** | [**Array&lt;Email&gt;**](Email.md) | A list of email addresses associated with the account. |  |
| **addresses** | [**Array&lt;Address&gt;**](Address.md) | Data about the various addresses associated with the account. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::OwnerOverride.new(
  names: null,
  phone_numbers: null,
  emails: null,
  addresses: null
)
```

