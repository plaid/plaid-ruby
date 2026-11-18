# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Score found by matching phone number provided by the API with the phone number on the account at the financial
    # institution. 100 is a perfect match and 0 is a no match. If the account contains multiple owners, the maximum
    # match score is filled.
    class PhoneNumberMatchScore < Internal::Types::Model
      field :score, -> { Integer }, optional: false, nullable: true
    end
  end
end
