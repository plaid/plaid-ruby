# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Official identity document edit statistics.
    class UserAccountIdentityOfficialDocument < Internal::Types::Model
      field :ssn, -> { Plaid::Types::UserAccountIdentityEditCounts }, optional: true, nullable: false
    end
  end
end
