# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PrismExtendVersion
      extend Plaid::Internal::Types::Enum

      FOUR1 = "4.1"
      FOUR = "4"
    end
  end
end
