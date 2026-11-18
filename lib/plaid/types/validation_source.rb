# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class ValidationSource < Internal::Types::Model
      field :validation_source_name, -> { String }, optional: false, nullable: true, api_name: "ValidationSourceName"

      field :validation_source_reference_identifier, -> { String }, optional: false, nullable: true, api_name: "ValidationSourceReferenceIdentifier"
    end
  end
end
