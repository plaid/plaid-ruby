# frozen_string_literal: true

module Plaid
  module User
    module Types
      class UserUpdateRequest < Internal::Types::Model
        field :plaid_new_user_api_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "Plaid-New-User-API-Enabled"

        field :user_id, -> { String }, optional: true, nullable: false

        field :identity, -> { Plaid::Types::ClientUserIdentity }, optional: true, nullable: true

        field :user_token, -> { String }, optional: true, nullable: false

        field :consumer_report_user_identity, -> { Plaid::Types::ConsumerReportUserIdentity }, optional: true, nullable: true
      end
    end
  end
end
