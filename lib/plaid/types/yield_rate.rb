# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about a fixed income security's expected rate of return.
    class YieldRate < Internal::Types::Model
      field :percentage, -> { Float }, optional: false, nullable: false

      field :type, -> { Plaid::Types::YieldRateType }, optional: false, nullable: true
    end
  end
end
