# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AuthUpdateTypes
      extend Plaid::Internal::Types::Enum

      ACCOUNT_NUMBER = "account_number"
      ROUTING_NUMBER = "routing_number"
      ACCOUNT_NUMBER_MASK = "account_number_mask"
    end
  end
end
