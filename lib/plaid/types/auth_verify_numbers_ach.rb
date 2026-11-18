# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ACH numbers for verification via Database Auth
    class AuthVerifyNumbersAch < Internal::Types::Model
      field :account, -> { String }, optional: false, nullable: false

      field :routing, -> { String }, optional: false, nullable: false
    end
  end
end
