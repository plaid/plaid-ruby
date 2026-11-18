# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information on the ownership of an investment account
    class InvestmentsAuthOwner < Internal::Types::Model
      field :account_id, -> { String }, optional: true, nullable: false

      field :names, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
