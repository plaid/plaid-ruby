# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A collection of objects that define specific parties to a deal. This includes the direct participating parties,
    # such as borrower and seller and the indirect parties such as the credit report provider.
    class CreditFreddieMacParties < Internal::Types::Model
      field :party, -> { Internal::Types::Array[Plaid::Types::CreditFreddieMacParty] }, optional: false, nullable: false, api_name: "PARTY"
    end
  end
end
