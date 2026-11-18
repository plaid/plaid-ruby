# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies the report parameters for Plaid Check products, mirroring the parameters accepted on
    # `/cra/report/create`.
    class LinkTokenCreateRequestCraReportParameter < Internal::Types::Model
      field :scope, -> { Plaid::Types::LinkTokenCreateRequestCraReportParameterScope }, optional: false, nullable: false

      field :decision_stage, -> { Plaid::Types::CraReportDecisionStage }, optional: false, nullable: false

      field :client_report_id, -> { String }, optional: true, nullable: true

      field :days_requested, -> { Integer }, optional: true, nullable: true

      field :days_required, -> { Integer }, optional: true, nullable: true

      field :include_investments, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :include_identity_match, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :products, -> { Internal::Types::Array[Plaid::Types::CraReportProduct] }, optional: true, nullable: false
    end
  end
end
