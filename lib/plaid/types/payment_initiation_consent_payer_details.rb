# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the payment consent payer details.
    # Payer `name` and account `numbers` are required to lock the account to which the consent can be created.
    class PaymentInitiationConsentPayerDetails < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :numbers, -> { Plaid::Types::PaymentInitiationConsentPayerNumbers }, optional: false, nullable: false

      field :address, -> { Plaid::Types::PaymentInitiationAddress }, optional: true, nullable: true

      field :date_of_birth, -> { String }, optional: true, nullable: true

      field :phone_numbers, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :emails, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
