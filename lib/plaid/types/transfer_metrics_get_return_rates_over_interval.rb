# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details regarding return rates.
    class TransferMetricsGetReturnRatesOverInterval < Internal::Types::Model
      field :overall_return_rate, -> { String }, optional: true, nullable: false

      field :unauthorized_return_rate, -> { String }, optional: true, nullable: false

      field :administrative_return_rate, -> { String }, optional: true, nullable: false
    end
  end
end
