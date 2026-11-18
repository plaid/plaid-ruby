# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxPaymentSimulateRequest < Internal::Types::Model
        field :payment_id, -> { String }, optional: false, nullable: false

        field :webhook, -> { String }, optional: false, nullable: false

        field :status, -> { String }, optional: false, nullable: false
      end
    end
  end
end
