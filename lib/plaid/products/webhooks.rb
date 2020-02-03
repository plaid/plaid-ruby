module Plaid
  # Public: Class used to call the Webhooks endpoint.
  class Webhooks < BaseProduct
    # Public: Retrieve a webhook verification key.
    #
    # key_id - The key ID from the Plaid-Verification header.
    #
    # Returns a WebhookVerificationKeyGetResponse object.
    def get_verification_key(key_id)
      post_with_auth 'webhook_verification_key/get',
                     WebhookVerificationKeyGetResponse,
                     key_id: key_id
    end

    # Public: The response wrapper for /webhook_verification_key/get.
    class WebhookVerificationKeyGetResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The webhook verification key.
      property :key, coerce: Models::WebhookVerificationKey
    end
  end
end
