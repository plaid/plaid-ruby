# frozen_string_literal: true

module Plaid
  module CraReport
    module Types
      class CraReportCreateRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: false, nullable: false

        field :products, -> { Internal::Types::Array[Plaid::Types::CraReportProduct] }, optional: false, nullable: false

        field :scope, -> { Plaid::CraReport::Types::CraReportCreateRequestScope }, optional: false, nullable: false

        field :decision_stage, -> { Plaid::Types::CraReportDecisionStage }, optional: false, nullable: false

        field :consumer_report_permissible_purpose, -> { Plaid::CraReport::Types::CraReportCreateRequestConsumerReportPermissiblePurpose }, optional: false, nullable: false

        field :client_report_id, -> { String }, optional: true, nullable: true

        field :days_requested, -> { Integer }, optional: true, nullable: true

        field :days_required, -> { Integer }, optional: true, nullable: true

        field :include_investments, -> { Internal::Types::Boolean }, optional: true, nullable: true

        field :include_identity_match, -> { Internal::Types::Boolean }, optional: true, nullable: true

        field :webhook, -> { String }, optional: true, nullable: false
      end
    end
  end
end
