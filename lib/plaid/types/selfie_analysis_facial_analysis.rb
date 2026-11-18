# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analysis of the facial features of the selfie when compared to the face in the uploaded document, if one is
    # present.
    class SelfieAnalysisFacialAnalysis < Internal::Types::Model
      field :left_eye, -> { Plaid::Types::SelfieAnalysisFacialAnalysisOutcome }, optional: false, nullable: false

      field :right_eye, -> { Plaid::Types::SelfieAnalysisFacialAnalysisOutcome }, optional: false, nullable: false

      field :left_brow, -> { Plaid::Types::SelfieAnalysisFacialAnalysisOutcome }, optional: false, nullable: false

      field :right_brow, -> { Plaid::Types::SelfieAnalysisFacialAnalysisOutcome }, optional: false, nullable: false

      field :forehead, -> { Plaid::Types::SelfieAnalysisFacialAnalysisOutcome }, optional: false, nullable: false

      field :middle_forehead, -> { Plaid::Types::SelfieAnalysisFacialAnalysisOutcome }, optional: false, nullable: false

      field :nose, -> { Plaid::Types::SelfieAnalysisFacialAnalysisOutcome }, optional: false, nullable: false

      field :philtrum, -> { Plaid::Types::SelfieAnalysisFacialAnalysisOutcome }, optional: false, nullable: false

      field :mouth, -> { Plaid::Types::SelfieAnalysisFacialAnalysisOutcome }, optional: false, nullable: false

      field :jaw, -> { Plaid::Types::SelfieAnalysisFacialAnalysisOutcome }, optional: false, nullable: false

      field :left_cheek, -> { Plaid::Types::SelfieAnalysisFacialAnalysisOutcome }, optional: false, nullable: false

      field :right_cheek, -> { Plaid::Types::SelfieAnalysisFacialAnalysisOutcome }, optional: false, nullable: false
    end
  end
end
