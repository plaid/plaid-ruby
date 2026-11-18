# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The data from the Insights product returned by Prism Data.
    class CraReportGetPrismInsights < Internal::Types::Model
      field :model_version, -> { String }, optional: false, nullable: false

      field :result, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :error_reason, -> { String }, optional: true, nullable: false
    end
  end
end
