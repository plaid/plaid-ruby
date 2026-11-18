# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about the fixed income security.
    class FixedIncome < Internal::Types::Model
      field :yield_rate, -> { Plaid::Types::YieldRate }, optional: false, nullable: true

      field :maturity_date, -> { String }, optional: false, nullable: true

      field :issue_date, -> { String }, optional: false, nullable: true

      field :face_value, -> { Float }, optional: false, nullable: true
    end
  end
end
