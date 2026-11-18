# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Additional details for receiver events. Currently always `null`.
    class ReceiverDetails < Internal::Types::Model
      field :available_balance, -> { String }, optional: false, nullable: true
    end
  end
end
