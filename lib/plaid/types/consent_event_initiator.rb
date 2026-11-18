# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ConsentEventInitiator
      extend Plaid::Internal::Types::Enum

      PLAID = "PLAID"
      DATA_PROVIDER = "DATA_PROVIDER"
      CUSTOMER = "CUSTOMER"
      END_USER = "END_USER"
    end
  end
end
