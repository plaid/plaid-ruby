# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the device being used to initiate the authorization. These fields are not currently incorporated
    # into the risk check.
    class TransferAuthorizationDevice < Internal::Types::Model
      field :ip_address, -> { String }, optional: true, nullable: false

      field :user_agent, -> { String }, optional: true, nullable: false
    end
  end
end
