# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Enumerates the account subtypes that the application wishes for the user to be able to select from. For more
    # details refer to Plaid documentation on account filters.
    class AccountFilter < Internal::Types::Model
      field :depository, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :credit, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :loan, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :investment, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
