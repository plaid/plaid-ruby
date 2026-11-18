# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing identifying account numbers for verification via Database Auth
    class AuthVerifyRequestNumbers < Internal::Types::Model
      field :ach, -> { Plaid::Types::AuthVerifyNumbersAch }, optional: false, nullable: false
    end
  end
end
