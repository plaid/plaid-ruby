# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The full name provided by the user. If the user has not submitted their name, this field will be null. Otherwise,
    # both fields are guaranteed to be filled.
    class IdentityVerificationResponseUserName < Internal::Types::Model
      field :given_name, -> { String }, optional: false, nullable: false

      field :family_name, -> { String }, optional: false, nullable: false
    end
  end
end
