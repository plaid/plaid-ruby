# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Metadata on whether this income transaction is an outlier.
    class CraVerificationIncomeTransactionOutlier < Internal::Types::Model
      field :is_outlier, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :amount, -> { Float }, optional: true, nullable: true
    end
  end
end
