# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details regarding authorization usage.
    class TransferMetricsGetAuthorizationUsage < Internal::Types::Model
      field :daily_credit_utilization, -> { String }, optional: true, nullable: false

      field :daily_debit_utilization, -> { String }, optional: true, nullable: false

      field :monthly_credit_utilization, -> { String }, optional: true, nullable: false

      field :monthly_debit_utilization, -> { String }, optional: true, nullable: false
    end
  end
end
