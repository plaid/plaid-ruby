# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing a VOA report.
    class CraVoaReport < Internal::Types::Model
      field :generated_time, -> { String }, optional: false, nullable: false

      field :days_requested, -> { Float }, optional: false, nullable: false

      field :items, -> { Internal::Types::Array[Plaid::Types::CraVoaReportItem] }, optional: false, nullable: false

      field :attributes, -> { Plaid::Types::CraVoaReportAttributes }, optional: false, nullable: false
    end
  end
end
