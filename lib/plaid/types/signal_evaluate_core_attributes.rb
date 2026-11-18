# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The core attributes object contains additional data that can be used to assess the ACH return risk.
    #
    # If using a Balance-only ruleset, only `available_balance` and `current_balance` will be returned as core
    # attributes. If using a Signal Transaction Scores ruleset, over 80 core attributes will be returned. Examples of
    # attributes include:
    #
    # `available_balance` and `current_balance`: The balance in the ACH transaction funding account
    #
    # `days_since_first_plaid_connection`: The number of days since the first time the Item was connected to an
    # application via Plaid
    #
    # `plaid_connections_count_7d`: The number of times the Item has been connected to applications via Plaid over the
    # past 7 days
    #
    # `plaid_connections_count_30d`: The number of times the Item has been connected to applications via Plaid over the
    # past 30 days
    #
    # `total_plaid_connections_count`: The number of times the Item has been connected to applications via Plaid
    #
    # `is_savings_or_money_market_account`: Indicates whether the ACH transaction funding account is a savings/money
    # market account
    #
    # For the full list and detailed documentation of core attributes available, or to request that core attributes not
    # be returned, contact sales or your Plaid account manager.
    class SignalEvaluateCoreAttributes < Internal::Types::Model
      field :unauthorized_transactions_count7d, -> { Integer }, optional: true, nullable: true, api_name: "unauthorized_transactions_count_7d"

      field :unauthorized_transactions_count30d, -> { Integer }, optional: true, nullable: true, api_name: "unauthorized_transactions_count_30d"

      field :unauthorized_transactions_count60d, -> { Integer }, optional: true, nullable: true, api_name: "unauthorized_transactions_count_60d"

      field :unauthorized_transactions_count90d, -> { Integer }, optional: true, nullable: true, api_name: "unauthorized_transactions_count_90d"

      field :nsf_overdraft_transactions_count7d, -> { Integer }, optional: true, nullable: true, api_name: "nsf_overdraft_transactions_count_7d"

      field :nsf_overdraft_transactions_count30d, -> { Integer }, optional: true, nullable: true, api_name: "nsf_overdraft_transactions_count_30d"

      field :nsf_overdraft_transactions_count60d, -> { Integer }, optional: true, nullable: true, api_name: "nsf_overdraft_transactions_count_60d"

      field :nsf_overdraft_transactions_count90d, -> { Integer }, optional: true, nullable: true, api_name: "nsf_overdraft_transactions_count_90d"

      field :days_since_first_plaid_connection, -> { Integer }, optional: true, nullable: true

      field :plaid_connections_count7d, -> { Integer }, optional: true, nullable: true, api_name: "plaid_connections_count_7d"

      field :plaid_connections_count30d, -> { Integer }, optional: true, nullable: true, api_name: "plaid_connections_count_30d"

      field :total_plaid_connections_count, -> { Integer }, optional: true, nullable: true

      field :is_savings_or_money_market_account, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :total_credit_transactions_amount10d, -> { Float }, optional: true, nullable: true, api_name: "total_credit_transactions_amount_10d"

      field :total_debit_transactions_amount10d, -> { Float }, optional: true, nullable: true, api_name: "total_debit_transactions_amount_10d"

      field :p50credit_transactions_amount28d, -> { Float }, optional: true, nullable: true, api_name: "p50_credit_transactions_amount_28d"

      field :p50debit_transactions_amount28d, -> { Float }, optional: true, nullable: true, api_name: "p50_debit_transactions_amount_28d"

      field :p95credit_transactions_amount28d, -> { Float }, optional: true, nullable: true, api_name: "p95_credit_transactions_amount_28d"

      field :p95debit_transactions_amount28d, -> { Float }, optional: true, nullable: true, api_name: "p95_debit_transactions_amount_28d"

      field :days_with_negative_balance_count90d, -> { Integer }, optional: true, nullable: true, api_name: "days_with_negative_balance_count_90d"

      field :p90eod_balance30d, -> { Float }, optional: true, nullable: true, api_name: "p90_eod_balance_30d"

      field :p90eod_balance60d, -> { Float }, optional: true, nullable: true, api_name: "p90_eod_balance_60d"

      field :p90eod_balance90d, -> { Float }, optional: true, nullable: true, api_name: "p90_eod_balance_90d"

      field :p10eod_balance30d, -> { Float }, optional: true, nullable: true, api_name: "p10_eod_balance_30d"

      field :p10eod_balance60d, -> { Float }, optional: true, nullable: true, api_name: "p10_eod_balance_60d"

      field :p10eod_balance90d, -> { Float }, optional: true, nullable: true, api_name: "p10_eod_balance_90d"

      field :available_balance, -> { Float }, optional: true, nullable: true

      field :current_balance, -> { Float }, optional: true, nullable: true

      field :balance_last_updated, -> { String }, optional: true, nullable: true

      field :phone_change_count28d, -> { Integer }, optional: true, nullable: true, api_name: "phone_change_count_28d"

      field :phone_change_count90d, -> { Integer }, optional: true, nullable: true, api_name: "phone_change_count_90d"

      field :email_change_count28d, -> { Integer }, optional: true, nullable: true, api_name: "email_change_count_28d"

      field :email_change_count90d, -> { Integer }, optional: true, nullable: true, api_name: "email_change_count_90d"

      field :address_change_count28d, -> { Integer }, optional: true, nullable: true, api_name: "address_change_count_28d"

      field :address_change_count90d, -> { Integer }, optional: true, nullable: true, api_name: "address_change_count_90d"

      field :plaid_non_oauth_authentication_attempts_count3d, -> { Integer }, optional: true, nullable: true, api_name: "plaid_non_oauth_authentication_attempts_count_3d"

      field :plaid_non_oauth_authentication_attempts_count7d, -> { Integer }, optional: true, nullable: true, api_name: "plaid_non_oauth_authentication_attempts_count_7d"

      field :plaid_non_oauth_authentication_attempts_count30d, -> { Integer }, optional: true, nullable: true, api_name: "plaid_non_oauth_authentication_attempts_count_30d"

      field :failed_plaid_non_oauth_authentication_attempts_count3d, -> { Integer }, optional: true, nullable: true, api_name: "failed_plaid_non_oauth_authentication_attempts_count_3d"

      field :failed_plaid_non_oauth_authentication_attempts_count7d, -> { Integer }, optional: true, nullable: true, api_name: "failed_plaid_non_oauth_authentication_attempts_count_7d"

      field :failed_plaid_non_oauth_authentication_attempts_count30d, -> { Integer }, optional: true, nullable: true, api_name: "failed_plaid_non_oauth_authentication_attempts_count_30d"

      field :debit_transactions_count10d, -> { Integer }, optional: true, nullable: true, api_name: "debit_transactions_count_10d"

      field :credit_transactions_count10d, -> { Integer }, optional: true, nullable: true, api_name: "credit_transactions_count_10d"

      field :debit_transactions_count30d, -> { Integer }, optional: true, nullable: true, api_name: "debit_transactions_count_30d"

      field :credit_transactions_count30d, -> { Integer }, optional: true, nullable: true, api_name: "credit_transactions_count_30d"

      field :debit_transactions_count60d, -> { Integer }, optional: true, nullable: true, api_name: "debit_transactions_count_60d"

      field :credit_transactions_count60d, -> { Integer }, optional: true, nullable: true, api_name: "credit_transactions_count_60d"

      field :debit_transactions_count90d, -> { Integer }, optional: true, nullable: true, api_name: "debit_transactions_count_90d"

      field :credit_transactions_count90d, -> { Integer }, optional: true, nullable: true, api_name: "credit_transactions_count_90d"

      field :total_debit_transactions_amount30d, -> { Float }, optional: true, nullable: true, api_name: "total_debit_transactions_amount_30d"

      field :total_credit_transactions_amount30d, -> { Float }, optional: true, nullable: true, api_name: "total_credit_transactions_amount_30d"

      field :total_debit_transactions_amount60d, -> { Float }, optional: true, nullable: true, api_name: "total_debit_transactions_amount_60d"

      field :total_credit_transactions_amount60d, -> { Float }, optional: true, nullable: true, api_name: "total_credit_transactions_amount_60d"

      field :total_debit_transactions_amount90d, -> { Float }, optional: true, nullable: true, api_name: "total_debit_transactions_amount_90d"

      field :total_credit_transactions_amount90d, -> { Float }, optional: true, nullable: true, api_name: "total_credit_transactions_amount_90d"

      field :p50eod_balance30d, -> { Float }, optional: true, nullable: true, api_name: "p50_eod_balance_30d"

      field :p50eod_balance60d, -> { Float }, optional: true, nullable: true, api_name: "p50_eod_balance_60d"

      field :p50eod_balance90d, -> { Float }, optional: true, nullable: true, api_name: "p50_eod_balance_90d"

      field :p50eod_balance31d_to60d, -> { Float }, optional: true, nullable: true, api_name: "p50_eod_balance_31d_to_60d"

      field :p50eod_balance61d_to90d, -> { Float }, optional: true, nullable: true, api_name: "p50_eod_balance_61d_to_90d"

      field :p90eod_balance31d_to60d, -> { Float }, optional: true, nullable: true, api_name: "p90_eod_balance_31d_to_60d"

      field :p90eod_balance61d_to90d, -> { Float }, optional: true, nullable: true, api_name: "p90_eod_balance_61d_to_90d"

      field :p10eod_balance31d_to60d, -> { Float }, optional: true, nullable: true, api_name: "p10_eod_balance_31d_to_60d"

      field :p10eod_balance61d_to90d, -> { Float }, optional: true, nullable: true, api_name: "p10_eod_balance_61d_to_90d"

      field :transactions_last_updated, -> { String }, optional: true, nullable: true

      field :is_account_closed, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :is_account_frozen_or_restricted, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :distinct_ip_addresses_count3d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_ip_addresses_count_3d"

      field :distinct_ip_addresses_count7d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_ip_addresses_count_7d"

      field :distinct_ip_addresses_count30d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_ip_addresses_count_30d"

      field :distinct_ip_addresses_count90d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_ip_addresses_count_90d"

      field :distinct_user_agents_count3d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_user_agents_count_3d"

      field :distinct_user_agents_count7d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_user_agents_count_7d"

      field :distinct_user_agents_count30d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_user_agents_count_30d"

      field :distinct_user_agents_count90d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_user_agents_count_90d"

      field :distinct_ssl_tls_connection_sessions_count3d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_ssl_tls_connection_sessions_count_3d"

      field :distinct_ssl_tls_connection_sessions_count7d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_ssl_tls_connection_sessions_count_7d"

      field :distinct_ssl_tls_connection_sessions_count30d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_ssl_tls_connection_sessions_count_30d"

      field :distinct_ssl_tls_connection_sessions_count90d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_ssl_tls_connection_sessions_count_90d"

      field :days_since_account_opening, -> { Integer }, optional: true, nullable: true

      field :balance_to_transaction_amount_ratio, -> { Float }, optional: true, nullable: true
    end
  end
end
