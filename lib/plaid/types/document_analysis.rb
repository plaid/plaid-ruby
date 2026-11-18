# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # High level descriptions of how the associated document was processed. If a document fails verification, the
    # details in the `analysis` object should help clarify why the document was rejected.
    class DocumentAnalysis < Internal::Types::Model
      field :authenticity, -> { Plaid::Types::DocumentAuthenticityMatchCode }, optional: false, nullable: false

      field :image_quality, -> { Plaid::Types::ImageQuality }, optional: false, nullable: false

      field :extracted_data, -> { Plaid::Types::PhysicalDocumentExtractedDataAnalysis }, optional: false, nullable: true

      field :fraud_analysis_details, -> { Plaid::Types::FraudAnalysisDetails }, optional: false, nullable: true

      field :image_quality_details, -> { Plaid::Types::ImageQualityDetails }, optional: false, nullable: true

      field :human_review, -> { Plaid::Types::HumanReview }, optional: true, nullable: true

      field :aamva_verification, -> { Plaid::Types::AamvaAnalysis }, optional: false, nullable: true
    end
  end
end
