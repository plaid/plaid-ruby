# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ID number submitted by the user. If the user has not submitted this data yet, this field will be `null`.
    # Otherwise, both fields are guaranteed to be filled.
    class UserIDNumber < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false

      field :type, -> { Plaid::Types::IDNumberType }, optional: false, nullable: false
    end
  end
end
