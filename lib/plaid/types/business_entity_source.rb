# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BusinessEntitySource
      extend Plaid::Internal::Types::Enum

      SECRETARY_OF_STATE = "secretary_of_state"
      ONLINE = "online"
    end
  end
end
