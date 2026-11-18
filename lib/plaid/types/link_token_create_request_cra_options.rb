# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for use with Plaid Check products
    class LinkTokenCreateRequestCraOptions < Internal::Types::Model
      field :days_requested, -> { Integer }, optional: false, nullable: false

      field :days_required, -> { Integer }, optional: true, nullable: false

      field :client_report_id, -> { String }, optional: true, nullable: true

      field :partner_insights, -> { Plaid::Types::LinkTokenCreateRequestCraOptionsPartnerInsights }, optional: true, nullable: false

      field :base_report, -> { Plaid::Types::LinkTokenCreateRequestCraOptionsBaseReport }, optional: true, nullable: false

      field :cashflow_insights, -> { Plaid::Types::LinkTokenCreateRequestCraOptionsCashflowInsights }, optional: true, nullable: false

      field :lend_score, -> { Plaid::Types::LinkTokenCreateRequestCraOptionsLendScore }, optional: true, nullable: false

      field :network_insights, -> { Plaid::Types::LinkTokenCreateRequestCraOptionsNetworkInsights }, optional: true, nullable: false

      field :include_investments, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :income_insights, -> { Plaid::Types::LinkTokenCreateRequestCraOptionsIncomeInsights }, optional: true, nullable: false
    end
  end
end
