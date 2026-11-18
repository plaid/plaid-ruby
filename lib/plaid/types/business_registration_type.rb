# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BusinessRegistrationType
      extend Plaid::Internal::Types::Enum

      DOMESTIC = "domestic"
      FOREIGN = "foreign"
      UNKNOWN = "unknown"
    end
  end
end
