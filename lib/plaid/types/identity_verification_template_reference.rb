# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The resource ID and version number of the template configuring the behavior of a given Identity Verification.
    class IdentityVerificationTemplateReference < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :version, -> { Integer }, optional: false, nullable: false
    end
  end
end
