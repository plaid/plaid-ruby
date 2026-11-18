# frozen_string_literal: true

module Plaid
  module Processor
    module Types
      class ProcessorIdentityMatchRequest < Internal::Types::Model
        field :processor_token, -> { String }, optional: false, nullable: false

        field :user, -> { Plaid::Types::IdentityMatchUser }, optional: true, nullable: false
      end
    end
  end
end
