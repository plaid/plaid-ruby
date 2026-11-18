# frozen_string_literal: true

module Plaid
  module AssetReport
    module Types
      class AssetReportGetRequest < Internal::Types::Model
        field :asset_report_token, -> { String }, optional: true, nullable: false

        field :user_token, -> { String }, optional: true, nullable: false

        field :include_insights, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :fast_report, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :options, -> { Plaid::Types::AssetReportGetRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
