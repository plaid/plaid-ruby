# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraReportErrorCode
      extend Plaid::Internal::Types::Enum

      DATA_UNAVAILABLE = "DATA_UNAVAILABLE"
      INTERNAL_SERVER_ERROR = "INTERNAL_SERVER_ERROR"
    end
  end
end
