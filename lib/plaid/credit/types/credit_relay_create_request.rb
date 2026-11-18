# frozen_string_literal: true

module Plaid
  module Credit
    module Types
      class CreditRelayCreateRequest < Internal::Types::Model
        field :report_tokens, -> { Internal::Types::Array[String] }, optional: false, nullable: false

        field :secondary_client_id, -> { String }, optional: false, nullable: false

        field :webhook, -> { String }, optional: true, nullable: true
      end
    end
  end
end
