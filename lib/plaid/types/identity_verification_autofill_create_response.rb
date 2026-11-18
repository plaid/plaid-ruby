# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Autofill represents unverified customer information. This needs to be confirmed by the customer before using.
    class IdentityVerificationAutofillCreateResponse < Internal::Types::Model
      field :status, -> { Plaid::Types::IdentityVerificationAutofillStatus }, optional: false, nullable: false

      field :user, -> { Plaid::Types::IdentityVerificationAutofillUserData }, optional: false, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
