# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Metadata that captures what specific payment configurations an institution supports when making Payment Initiation
    # requests.
    class PaymentInitiationMetadata < Internal::Types::Model
      field :supports_international_payments, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :supports_sepa_instant, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :maximum_payment_amount, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false

      field :supports_refund_details, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :standing_order_metadata, -> { Plaid::Types::PaymentInitiationStandingOrderMetadata }, optional: true, nullable: true

      field :supports_payment_consents, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :supports_commercial_payment_consents, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
