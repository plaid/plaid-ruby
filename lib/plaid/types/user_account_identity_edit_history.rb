# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Statistics tracking the number of edits made to identity fields over various time periods.
    class UserAccountIdentityEditHistory < Internal::Types::Model
      field :name, -> { Plaid::Types::UserAccountIdentityEditCounts }, optional: true, nullable: false

      field :address, -> { Plaid::Types::UserAccountIdentityEditCounts }, optional: true, nullable: false

      field :email, -> { Plaid::Types::UserAccountIdentityEditCounts }, optional: true, nullable: false

      field :date_of_birth, -> { Plaid::Types::UserAccountIdentityEditCounts }, optional: true, nullable: false

      field :official_document, -> { Plaid::Types::UserAccountIdentityOfficialDocument }, optional: true, nullable: true
    end
  end
end
