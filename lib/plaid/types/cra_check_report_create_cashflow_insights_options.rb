# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines configuration options to generate Cashflow Insights
    class CraCheckReportCreateCashflowInsightsOptions < Internal::Types::Model
      field :attributes_version, -> { Plaid::Types::CashflowAttributesVersion }, optional: true, nullable: true
    end
  end
end
