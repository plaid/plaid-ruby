# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing a Base Report
    class BaseReport < Internal::Types::Model
      field :report_id, -> { String }, optional: false, nullable: false

      field :date_generated, -> { String }, optional: false, nullable: false

      field :days_requested, -> { Float }, optional: false, nullable: false

      field :client_report_id, -> { String }, optional: true, nullable: true

      field :items, -> { Internal::Types::Array[Plaid::Types::BaseReportItem] }, optional: false, nullable: false

      field :attributes, -> { Plaid::Types::BaseReportUserAttributes }, optional: true, nullable: false
    end
  end
end
