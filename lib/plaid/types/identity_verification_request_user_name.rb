# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # You can use this field to pre-populate the user's legal name; if it is provided here, they will not be prompted to
    # enter their name in the identity verification attempt.
    class IdentityVerificationRequestUserName < Internal::Types::Model
      field :given_name, -> { String }, optional: false, nullable: false

      field :family_name, -> { String }, optional: false, nullable: false
    end
  end
end
