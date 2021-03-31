# Plaid::Owner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **names** | **Array&lt;String&gt;** | A list of names associated with the account by the financial institution. These should always be the names of individuals, even for business accounts. If the name of a business is reported, please contact Plaid Support.  In the case of a joint account, the names of all account holders will be reported.  If an Item contains multiple accounts with different owner names, some institutions will report all names associated with the Item in each account&#39;s &#x60;names&#x60; array. |  |
| **phone_numbers** | [**Array&lt;PhoneNumber&gt;**](PhoneNumber.md) | A list of phone numbers associated with the account by the financial institution. May be an empty array if no relevant information is returned from the financial institution. |  |
| **emails** | [**Array&lt;Email&gt;**](Email.md) | A list of email addresses associated with the account by the financial institution. May be an empty array if no relevant information is returned from the financial institution. |  |
| **addresses** | [**Array&lt;Address&gt;**](Address.md) | Data about the various addresses associated with the account by the financial institution. May be an empty array if no relevant information is returned from the financial institution. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::Owner.new(
  names: null,
  phone_numbers: null,
  emails: null,
  addresses: null
)
```

