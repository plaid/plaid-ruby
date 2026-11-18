# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Additional payment options
    class ExternalPaymentOptions < Internal::Types::Model
      field :request_refund_details, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :iban, -> { String }, optional: true, nullable: true

      field :bacs, -> { Plaid::Types::PaymentInitiationOptionalRestrictionBacs }, optional: true, nullable: true

      field :scheme, -> { Plaid::Types::PaymentScheme }, optional: true, nullable: true
    end
  end
end
