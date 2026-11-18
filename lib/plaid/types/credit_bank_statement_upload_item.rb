# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing information about the bank statement upload Item.
    class CreditBankStatementUploadItem < Internal::Types::Model
      field :item_id, -> { String }, optional: false, nullable: false

      field :bank_statements, -> { Internal::Types::Array[Plaid::Types::CreditBankStatementUploadObject] }, optional: false, nullable: false

      field :status, -> { Plaid::Types::PayrollItemStatus }, optional: false, nullable: true

      field :updated_at, -> { String }, optional: false, nullable: true
    end
  end
end
