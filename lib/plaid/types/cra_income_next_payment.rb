# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Metadata of the income stream's next payment.
    class CraIncomeNextPayment < Internal::Types::Model
      field :date, -> { String }, optional: false, nullable: false
    end
  end
end
