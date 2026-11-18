# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module EmailType
      extend Plaid::Internal::Types::Enum

      PRIMARY = "primary"
      SECONDARY = "secondary"
      OTHER = "other"
    end
  end
end
