# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details of a bank income verification in Link
    class CreditSessionBankIncomeResult < Internal::Types::Model
      field :status, -> { Plaid::Types::CreditSessionBankIncomeStatus }, optional: true, nullable: false

      field :item_id, -> { String }, optional: true, nullable: false

      field :institution_id, -> { String }, optional: true, nullable: false
    end
  end
end
