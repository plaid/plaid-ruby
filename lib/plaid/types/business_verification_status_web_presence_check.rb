# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BusinessVerificationStatusWebPresenceCheck
      extend Plaid::Internal::Types::Enum

      ACTIVE = "active"
      SUCCESS = "success"
      FAILED = "failed"
      NOT_APPLICABLE = "not_applicable"
    end
  end
end
