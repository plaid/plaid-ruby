# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module LinkTokenCreateRequestAuthRerouteToCredentials
      extend Plaid::Internal::Types::Enum

      OFF = "OFF"
      OPTIONAL = "OPTIONAL"
      FORCED = "FORCED"
    end
  end
end
