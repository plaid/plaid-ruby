# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CashflowReportGetResponse defines the response schema for `/cashflow_report/get`
    class CashflowReportGetResponse < Internal::Types::Model
      field :accounts, -> { Internal::Types::Array[Plaid::Types::BusinessAccount] }, optional: false, nullable: false

      field :transactions, -> { Internal::Types::Array[Plaid::Types::CashflowReportTransaction] }, optional: false, nullable: false

      field :total_transactions, -> { Integer }, optional: false, nullable: false

      field :item, -> { Plaid::Types::Item }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :last_successful_update_time, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
