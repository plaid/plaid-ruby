# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Score found by matching address provided by the API with the address on the account at the financial institution.
    # The score can range from 0 to 100 where 100 is a perfect match and 0 is a no match. If the account contains
    # multiple owners, the maximum match score is filled.
    class AddressMatchScore < Internal::Types::Model
      field :score, -> { Integer }, optional: false, nullable: true

      field :is_postal_code_match, -> { Internal::Types::Boolean }, optional: false, nullable: true
    end
  end
end
