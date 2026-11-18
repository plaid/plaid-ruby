# frozen_string_literal: true

module Plaid
  module User
    module Types
      class UserRemoveRequest < Internal::Types::Model
        field :plaid_new_user_api_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "Plaid-New-User-API-Enabled"

        field :user_id, -> { String }, optional: true, nullable: false

        field :user_token, -> { String }, optional: true, nullable: false
      end
    end
  end
end
