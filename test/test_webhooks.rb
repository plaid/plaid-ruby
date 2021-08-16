require_relative "test_helper"

# Internal: The test for Plaid::Webhooks.
class PlaidWebhooksTest < PlaidTest
  def test_get_verification_key
    key_id = "6c5516e1-92dc-479e-a8ff-5a51992e0001"

    webhook_verification_key_get_request = Plaid::WebhookVerificationKeyGetRequest.new
    webhook_verification_key_get_request.key_id = key_id

    webhook_verification_key_response = client.webhook_verification_key_get(webhook_verification_key_get_request)

    refute_empty(webhook_verification_key_response.key.to_hash)
    refute_empty(webhook_verification_key_response.key.alg)
    refute_empty(webhook_verification_key_response.key.crv)
    refute_empty(webhook_verification_key_response.key.kid)
    refute_empty(webhook_verification_key_response.key.kty)
    refute_empty(webhook_verification_key_response.key.use)
    refute_empty(webhook_verification_key_response.key.x)
    refute_empty(webhook_verification_key_response.key.y)
  end
end