# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object to filter or add data to `/asset_report/get` results. If provided, must be non-`null`.
    class AssetReportGetRequestOptions < Internal::Types::Model
      field :days_to_include, -> { Integer }, optional: true, nullable: true
    end
  end
end
