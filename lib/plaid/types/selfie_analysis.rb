# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # High level descriptions of how the associated selfie was processed. If a selfie fails verification, the details in
    # the `analysis` object should help clarify why the selfie was rejected.
    class SelfieAnalysis < Internal::Types::Model
      field :document_comparison, -> { Plaid::Types::SelfieAnalysisDocumentComparison }, optional: false, nullable: false

      field :liveness_check, -> { Plaid::Types::SelfieAnalysisLivenessCheck }, optional: false, nullable: false

      field :age_check, -> { Plaid::Types::SelfieAgeCheck }, optional: true, nullable: true

      field :facial_analysis, -> { Plaid::Types::SelfieAnalysisFacialAnalysis }, optional: true, nullable: true
    end
  end
end
