# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Attributes derived from the account's transaction-level data. May be `null` if attributes were not available.
    class CraReportGetBaseReportAccountAttributes < Internal::Types::Model
      field :is_primary_account, -> { Internal::Types::Boolean }, optional: false, nullable: true

      field :primary_account_score, -> { Float }, optional: false, nullable: true

      field :nsf_overdraft_transactions_count, -> { Integer }, optional: true, nullable: true

      field :nsf_overdraft_transactions_count30d, -> { Integer }, optional: true, nullable: true, api_name: "nsf_overdraft_transactions_count_30d"

      field :nsf_overdraft_transactions_count60d, -> { Integer }, optional: true, nullable: true, api_name: "nsf_overdraft_transactions_count_60d"

      field :nsf_overdraft_transactions_count90d, -> { Integer }, optional: true, nullable: true, api_name: "nsf_overdraft_transactions_count_90d"

      field :total_inflow_amount, -> { Plaid::Types::TotalInflowAmount }, optional: true, nullable: true

      field :total_inflow_amount30d, -> { Plaid::Types::TotalInflowAmount30D }, optional: true, nullable: true, api_name: "total_inflow_amount_30d"

      field :total_inflow_amount60d, -> { Plaid::Types::TotalInflowAmount60D }, optional: true, nullable: true, api_name: "total_inflow_amount_60d"

      field :total_inflow_amount90d, -> { Plaid::Types::TotalInflowAmount90D }, optional: true, nullable: true, api_name: "total_inflow_amount_90d"

      field :total_outflow_amount, -> { Plaid::Types::TotalOutflowAmount }, optional: true, nullable: true

      field :total_outflow_amount30d, -> { Plaid::Types::TotalOutflowAmount30D }, optional: true, nullable: true, api_name: "total_outflow_amount_30d"

      field :total_outflow_amount60d, -> { Plaid::Types::TotalOutflowAmount60D }, optional: true, nullable: true, api_name: "total_outflow_amount_60d"

      field :total_outflow_amount90d, -> { Plaid::Types::TotalOutflowAmount90D }, optional: true, nullable: true, api_name: "total_outflow_amount_90d"
    end
  end
end
