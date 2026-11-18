# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object for `/credit/bank_statements/uploads/get` request options.
    class CreditBankStatementsUploadsGetRequestOptions < Internal::Types::Model
      field :item_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
