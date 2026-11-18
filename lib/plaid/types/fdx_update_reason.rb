# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module FdxUpdateReason
      extend Plaid::Internal::Types::Enum

      BUSINESS_RULE = "BUSINESS_RULE"
      SECURITY_EVENT = "SECURITY_EVENT"
      USER_ACTION = "USER_ACTION"
      OTHER = "OTHER"
    end
  end
end
