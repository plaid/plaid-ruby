# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # BetaCashAdvanceIncomeInsightsV1GetResponse defines the response schema for
    # `/beta/cash_advance/income_insights/v1/get`
    class BetaCashAdvanceIncomeInsightsV1GetResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :next_payment_date, -> { String }, optional: false, nullable: true

      field :next_payment_amount, -> { Float }, optional: false, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :income_streams, -> { Internal::Types::Array[Plaid::Types::CashAdvanceIncomeStream] }, optional: false, nullable: false
    end
  end
end
