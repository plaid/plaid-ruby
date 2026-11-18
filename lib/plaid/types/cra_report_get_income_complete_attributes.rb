# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Income Complete attribute data returned by `/cra/report/get`.
    class CraReportGetIncomeCompleteAttributes < Internal::Types::Model
      field :income_insights, -> { Plaid::Types::CraReportGetIncomeInsightsAttributes }, optional: false, nullable: true
    end
  end
end
