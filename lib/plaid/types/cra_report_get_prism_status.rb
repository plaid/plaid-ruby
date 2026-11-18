# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraReportGetPrismStatus
      extend Plaid::Internal::Types::Enum

      SUCCESS = "SUCCESS"
      PARTIAL_SUCCESS = "PARTIAL_SUCCESS"
      ERROR = "ERROR"
    end
  end
end
