# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraCheckReportBaseReportGetResponse defines the response schema for `/cra/check_report/base_report/get`
    class CraCheckReportBaseReportGetResponse < Internal::Types::Model
      field :report, -> { Plaid::Types::BaseReport }, optional: false, nullable: false

      field :warnings, -> { Internal::Types::Array[Plaid::Types::BaseReportWarning] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
