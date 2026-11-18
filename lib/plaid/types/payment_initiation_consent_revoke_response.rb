# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # PaymentInitiationConsentRevokeResponse defines the response schema for `/payment_initiation/consent/revoke`
    class PaymentInitiationConsentRevokeResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: true, nullable: false
    end
  end
end
