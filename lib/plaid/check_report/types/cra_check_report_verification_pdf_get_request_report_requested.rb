# frozen_string_literal: true

require_relative "../../../plaid"

module Plaid
  module CheckReport
    module Types
      module CraCheckReportVerificationPdfGetRequestReportRequested
        extend Plaid::Internal::Types::Enum

        VOA = "voa"
        EMPLOYMENT_REFRESH = "employment_refresh"
        INCOME = "income"
      end
    end
  end
end
