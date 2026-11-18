# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module IsoCurrencyCode
      extend Plaid::Internal::Types::Enum

      USD = "USD"
    end
  end
end
