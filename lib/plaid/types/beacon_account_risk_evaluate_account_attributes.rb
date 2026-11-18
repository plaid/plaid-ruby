# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The attributes object contains data that can be used to assess account risk. Examples of data include:
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
    # For the full list and detailed documentation of core attributes available, or to request that core attributes not
    # be returned, contact sales or your Plaid account manager
    class BeaconAccountRiskEvaluateAccountAttributes < Internal::Types::Model
      field :days_since_first_plaid_connection, -> { Integer }, optional: true, nullable: true

      field :is_account_closed, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :is_account_frozen_or_restricted, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :total_plaid_connections_count, -> { Integer }, optional: true, nullable: true

      field :plaid_connections_count7d, -> { Integer }, optional: true, nullable: true, api_name: "plaid_connections_count_7d"

      field :plaid_connections_count30d, -> { Integer }, optional: true, nullable: true, api_name: "plaid_connections_count_30d"

      field :failed_plaid_non_oauth_authentication_attempts_count3d, -> { Integer }, optional: true, nullable: true, api_name: "failed_plaid_non_oauth_authentication_attempts_count_3d"

      field :plaid_non_oauth_authentication_attempts_count3d, -> { Integer }, optional: true, nullable: true, api_name: "plaid_non_oauth_authentication_attempts_count_3d"

      field :failed_plaid_non_oauth_authentication_attempts_count7d, -> { Integer }, optional: true, nullable: true, api_name: "failed_plaid_non_oauth_authentication_attempts_count_7d"

      field :plaid_non_oauth_authentication_attempts_count7d, -> { Integer }, optional: true, nullable: true, api_name: "plaid_non_oauth_authentication_attempts_count_7d"

      field :failed_plaid_non_oauth_authentication_attempts_count30d, -> { Integer }, optional: true, nullable: true, api_name: "failed_plaid_non_oauth_authentication_attempts_count_30d"

      field :plaid_non_oauth_authentication_attempts_count30d, -> { Integer }, optional: true, nullable: true, api_name: "plaid_non_oauth_authentication_attempts_count_30d"

      field :distinct_ip_addresses_count3d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_ip_addresses_count_3d"

      field :distinct_ip_addresses_count7d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_ip_addresses_count_7d"

      field :distinct_ip_addresses_count30d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_ip_addresses_count_30d"

      field :distinct_ip_addresses_count90d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_ip_addresses_count_90d"

      field :distinct_user_agents_count3d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_user_agents_count_3d"

      field :distinct_user_agents_count7d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_user_agents_count_7d"

      field :distinct_user_agents_count30d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_user_agents_count_30d"

      field :distinct_user_agents_count90d, -> { Integer }, optional: true, nullable: true, api_name: "distinct_user_agents_count_90d"

      field :address_change_count28d, -> { Integer }, optional: true, nullable: true, api_name: "address_change_count_28d"

      field :email_change_count28d, -> { Integer }, optional: true, nullable: true, api_name: "email_change_count_28d"

      field :phone_change_count28d, -> { Integer }, optional: true, nullable: true, api_name: "phone_change_count_28d"

      field :address_change_count90d, -> { Integer }, optional: true, nullable: true, api_name: "address_change_count_90d"

      field :email_change_count90d, -> { Integer }, optional: true, nullable: true, api_name: "email_change_count_90d"

      field :phone_change_count90d, -> { Integer }, optional: true, nullable: true, api_name: "phone_change_count_90d"

      field :days_since_account_opening, -> { Integer }, optional: true, nullable: true

      field :days_since_first_observed_transaction, -> { Integer }, optional: true, nullable: true
    end
  end
end
