# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A date range with a start and end date
    class DateRange < Internal::Types::Model
      field :beginning, -> { String }, optional: false, nullable: false

      field :ending, -> { String }, optional: false, nullable: false
    end
  end
end
