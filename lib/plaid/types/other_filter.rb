# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A filter to apply to `other`-type accounts
    class OtherFilter < Internal::Types::Model
      field :account_subtypes, -> { Internal::Types::Array[Plaid::Types::OtherAccountSubtype] }, optional: false, nullable: false
    end
  end
end
