# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing data about the owner of the bank account for the uploaded bank statement.
    class CreditBankStatementUploadAccountOwner < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: true

      field :address, -> { Plaid::Types::CreditBankStatementUploadAccountOwnerAddress }, optional: false, nullable: false
    end
  end
end
