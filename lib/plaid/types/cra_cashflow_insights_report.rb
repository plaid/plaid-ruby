# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains data for the CRA Cashflow Insights Report.
    class CraCashflowInsightsReport < Internal::Types::Model
      field :report_id, -> { String }, optional: false, nullable: false

      field :generated_time, -> { String }, optional: false, nullable: false

      field :attributes, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
