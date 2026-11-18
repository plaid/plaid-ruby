# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The Item's bank accounts that have the selected data.
    class CreditBankIncomeAccount < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :mask, -> { String }, optional: false, nullable: true

      field :name, -> { String }, optional: false, nullable: false

      field :official_name, -> { String }, optional: false, nullable: true

      field :subtype, -> { Plaid::Types::DepositoryAccountSubtype }, optional: false, nullable: false

      field :type, -> { Plaid::Types::CreditBankIncomeAccountType }, optional: false, nullable: false

      field :owners, -> { Internal::Types::Array[Plaid::Types::Owner] }, optional: false, nullable: false
    end
  end
end
