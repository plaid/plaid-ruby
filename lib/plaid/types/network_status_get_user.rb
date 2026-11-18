# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object specifying information about the end user for the network status check.
    class NetworkStatusGetUser < Internal::Types::Model
      field :phone_number, -> { String }, optional: false, nullable: false
    end
  end
end
