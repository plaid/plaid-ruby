# Plaid::InstitutionStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **item_logins** | [**ProductStatus**](ProductStatus.md) |  |  |
| **transactions_updates** | [**ProductStatus**](ProductStatus.md) |  |  |
| **auth** | [**ProductStatus**](ProductStatus.md) |  |  |
| **balance** | [**ProductStatus**](ProductStatus.md) |  |  |
| **identity** | [**ProductStatus**](ProductStatus.md) |  |  |
| **investments_updates** | [**ProductStatus**](ProductStatus.md) |  |  |
| **health_incidents** | [**Array&lt;HealthIncident&gt;**](HealthIncident.md) | Details of recent health incidents associated with the institution. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::InstitutionStatus.new(
  item_logins: null,
  transactions_updates: null,
  auth: null,
  balance: null,
  identity: null,
  investments_updates: null,
  health_incidents: null
)
```

