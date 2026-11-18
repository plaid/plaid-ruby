# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PrismCashScoreVersion
      extend Plaid::Internal::Types::Enum

      FOUR1 = "4.1"
      FOUR = "4"
      THREE_LITE = "3_lite"
      THREE = "3"
    end
  end
end
