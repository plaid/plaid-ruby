# frozen_string_literal: true

module Plaid
  module Webhook
    module Types
      class WebhookVerificationKeyGetRequest < Internal::Types::Model
        field :key_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
