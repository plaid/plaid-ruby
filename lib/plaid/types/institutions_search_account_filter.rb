# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An account filter to apply to institutions search requests
    class InstitutionsSearchAccountFilter < Internal::Types::Model
      field :loan, -> { Internal::Types::Array[Plaid::Types::AccountSubtype] }, optional: true, nullable: false

      field :depository, -> { Internal::Types::Array[Plaid::Types::AccountSubtype] }, optional: true, nullable: false

      field :credit, -> { Internal::Types::Array[Plaid::Types::AccountSubtype] }, optional: true, nullable: false

      field :investment, -> { Internal::Types::Array[Plaid::Types::AccountSubtype] }, optional: true, nullable: false
    end
  end
end
