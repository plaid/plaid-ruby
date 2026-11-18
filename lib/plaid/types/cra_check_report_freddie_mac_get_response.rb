# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraCheckReportFreddieMacGetResponse defines the response schema for `/cra/check_report/freddie_mac/get`
    class CraCheckReportFreddieMacGetResponse < Internal::Types::Model
      field :deal, -> { Plaid::Types::CraCheckReportFreddieMacVerificationOfAssetsDeal }, optional: false, nullable: false, api_name: "DEAL"

      field :request_id, -> { String }, optional: false, nullable: false

      field :schema_version, -> { Float }, optional: false, nullable: false, api_name: "SchemaVersion"
    end
  end
end
