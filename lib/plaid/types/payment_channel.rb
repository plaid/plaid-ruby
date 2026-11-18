# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PaymentChannel
      extend Plaid::Internal::Types::Enum

      ONLINE = "online"
      IN_STORE = "in store"
      OTHER = "other"
    end
  end
end
