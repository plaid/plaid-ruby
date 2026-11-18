# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module IdentityUpdateTypes
      extend Plaid::Internal::Types::Enum

      ADDRESSES = "addresses"
      EMAILS = "emails"
      NAMES = "names"
      PHONE_NUMBERS = "phone_numbers"
    end
  end
end
