# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraReportGetRequestProduct specifies one product and version requested from `/cra/report/get`, selected by the
    # `product` discriminator.
    class CraReportGetRequestProduct < Internal::Types::Model
      extend Plaid::Internal::Types::Union

      discriminant :product

      member -> { Plaid::Types::CraQualifyProduct }, key: "CRA_QUALIFY"

      member -> { Plaid::Types::CraIncomeInsightsProduct }, key: "CRA_INCOME_INSIGHTS"

      member -> { Plaid::Types::CraHomeLendingProduct }, key: "CRA_HOME_LENDING"

      member -> { Plaid::Types::CraHomeLendingVoaProduct }, key: "CRA_HOME_LENDING_VOA"

      member -> { Plaid::Types::CraBaseReportProduct }, key: "CRA_BASE_REPORT"

      member -> { Plaid::Types::CraLendScoreProduct }, key: "CRA_LEND_SCORE"

      member -> { Plaid::Types::CraCashflowInsightsProduct }, key: "CRA_CASHFLOW_INSIGHTS"

      member -> { Plaid::Types::CraNetworkInsightsProduct }, key: "CRA_NETWORK_INSIGHTS"

      member -> { Plaid::Types::CraLendScoreCompleteBundleProduct }, key: "CRA_LEND_SCORE_COMPLETE"

      member -> { Plaid::Types::CraIncomeCompleteBundleProduct }, key: "CRA_INCOME_COMPLETE"

      member -> { Plaid::Types::CraPrismProduct }, key: "CRA_PRISM"

      member -> { Plaid::Types::CraUltraFicoProduct }, key: "CRA_ULTRAFICO"
    end
  end
end
