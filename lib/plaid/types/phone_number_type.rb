# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PhoneNumberType
      extend Plaid::Internal::Types::Enum

      HOME = "home"
      WORK = "work"
      OFFICE = "office"
      MOBILE = "mobile"
      MOBILE1 = "mobile1"
      OTHER = "other"
    end
  end
end
