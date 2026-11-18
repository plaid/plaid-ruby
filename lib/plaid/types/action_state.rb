# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ActionState
      extend Plaid::Internal::Types::Enum

      UNKNOWN = "UNKNOWN"
      ATTEMPT = "ATTEMPT"
      SUCCESS = "SUCCESS"
      FAILURE = "FAILURE"
      SKIPPED = "SKIPPED"
    end
  end
end
