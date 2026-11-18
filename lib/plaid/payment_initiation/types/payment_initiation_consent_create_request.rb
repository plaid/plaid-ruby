# frozen_string_literal: true

module Plaid
  module PaymentInitiation
    module Types
      class PaymentInitiationConsentCreateRequest < Internal::Types::Model
        field :recipient_id, -> { String }, optional: false, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false

        field :reference, -> { String }, optional: false, nullable: false

        field :scopes, -> { Internal::Types::Array[Plaid::Types::PaymentInitiationConsentScope] }, optional: true, nullable: false

        field :type, -> { Plaid::Types::PaymentInitiationConsentType }, optional: true, nullable: false

        field :constraints, -> { Plaid::Types::PaymentInitiationConsentConstraints }, optional: false, nullable: false

        field :options, -> { Plaid::Types::ExternalPaymentInitiationConsentOptions }, optional: true, nullable: true

        field :payer_details, -> { Plaid::Types::PaymentInitiationConsentPayerDetails }, optional: true, nullable: true
      end
    end
  end
end
