# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A representation of a removed transaction
    class RemovedTransaction < Internal::Types::Model
      field :transaction_id, -> { String }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: false
    end
  end
end
