# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module Strategy
      extend Plaid::Internal::Types::Enum

      RESET = "reset"
      INCOMPLETE = "incomplete"
      INFER = "infer"
      CUSTOM = "custom"
    end
  end
end
