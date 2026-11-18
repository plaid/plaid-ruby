# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information describing the intent of the transaction. Most relevant for business finance use cases, but not
    # limited to such use cases.
    class BusinessFinanceCategory < Internal::Types::Model
      field :primary, -> { String }, optional: false, nullable: false

      field :detailed, -> { String }, optional: false, nullable: false

      field :confidence_level, -> { String }, optional: true, nullable: true
    end
  end
end
