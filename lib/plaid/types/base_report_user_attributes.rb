# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Calculated attributes derived from transaction-level data, aggregated across accounts.
    class BaseReportUserAttributes < Internal::Types::Model
      field :nsf_overdraft_transactions_count, -> { Integer }, optional: true, nullable: true

      field :nsf_overdraft_transactions_count30d, -> { Integer }, optional: true, nullable: true, api_name: "nsf_overdraft_transactions_count_30d"

      field :nsf_overdraft_transactions_count60d, -> { Integer }, optional: true, nullable: true, api_name: "nsf_overdraft_transactions_count_60d"

      field :nsf_overdraft_transactions_count90d, -> { Integer }, optional: true, nullable: true, api_name: "nsf_overdraft_transactions_count_90d"

      field :total_inflow_amount, -> { Plaid::Types::TotalReportInflowAmount }, optional: true, nullable: true

      field :total_inflow_amount30d, -> { Plaid::Types::TotalReportInflowAmount30D }, optional: true, nullable: true, api_name: "total_inflow_amount_30d"

      field :total_inflow_amount60d, -> { Plaid::Types::TotalReportInflowAmount60D }, optional: true, nullable: true, api_name: "total_inflow_amount_60d"

      field :total_inflow_amount90d, -> { Plaid::Types::TotalReportInflowAmount90D }, optional: true, nullable: true, api_name: "total_inflow_amount_90d"

      field :total_outflow_amount, -> { Plaid::Types::TotalReportOutflowAmount }, optional: true, nullable: true

      field :total_outflow_amount30d, -> { Plaid::Types::TotalReportOutflowAmount30D }, optional: true, nullable: true, api_name: "total_outflow_amount_30d"

      field :total_outflow_amount60d, -> { Plaid::Types::TotalReportOutflowAmount60D }, optional: true, nullable: true, api_name: "total_outflow_amount_60d"

      field :total_outflow_amount90d, -> { Plaid::Types::TotalReportOutflowAmount90D }, optional: true, nullable: true, api_name: "total_outflow_amount_90d"
    end
  end
end
