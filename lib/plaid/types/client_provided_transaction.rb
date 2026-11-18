# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A client-provided transaction for Plaid to enrich.
    class ClientProvidedTransaction < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :client_user_id, -> { String }, optional: true, nullable: false

      field :client_account_id, -> { String }, optional: true, nullable: false

      field :account_type, -> { String }, optional: true, nullable: false

      field :account_subtype, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :amount, -> { Float }, optional: false, nullable: false

      field :direction, -> { Plaid::Types::EnrichTransactionDirection }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: false

      field :location, -> { Plaid::Types::ClientProvidedTransactionLocation }, optional: true, nullable: false

      field :mcc, -> { String }, optional: true, nullable: false

      field :date_posted, -> { String }, optional: true, nullable: false
    end
  end
end
