# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CashflowReportRefreshResponse defines the response schema for `/cashflow_report/refresh`
    class CashflowReportRefreshResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
