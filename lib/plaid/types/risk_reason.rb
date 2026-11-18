# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # This object includes a code and description to describe medium risk transactions and above on
    # `/accounts/balance/get`.
    class RiskReason < Internal::Types::Model
      field :code, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false
    end
  end
end
