# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A summary across all risk signals associated with a document
    class DocumentRiskSummary < Internal::Types::Model
      field :risk_score, -> { Float }, optional: false, nullable: true
    end
  end
end
