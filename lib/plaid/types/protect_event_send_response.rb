# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Response object for /protect/event/send
    class ProtectEventSendResponse < Internal::Types::Model
      field :event_id, -> { String }, optional: false, nullable: false

      field :trust_index, -> { Plaid::Types::TrustIndex }, optional: true, nullable: true

      field :fraud_attributes, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
