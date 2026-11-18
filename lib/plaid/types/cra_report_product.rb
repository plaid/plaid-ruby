# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A Plaid Check product and version to generate for the report, with the options that apply to that product,
    # selected by the `product` field.
    class CraReportProduct < Internal::Types::Model
      extend Plaid::Internal::Types::Union

      discriminant :product

      member -> { Plaid::Types::CraReportCreateBaseReportProductConfig }, key: "CRA_BASE_REPORT"

      member -> { Plaid::Types::CraReportCreateCashflowInsightsProductConfig }, key: "CRA_CASHFLOW_INSIGHTS"

      member -> { Plaid::Types::CraReportCreateHomeLendingProductConfig }, key: "CRA_HOME_LENDING"

      member -> { Plaid::Types::CraReportCreateHomeLendingVoaProductConfig }, key: "CRA_HOME_LENDING_VOA"

      member -> { Plaid::Types::CraReportCreateIncomeInsightsProductConfig }, key: "CRA_INCOME_INSIGHTS"

      member -> { Plaid::Types::CraReportCreateLendScoreProductConfig }, key: "CRA_LEND_SCORE"

      member -> { Plaid::Types::CraReportCreateNetworkInsightsProductConfig }, key: "CRA_NETWORK_INSIGHTS"

      member -> { Plaid::Types::CraReportCreatePrismProductConfig }, key: "CRA_PRISM"

      member -> { Plaid::Types::CraReportCreateUltraFicoProductConfig }, key: "CRA_ULTRAFICO"

      member -> { Plaid::Types::CraReportCreateQualifyProductConfig }, key: "CRA_QUALIFY"

      member -> { Plaid::Types::CraReportCreateLendScoreCompleteBundleProductConfig }, key: "CRA_LEND_SCORE_COMPLETE"

      member -> { Plaid::Types::CraReportCreateIncomeCompleteBundleProductConfig }, key: "CRA_INCOME_COMPLETE"
    end
  end
end
