# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ServiceProductFulfillmentIdentifier
      extend Plaid::Internal::Types::Enum

      VOA = "VOA"
      VOE = "VOE"
    end
  end
end
