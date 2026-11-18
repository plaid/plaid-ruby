# frozen_string_literal: true

module Plaid
  module PaymentInitiation
    module Types
      class PaymentInitiationRecipientGetRequest < Internal::Types::Model
        field :recipient_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
