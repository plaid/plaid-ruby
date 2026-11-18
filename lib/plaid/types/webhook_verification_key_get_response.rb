# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # WebhookVerificationKeyGetResponse defines the response schema for `/webhook_verification_key/get`
    class WebhookVerificationKeyGetResponse < Internal::Types::Model
      field :key, -> { Plaid::Types::JwkPublicKey }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
