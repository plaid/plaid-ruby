# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Indicates that Plaid's authentication process has completed for a user and that Plaid has verified that the user
    # owns their phone number. If you receive this webhook, you should skip your own OTP phone number verification flow
    # for the user, even if the user does not complete the entire Link flow. If the user doesn't complete the full Link
    # flow (as verified by your being able to successfully call `/user_account/session/get` using the `public_token`
    # from the `onSuccess` callback) it is recommended that you implement [webhook
    # verification](https://plaid.com/docs/api/webhooks/webhook-verification/) or another technique to avoid webhook
    # spoofing attacks.
    class LayerAuthenticationPassedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false

      field :link_session_id, -> { String }, optional: false, nullable: false

      field :link_token, -> { String }, optional: false, nullable: false
    end
  end
end
