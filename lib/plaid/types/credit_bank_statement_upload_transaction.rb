# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing data about a transaction appearing on a user-uploaded bank statement.
    class CreditBankStatementUploadTransaction < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: true

      field :date, -> { String }, optional: false, nullable: true

      field :original_description, -> { String }, optional: false, nullable: true

      field :account_id, -> { String }, optional: false, nullable: true
    end
  end
end
