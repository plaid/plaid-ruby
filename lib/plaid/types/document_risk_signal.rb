# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about a certain reason as to why a document could potentially be fraudulent.
    class DocumentRiskSignal < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: true

      field :field, -> { String }, optional: false, nullable: true

      field :has_fraud_risk, -> { Internal::Types::Boolean }, optional: false, nullable: true

      field :institution_metadata, -> { Plaid::Types::DocumentRiskSignalInstitutionMetadata }, optional: false, nullable: true

      field :expected_value, -> { String }, optional: false, nullable: true

      field :actual_value, -> { String }, optional: false, nullable: true

      field :signal_description, -> { String }, optional: false, nullable: true

      field :page_number, -> { Integer }, optional: false, nullable: true
    end
  end
end
