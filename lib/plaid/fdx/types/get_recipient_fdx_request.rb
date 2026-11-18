# frozen_string_literal: true

module Plaid
  module Fdx
    module Types
      class GetRecipientFdxRequest < Internal::Types::Model
        field :recipient_id, -> { String }, optional: false, nullable: false, api_name: "recipientId"

        field :oauth_state_id, -> { String }, optional: true, nullable: false, api_name: "OAUTH-STATE-ID"
      end
    end
  end
end
