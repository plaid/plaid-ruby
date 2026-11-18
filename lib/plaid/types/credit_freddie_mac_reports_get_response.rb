# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CreditFreddieMacReportsGetResponse defines the response schema for `/credit/freddie_mac/reports/get`
    class CreditFreddieMacReportsGetResponse < Internal::Types::Model
      field :deal, -> { Plaid::Types::CreditFreddieMacVerificationOfAssetsDeal }, optional: false, nullable: false, api_name: "DEAL"

      field :request_id, -> { String }, optional: false, nullable: false

      field :schema_version, -> { Float }, optional: false, nullable: false, api_name: "SchemaVersion"
    end
  end
end
