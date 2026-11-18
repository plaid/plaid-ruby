# frozen_string_literal: true

module Plaid
  module PaymentProfile
    module Types
      class PaymentProfileRemoveRequest < Internal::Types::Model
        field :payment_profile_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
