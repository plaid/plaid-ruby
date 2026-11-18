# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information describing the intent of the transaction. Most relevant for personal finance use cases, but not
    # limited to such use cases.
    #
    # See the [taxonomy CSV file](https://plaid.com/documents/pfc-taxonomy-all.csv) for a full list of personal finance
    # categories. If you are migrating to personal finance categories from the legacy categories, also refer to the
    # [migration guide](https://plaid.com/docs/transactions/pfc-migration/).
    class PersonalFinanceCategory < Internal::Types::Model
      field :primary, -> { String }, optional: false, nullable: false

      field :detailed, -> { String }, optional: false, nullable: false

      field :confidence_level, -> { String }, optional: true, nullable: true

      field :version, -> { Plaid::Types::PersonalFinanceCategoryVersion }, optional: true, nullable: false
    end
  end
end
