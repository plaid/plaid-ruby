# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraSubscriptionCadence
      extend Plaid::Internal::Types::Enum

      DAILY = "DAILY"
    end
  end
end
