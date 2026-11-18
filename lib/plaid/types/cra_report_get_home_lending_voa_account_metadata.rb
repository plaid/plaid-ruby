# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Metadata about the financial institution data available for an account in a Home Lending VOA report. Omitted in
    # the Employment Refresh format.
    class CraReportGetHomeLendingVoaAccountMetadata < Internal::Types::Model
      field :start_date, -> { String }, optional: false, nullable: true

      field :end_date, -> { String }, optional: false, nullable: true
    end
  end
end
