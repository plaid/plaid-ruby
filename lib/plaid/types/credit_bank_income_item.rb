# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details and metadata for an end user's Item.
    class CreditBankIncomeItem < Internal::Types::Model
      field :bank_income_accounts, -> { Internal::Types::Array[Plaid::Types::CreditBankIncomeAccount] }, optional: true, nullable: false

      field :bank_income_sources, -> { Internal::Types::Array[Plaid::Types::CreditBankIncomeSource] }, optional: true, nullable: false

      field :last_updated_time, -> { String }, optional: true, nullable: false

      field :institution_id, -> { String }, optional: true, nullable: false

      field :institution_name, -> { String }, optional: true, nullable: false

      field :item_id, -> { String }, optional: true, nullable: false
    end
  end
end
