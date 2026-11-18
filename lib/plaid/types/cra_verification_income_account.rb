# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Account information within the Home Lending Income Report.
    class CraVerificationIncomeAccount < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :mask, -> { String }, optional: false, nullable: true

      field :metadata, -> { Plaid::Types::CraBankIncomeAccountMetadata }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :official_name, -> { String }, optional: false, nullable: true

      field :subtype, -> { Plaid::Types::AccountSubtype }, optional: false, nullable: true

      field :type, -> { Plaid::Types::AccountType }, optional: false, nullable: false
    end
  end
end
