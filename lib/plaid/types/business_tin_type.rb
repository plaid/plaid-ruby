# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BusinessTinType
      extend Plaid::Internal::Types::Enum

      EIN = "ein"
      SSN = "ssn"
      UNKNOWN = "unknown"
    end
  end
end
