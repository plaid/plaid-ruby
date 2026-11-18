# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # BankTransferSweep describes a sweep transfer.
    class BankTransferSweep < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :amount, -> { String }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: false
    end
  end
end
