# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # PaymentInitiationConsentGetResponse defines the response schema for `/payment_initiation/consent/get`
    class PaymentInitiationConsentGetResponse < Internal::Types::Model
      field :consent_id, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::PaymentInitiationConsentStatus }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :recipient_id, -> { String }, optional: false, nullable: false

      field :reference, -> { String }, optional: false, nullable: false

      field :constraints, -> { Plaid::Types::PaymentInitiationConsentConstraints }, optional: false, nullable: false

      field :scopes, -> { Internal::Types::Array[Plaid::Types::PaymentInitiationConsentScope] }, optional: true, nullable: false

      field :type, -> { Plaid::Types::PaymentInitiationConsentType }, optional: true, nullable: false

      field :payer_details, -> { Plaid::Types::ExternalPaymentRefundDetails }, optional: true, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
