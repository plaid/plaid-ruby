# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Largest number of days between sequential transactions per calendar month
    class BaseReportLongestGapInsights < Internal::Types::Model
      field :start_date, -> { String }, optional: true, nullable: false

      field :end_date, -> { String }, optional: true, nullable: false

      field :days, -> { Integer }, optional: true, nullable: true
    end
  end
end
