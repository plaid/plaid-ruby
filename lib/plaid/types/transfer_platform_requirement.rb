# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A piece of information that is required for originator onboarding.
    class TransferPlatformRequirement < Internal::Types::Model
      field :requirement_type, -> { String }, optional: true, nullable: false

      field :person_id, -> { String }, optional: true, nullable: true
    end
  end
end
