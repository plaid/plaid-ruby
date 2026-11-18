# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxProcessorTokenCreateRequest < Internal::Types::Model
        field :institution_id, -> { String }, optional: false, nullable: false

        field :options, -> { Plaid::Types::SandboxProcessorTokenCreateRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
