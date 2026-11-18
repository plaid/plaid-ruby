# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SandboxPaymentProfileResetLoginResponse defines the response schema for `/sandbox/payment_profile/reset_login`
    class SandboxPaymentProfileResetLoginResponse < Internal::Types::Model
      field :reset_login, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
