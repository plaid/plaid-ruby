# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module FdxNotificationPriority
      extend Plaid::Internal::Types::Enum

      HIGH = "HIGH"
      MEDIUM = "MEDIUM"
      LOW = "LOW"
    end
  end
end
