# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A client-provided transaction that Plaid has enriched.
    class ClientProvidedEnrichedTransaction < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :client_user_id, -> { String }, optional: true, nullable: false

      field :client_account_id, -> { String }, optional: true, nullable: false

      field :account_type, -> { String }, optional: true, nullable: false

      field :account_subtype, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :amount, -> { Float }, optional: false, nullable: false

      field :direction, -> { Plaid::Types::EnrichTransactionDirection }, optional: true, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: false

      field :enrichments, -> { Plaid::Types::Enrichments }, optional: false, nullable: false

      field :client_customization, -> { Plaid::Types::ClientCustomization }, optional: true, nullable: true
    end
  end
end
