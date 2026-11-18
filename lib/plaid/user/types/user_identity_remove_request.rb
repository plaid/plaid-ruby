# frozen_string_literal: true

module Plaid
  module User
    module Types
      class UserIdentityRemoveRequest < Internal::Types::Model
        field :plaid_new_user_api_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "Plaid-New-User-API-Enabled"

        field :user_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
