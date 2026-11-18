# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details regarding the number of unique loan payment merchants
    class LoanPaymentsMerchantCounts < Internal::Types::Model
      field :baseline_count, -> { Float }, optional: true, nullable: true

      field :current_count, -> { Float }, optional: false, nullable: false
    end
  end
end
