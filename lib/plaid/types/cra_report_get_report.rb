# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The Consumer Report returned by `/cra/report/get`.
    class CraReportGetReport < Internal::Types::Model
      field :report_id, -> { String }, optional: false, nullable: true

      field :client_report_id, -> { String }, optional: false, nullable: true

      field :retrieved_time, -> { String }, optional: false, nullable: false

      field :scope, -> { Plaid::Types::CraReportScope }, optional: false, nullable: false

      field :decision_stage, -> { Plaid::Types::CraReportDecisionStage }, optional: false, nullable: false

      field :consumer_report_permissible_purpose, -> { Plaid::Types::CraReportGetReportConsumerReportPermissiblePurpose }, optional: false, nullable: false

      field :products, -> { Internal::Types::Array[Plaid::Types::CraReportGetResponseProduct] }, optional: false, nullable: false
    end
  end
end
