# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # AssetReportRefreshResponse defines the response schema for `/asset_report/refresh`
    class AssetReportRefreshResponse < Internal::Types::Model
      field :asset_report_id, -> { String }, optional: false, nullable: false

      field :asset_report_token, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
