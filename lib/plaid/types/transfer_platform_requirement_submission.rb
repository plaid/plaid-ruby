# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A single requirement submission
    class TransferPlatformRequirementSubmission < Internal::Types::Model
      field :requirement_type, -> { String }, optional: false, nullable: false

      field :value, -> { String }, optional: false, nullable: false

      field :person_id, -> { String }, optional: true, nullable: false
    end
  end
end
