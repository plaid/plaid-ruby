# frozen_string_literal: true

module Plaid
  module Protect
    module Types
      class ProtectComputeRequest < Internal::Types::Model
        field :model, -> { String }, optional: false, nullable: false

        field :user, -> { Plaid::Types::ProtectUser }, optional: false, nullable: false

        field :model_inputs, -> { Plaid::Types::ProtectModelInputs }, optional: true, nullable: true
      end
    end
  end
end
