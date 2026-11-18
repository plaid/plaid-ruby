# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Requests the given version of the Income Insights product, optionally configuring how it is generated.
    class CraReportCreateIncomeInsightsProductConfig < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :options, -> { Plaid::Types::CraReportCreateIncomeInsightsOptions }, optional: true, nullable: true
    end
  end
end
