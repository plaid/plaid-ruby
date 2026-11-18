# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Attributes for the VOA report.
    class CraVoaReportAttributes < Internal::Types::Model
      field :total_inflow_amount, -> { Plaid::Types::TotalReportInflowAmount }, optional: false, nullable: true

      field :total_outflow_amount, -> { Plaid::Types::TotalReportOutflowAmount }, optional: false, nullable: true
    end
  end
end
