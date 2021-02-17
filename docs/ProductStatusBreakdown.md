# Plaid::ProductStatusBreakdown

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **success** | **Float** | The percentage of login attempts that are successful, expressed as a decimal. |  |
| **error_plaid** | **Float** | The percentage of logins that are failing due to an internal Plaid issue, expressed as a decimal.  |  |
| **error_institution** | **Float** | The percentage of logins that are failing due to an issue in the institution&#39;s system, expressed as a decimal. |  |
| **refresh_interval** | **String** | The &#x60;refresh_interval&#x60; may be &#x60;DELAYED&#x60; or &#x60;STOPPED&#x60; even when the success rate is high. This value is only returned for Transactions status breakdowns. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::ProductStatusBreakdown.new(
  success: null,
  error_plaid: null,
  error_institution: null,
  refresh_interval: null
)
```

