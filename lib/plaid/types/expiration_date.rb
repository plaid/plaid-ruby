# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ExpirationDate
      extend Plaid::Internal::Types::Enum

      NOT_EXPIRED = "not_expired"
      EXPIRED = "expired"
      NO_DATA = "no_data"
    end
  end
end
