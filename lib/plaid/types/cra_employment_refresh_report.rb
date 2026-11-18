# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing an Employment Refresh Report.
    class CraEmploymentRefreshReport < Internal::Types::Model
      field :generated_time, -> { String }, optional: false, nullable: false

      field :days_requested, -> { Float }, optional: false, nullable: false

      field :items, -> { Internal::Types::Array[Plaid::Types::CraEmploymentRefreshReportItem] }, optional: false, nullable: false
    end
  end
end
