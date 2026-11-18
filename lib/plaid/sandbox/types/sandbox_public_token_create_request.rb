# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxPublicTokenCreateRequest < Internal::Types::Model
        field :institution_id, -> { String }, optional: false, nullable: false

        field :initial_products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: false, nullable: false

        field :options, -> { Plaid::Types::SandboxPublicTokenCreateRequestOptions }, optional: true, nullable: false

        field :user_token, -> { String }, optional: true, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
