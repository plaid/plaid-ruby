# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # PaymentInitiationRecipient defines a payment initiation recipient
    class PaymentInitiationRecipient < Internal::Types::Model
      field :recipient_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :address, -> { Plaid::Types::PaymentInitiationAddress }, optional: true, nullable: true

      field :iban, -> { String }, optional: true, nullable: true

      field :bacs, -> { Plaid::Types::RecipientBacsNullableInResponse }, optional: true, nullable: true
    end
  end
end
