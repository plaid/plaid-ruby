# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing an Asset Report
    class AssetReport < Internal::Types::Model
      field :asset_report_id, -> { String }, optional: false, nullable: false

      field :insights, -> { Plaid::Types::AccountInsights }, optional: true, nullable: true

      field :client_report_id, -> { String }, optional: false, nullable: true

      field :date_generated, -> { String }, optional: false, nullable: false

      field :days_requested, -> { Float }, optional: false, nullable: false

      field :user, -> { Plaid::Types::AssetReportUser }, optional: false, nullable: false

      field :items, -> { Internal::Types::Array[Plaid::Types::AssetReportItem] }, optional: false, nullable: false
    end
  end
end
