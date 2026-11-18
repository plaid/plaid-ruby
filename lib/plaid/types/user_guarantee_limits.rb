# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The user's Guaranteed ACH debit limits. Daily, weekly, and monthly limits are configured ceilings, not remaining
    # capacity. Each rolling limit is `null` when no ceiling is enabled for that window.
    class UserGuaranteeLimits < Internal::Types::Model
      field :transaction_limit, -> { Plaid::Types::UserGuaranteeLimitsTransactionLimit }, optional: false, nullable: false

      field :daily_limit, -> { Plaid::Types::UserTransferLimitAmountNullable }, optional: false, nullable: true

      field :weekly_limit, -> { Plaid::Types::UserTransferLimitAmountNullable }, optional: false, nullable: true

      field :monthly_limit, -> { Plaid::Types::UserTransferLimitAmountNullable }, optional: false, nullable: true
    end
  end
end
