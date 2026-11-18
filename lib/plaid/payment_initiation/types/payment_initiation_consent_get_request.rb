# frozen_string_literal: true

module Plaid
  module PaymentInitiation
    module Types
      class PaymentInitiationConsentGetRequest < Internal::Types::Model
        field :consent_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
