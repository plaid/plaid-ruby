# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing data that has been parsed from a user-uploaded bank statement.
    class CreditBankStatementUploadObject < Internal::Types::Model
      field :transactions, -> { Internal::Types::Array[Plaid::Types::CreditBankStatementUploadTransaction] }, optional: false, nullable: false

      field :document_metadata, -> { Plaid::Types::CreditDocumentMetadata }, optional: false, nullable: false

      field :document_id, -> { String }, optional: false, nullable: true

      field :bank_accounts, -> { Internal::Types::Array[Plaid::Types::CreditBankStatementUploadBankAccount] }, optional: false, nullable: false
    end
  end
end
