# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Summary of the income sources backing the Home Lending report.
    class CraReportGetHomeLendingIncomeSources < Internal::Types::Model
      field :income_stream_count, -> { Integer }, optional: false, nullable: false

      field :income_providers, -> { Internal::Types::Array[Plaid::Types::CraBankIncomeIncomeProvider] }, optional: false, nullable: false
    end
  end
end
