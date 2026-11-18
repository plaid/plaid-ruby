# frozen_string_literal: true

module Plaid
  module CraReport
    module Types
      class CraReportGetRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: false, nullable: false

        field :products, -> { Internal::Types::Array[Plaid::Types::CraReportGetRequestProduct] }, optional: false, nullable: false

        field :scope, -> { Plaid::Types::CraReportScope }, optional: true, nullable: false

        field :decision_stage, -> { Plaid::Types::CraReportDecisionStage }, optional: false, nullable: false

        field :consumer_report_permissible_purpose, -> { Plaid::CraReport::Types::CraReportGetRequestConsumerReportPermissiblePurpose }, optional: false, nullable: false

        field :report_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
