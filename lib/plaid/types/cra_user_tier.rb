# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraUserTier
      extend Plaid::Internal::Types::Enum

      FREE = "free"
      PAID = "paid"
    end
  end
end
