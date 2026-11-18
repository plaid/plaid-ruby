# frozen_string_literal: true

module Plaid
  module AssetReport
    module Types
      class AssetReportCreateRequest < Internal::Types::Model
        field :access_tokens, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :days_requested, -> { Integer }, optional: false, nullable: false

        field :options, -> { Plaid::Types::AssetReportCreateRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
