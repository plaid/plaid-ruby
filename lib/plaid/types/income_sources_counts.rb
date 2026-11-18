# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about the number of income sources
    class IncomeSourcesCounts < Internal::Types::Model
      field :baseline_count, -> { Float }, optional: true, nullable: true

      field :current_count, -> { Float }, optional: false, nullable: false
    end
  end
end
