# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information describing the intent of the transaction. Most relevant for credit use cases, but not limited to such
    # use cases.
    #
    # See the [`taxonomy csv file`](https://plaid.com/documents/credit-category-taxonomy.csv) for a full list of credit
    # categories.
    class CreditCategory < Internal::Types::Model
      field :primary, -> { String }, optional: false, nullable: true

      field :detailed, -> { String }, optional: false, nullable: true
    end
  end
end
