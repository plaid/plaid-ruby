# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Event data for Protect events.
    class ProtectEvent < Internal::Types::Model
      field :timestamp, -> { String }, optional: false, nullable: false

      field :device_session_id, -> { String }, optional: true, nullable: false

      field :app_visit, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true

      field :user_sign_in, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true

      field :user_sign_up, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true
    end
  end
end
