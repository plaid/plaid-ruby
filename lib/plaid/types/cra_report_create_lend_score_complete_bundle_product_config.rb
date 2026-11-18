# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Requests the given version of the LendScore Complete product bundle, which combines LendScore with the Cashflow
    # Insights and Network Insights attributes it was computed from. The Items and accounts used to generate it are
    # returned only when the report's `scope` is `CLIENT_USER`.
    class CraReportCreateLendScoreCompleteBundleProductConfig < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :options, -> { Plaid::Types::CraReportCreateLendScoreCompleteOptions }, optional: true, nullable: true
    end
  end
end
