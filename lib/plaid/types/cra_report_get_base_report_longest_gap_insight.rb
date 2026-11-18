# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The largest number of days between sequential transactions in one calendar month.
    class CraReportGetBaseReportLongestGapInsight < Internal::Types::Model
      field :start_date, -> { String }, optional: false, nullable: false

      field :end_date, -> { String }, optional: false, nullable: false

      field :days, -> { Integer }, optional: false, nullable: true
    end
  end
end
