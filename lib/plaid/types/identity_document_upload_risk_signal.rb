# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Risk signals tied to the document
    class IdentityDocumentUploadRiskSignal < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: true

      field :has_fraud_risk, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :signal_description, -> { String }, optional: true, nullable: true

      field :page_number, -> { Integer }, optional: true, nullable: true
    end
  end
end
