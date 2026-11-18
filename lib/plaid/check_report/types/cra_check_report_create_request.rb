# frozen_string_literal: true

module Plaid
  module CheckReport
    module Types
      class CraCheckReportCreateRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: true, nullable: false

        field :user_token, -> { String }, optional: true, nullable: false

        field :webhook, -> { String }, optional: false, nullable: false

        field :days_requested, -> { Integer }, optional: false, nullable: false

        field :days_required, -> { Integer }, optional: true, nullable: false

        field :client_report_id, -> { String }, optional: true, nullable: true

        field :products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: true, nullable: true

        field :base_report, -> { Plaid::Types::CraCheckReportCreateBaseReportOptions }, optional: true, nullable: true

        field :cashflow_insights, -> { Plaid::Types::CraCheckReportCreateCashflowInsightsOptions }, optional: true, nullable: true

        field :partner_insights, -> { Plaid::Types::CraCheckReportCreatePartnerInsightsOptions }, optional: true, nullable: true

        field :lend_score, -> { Plaid::Types::CraCheckReportCreateLendScoreOptions }, optional: true, nullable: true

        field :network_insights, -> { Plaid::Types::CraCheckReportCreateNetworkInsightsOptions }, optional: true, nullable: true

        field :include_investments, -> { Internal::Types::Boolean }, optional: true, nullable: true

        field :income_insights, -> { Plaid::Types::CraCheckReportCreateIncomeInsightsOptions }, optional: true, nullable: true

        field :consumer_report_permissible_purpose, -> { Plaid::Types::ConsumerReportPermissiblePurpose }, optional: false, nullable: false
      end
    end
  end
end
