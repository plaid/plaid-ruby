# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing a Monitoring Insights Item
    class CraMonitoringInsightsItem < Internal::Types::Model
      field :date_generated, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :institution_id, -> { String }, optional: false, nullable: false

      field :institution_name, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::MonitoringInsightsItemStatus }, optional: false, nullable: false

      field :insights, -> { Plaid::Types::MonitoringInsights }, optional: false, nullable: true

      field :accounts, -> { Internal::Types::Array[Plaid::Types::BaseReportAccount] }, optional: true, nullable: false
    end
  end
end
