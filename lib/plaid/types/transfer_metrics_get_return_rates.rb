# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details regarding return rates.
    class TransferMetricsGetReturnRates < Internal::Types::Model
      field :last60d, -> { Plaid::Types::TransferMetricsGetReturnRatesOverInterval }, optional: true, nullable: true, api_name: "last_60d"
    end
  end
end
