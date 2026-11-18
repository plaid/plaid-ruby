# frozen_string_literal: true

module Plaid
  module Credit
    module Types
      class CreditRelayRemoveRequest < Internal::Types::Model
        field :relay_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
