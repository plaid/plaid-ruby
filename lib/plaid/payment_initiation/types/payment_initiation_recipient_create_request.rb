# frozen_string_literal: true

module Plaid
  module PaymentInitiation
    module Types
      class PaymentInitiationRecipientCreateRequest < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false

        field :iban, -> { String }, optional: true, nullable: true

        field :bacs, -> { Plaid::Types::RecipientBacsNullable }, optional: true, nullable: true

        field :address, -> { Plaid::Types::PaymentInitiationAddress }, optional: true, nullable: true
      end
    end
  end
end
