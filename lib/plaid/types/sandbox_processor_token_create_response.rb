# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SandboxProcessorTokenCreateResponse defines the response schema for `/sandbox/processor_token/create`
    class SandboxProcessorTokenCreateResponse < Internal::Types::Model
      field :processor_token, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
