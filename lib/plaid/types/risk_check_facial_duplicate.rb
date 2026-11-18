# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Result summary object specifying values for the `facial_duplicates` attributes of risk check.
    class RiskCheckFacialDuplicate < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :similarity, -> { Integer }, optional: false, nullable: false

      field :matched_after_completed, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
