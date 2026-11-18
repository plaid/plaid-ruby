# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Metadata that captures information about the Auth features of an institution.
    class AuthMetadata < Internal::Types::Model
      field :supported_methods, -> { Plaid::Types::AuthSupportedMethods }, optional: false, nullable: true
    end
  end
end
