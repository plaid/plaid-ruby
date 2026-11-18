# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/metrics/get`
    class TransferMetricsGetResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :daily_debit_transfer_volume, -> { String }, optional: false, nullable: false

      field :daily_credit_transfer_volume, -> { String }, optional: false, nullable: false

      field :monthly_transfer_volume, -> { String }, optional: false, nullable: false

      field :monthly_debit_transfer_volume, -> { String }, optional: false, nullable: false

      field :monthly_credit_transfer_volume, -> { String }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: false

      field :return_rates, -> { Plaid::Types::TransferMetricsGetReturnRates }, optional: true, nullable: true

      field :authorization_usage, -> { Plaid::Types::TransferMetricsGetAuthorizationUsage }, optional: true, nullable: true
    end
  end
end
