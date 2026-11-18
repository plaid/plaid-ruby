# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # PaymentInitiationRecipientGetResponse defines the response schema for `/payment_initiation/recipient/get`
    class PaymentInitiationRecipientGetResponse < Internal::Types::Model
      field :recipient_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :address, -> { Plaid::Types::PaymentInitiationAddress }, optional: true, nullable: true

      field :iban, -> { String }, optional: true, nullable: true

      field :bacs, -> { Plaid::Types::RecipientBacsNullableInResponse }, optional: true, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
