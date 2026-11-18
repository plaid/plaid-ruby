# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # AssetReportRemoveResponse defines the response schema for `/asset_report/remove`
    class AssetReportRemoveResponse < Internal::Types::Model
      field :removed, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
