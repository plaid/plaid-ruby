# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class RoleDetail < Internal::Types::Model
      field :party_role_type, -> { Plaid::Types::PartyRoleType }, optional: false, nullable: false, api_name: "PartyRoleType"
    end
  end
end
