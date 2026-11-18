# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module LimitedPurposeType
      extend Plaid::Internal::Types::Enum

      RENT_MORTGAGE = "RENT_MORTGAGE"
      AUTO_LOAN = "AUTO_LOAN"
      GENERAL_PURPOSE = "GENERAL_PURPOSE"
    end
  end
end
