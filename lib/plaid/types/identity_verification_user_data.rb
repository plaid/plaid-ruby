# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The identity data that was either collected from the user or provided via API in order to perform an Identity
    # Verification.
    class IdentityVerificationUserData < Internal::Types::Model
      field :phone_number, -> { String }, optional: true, nullable: true

      field :date_of_birth, -> { String }, optional: false, nullable: true

      field :ip_address, -> { String }, optional: false, nullable: true

      field :email_address, -> { String }, optional: false, nullable: true

      field :name, -> { Plaid::Types::IdentityVerificationResponseUserName }, optional: false, nullable: true

      field :address, -> { Plaid::Types::IdentityVerificationUserAddress }, optional: false, nullable: true

      field :id_number, -> { Plaid::Types::UserIDNumber }, optional: false, nullable: true
    end
  end
end
