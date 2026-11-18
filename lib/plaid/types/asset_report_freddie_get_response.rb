# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # AssetReportFreddieGetResponse defines the response schema for `/credit/asset_report/freddie_mac/get`
    class AssetReportFreddieGetResponse < Internal::Types::Model
      field :deal, -> { Plaid::Types::AssetReportFreddie }, optional: false, nullable: false, api_name: "DEAL"

      field :request_id, -> { String }, optional: false, nullable: false

      field :schema_version, -> { Float }, optional: false, nullable: false, api_name: "SchemaVersion"
    end
  end
end
