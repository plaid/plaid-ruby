# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Override the `interest_rate` field. Can only be set if `type` is `loan` or `line_of_credit`.
    class LiabilityOverrideInterestRate < Internal::Types::Model
      field :percentage, -> { Float }, optional: true, nullable: false

      field :type, -> { Plaid::Types::LiabilityOverrideInterestRateType }, optional: true, nullable: false
    end
  end
end
