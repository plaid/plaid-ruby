# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxItemApplicationSeedRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :application_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
