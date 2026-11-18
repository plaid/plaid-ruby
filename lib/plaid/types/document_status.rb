# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module DocumentStatus
      extend Plaid::Internal::Types::Enum

      SUCCESS = "success"
      FAILED = "failed"
      MANUALLY_APPROVED = "manually_approved"
    end
  end
end
