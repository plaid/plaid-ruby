# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # PaymentInitiationConsentCreateResponse defines the response schema for `/payment_initiation/consent/create`
    class PaymentInitiationConsentCreateResponse < Internal::Types::Model
      field :consent_id, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::PaymentInitiationConsentStatus }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
