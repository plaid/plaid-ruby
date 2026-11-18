# frozen_string_literal: true

module Plaid
  module MonitoringInsights
    module Types
      class CraMonitoringInsightsSubscribeRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: true, nullable: false

        field :item_id, -> { String }, optional: true, nullable: false

        field :webhook, -> { String }, optional: false, nullable: false

        field :income_categories, -> { Internal::Types::Array[Plaid::Types::CreditBankIncomeCategory] }, optional: true, nullable: true

        field :user_token, -> { String }, optional: true, nullable: false
      end
    end
  end
end
