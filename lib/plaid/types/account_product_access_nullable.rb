# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Allow the application to access specific products on this account
    class AccountProductAccessNullable < Internal::Types::Model
      field :account_data, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :statements, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :tax_documents, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
