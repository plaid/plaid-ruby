# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about the fraud analysis performed on the document.
    class FraudAnalysisDetails < Internal::Types::Model
      field :type_supported, -> { Plaid::Types::FraudCheckOutcome }, optional: false, nullable: false

      field :portrait_presence_check, -> { Plaid::Types::FraudCheckOutcome }, optional: false, nullable: false

      field :portrait_details_check, -> { Plaid::Types::FraudCheckOutcome }, optional: false, nullable: false

      field :image_composition_check, -> { Plaid::Types::FraudCheckOutcome }, optional: false, nullable: false

      field :integrity_check, -> { Plaid::Types::FraudCheckOutcome }, optional: false, nullable: false

      field :detail_check, -> { Plaid::Types::FraudCheckOutcome }, optional: false, nullable: false

      field :issue_date_check, -> { Plaid::Types::FraudCheckOutcomeWithNoData }, optional: false, nullable: false
    end
  end
end
