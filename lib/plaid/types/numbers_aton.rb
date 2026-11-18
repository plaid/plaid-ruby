# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Identifying information for transferring holdings to an investment account via ATON.
    class NumbersAton < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :account, -> { String }, optional: false, nullable: false
    end
  end
end
