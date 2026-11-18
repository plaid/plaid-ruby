# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BusinessVerificationStatusRiskCheck
      extend Plaid::Internal::Types::Enum

      ACTIVE = "active"
      SUCCESS = "success"
      FAILED = "failed"
    end
  end
end
