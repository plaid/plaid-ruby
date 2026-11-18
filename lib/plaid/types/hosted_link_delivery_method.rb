# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module HostedLinkDeliveryMethod
      extend Plaid::Internal::Types::Enum

      SMS = "sms"
      EMAIL = "email"
    end
  end
end
