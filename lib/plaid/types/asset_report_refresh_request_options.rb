# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object to filter `/asset_report/refresh` results. If provided, cannot be `null`. If not specified, the
    # `options` from the original call to `/asset_report/create` will be used.
    class AssetReportRefreshRequestOptions < Internal::Types::Model
      field :client_report_id, -> { String }, optional: true, nullable: true

      field :webhook, -> { String }, optional: true, nullable: true

      field :user, -> { Plaid::Types::AssetReportUser }, optional: true, nullable: false
    end
  end
end
