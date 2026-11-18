# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An income stream detected for the user.
    class CraVerificationIncomeStream < Internal::Types::Model
      field :income_stream_id, -> { String }, optional: false, nullable: false

      field :start_date, -> { String }, optional: false, nullable: false

      field :end_date, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :insights, -> { Plaid::Types::CraVerificationIncomeStreamInsights }, optional: false, nullable: false

      field :income_metrics, -> { Plaid::Types::CraVerificationIncomeMetrics }, optional: false, nullable: false

      field :transactions, -> { Internal::Types::Array[Plaid::Types::CraVerificationIncomeTransaction] }, optional: false, nullable: false
    end
  end
end
