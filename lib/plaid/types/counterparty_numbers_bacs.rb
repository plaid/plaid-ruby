# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Identifying information for a UK bank account via Bacs.
    class CounterpartyNumbersBacs < Internal::Types::Model
      field :account, -> { String }, optional: true, nullable: true

      field :sort_code, -> { String }, optional: true, nullable: true
    end
  end
end
