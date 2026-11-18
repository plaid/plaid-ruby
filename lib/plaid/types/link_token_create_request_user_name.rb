# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The user's full name. Optional, and only allowed when using [Identity
    # Verification](https://plaid.com/docs/api/products/identity-verification), Assets, Protect, or Hosted Link. Users
    # will not be asked for their name when this field is provided.
    class LinkTokenCreateRequestUserName < Internal::Types::Model
      field :given_name, -> { String }, optional: false, nullable: false

      field :family_name, -> { String }, optional: false, nullable: false
    end
  end
end
