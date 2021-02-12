# Plaid::IncomeVerificationStatusWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_type** | **String** | &#x60;\&quot;INCOME\&quot;&#x60; |  |
| **webhook_code** | **String** | &#x60;income_verification&#x60; |  |
| **income_verification_id** | **String** | The &#x60;income_verification_id&#x60; of the verification instance whose status is being reported. |  |
| **verification_status** | **String** | &#x60;VERIFICATION_STATUS_PROCESSING_COMPLETE&#x60;: The income verification status processing has completed.  &#x60;VERIFICATION_STATUS_UPLOAD_ERROR&#x60;: An upload error occurred when the end user attempted to upload their verification documentation.  &#x60;VERIFICATION_STATUS_INVALID_TYPE&#x60;: The end user attempted to upload verification documentation in an unsupported file format.  &#x60;VERIFICATION_STATUS_DOCUMENT_REJECTED&#x60;: The documentation uploaded by the end user was recognized as a supported file format, but not recognized as a valid paystub.  &#x60;VERIFICATION_STATUS_PROCESSING_FAILED&#x60;: A failure occurred when attempting to process the verification documentation. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::IncomeVerificationStatusWebhook.new(
  webhook_type: null,
  webhook_code: null,
  income_verification_id: null,
  verification_status: null
)
```

