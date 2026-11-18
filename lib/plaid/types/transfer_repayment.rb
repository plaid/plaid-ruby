# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A repayment is created automatically after one or more guaranteed transactions receive a return. If there are
    # multiple eligible returns in a day, they are batched together into a single repayment.
    #
    # Repayments are sent over ACH, with funds typically available on the next banking day.
    class TransferRepayment < Internal::Types::Model
      field :repayment_id, -> { String }, optional: false, nullable: false

      field :created, -> { String }, optional: false, nullable: false

      field :amount, -> { String }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: false
    end
  end
end
