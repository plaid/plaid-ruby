# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Attributes derived from transaction-level data, aggregated across all accounts in the report. Returned for
    # successfully generated VOA reports; omitted when `metadata.report_format` is `EMPLOYMENT_REFRESH` or if the
    # product failed to generate.
    class CraReportGetHomeLendingVoaAttributes < Internal::Types::Model
      field :total_inflow_amount, -> { Plaid::Types::TotalReportInflowAmount }, optional: false, nullable: true

      field :total_outflow_amount, -> { Plaid::Types::TotalReportOutflowAmount }, optional: false, nullable: true
    end
  end
end
