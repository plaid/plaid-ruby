# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The identity data permissioned by the end user during the authorization flow.
    class UserAccountIdentity < Internal::Types::Model
      field :name, -> { Plaid::Types::UserAccountIdentityName }, optional: true, nullable: true

      field :address, -> { Plaid::Types::UserAccountIdentityAddress }, optional: true, nullable: true

      field :phone_number, -> { String }, optional: true, nullable: false

      field :email, -> { String }, optional: true, nullable: true

      field :date_of_birth, -> { String }, optional: true, nullable: true

      field :ssn, -> { String }, optional: true, nullable: true

      field :ssn_last4, -> { String }, optional: true, nullable: true, api_name: "ssn_last_4"
    end
  end
end
