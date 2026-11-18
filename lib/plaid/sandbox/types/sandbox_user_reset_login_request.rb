# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxUserResetLoginRequest < Internal::Types::Model
        field :user_token, -> { String }, optional: true, nullable: false

        field :item_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

        field :user_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
