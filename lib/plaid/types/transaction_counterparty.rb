# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The counterparty, such as the merchant or financial institution, is extracted by Plaid from the raw description.
    class TransactionCounterparty < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :entity_id, -> { String }, optional: true, nullable: true

      field :type, -> { Plaid::Types::CounterpartyType }, optional: false, nullable: false

      field :website, -> { String }, optional: false, nullable: true

      field :logo_url, -> { String }, optional: false, nullable: true

      field :confidence_level, -> { String }, optional: true, nullable: true

      field :account_numbers, -> { Plaid::Types::CounterpartyNumbers }, optional: true, nullable: true
    end
  end
end
