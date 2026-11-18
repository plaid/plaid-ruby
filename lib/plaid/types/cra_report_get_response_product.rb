# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Per-product report data, selected by the `product` discriminator.
    class CraReportGetResponseProduct < Internal::Types::Model
      extend Plaid::Internal::Types::Union

      discriminant :product

      member -> { Plaid::Types::CraReportGetQualifyResponseProduct }, key: "CRA_QUALIFY"

      member -> { Plaid::Types::CraReportGetIncomeInsightsResponseProduct }, key: "CRA_INCOME_INSIGHTS"

      member -> { Plaid::Types::CraReportGetHomeLendingResponseProduct }, key: "CRA_HOME_LENDING"

      member -> { Plaid::Types::CraReportGetHomeLendingVoaResponseProduct }, key: "CRA_HOME_LENDING_VOA"

      member -> { Plaid::Types::CraReportGetCashflowInsightsResponseProduct }, key: "CRA_CASHFLOW_INSIGHTS"

      member -> { Plaid::Types::CraReportGetNetworkInsightsResponseProduct }, key: "CRA_NETWORK_INSIGHTS"

      member -> { Plaid::Types::CraReportGetLendScoreResponseProduct }, key: "CRA_LEND_SCORE"

      member -> { Plaid::Types::CraReportGetBaseReportResponseProduct }, key: "CRA_BASE_REPORT"

      member -> { Plaid::Types::CraReportGetLendScoreCompleteResponseProduct }, key: "CRA_LEND_SCORE_COMPLETE"

      member -> { Plaid::Types::CraReportGetIncomeCompleteResponseProduct }, key: "CRA_INCOME_COMPLETE"

      member -> { Plaid::Types::CraReportGetPrismResponseProduct }, key: "CRA_PRISM"

      member -> { Plaid::Types::CraReportGetUltraFicoResponseProduct }, key: "CRA_ULTRAFICO"
    end
  end
end
