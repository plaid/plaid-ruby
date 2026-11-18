# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The data from the Insights product returned by Prism Data.
    class PrismInsights < Internal::Types::Model
      field :version, -> { Integer }, optional: false, nullable: false

      field :model_version, -> { String }, optional: true, nullable: false

      field :result, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :error_reason, -> { String }, optional: true, nullable: false
    end
  end
end
