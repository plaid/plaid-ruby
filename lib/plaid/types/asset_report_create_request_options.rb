# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object to filter `/asset_report/create` results. If provided, must be non-`null`. The optional `user`
    # object is required for the report to be eligible for Fannie Mae's Day 1 Certainty program.
    class AssetReportCreateRequestOptions < Internal::Types::Model
      field :client_report_id, -> { String }, optional: true, nullable: true

      field :webhook, -> { String }, optional: true, nullable: true

      field :include_fast_report, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :products, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :add_ons, -> { Internal::Types::Array[Plaid::Types::AssetReportAddOns] }, optional: true, nullable: false

      field :user, -> { Plaid::Types::AssetReportUser }, optional: true, nullable: false

      field :require_all_items, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
