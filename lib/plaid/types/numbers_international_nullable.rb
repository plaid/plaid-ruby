# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Identifying information for transferring money to or from an international bank account via wire transfer.
    class NumbersInternationalNullable < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :iban, -> { String }, optional: false, nullable: true

      field :bic, -> { String }, optional: false, nullable: true
    end
  end
end
