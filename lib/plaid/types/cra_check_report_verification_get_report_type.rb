# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraCheckReportVerificationGetReportType
      extend Plaid::Internal::Types::Enum

      VOA = "VOA"
      EMPLOYMENT_REFRESH = "EMPLOYMENT_REFRESH"
      INCOME = "INCOME"
    end
  end
end
