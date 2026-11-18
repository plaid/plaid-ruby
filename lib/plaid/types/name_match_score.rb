# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Score found by matching name provided by the API with the name on the account at the financial institution. If the
    # account contains multiple owners, the maximum match score is filled.
    class NameMatchScore < Internal::Types::Model
      field :score, -> { Integer }, optional: false, nullable: true

      field :is_first_name_or_last_name_match, -> { Internal::Types::Boolean }, optional: false, nullable: true

      field :is_nickname_match, -> { Internal::Types::Boolean }, optional: false, nullable: true

      field :is_business_name_detected, -> { Internal::Types::Boolean }, optional: false, nullable: true
    end
  end
end
