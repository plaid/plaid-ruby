# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module WeakAliasDetermination
      extend Plaid::Internal::Types::Enum

      NONE = "none"
      SOURCE = "source"
      PLAID = "plaid"
    end
  end
end
