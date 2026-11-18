# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Score found by matching email provided by the API with the email on the account at the financial institution. 100
    # is a perfect match and 0 is a no match. If the account contains multiple owners, the maximum match score is
    # filled.
    class EmailAddressMatchScore < Internal::Types::Model
      field :score, -> { Integer }, optional: false, nullable: true
    end
  end
end
