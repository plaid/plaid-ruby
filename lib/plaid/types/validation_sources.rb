# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class ValidationSources < Internal::Types::Model
      field :validation_source, -> { Internal::Types::Array[Plaid::Types::ValidationSource] }, optional: false, nullable: false, api_name: "VALIDATION_SOURCE"
    end
  end
end
