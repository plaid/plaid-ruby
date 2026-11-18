# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about external payment refund
    class ExternalPaymentRefundDetails < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :iban, -> { String }, optional: false, nullable: true

      field :bacs, -> { Plaid::Types::RecipientBacsNullableInResponse }, optional: false, nullable: true
    end
  end
end
