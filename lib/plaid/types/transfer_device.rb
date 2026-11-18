# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the device being used to initiate the authorization.
    class TransferDevice < Internal::Types::Model
      field :ip_address, -> { String }, optional: false, nullable: false

      field :user_agent, -> { String }, optional: false, nullable: false
    end
  end
end
