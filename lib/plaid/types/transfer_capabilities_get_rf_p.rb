# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains the supported service types in RfP
    class TransferCapabilitiesGetRfP < Internal::Types::Model
      field :debit, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :max_amount, -> { String }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: true, nullable: true
    end
  end
end
