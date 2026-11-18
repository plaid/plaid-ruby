# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The Partner Insights report of the bank data for an end user.
    class CraPartnerInsights < Internal::Types::Model
      field :report_id, -> { String }, optional: true, nullable: false

      field :generated_time, -> { String }, optional: true, nullable: false

      field :client_report_id, -> { String }, optional: true, nullable: true

      field :fico, -> { Plaid::Types::CraPartnerInsightsFicoResults }, optional: true, nullable: true

      field :prism, -> { Plaid::Types::CraPartnerInsightsPrism }, optional: true, nullable: true

      field :items, -> { Internal::Types::Array[Plaid::Types::CraPartnerInsightsItem] }, optional: true, nullable: false
    end
  end
end
