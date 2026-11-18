# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A product and its configuration, for use with CRA servicing subscription endpoints.
    class CraSubscriptionProductConfig < Internal::Types::Model
      extend Plaid::Internal::Types::Union

      discriminant :product

      member -> { Plaid::Types::CraQualifyProductConfig }, key: "CRA_QUALIFY"

      member -> { Plaid::Types::CraBaseReportProductConfig }, key: "CRA_BASE_REPORT"

      member -> { Plaid::Types::CraIncomeInsightsProductConfig }, key: "CRA_INCOME_INSIGHTS"
    end
  end
end
