# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PoBoxStatus
      extend Plaid::Internal::Types::Enum

      YES = "yes"
      NO = "no"
      NO_DATA = "no_data"
    end
  end
end
