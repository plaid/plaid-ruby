# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The Income Insights product at a given version, together with options for additional configuration.
    class CraIncomeInsightsProductConfig < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :options, -> { Plaid::Types::CraCheckReportCreateIncomeInsightsOptions }, optional: true, nullable: true
    end
  end
end
