# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PlaidLendScoreVersion
      extend Plaid::Internal::Types::Enum

      V20 = "v2.0"
      LS1 = "LS1"
    end
  end
end
