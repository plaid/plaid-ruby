# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PhoneType
      extend Plaid::Internal::Types::Enum

      PHONE = "phone"
      FAX = "fax"
    end
  end
end
