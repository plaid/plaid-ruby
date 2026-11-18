# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details and metadata for an end user's Item.
    class CreditBankEmploymentItem < Internal::Types::Model
      field :item_id, -> { String }, optional: false, nullable: false

      field :last_updated_time, -> { String }, optional: false, nullable: false

      field :institution_id, -> { String }, optional: false, nullable: false

      field :institution_name, -> { String }, optional: false, nullable: false

      field :bank_employments, -> { Internal::Types::Array[Plaid::Types::CreditBankEmployment] }, optional: false, nullable: false

      field :bank_employment_accounts, -> { Internal::Types::Array[Plaid::Types::CreditBankIncomeAccount] }, optional: false, nullable: false
    end
  end
end
