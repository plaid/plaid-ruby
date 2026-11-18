# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the matched direct deposit transaction used to verify a user's payroll information.
    class TransactionData < Internal::Types::Model
      field :description, -> { String }, optional: false, nullable: false

      field :amount, -> { Float }, optional: false, nullable: false

      field :date, -> { String }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: false

      field :transaction_id, -> { String }, optional: false, nullable: false
    end
  end
end
