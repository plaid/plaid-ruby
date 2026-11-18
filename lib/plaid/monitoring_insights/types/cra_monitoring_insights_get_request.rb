# frozen_string_literal: true

module Plaid
  module MonitoringInsights
    module Types
      class CraMonitoringInsightsGetRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: true, nullable: false

        field :consumer_report_permissible_purpose, -> { Plaid::Types::MonitoringConsumerReportPermissiblePurpose }, optional: false, nullable: false

        field :user_token, -> { String }, optional: true, nullable: false
      end
    end
  end
end
