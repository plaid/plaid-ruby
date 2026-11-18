# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The category of an income stream.
    class CashAdvanceIncomeCategory < Internal::Types::Model
      field :primary, -> { String }, optional: false, nullable: true
    end
  end
end
