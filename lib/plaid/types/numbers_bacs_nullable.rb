# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Identifying information for transferring money to or from a UK bank account via Bacs.
    class NumbersBacsNullable < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :account, -> { String }, optional: false, nullable: false

      field :sort_code, -> { String }, optional: false, nullable: false
    end
  end
end
