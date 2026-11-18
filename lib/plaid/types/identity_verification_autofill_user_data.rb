# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # User information that was autofilled. All this information should be confirmed by the user before using.
    class IdentityVerificationAutofillUserData < Internal::Types::Model
      field :name, -> { Plaid::Types::IdentityVerificationResponseUserName }, optional: false, nullable: true

      field :address, -> { Plaid::Types::IdentityVerificationAutofillAddress }, optional: false, nullable: true

      field :id_number, -> { Plaid::Types::UserIDNumber }, optional: false, nullable: true
    end
  end
end
