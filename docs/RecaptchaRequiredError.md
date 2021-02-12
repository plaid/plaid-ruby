# Plaid::RecaptchaRequiredError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **error_type** | **String** | RECAPTCHA_ERROR |  |
| **error_code** | **String** | RECAPTCHA_REQUIRED |  |
| **display_message** | **String** |  |  |
| **http_code** | **String** | 400 |  |
| **link_user_experience** | **String** | Your user will be prompted to solve a Google reCAPTCHA challenge in the Link Recaptcha pane. If they solve the challenge successfully, the user&#39;s request is resubmitted and they are directed to the next Item creation step. |  |
| **common_causes** | **String** | Plaid&#39;s fraud system detects abusive traffic and considers a variety of parameters throughout Item creation requests. When a request is considered risky or possibly fraudulent, Link presents a reCAPTCHA for the user to solve. |  |
| **troubleshooting_steps** | **String** | Link will automatically guide your user through reCAPTCHA verification. As a general rule, we recommend instrumenting basic fraud monitoring to detect and protect your website from spam and abuse.  If your user cannot verify their session, please submit a Support ticket with the following identifiers: &#x60;link_session_id&#x60; or &#x60;request_id&#x60; |  |

## Example

```ruby
require 'plaid'

instance = Plaid::RecaptchaRequiredError.new(
  error_type: null,
  error_code: null,
  display_message: null,
  http_code: null,
  link_user_experience: null,
  common_causes: null,
  troubleshooting_steps: null
)
```

