# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Requests the given version of the Cashflow Insights product. Cashflow Insights accepts no additional configuration
    # today.
    class CraReportCreateCashflowInsightsProductConfig < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false
    end
  end
end
