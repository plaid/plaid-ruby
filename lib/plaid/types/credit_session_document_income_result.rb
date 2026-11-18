# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details of a document income verification in Link
    class CreditSessionDocumentIncomeResult < Internal::Types::Model
      field :num_paystubs_uploaded, -> { Integer }, optional: false, nullable: false

      field :num_w2s_uploaded, -> { Integer }, optional: false, nullable: false

      field :num_bank_statements_uploaded, -> { Integer }, optional: false, nullable: false

      field :num1099s_uploaded, -> { Integer }, optional: false, nullable: false, api_name: "num_1099s_uploaded"

      field :num_i20s_uploaded, -> { Integer }, optional: false, nullable: false
    end
  end
end
