# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module FdxNotificationSeverity
      extend Plaid::Internal::Types::Enum

      EMERGENCY = "EMERGENCY"
      ALERT = "ALERT"
      WARNING = "WARNING"
      NOTICE = "NOTICE"
      INFO = "INFO"
    end
  end
end
