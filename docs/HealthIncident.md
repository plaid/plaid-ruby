# Plaid::HealthIncident

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **String** | The start date of the incident, in ISO 8601 format, e.g. &#x60;\&quot;2020-10-30T15:26:48Z\&quot;&#x60;. | [optional] |
| **end_date** | **String** | The end date of the incident, in ISO 8601 format, e.g. &#x60;\&quot;2020-10-30T15:26:48Z\&quot;&#x60;. | [optional] |
| **title** | **String** | The title of the incident | [optional] |
| **incident_updates** | [**Array&lt;IncidentUpdate&gt;**](IncidentUpdate.md) | Updates on the health incident. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::HealthIncident.new(
  start_date: null,
  end_date: null,
  title: null,
  incident_updates: null
)
```

