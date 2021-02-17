# Plaid::AssetReportUser

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_user_id** | **String** | An identifier you determine and submit for the user. | [optional] |
| **first_name** | **String** | The user&#39;s first name. Required for the Fannie Mae Day 1 Certainty™ program. | [optional] |
| **middle_name** | **String** | The user&#39;s middle name | [optional] |
| **last_name** | **String** | The user&#39;s last name.  Required for the Fannie Mae Day 1 Certainty™ program. | [optional] |
| **ssn** | **String** | The user&#39;s Social Security Number. Required for the Fannie Mae Day 1 Certainty™ program.  Format: \&quot;ddd-dd-dddd\&quot; | [optional] |
| **phone_number** | **String** | The user&#39;s phone number, in E.164 format: +{countrycode}{number}. For example: \&quot;+14151234567\&quot; | [optional] |
| **email** | **String** | The user&#39;s email address. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::AssetReportUser.new(
  client_user_id: null,
  first_name: null,
  middle_name: null,
  last_name: null,
  ssn: null,
  phone_number: null,
  email: null
)
```

