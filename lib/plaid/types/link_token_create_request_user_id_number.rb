# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The user's ID number. Used only for Identity Verification. If provided, the user will not be shown fields to enter
    # their ID number in the Identity Verification flow. May be omitted, but if not omitted, all fields marked as
    # required must be provided.
    class LinkTokenCreateRequestUserIDNumber < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false

      field :type, -> { Plaid::Types::IDNumberType }, optional: false, nullable: false
    end
  end
end
