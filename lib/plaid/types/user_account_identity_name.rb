# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The user's first name and last name.
    class UserAccountIdentityName < Internal::Types::Model
      field :first_name, -> { String }, optional: true, nullable: false

      field :last_name, -> { String }, optional: true, nullable: false
    end
  end
end
