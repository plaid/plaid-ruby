# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional set of options to be used when configuring the Item. If specified, must not be `null`.
    class SandboxProcessorTokenCreateRequestOptions < Internal::Types::Model
      field :override_username, -> { String }, optional: true, nullable: true

      field :override_password, -> { String }, optional: true, nullable: true
    end
  end
end
