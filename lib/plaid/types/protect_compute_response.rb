# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Response object for /protect/compute
    class ProtectComputeResponse < Internal::Types::Model
      field :score, -> { Integer }, optional: true, nullable: true

      field :model, -> { String }, optional: true, nullable: false

      field :attributes, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true

      field :subscores, -> { Plaid::Types::ProtectComputeSubscores }, optional: true, nullable: true

      field :timestamp, -> { String }, optional: true, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
