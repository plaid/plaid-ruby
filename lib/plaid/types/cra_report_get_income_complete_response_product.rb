# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Income Complete data returned by `/cra/report/get`.
    class CraReportGetIncomeCompleteResponseProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :metadata, -> { Plaid::Types::CraReportGetIncomeCompleteMetadata }, optional: false, nullable: true

      field :attributes, -> { Plaid::Types::CraReportGetIncomeCompleteAttributes }, optional: false, nullable: true

      field :items, -> { Internal::Types::Array[Plaid::Types::CraReportGetIncomeCompleteItem] }, optional: false, nullable: false

      field :errors, -> { Internal::Types::Array[Plaid::Types::PlaidError] }, optional: false, nullable: false
    end
  end
end
