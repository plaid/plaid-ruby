# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The user's legal name, phone number, email address and address used to perform fuzzy match. If Financial Account
    # Matching is enabled in the Identity Verification product, leave this field empty to automatically match against
    # PII collected from the Identity Verification checks.
    class IdentityMatchUser < Internal::Types::Model
      field :legal_name, -> { String }, optional: true, nullable: true

      field :phone_number, -> { String }, optional: true, nullable: true

      field :email_address, -> { String }, optional: true, nullable: true

      field :address, -> { Plaid::Types::AddressDataNullableNoRequiredFields }, optional: true, nullable: true
    end
  end
end
