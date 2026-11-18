# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Identity Match scores for one account. Scores compare the user identity data supplied for the Link session through
    # `/link/token/create` with the account owner information from the financial institution.
    class IdentityMatchListAttemptScore < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: true

      field :legal_name, -> { Plaid::Types::NameMatchScore }, optional: false, nullable: false

      field :phone_number, -> { Plaid::Types::PhoneNumberMatchScore }, optional: false, nullable: false

      field :email_address, -> { Plaid::Types::EmailAddressMatchScore }, optional: false, nullable: false

      field :address, -> { Plaid::Types::AddressMatchScore }, optional: false, nullable: false
    end
  end
end
