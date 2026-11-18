# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing data about a user's bank account related to an uploaded bank statement.
    class CreditBankStatementUploadBankAccount < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: true

      field :bank_name, -> { String }, optional: false, nullable: true

      field :account_type, -> { String }, optional: false, nullable: true

      field :account_number, -> { String }, optional: false, nullable: true

      field :owner, -> { Plaid::Types::CreditBankStatementUploadAccountOwner }, optional: false, nullable: false

      field :periods, -> { Internal::Types::Array[Plaid::Types::CreditBankStatementUploadBankAccountPeriod] }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: true
    end
  end
end
