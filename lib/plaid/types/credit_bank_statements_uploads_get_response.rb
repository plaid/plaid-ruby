# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CreditBankStatementsUploadsGetResponse defines the response schema for `/credit/bank_statements/uploads/get`
    class CreditBankStatementsUploadsGetResponse < Internal::Types::Model
      field :items, -> { Internal::Types::Array[Plaid::Types::CreditBankStatementUploadItem] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
