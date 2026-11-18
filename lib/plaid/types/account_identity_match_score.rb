# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Identity match scores for an account
    class AccountIdentityMatchScore < Internal::Types::Model
      field :verification_name, -> { String }, optional: true, nullable: false

      field :legal_name, -> { Plaid::Types::NameMatchScore }, optional: false, nullable: false

      field :phone_number, -> { Plaid::Types::PhoneNumberMatchScore }, optional: false, nullable: false

      field :email_address, -> { Plaid::Types::EmailAddressMatchScore }, optional: false, nullable: false

      field :address, -> { Plaid::Types::AddressMatchScore }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: false

      field :balances, -> { Plaid::Types::AccountBalance }, optional: false, nullable: false

      field :mask, -> { String }, optional: false, nullable: true

      field :name, -> { String }, optional: false, nullable: false

      field :official_name, -> { String }, optional: false, nullable: true

      field :type, -> { Plaid::Types::AccountType }, optional: false, nullable: false

      field :subtype, -> { Plaid::Types::AccountSubtype }, optional: false, nullable: true

      field :verification_status, -> { Plaid::Types::AccountBaseVerificationStatus }, optional: true, nullable: false

      field :verification_insights, -> { Plaid::Types::AccountVerificationInsights }, optional: true, nullable: true

      field :persistent_account_id, -> { String }, optional: true, nullable: false

      field :apy, -> { Float }, optional: true, nullable: true

      field :holder_category, -> { Plaid::Types::AccountHolderCategory }, optional: true, nullable: true

      field :paired_account_id, -> { String }, optional: true, nullable: true
    end
  end
end
