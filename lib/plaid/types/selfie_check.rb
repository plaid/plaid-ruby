# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Additional information for the `selfie_check` step. This field will be `null` unless `steps.selfie_check` has
    # reached a terminal state of `success`, `failed`, `manually_approved`, or `manually_rejected`.
    class SelfieCheck < Internal::Types::Model
      field :status, -> { Plaid::Types::SelfieCheckStatus }, optional: false, nullable: false

      field :selfies, -> { Internal::Types::Array[Plaid::Types::SelfieCheckSelfie] }, optional: false, nullable: false
    end
  end
end
